# Set FZF_DEFAULT_OPTS with customized key bindings
alias fzfb="fzf --preview 'bat --style=numbers --color=always {}'"
export FZF_DEFAULT_OPTS="\
--color=hl:#82aaff,fg+:#eeffff,bg+:#414141,hl+:#82aaff,info:#ffcb6b,prompt:#c3e88d,pointer:#ffcc00,marker:#ffcc00,spinner:#89ddff,header:#616161 \
--cycle --pointer=▎ --marker=▎ \
--bind=ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up,ctrl-f:preview-page-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,shift-up:preview-top,shift-down:preview-bottom,alt-up:half-page-up,alt-down:half-page-down"

