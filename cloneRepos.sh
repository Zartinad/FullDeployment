backend=$1
frontendserver=$2
frontendapp=$3

git clone --branch "$backend" https://github.com/MarkdaleMGMT/transaction-methods.git
git clone --branch "$frontendserver" https://github.com/MarkdaleMGMT/frontend-server.git
git clone --branch "$frontendapp" https://github.com/MarkdaleMGMT/frontend-app.git
