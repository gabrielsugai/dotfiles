# ── Paleta (tmux-dotbar) ──────────────────────────────────────
# Precisa ser setada explicitamente, mesmo sendo o default do dotbar: o
# plugin só *lê* @tmux-dotbar-bg pra uma variável de shell (dotbar.tmux:12),
# nunca faz `set` dela. Sem isso, o #{@tmux-dotbar-bg} do status-left abaixo
# expande pra vazio, o tmux rejeita o estilo inteiro ("invalid style:
# bg=...,fg=,bold") e a pílula do prefix perde o fundo.
set -g @tmux-dotbar-bg "#0B0E14"
set -g @tmux-dotbar-fg-current "green"
set -g @tmux-dotbar-fg-session "green"
set -g @tmux-dotbar-fg "#585b70"        # dim: janelas inativas + separadores
set -g @tmux-dotbar-fg-prefix "#a6e3a1" # destaque quando o prefix é pressionado

# Espaço p/ session + path (esquerda) e cpu + ram (direita)
set -g status-left-length 100
set -g status-right-length 100

# ── Esquerda: nome da sessão + current path ───────────────────
set -g @tmux-dotbar-status-left "#[bg=#{@tmux-dotbar-bg},fg=#7d8bb5]#{?client_prefix,#[fg=#{@tmux-dotbar-fg-prefix}], #S}#[bg=#{@tmux-dotbar-fg-prefix},fg=#{@tmux-dotbar-bg},bold]#{?client_prefix, #S ,}#[bg=#{@tmux-dotbar-bg},fg=#7d8bb5]#{?client_prefix,#[fg=#{@tmux-dotbar-fg-prefix}],} #[fg=#{@tmux-dotbar-fg}]#[fg=#7d8bb5]#{b:pane_current_path} "

# ── Direita: CPU + RAM (interpolados pelo tmux-cpu) ────────────
set -g @tmux-dotbar-right true
set -g @tmux-dotbar-status-right "#[fg=#7d8bb5]  #{cpu_percentage} #[fg=#{@tmux-dotbar-fg}]│#[fg=#7d8bb5]  #{ram_percentage} "
