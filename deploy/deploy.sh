#!/bin/bash
WOWACE_PROJECT="$1"
DEPLOY_DIR="$TRAVIS_BUILD_DIR/deploy"

# Setup SSH
mkdir -p "$HOME/.ssh"
openssl aes-256-cbc -K "$encrypted_bfcd8b8ecc98_key" -iv "$encrypted_bfcd8b8ecc98_iv" -in "$DEPLOY_DIR/wowace.key.enc" -out "$HOME/.ssh/id_rsa" -d
chmod -R og= "$HOME/.ssh"

# Force BatchMode for SSH
export GIT_SSH_COMMAND="$(which ssh) -o 'BatchMode Yes'"

# Do push
git push "git@git.wowace.com:wow/${WOWACE_PROJECT}/mainline.git" --tags "$TRAVIS_BRANCH"
