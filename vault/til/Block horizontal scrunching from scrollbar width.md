---
tags:
  - css
  - REVISIT
---

## TLDR

```css
/* Make the nav scrollable if screen height shorter than nav items... */

overflow-y: auto;

/* ... but don't shrink the nav width to accommodate the scrollbar */

min-width: fit-content;
```

To preserve width of a  fixed or constrained-width container's items in the face of a vertical scrollbar.

## Explanation
I was working on a nav menu today, a column pinned to the left-hand side of the site's standard layout containing a logo at the top, followed by a group of nav links. The designs called for spacing the bottommost link, the logout link, away from the rest of the links (for pages, for doing things in the app). After fumbling with this for a bit, I applied the following to the logout link

```css
margin-top: auto;
margin-bottom: auto;
```

This worked great! (context: nav container is a flex container, so auto margin here basically said: occupy space left over from the other links. I read the designs as meaning the space between wasn't meant as exact so much as enough to call out the logout link as conceptually separate. This margin approach fit the bill)

I saw, though, that on collapsing the screen vertically, the nav items overflowed the container, which was set to fill the height of the view: `height: 100%`, which was also set on html and body, as well as the `main` element. So the root elements, `nav` and `main` , of the layout, filled the tab's vertical space, individually taking responsibility for their own scrolling behaviors. I had done so on `main` already, but not on `nav`. On naively slapping `overflow-y: auto` on the nav, the items no longer overflow, but a horizontal scrollbar now appeared due to the vertical scrollbar now occupying space previously filled by the nav links: the nav menu occupied only the max width of its children, shrinking to accommodate the width of the `main`element (set to `width: 100%` , as it was designed to occupy most of the layout's real estate, as is probably assumed). 

I scratched my head at this for a few minutes, thinking of bad ideas like detecting scroll (especially bad given how edge-casey I know this scenario feels), then somehow thought to try the following:

```css
/* Make the nav scrollable if screen height shorter than nav items... */

overflow-y: auto;

/* ... but don't shrink the nav width to accommodate the scrollbar */

min-width: fit-content;
```

And this worked for my purposes: nav expanded to fit its children, which blew the horizontal scroll bar away, no issue with the added horizontal space on the nav.

I'm sure I'm omitting details to help reproduce this exact context; I'd like to come up with a more precise, simple demonstration. But the solution I settled on just clicked and I was surprised it did, I'd never thought to offset scrollbars with `fit-content`. I'm sure there are drawbacks to this approach that I haven't considered, as well. more testing needed, but seems worth back-pocketing.

## Updates

Issue discovered: doesn't contain children, allows expanding to fill intrinsic width. Tried adding a text element within the nav, set stock truncation styles, tested with a much longer string, text didn't overflow, but rather expanded the nav container. 

Adjusted as follows:

```css
width: '264px'; /* arbitrary */
flex-shrink: 0; /* main element has width of 100%, otherwise causing nav to shrink to as small as possible (child min-content I think?) */
```

Predictable, but curious how applying that width value to all nav children would work here, then re-setting the `min-width: fit-content` rule again. Clunkier, sure, but I wonder if there are benefits to that approach, for example finer-grained control over the navigation width? Also realizing I'm not sure I totally understood how `fit-content` width worked in a flex context here. Hmm. Or rather, vague recollection that `width` is handled differently in flexbox, I _believe_ treated same as flex-basis i.e. suggestion of initial sizing, but adjusted to accommodate constraints of siblings? Need a refresher here. Whereas `min-width` is more strictly enforced or I suppose implicitly prevents shrinking?

I dunno. For a `nav`, you probably want a totally predictable size, so a hardcoded width makes most sense here. Maybe other contexts where it's fine for a container to resize some based on contents, while enforcing internal constraints on a child-by-child basis i.e. prevent text from getting wider than a certain amount by setting a `max-width` or `width` on that child? Or `min-width: fit-content; max-width: Npx;` on the parent?