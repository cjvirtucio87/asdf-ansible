#!/usr/bin/env bash

set -xeuo pipefail

fail() {
  echo -e "asdf-ansible: $*"
  exit 1
}

list_ansible_versions() {
  curl -L -s 'https://pypi.org/pypi/ansible/json' | jq  -r '.releases | keys | .[]' | sort -V
}

list_all_versions() {
  list_ansible_versions
}

log() {
  local ts
  ts="$(date -Is)"
  >&2 printf '[%s] %s\n' "${ts}" "$1"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-ansible supports release installs only"
  fi

  if [ "$version" == 'latest' ]; then
    version=$(list_ansible_versions | tail -n1)
  fi

  local pip_path
  pip_path="$(command -v pip)"
  log "ansible will be installed using the following pip: ${pip_path}"

  (
    pip install ansible=="$version"

    echo "ansible $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing ansible $version."
  )
}
