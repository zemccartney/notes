Took inspiration / copied from:
- https://www.swyx.io/new-mac-setup#new-mac-setup---from-scratch
- https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development

> [!todo]-
> - [ ] #task Revisit git settings, interested in a.) `autoSetupRebase` per [this discussion](https://stackoverflow.com/questions/71768999/how-to-merge-when-you-get-error-hint-you-have-divergent-branches-and-need-to-s/71774640#71774640) b.) diff config & git pull `l` alias in https://github.com/ai/environment/blob/main/gitconfig


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
	- [ ] ssh fix https://ghostty.org/docs/help/terminfo#configure-ssh-to-fall-back-to-a-known-terminfo-entry
		- [ ] check ssh connections, add `SetEnv TERM=xterm-256color` for broken Linux sessions (manifests as backspace adding spaces)
	- [ ] configure (From root: `mkdir -p .config/ghostty` and add the following)
    
```reference

path: '@/../config/ghostty/config'

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

```reference
path: '@/../config/.gitconfig'
lang: ini
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
		- [ ] [colorize](https://marketplace.cursorapi.com/items?itemName=kamikillerto.vscode-colorize)
		- [ ] [svg preview](https://marketplace.cursorapi.com/items?itemName=SimonSiefke.svg-preview)
		- [ ] [Image preview](https://marketplace.visualstudio.com/items?itemName=kisstkondoros.vscode-gutter-preview)
		- [ ] [Image Gallery](https://marketplace.visualstudio.com/items?itemName=GeriYoco.vscode-image-gallery)
	- [ ] install Iosevka font: https://github.com/be5invis/Iosevka/releases (followed steps here: https://support.apple.com/guide/font-book/install-and-validate-fonts-fntbk1000/mac)
	- [ ] settings

```reference
path: '@/../config/vscode/settings.json'
```


- [ ] https://apps.apple.com/us/app/pure-paste/id1611378436?mt=12 
	- [ ] settings
		- [ ] start on login
		- [ ] automatically clear formatting
		- [ ] extras > everything under when clearing formatting except list normalization
- [ ] https://rectangleapp.com/ , recommended shortcuts, set as login item and to check for updates
- [ ] linear app
- [ ] vlc

