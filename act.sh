#!/bin/bash

oone=$1

echo "starting_$oone $myoct .. "
mkdir /tmp/$myoct
tar c . |(cd /tmp/$myoct ;tar xv|wc -l)
test -e /tmp/$myoct/.git || exit 1
cd /tmp/$myoct
pwd
echo "GIT ACTIONS_$oone $myoct"
git branch -D rdns_automerge_$oone_${myoct} || true
git checkout -b rdns_automerge_$oone_${myoct} pages
git branch
test -e /tmp/gen_$myoct.log && rm /tmp/gen_$myoct.log
(echo $(date)" STARTING FOR $oone $myoct" )> /tmp/gen_$myoct.log
( bash /tmp/gen.sh  $oone $myoct || true ) 2>&1|tee -a /tmp/gen_$myoct.log)
( git add -A 2>&1 && git commit -m "automerge rdns_automerge_$oone_${myoct}" 2>&1  || true ) | tee /tmp/git_$myoct.log|grep -i -e ^done -e "|OK" -e fail -e error 
echo "none" > /tmp/gitres_$myoct.log
( bash -c "git push --set-upstream origin rdns_automerge_$oone_${myoct} &>/tmp/gitres_$myoct.log || true" || true ) 
bash -c 'grep "othing to commit" /tmp/gitres_$myoct.log || true' || true 
(echo "# Auto merge from actions";echo;echo "generated_UTC: "$(date -u +%s);echo "generated_TIME: "$(date -u );echo ;echo;echo "## git results";echo;echo '```';wc -l /tmp/git_$myoct.log /tmp/gitres_$myoct.log;cat /tmp/git_$myoct.log /tmp/gitres_$myoct.log;echo '```';echo "## generator results";echo;echo '```';wc -l /tmp/gen_$myoct.log;cat /tmp/gen_$myoct.log|grep -e OK -e NXDOMAIN -e REFUSE -e ERR -e SERVFAIL ;echo '```') > /tmp/pullreq.md
sleep 3;
bash -c 'sleep $(($RANDOM%23))'
gh pr create -B pages -H rdns_automerge_$oone_${myoct} --label automerge --title 'Merge rdns_automerge_$oone_${myoct} into base_branch' --body-file /tmp/pullreq.md || true 
echo Pull Request Automerge
echo "OPEN PReqs:" && gh pr list --limit 333 && gh pr list --limit 333 |grep rdns_automerge|cut  -f1 | while read a ;do echo "CLOSING $a";res=$(gh pr merge --delete-branch --squash --auto "$a" 2>&1 || true  ) ;echo "$res";echo "$res"|grep -i "rate limit" && (echo "RATE LIMIT..42s" ;sleep 61 ; gh pr merge --delete-branch --squash --auto "$a" 2>&1 || true  ) ;sleep 3;done|| true 
exit 0