#!/usr/bin/env bash
# Monta o window-status-format do tmux-dotbar com um ícone Nerd Font
# escolhido pelo comando que roda no painel ativo de cada janela.
#
# O resultado é um format string puro do tmux (sem #(shell)), então o
# redraw da barra não gera fork nenhum. O ícone acompanha o comando do
# painel no próximo redraw (no máximo `status-interval` segundos, 5 aqui).
#
# Os ícones ficam como CODEPOINT EM HEX, não como caractere literal: glyph
# na Private Use Area (U+E000–F8FF) é frágil e já foi silenciosamente
# apagado deste arquivo uma vez — e um glyph vazio não dá erro, só some da
# barra. Em hex, o pior caso é um retângulo visível.
#
# Os codepoints são Nerd Fonts v3 e foram checados contra a MesloLGS Nerd
# Font Mono. Cuidado ao pegar codepoint de config alheia: os do range
# Material Design antigo (U+F500–FD46) saíram na v3 e viram tofu — foi o
# que aconteceu com o do terraform (era U+FCBD, agora é U+E69A).
#
# Rodar `window-icons.sh --list` imprime a tabela pra conferir a olho quais
# glyphs a fonte do terminal realmente tem.

set -euo pipefail

# padrão (glob do tmux)   codepoint — a primeira correspondência vence
ICONS=(
  "nvim        E6AE"
  "vim         E62B"
  "nano        F040"
  "zsh         E795"
  "bash        EBCA"
  "fish        EE41"
  "claude*     F06A9"
  "lazygit     E702"
  "lazydocker  E7B0"
  "git         E725"
  "gh          F09B"
  "docker*     F308"
  "kubectl     F10FE"
  "k9s         F10FE"
  "terraform   E69A"
  "aws         E7AD"
  "ssh         F08C0"
  "node        E718"
  "npm         E71E"
  "pnpm        E71E"
  "yarn        E71E"
  "deno        F0DAB"
  "bun         F1000"
  "python*     E73C"
  "ruby        E739"
  "rails       E73B"
  "irb         E739"
  "bundle      E739"
  "rake        E739"
  "elixir      E62D"
  "iex         E62D"
  "mix         E62D"
  "go          E627"
  "cargo       E7A8"
  "rustc       E7A8"
  "java        E738"
  "php         E73D"
  "dotnet      E77F"
  "make        E673"
  "psql        E76E"
  "mysql       E704"
  "redis-cli   E76D"
  "htop        F0E4"
  "btop        F0E4"
  "top         F0E4"
  "man         F02D"
  "less        F0F6"
  "yazi        F07C"
  "ranger      F07C"
  "lf          F07C"
  "brew        F0FC"
  "curl        F0ED"
  "tmux        EBC8"
)

FALLBACK=F489  # nenhum padrão bateu: ícone genérico de terminal

# O bash do macOS é o 3.2, que não tem printf '\uXXXX' — decodifica os
# codepoints todos de uma vez num perl só.
glyphs=()
while IFS= read -r glyph; do
  glyphs+=("$glyph")
done < <(printf '%s\n' "${ICONS[@]##* }" "$FALLBACK" | perl -CO -lne 'print chr hex')

fallback_glyph="${glyphs[${#glyphs[@]} - 1]}"

if [ "${1:-}" = "--list" ]; then
  for ((i = 0; i < ${#ICONS[@]}; i++)); do
    printf '%-12s %s  U+%s\n' "${ICONS[i]%% *}" "${glyphs[i]}" "${ICONS[i]##* }"
  done
  printf '%-12s %s  U+%s\n' "(fallback)" "$fallback_glyph" "$FALLBACK"
  exit 0
fi

# Aninha de trás pra frente: #{?match,icone,<resto>}
icon="$fallback_glyph"
for ((i = ${#ICONS[@]} - 1; i >= 0; i--)); do
  pattern="${ICONS[i]%% *}"
  icon="#{?#{m:${pattern},#{pane_current_command}},${glyphs[i]},${icon}}"
done

tmux set-option -g @tmux-dotbar-window-status-format " ${icon} #W "

