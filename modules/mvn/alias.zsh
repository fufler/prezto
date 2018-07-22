#
# Defines Maven aliases.
#
# Authors:
#   Alexey Ermakov <fufler@gmail.com>
#

#
# Aliases
#

if ! zstyle -t ':prezto:module:mvn:alias' skip 'yes'; then
  # Set revision to current git branch
  alias mvn='mvn -D revision=$( git branch | grep \* | cut -d " " -f2 )'
fi
