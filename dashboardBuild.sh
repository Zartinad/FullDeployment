dashboardFolder=$1

echo "\n Building Produciton Build of $dashboardFolder \n"

cd $dashboardFolder
npm install
sleep 5
npm run build

