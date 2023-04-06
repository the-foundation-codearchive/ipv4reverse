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
#remote branch del
(git push origin --delete "rdns_automerge_${oone}" || true) |tee -a "/tmp/git_${oone}.log" 
#local branch del
#git branch -D "rdns_automerge_${oone}" || true
git checkout -b "rdns_automerge_${oone}" pages                       2>&1  |tee -a "/tmp/git_${oone}.log" 
git pull origin "rdns_automerge_${oone}" --allow-unrelated-histories 2>&1  |tee -a "/tmp/git_${oone}.log" 
git branch
exit 0