git config remote.origin.url https://$USERNAME:$PASSWORD@bitbucket.org/$USERNAME/pipeline-npm.git
gulp auto-version-patch
git init
git config user.name "$USERNAME"
git config user.email "$USER_EMAIL"
git add package.json
git commit -m "[skip CI]" # Required to avoid re-running this CI upon git push
git push
            - declare -x VERSION=$(jq -r '.version' package.json)
            - echo $VERSION
git tag $VERSION
git remote -v
git push origin --tags