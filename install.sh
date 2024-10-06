#!/bin/sh

set -e

yes | env RCRC="${HOME}/dotfiles/rcrc" rcup
