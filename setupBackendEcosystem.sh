
backend=$1
node inputBackend.js
cp -f "ecosystem.config.js" ./$backend/
