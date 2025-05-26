---
source: https://hackernoon.com/flexbox-s-best-kept-secret-bd3d892826b6
author: Sam Provenza
tags:
  - css
  - CSS_CORE
via: https://css-tricks.com/the-peculiar-magic-of-flexbox-and-auto-margins/
---
Stashing an incredibly useful flexbox technique that I'm prone to forget. Not reached for often, but feels like magic when you do. Useful to backpocket.

The problem 
> I asked myself the question, “How do I override justify-content to position a flex item independently along the main axis?” I was attempting to space flex items evenly along the main axis inside of a row with the last item floating all the way to the right side. I was stumped how to do this without floats or fixed margins.

And how the technique works:
> If you apply auto margins to a flex item, that item will automatically extend its specified margin to occupy the extra space in the flex container, depending on the direction in which the auto-margin is applied

>Using auto margins with Flexbox is an effective way to get all of the flexibility of css floats, without the nastiness of breaking elements out of the document’s normal flow. It can be applied horizontally or vertically and it gives you more control of flex items along the main axis.