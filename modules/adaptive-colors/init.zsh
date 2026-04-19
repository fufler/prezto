local response

oldstty=$(stty -g)

stty raw -echo min 0 time 1
printf "\e]11;?\a"
sleep 0.1
read -r response
stty "$oldstty"

local rgb=${response#*:}
rgb=$( echo $rgb | tr -dc '[:print:]' )

local r_hex
local g_hex
local b_hex

IFS='/' read -r r_hex g_hex b_hex <<< "$rgb"

local R=$((16#${r_hex}))
local G=$((16#${g_hex}))
local B=$((16#${b_hex}))


local lum=$(( (0.2126 * R + 0.7152 * G + 0.0722 * B) / 65535 ))

if (( lum < 0.5 )); then
  export MC_SKIN=dracula256

  if command -v vivid >/dev/null 2>&1; then
    export LS_COLORS="$( vivid generate dracula )"
  fi

  source "$HOME/.zsh/zshsh-dracula/zsh-syntax-highlighting.sh"
else
  export MC_SKIN=nlight
fi
