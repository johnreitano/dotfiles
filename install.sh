#!/bin/sh

set -e

echo "Installing dotfiles"

cd "$(dirname "$0")"
yes | env RCRC=$HOME/dotfiles/rcrc rcup
