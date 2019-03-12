#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git checkout -b master
  git stage -A
  git commit --message "Travis-CI: Gerada imagem docker usando Travis-CI"
}

upload_files() {
  git remote add origin-gh https://${GH_TOKEN}@github.com/emanuelflp/nxfilter.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-gh master
}

setup_git
commit_files $1
upload_files