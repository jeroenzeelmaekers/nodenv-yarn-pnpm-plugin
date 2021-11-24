#!/usr/bin/env bash

set -e
[ -n "$NODENV_DEBUG" ] && set -x

if declare -Ff after_install > /dev/null; then
  after_install run_after_install
fi

run_after_install() {
  echo "Installing yarn..."
  nodenv-exec npm install yarn -g --silent
  echo "Installed Yarn!"

  echo "Installing pnpm..."
  nodenv-exec npm install pnpm -g --silent
  echo "Installed pnpm!"
}
