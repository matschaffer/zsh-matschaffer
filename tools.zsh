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
