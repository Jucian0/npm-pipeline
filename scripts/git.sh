
# Git configuration
git init

# Authentication
git config remote.origin.url https://$USERNAME:$PASSWORD@bitbucket.org/$USERNAME/pipeline-npm.git

# Configure git
git config user.name "$USERNAME"
git config user.email "$USER_EMAIL"

abort_on_failure () {
    if [ $? != 0 ]; then
        echo "${1}. Aborting."
        exit 1
    fi
}


git add package.json
git commit -m "[skip CI]" # Required to avoid re-running this CI upon git push
git push
abort_on_failure "Failed to push"

declare -x VERSION=$(jq -r '.version' package.json)

echo $VERSION

git tag $VERSION
git remote -v
git push origin --tags

echo "New Version: $VERSION"