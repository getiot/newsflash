#!/bin/bash

current_date=$(date +'%Y%m%d')

commit_message="docs: add ${current_date} news flash"

git add .
git commit -m "$commit_message"

remotes=$(git remote -v | awk '{print $1}' | sort | uniq)
main_branch="main"

# 遍历所有远程仓库，推送 main 分支
for remote in $remotes; do
    echo "Pushing to $remote..."
    git push $remote $main_branch
done

echo "Commit and push to all remotes completed."

