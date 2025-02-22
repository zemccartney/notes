---
tags:
  - astro
  - ssr
---
Unclear if this thought is useful, but I find metaphors helpful for remembering intuitions for technical problems, so jotting down one that came to mind for Astro's server islands feature, which I've both loved working with, but also has requiring rewiring my brain a bit, coming from working mostly in SPAs for the past 6 years or so.

Like a squirrel burying acorns / other food during winter (Setting aside likely misunderstanding, on my part, of squirrel behavior)

Winter coming, the squirrel buries food — marking components as server islands, deferring rendering — ahead of the frost. The ground freezes — pages rendered statically at build time; frozen, unchanging — , but the squirrel's food is still there, protected, its nutritional value preserved. Ready to unearth whenever needed, whenever someone — client-side — asks.

Static site generation as destructive in the same sense as winter: not malicious or violent, but puts life on pause. Freezing. 

Server islands as rationing: selectivity, working with the constraint of freezing, explicitly identifying only that which needs preserving (vs. using more resources to protect against "winter" i.e. rendering your entire site on-demand, heavier reliance on server infrastructure. Rendering templates on demand, on your own server, is snow birding :) ).

