https://www.swyx.io/new-mac-setup#new-mac-setup---from-scratch
https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development

## TODOs to publish
- [ ] link all resources as relevant
- [ ] integrate setup notes at bottom
- [ ] fill in gitconfig section with where you landed 


- [ ] disable icloud sync (in settings > apple id > icloud)
- [ ] delete as many apple apps as allowed
	- [ ] clean up dock
- [ ] docker
- [ ] obsidian
- [ ] chrome
	- [ ] settings
		- [ ] enable memory saver
	- [ ] extensions
		- [ ] react dev tools
		- [ ] lighthouse
		- [ ] colorzilla
		- [ ] wave eval tool
- [ ] ghostty
	- [ ] configure

	From root: `mkdir -p .config/ghostty`

    Add the following:
    
```sh
	font-size = 15
	theme = BlueDolphin
```


- [ ] download logi options +, set mouse tracking and scrolling speeds to 100% (for now; b/c using logitech hardware, app is only way to change settings of devices; outright piracy, such horseshit, need to move away from logitech hardware entirely)
- [ ] homebrew
	- [ ] don't forget to follow instructions to add to path (printed by brew installation)
- [ ] Install node
	- [ ] https://github.com/Schniz/fnm
- [ ] ommwriter (needs to copied)
- [ ] git
	- [ ] config: https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/#git ALIASES!!
	- [ ] ssh key, add to github
	- [ ] trying difftastic
- [ ] mac os config
	- [ ] add home folder to finder (drag into favorites)
- [ ] vs code
	- [ ] install shell command
	- [ ] extensions
		- [ ] astro
		- [ ] eslint
		- [ ] even better TOML
		- [ ] html-validate (or super HTML?)
		- [ ] mdx
		- [ ] prettier
		- [ ] pretty typescript errors
		- [ ] stylelint
		- [ ] tailwind css intellisense
		- [ ] total typescript
		- [ ] noctis theme
		- [ ] vs code icons
		- [ ] https://marketplace.visualstudio.com/items?itemName=vincaslt.highlight-matching-tag?

- [ ] https://apps.apple.com/us/app/pure-paste/id1611378436?mt=12 
	- [ ] doc settings used
- [ ] https://rectangleapp.com/ 
- [ ] linear app


## cleanup

Intent:
- folder for things I'd be very sad to lose
- folder for things hanging on to, but not important, just not sure what to do with them yet
- copy up to cloudflare / some other cloud service as time allows

- [x] anything from steam?
- [x] copy ommwriter and any relevant files?
- [x] copy over any local-only folders that are worth saving (css for js?)
- [ ] deal with tabs
- [x] clean off desktop
- [x] chrome, bookmarks?
- [x] review iCloud; anything actually useful in there? No interest in using iCloud
- [ ] other external drive (review... consolidate into new drive)
	- [ ] store latest timemachine backup 
	- [ ] store p joons
	- [ ] store jennie stories, buried in there (did those make it to drive?)
	- [ ] keep drive around, boot up as part of regular maintenance, but otherwise, seems fine?
- [ ] clean up google drive / stash anything from there? 
	- [ ] store boyz materials
- [ ] store data from phone (stash photos)

https://www.youtube.com/watch?v=eKy3Z9l9Mi0&t=92s
https://www.lg.com/us/monitors/lg-34wq500-b-ultrawide-monitor

## Mac setup notes

- ran into issue with fnm, turned out to be incorrect installation path
	- https://github.com/Schniz/fnm/issues/824

### git

- ended up trying https://difftastic.wilfred.me.uk/git.html
	- per https://github.com/ai/environment/blob/main/gitconfig 
	- looks like won't work with astro, though
- for ssh https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent 
- rectangle
	- ok, kind of get it after using it, seems pretty cool
	- remember to set as login itme
	- curious how often I'll actually end up using it, but nice to have

### purepaste 

- enabled most settings, except for list normalization
- keep an eye on it

## vs code

https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons

https://marketplace.visualstudio.com/items?itemName=liviuschera.noctis

```json
{
  "editor.guides.bracketPairs": "active",
  "workbench.colorTheme": "Noctis",
  "workbench.iconTheme": "vscode-icons",
  "window.zoomLevel": 1
}
```