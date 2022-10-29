#!/bin/sh
git stash apply stash^{/prod-build} \
&& cd ~/main/web \
&& sudo rm -rf .next \
&& yarn build \
&& docker-compose down \
&& docker-compose up
