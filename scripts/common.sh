#!/bin/sh
md(){
  mkdir "$1" && cd "$1" || exit
}

stashapply(){
  git stash apply "$(git stash list | grep "$1" | cut -d : -f 1)"
}

# Codingal
cgprod(){
  cd ~/main/web \
  && stashapply "prod-build" \
  && sudo rm -rf .next \
  && yarn build \
  && docker-compose down \
  && docker-compose up
}

cgcommit(){
  git commit -m "$(git branch --show-current | cut -d - -f 1,2): $1"
}

cgrelease(){
  release_tag="$(git describe --tags --abbrev=0 | tr -d -c 0-9)"
  cmd="gh release create v$((release_tag + 1)) --generate-notes"
  echo "$cmd" && eval "$cmd"
}

gopen(){
  pr_number="$(gh pr view --json number | jq '.[]')"
  if [ -n "$pr_number" ]; then
    gh browse "$pr_number"
  else
    gh browse
  fi
}
