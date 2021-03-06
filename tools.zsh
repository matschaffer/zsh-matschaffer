alias tailf="tail -f"

# Retry a command till it succeeds (from http://bit.ly/1GnOAhv)
retry() {
  local n=1
  local max=15
  local delay=2
  while true; do
    "$@" && break || {
      if [[ $n -lt $max ]]; then
        ((n++))
        echo "Command failed. Attempt $n/$max:"
        sleep $delay;
      else
        fail "The command has failed after $n attempts."
      fi
    }
  done
}

# Bundle grep, search for text in bundled gems
bgrep() {
  grep -r "$@" $(bundle show --paths)
}

# Bundle find, search for a file in bundled gems
bfind() {
  find $(bundle show --paths) -iname "*$1*"
}

# Find files or directories like $1
# Shortcut for: find <dir> -name *<search>*
flike() {
  local search dir
  if [ -z "$2" ]; then
    search="$1"
    dir=.
  else
    search="$2"
    dir="$1"
  fi
  find "${dir}" -iname "*${search}*"
}

# Appends a public key to .ssh/authorized_keys on the given server.
#
# Usage: ssh_key_upload <server> [key_file.pub]
#
# Defaults to ~/.ssh/id_rsa.pub if no key specified.
ssh_key_upload() {
  local destination publicKey dotSsh authorizedKeys

  destination="$1"
  publicKey="${2:-$HOME/.ssh/id_rsa.pub}"

  dotSsh=".ssh"
  authorizedKeys=".ssh/authorized_keys"

  cat "$publicKey" | ssh "${destination}" "mkdir -p \$HOME/${dotSsh}; chmod 700 \$HOME/${dotSsh}; \
                                           cat >> \$HOME/${authorizedKeys}; chmod 600 \$HOME/${authorizedKeys}"
}

# OS X command to show all listening ports
listening_ports() {
  sudo lsof -P -i -n | grep LISTEN
}

# Gets the Nth whitespace-deliniated field of stdin
nthfield() {
  awk "{ print \$$1 }"
}

# Makes a directory (or recursive) and cds into it
take() {
  mkdir -p $1
  cd $1
}

# Makes a gif from a mov
# Requires ffmpeg & imagemagick
# Courtesy of https://gist.github.com/dergachev/4627207
to_gif() {
  INPUT="$1"
  DIR=`dirname "${INPUT}"`
  FILENAME=`basename "${INPUT}"`
  NAME=${FILENAME%.*}
  ffmpeg -loglevel error -i "${INPUT}" -vf scale=600:-1 -r 7 -f image2pipe -vcodec ppm - | convert -delay 14 +dither -layers Optimize -loop 0 - "${DIR}/${NAME}.gif"
}
