#!/bin/bash

oone=$1
myoct=$2
source /dev/shm/.tokenv || true 
echo "starting_${oone} ${myoct} .. "
mkdir "/tmp/tmp_${myoct}"
tar c . |(cd "/tmp/tmp_${myoct}"||exit ;tar xv|wc -l)
test -e "/tmp/tmp_${myoct}/.git" || exit 1
cd "/tmp/tmp_${myoct}"|| exit 1
pwd
echo "GIT ACTIONS_${oone} ${myoct}"
#git branch -D "rdns_automerge_${oone}_${myoct}" || true
git checkout -b "rdns_automerge_${oone}_${myoct}" pages
git pull origin "rdns_automerge_${oone}_${myoct}" --allow-unrelated-histories
git branch
test -e "/tmp/gen_${myoct}.log" && rm "/tmp/gen_${myoct}.log"

(echo -n "$(date) ";echo " STARTING FOR ${oone} ${myoct}" )> "/tmp/gen_${myoct}.log"
find lists/ -mindepth 1 -delete
( ( bash /tmp/gen.sh  "${oone}" "${myoct}" || true ) 2>&1|tee -a "/tmp/gen_${myoct}.log")

( git add -A 2>&1 || true; 
  git commit -m "automerge rdns_automerge_${oone}_${myoct}" 2>&1  || true ) | tee "/tmp/git_${myoct}.log"|grep -i -e ^done -e "|OK" -e fail -e error 

echo "none" > "/tmp/gitres_${myoct}.log"
( bash -c "git push --set-upstream origin rdns_automerge_${oone}_${myoct} &>/tmp/gitres_${myoct}.log || true" || true ) 
bash -c 'grep "othing to commit" "/tmp/gitres_${myoct}.log "|| true' || true 
(
  echo "# Auto merge from actions";echo;
  echo -n "## generated_UTC: ";date -u +%s;
  echo -n "##generated_TIME: ";date -u ;echo ;
  echo;echo "## git results";echo;
  echo '```';
     wc -l "/tmp/git_${myoct}.log" "/tmp/gitres_${myoct}.log";
     cat "/tmp/git_${myoct}.log" "/tmp/gitres_${myoct}.log";
  echo '```';echo;
  echo "## generator results";echo;
  echo '```';
     wc -l "/tmp/gen_${myoct}.log";
     grep -e OK -e NXDOMAIN -e REFUSE -e ERR -e SERVFAIL  "/tmp/gen_${myoct}.log" ;
  echo '```';echo
  ) > "/tmp/pullreq_${myoct}.md"
sleep 3;
bash -c 'sleep $(($RANDOM%23))'
echo -n "Pull Request_creating pull req:"
export GITHUB_TOKEN=$PULLREQ_TOKEN
prcreateres=$(gh pr create -B pages -H "rdns_automerge_${oone}_${myoct}" --label automerge --title "Merge rdns_automerge_${oone}_${myoct} into base_branch" --body-file "/tmp/pullreq_${myoct}.md" || true ) || true
echo "$prcreateres"|grep -i "rate limit" && echo "$prcreateres" && sleep 120 && prcreateres=$(gh pr create -B pages -H "rdns_automerge_${oone}_${myoct}" --label automerge --title "Merge rdns_automerge_${oone}_${myoct} into base_branch" --body-file "/tmp/pullreq_${myoct}.md" || true )
echo "$prcreateres"
bash -c 'sleep $(($RANDOM%23))'
export GITHUB_TOKEN=$MERGERS_TOKEN
echo Pull Request Automerge && echo "OPEN PReqs:" && gh pr list --limit 33  && gh pr list --limit 33 |grep rdns_automerge|cut  -f1 | while read a ;do echo "CLOSING $a";res=$(export GITHUB_TOKEN=$MERGERS_TOKEN;gh pr merge --delete-branch --squash --auto "$a" 2>&1 || true  ) ;echo "$res";echo "$res"|grep -i "rate limit" && (echo "RATE LIMIT..42s" ;sleep 61 ; gh pr merge --delete-branch --squash --auto "$a" 2>&1 || true  ) ;sleep 3;done|| true 
exit 0