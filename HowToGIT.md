# GIT

## HowTo Switch Branches
    git branch -a
    git branch <your_branch_name> <optional remotes/>origin/<your_branch_name>
    git checkout <your_branch_name>

## HowTo Create Your Own Branch

To create your own branch locally:

    git branch <your_branch_name>

To push it to the server, so others can checkout your branch and you backup your branch to the server by normal use of "git push"

    git push -u origin <your_branch_name>

To check if it worked. You should see an entry like "remotes/origin/<your_branch_name>" and an entry like "<your_branch_name>"

    git branch -a 

## HowTo Delete Branches

### Delete local branch

    git branch -d <your_branch_name>

### Delete branch on server

    git push origin --delete <your_branch_name>

### Update list of remote branches

    git remote update origin --prune

### Revoke last commit locally

    git reset --soft HEAD~1
    git reset --hard HEAD~1

### Revoke last commit from server

    git push origin +HEAD

## HowTo create an extra GIT from a subfolder of an existing GIT

http://stackoverflow.com/questions/359424/detach-subdirectory-into-separate-git-repository/17864475#17864475

## HowTo Create a mobile GIT server

You need to clone the github repos in bare mode like this:

    git clone --bare git@github.com:<user>/<repo_name>.git <repo_name>.git
