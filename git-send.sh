#!/bin/bash

oone=$1
source /dev/shm/.tokenv || true 
echo "git_send_${oone}  "
( git add -A 2>&1 || true; 
  git commit -m "automerge rdns_automerge_${oone}" 2>&1  || true ) | tee -a "/tmp/gitres_${oone}.log"|grep -i -e ^done -e "|OK" -e fail -e error 

echo "none" > "/tmp/gitres_${oone}.log"
( bash -c "git push --set-upstream origin rdns_automerge_${oone} | tee -a /tmp/gitres_${oone}.log || true" || true ) 
grep "othing to commit" "/tmp/gitres_${oone}.log " 2>/dev/null|| true
(
  echo "# Auto merge from actions";echo;
  echo -n "## generated_UTC: ";date -u +%s;
  echo -n "##generated_TIME: ";date -u ;echo ;
  echo;echo "## git results";echo;
  echo '```';
     wc -l "/tmp/git_${oone}.log" "/tmp/gitres_${oone}.log";
     echo "git result(truncated):"
     echo 
     (cat "/tmp/git_${oone}.log" ;cat "/tmp/gitres_${oone}.log")|head -c 55555
  echo '```';echo;
  ) > "/tmp/pullreq_${oone}.md"
sleep 3;

touch /dev/shm/.lock_git_pr_${oone}
export GITHUB_TOKEN=$PULLREQ_TOKEN

echo -n "Pull Request_creating pull req:"

    while (  test -e /dev/shm/.lock_git_pr_${oone} );do 
       curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/check/github-pull-request"|grep LOCKED -q && (
           echo "WATING FOR GITHUB API to CREATE Pull Requests"
           sleep $(curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/waittime/github-pull-request")
       )
      
      prcreateres=$(gh pr create -B pages -H "rdns_automerge_${oone}" --label automerge --title "Merge rdns_automerge_${oone} into base_branch" --body-file "/tmp/pullreq_${oone}.md" && ( echo PR CREATED;rm /dev/shm/.lock_git_pr_${oone}; curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/lock/github-pull-request?qpm=1" ) ) 
      echo "$prcreateres"
      # unlock / exit if branch failed
      echo "$prcreateres"|grep -i -e "has no history in common"  && rm "/dev/shm/.lock_git_pr_${oone}"

      echo "$prcreateres"|grep -i -e "too quick" -e "too fast" -e "rate limit" &&  curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/lock/github-pull-request?qpm=1"|| true 
      bash -c 'sleep $(($RANDOM%23))'
    done
bash -c 'sleep $(($RANDOM%23))'

export GITHUB_TOKEN=$MERGERS_TOKEN
echo Pull Request Automerge && echo "OPEN PReqs:" && gh pr list --limit 33
gh pr list --limit 33 |grep rdns_automerge|cut  -f1 | while read a ;do 
    echo "CLOSING $a";
    bash -c 'sleep $(($RANDOM%23))'
    while (   curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/check/github-pull-merge"|grep LOCKED -q);do 
      echo "WATING FOR GITHUB API to merge Pull Requests"
      sleep $(curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/waittime/github-pull-merge")
      bash -c 'sleep $(($RANDOM%23))'
    done
    res=$(export GITHUB_TOKEN=$MERGERS_TOKEN;gh pr merge --delete-branch --squash --auto "$a" 2>&1 && curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/lock/github-pull-merge?qpm=1"  ) ;
    
    echo "$res";echo "$res"|grep -i "rate limit" && ( echo "RATE LIMIT HIT .. sleeping and trying again.." ;
                                                      while (   curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/check/github-pull-merge"|grep LOCKED -q);do 
                                                        echo "WATING FOR GITHUB API to merge Pull Requests"
                                                        sleep $(curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/waittime/github-pull-merge")
                                                        bash -c 'sleep $(($RANDOM%23))'
                                                      done
                                                      gh pr merge --delete-branch --squash --auto "$a" 2>&1 && curl -s -u api:$API_LIMIT_HELPER_SECRET "${API_LIMIT_HELPER_URL%/}/lock/github-pull-merge?qpm=1"
                                                      
                                                     ) ;sleep 3;done|| true 
exit 0