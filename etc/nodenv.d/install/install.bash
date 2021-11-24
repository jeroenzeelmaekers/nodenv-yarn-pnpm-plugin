#!/usr/bin/env bash

set -e
[ -n "$NODENV_DEBUG" ] && set -x

if declare -Ff after_install > /dev/null; then
  after_install run_after_install
fi

run_after_install() {
  local node_version

  local yarn_status
  local pnpm_status

  local yarn_version
  local pnpm_version

  echo "Installing yarn..."
  yarn_status=0
  NODENV_VERSION="$DEFINITION" nodenv-exec npm install yarn -g --silent || yarn_status="$?"
  echo "Installed Yarn $yarn_version!"

  echo "Installing pnpm..."
  pnpm_version=0
  NODENV_VERSION="$DEFINITION" nodenv-exec npm install pnpm -g --silent || yarn_status="$?"
  echo "Installed pnpm!"
}
