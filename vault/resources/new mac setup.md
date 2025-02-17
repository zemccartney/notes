Took inspiration / copied from:
- https://www.swyx.io/new-mac-setup#new-mac-setup---from-scratch
- https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development


- [ ] mac os config
	- [ ] add home folder to finder (drag into favorites)
	- [ ] disable icloud sync (in settings > apple id > icloud)
	- [ ] delete as many apple apps as allowed
	- [ ] clean up dock
- [ ] docker
- [ ] obsidian
- [ ] chrome
	- [ ] settings
		- [ ] enable memory saver
	- [ ] extensions
		- [ ] [react dev tools](https://chromewebstore.google.com/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en)
		- [ ] [lighthouse](https://chromewebstore.google.com/detail/lighthouse/blipmdconlkpinefehnmjammfjpmpbjk)
		- [ ] [colorzilla](https://www.colorzilla.com/chrome/)
		- [ ] [wave eval tool]https://chromewebstore.google.com/detail/wave-evaluation-tool/jbbplnpkjmmeebjpijfedlgcdilocofh
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
		- [ ] on 2/15/2025: ran into issue with fnm, turned out to be incorrect installation path: https://github.com/Schniz/fnm/issues/824
- [ ] [ommwriter](https://ommwriter.com/) (needs to copied, single installation per license)
- [ ] git
	- [ ] create ssh key, add to github: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
	- [ ] trying difftastic: https://difftastic.wilfred.me.uk/git.html
	- [ ] config (`touch ~/.gitconfig`)

```
[user]
  email = zemccartney@gmail.com
  name = zemccartney

[github]
  user = zemccartney

[alias]
  a = add
  s = status
  c = commit
  df = diff ':!package-lock.json'
  dft = -c diff.external=difft df

[push]
  autoSetupRemote = true

[pull]
  ff = only
```

Sources:
- https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/#git
- https://github.com/ai/environment/commit/12cfa5cbe664ef217ce4af230e236f94850c2dc3

- [ ] vs code
	- [ ] install shell command (cmd pallete, search for shell command)
	- [ ] extensions
		- [ ] [astro](https://marketplace.visualstudio.com/items?itemName=astro-build.astro-vscode)
		- [ ] [eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
		- [ ] [even better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)
		- [ ] [highlight matching tag](https://marketplace.visualstudio.com/items?itemName=vincaslt.highlight-matching-tag)
		- [ ] [html-validate](https://marketplace.visualstudio.com/items?itemName=html-validate.vscode-html-validate) (or [super HTML](https://marketplace.visualstudio.com/items?itemName=LorisCro.super?)
		- [ ] [mdx](https://marketplace.visualstudio.com/items?itemName=unifiedjs.vscode-mdx)
		- [ ] [noctis theme](https://marketplace.visualstudio.com/items?itemName=liviuschera.noctis)
		- [ ] [prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
		- [ ] [pretty typescript errors](https://marketplace.visualstudio.com/items?itemName=YoavBls.pretty-ts-errors)
		- [ ] [stylelint](https://marketplace.visualstudio.com/items?itemName=stylelint.vscode-stylelint)
		- [ ] [tailwind css intellisense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)
		- [ ] [total typescript](https://marketplace.visualstudio.com/items?itemName=mattpocock.ts-error-translator)
		- [ ] [vs code icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
	- [ ] install Iosevka font: https://github.com/be5invis/Iosevka/releases (followed steps here: https://support.apple.com/guide/font-book/install-and-validate-fonts-fntbk1000/mac)
	- [ ] settings

```json
{
  "editor.guides.bracketPairs": "active",
  "workbench.colorTheme": "Noctis",
  "workbench.iconTheme": "vscode-icons",
  "window.zoomLevel": 1,
  "editor.fontLigatures": true,
  "editor.fontFamily": "Iosevka, monospace",
  "editor.fontSize": 14
}
```


- [ ] https://apps.apple.com/us/app/pure-paste/id1611378436?mt=12 
	- [ ] settings
		- [ ] start on login
		- [ ] automatically clear formatting
		- [ ] extras > everything under when clearing formatting except list normalization
- [ ] https://rectangleapp.com/ , set as login item
- [ ] linear app
- [ ] vlc

