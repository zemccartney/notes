---
tags:
  - astro
  - sentry
  - cloudflare
---

### TODO
- [ ] Fix middleware typing; possible to make Cloudflare-aware?
- [ ] Add configurable Sentry testing utilities (ways to trigger client and server-side errors, to verify integration)

--- 
When I deployed [this site](), which is statically rendered while leveraging [Astro's server islands](https://docs.astro.build/en/guides/server-islands/) to render data-dependent components on demand, I had a time getting Sentry working server-side, through a combination of outdated / poor documentation and personal skill issues.

Anyway! I'll spare the uninteresting story, here's where I landed. I'm no Sentry expert, definitely room to leverage it for more and I could still have some things wrong here, but with this setup I'm capture errors client-side and server-side:

First, configure the integration:

**astro.config.mjs**
```js
export default defineConfig({
  ...,
  integrations: [
    ...,
    ...(SENTRY_AUTH_TOKEN
      ? [
          sentry({
            dsn: PUBLIC_SENTRY_DSN,
            // PUBLIC_DEPLOY_ENV identifies the environment to which we're deploying
            // Granularity over NODE_ENV or import.meta.env, which should indicate a production environment in all deployed envs, even if a dev or staging server
            environment: PUBLIC_DEPLOY_ENV,
            sourceMapsUploadOptions: {
              project: "my-project",
              authToken: SENTRY_AUTH_TOKEN,
            },
          }),
        ]
      : []),
  ]

```


Then, configure the client-side integration. This captures any exceptions in-browser.

**sentry.client.config.js**
```js
import * as Sentry from "@sentry/astro";

Sentry.init({
  dsn: import.meta.env.PUBLIC_SENTRY_DSN,
  environment: import.meta.env.PUBLIC_DEPLOY_ENV,

  integrations: [Sentry.browserTracingIntegration()],

  // Define how likely traces are sampled. Adjust this value in production,
  // or use tracesSampler for greater control.
  tracesSampleRate: 0.1,
});
```



Then, then server-side integration:

**middleware.ts**
```typescript
import { defineMiddleware } from "astro:middleware";
import { PUBLIC_DEPLOY_ENV, PUBLIC_SENTRY_DSN } from "astro:env/client";
import * as Sentry from "@sentry/cloudflare";

export const onRequest = defineMiddleware((ctx, next) => {
  // middleware are called during static page generation, too; since building occurs in a node
  // env and we wouldn't need sentry at buildtime anyway, we passthrough if prerendering
  const whenServer = import.meta.env.PROD && !ctx.isPrerendered;

  if (!whenServer) {
    return next();
  }
  const requestHandlerOptions = {
    options: {
      dsn: PUBLIC_SENTRY_DSN,
      tracesSampleRate: 0.1,
      environment: PUBLIC_DEPLOY_ENV,
    },

    // @ts-expect-error : "Property 'runtime' does not exist on type 'Locals'" ; provided by CF execution context: https://github.com/withastro/adapters/blob/83cedad780bf7a23ae9f6ca0c44a7b7f1c1767e1/packages/cloudflare/src/entrypoints/server.ts
    context: ctx.locals.runtime.ctx,
    request: ctx.request,
  };

  // @ts-expect-error : Not sure viable to tell Typescript that requestHandlerOptions will be correctly typed in a Cloudflare environment
  return Sentry.wrapRequestHandler(requestHandlerOptions, () => next());
});
```

The key here is the `wrapRequestHandler` API, the intuition for which is buried in https://github.com/getsentry/sentry-javascript/tree/82598f58e39d513d7e01b6c09c33bbbb735b24c6/packages/cloudflare#setup-cloudflare-pages

> If you do not have access to the `onRequest` middleware API, you can use the `wrapRequestHandler` API instead.


I'd assumed sentry's pages plugin would have done the trick for Astro, given [Sentry's docs](https://docs.sentry.io/platforms/javascript/guides/cloudflare/frameworks/astro/)suggest that API instead, but for whatever reason, that never worked for me. And by "worked," I mean supporting manually capturing errors in an action:

**actions/index.ts**
```typescript
import { defineAction, ActionError } from "astro:actions";
import * as Sentry from "@sentry/cloudflare";

export const server = {
  getData: defineAction({
    handler: async () => {
		try {
			// ...
		} catch (err) {
			if (import.meta.env.DEV) {
		        console.log(error);
	        }
	
	        if (import.meta.env.PROD) {
		        Sentry.captureException?.(error);
	        }
	
	        throw error;
		}
	}
  })
```


Again, no idea if this is the "rightest" way to use Sentry in Astro in a cloudflare environment, but it's been working for me. I started [a discussion on the Sentry JS repo](https://github.com/getsentry/sentry-javascript/discussions/15097) for feedback; no response as of 2/22/2025.