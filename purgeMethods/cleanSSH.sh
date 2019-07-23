#When your DO server gets wiped, your old ssh credential stored in your 
#laptop will no longer be valid. You need to delete and reverify the server

ssh=$1
ssh-keygen -R "$1"