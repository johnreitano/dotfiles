#!/bin/sh

set -e

echo "Installing dotfiles"

cd "$(dirname "$0")"
yes | env RCRC=$HOME/dotfiles/rcrc rcup

sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.1/zsh-in-docker.sh)" -- \
    -t lambda \
    -p alias-tips \
    -p asdf \
    -p autojump \
    -p bundler \
    -p common-aliases \
    -p docker \
    -p docker-compose \
    -p git \
    -p git-flow \
    -p macos \
    -p rails

    # -p https://github.com/zsh-users/zsh-autosuggestions \
    # -p https://github.com/zsh-users/zsh-completions \
