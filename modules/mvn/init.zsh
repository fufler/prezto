#
# Provides Maven aliases and functions.
#
# Authors:
#   Alexey Ermakov <fufler@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[mvn] )); then
  return 1
fi

# Source module files.
source "${0:h}/alias.zsh"
