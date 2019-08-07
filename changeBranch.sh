repo=$1
branch=$2

cd $repo
git checkout $branch
git pull
