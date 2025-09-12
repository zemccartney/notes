alias la="eza -ahl --git --icons --group-directories-first --hyperlink"
alias ll="eza -hl --git --icons --git-ignore --group-directories-first --hyperlink"
alias tree="eza -ahlT --git --git-ignore --group-directories-first --hyperlink"

###-begin-uv-completion-###
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# https://github.com/astral-sh/uv/issues/8432#issuecomment-2965692994
# Enables path completion within uv run commands
_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files -g "*.py"'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv
###-end-uv-completion-###