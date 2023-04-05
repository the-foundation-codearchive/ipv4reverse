#!/bin/bash

oone=$1
source /dev/shm/.tokenv || true 
echo "git_get_${oone}  .. "
mkdir "/tmp/tmp_${oone}"
tar c . |(cd "/tmp/tmp_${oone}"||exit ;tar xv|wc -l)
test -e "/tmp/tmp_${oone}/.git" || exit 1
cd "/tmp/tmp_${oone}"|| exit 1
pwd
echo "GIT ACTIONS_${oone} ${myoct}"
#git branch -D "rdns_automerge_${oone}" || true
git checkout -b "rdns_automerge_${oone}" pages
git pull origin "rdns_automerge_${oone}" --allow-unrelated-histories
git branch
exit 0