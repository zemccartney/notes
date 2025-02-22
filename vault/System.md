
> [!todo]-
> - [ ] #task how to deal with link rot? Document author and title when giving links, don't just post links? And routine for cleaning up?

## Inspirations

- https://simonwillison.net/2024/Dec/22/link-blog/
- https://simonwillison.net/2020/Apr/20/self-rewriting-readme/
- https://jvns.ca/til/
	- https://jvns.ca/blog/2024/11/09/new-microblog/
- https://github.com/jbranchaud/til?tab=readme-ov-file
	- https://dev.to/jbranchaud/how-i-built-a-learning-machine-45k9 

## Categories

### reading

blogmarks, as Simon Willison calls them. Capturing things read. Titles of posts are article titles. Intend to link titles via source property (see below), group by date read

#### properties
- source: link to piece
- author: name(s) of the writer(s) / producer(s)
- via: link that led to finding the piece

### resources

capture more formal documents of processes I use in my work, mainly so I have the thing written down in a known, central place. Think checklists, procedures, etc. 

Unclear how useful this'll be; we'll see!

### til

Follow https://github.com/jbranchaud/til

> A collection of concise write-ups on small things I learn day to day across a variety of languages and technologies. These are things that don't really warrant a full blog post.


## Conventions

### Tracking TODOs

- For file-specific TODOs, within the file

1. Add a foldable TODO callout to the top of the file
2. Within the callout, create a checklist, starting each list item with the `#task` tag, which is picked up by the "Tasks" plugin's global filter

```md
> [!todo]-
> - [ ] #task ....
```

You'll see any tasks added this way listed in the [[Upkeep]] file, which contains a "Tasks" plugin global query against all tasks registered as such across the vault

Periodically review [[Upkeep]], figure out what to do with items. Throw any stale or unimportant ones away. Feel free to delete fully complete todo callouts. Keeping "system" simple for now, may formalize later, as practice suggests i.e. if I actually stick with anything here

## Configuration files

- stored in `@/../config`, in repo housing this vault, sibling dir of the vault
- Favor storing reusable files there over inlining, then referencing within files courtesy of the [Code Styler plugin](https://github.com/mayurankv/Obsidian-Code-Styler)

Ref as follows:

```md
	```reference
	path: '@/../config/my-file'
	```
```