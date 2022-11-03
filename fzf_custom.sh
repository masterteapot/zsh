#!/bin/bash
function fzf_open() {
    fdfind -t f -H --ignore | fzf -m --preview="bat --color=always --style=numbers --line-range=:500 {}" --bind=ctrl-space:toggle-preview | xargs -ro -d "\n" xdg-open 2>&-
}
function fzf_cd() {
    cd $HOME && cd "$(fd -t d -H --ignore | fzf --preview="tree -L 1 {}" --bind="ctrl-space:toggle-preview")"
}
function fzf_yay() {
    yay -Syy $(yay -Ssq | fzf -m --preview="yay -Si {}" --bind=ctrl-space:toggle-preview)
}
function fzf_flat() {
    flatpak-search $(flatpak-install | fzf -m --preview="flatpak-info {}" --bind=ctrl-space:toggle-preview)
}
