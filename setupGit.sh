#a is username and b is email 
a=$1
b=$2
  
#If a is empty, then insert ipaddress for username 
if [ "$a" = "" ];
then 
    git config --global user.name "root@`wget http://ipecho.net/plain -O - -q ; echo`"
fi 
  
#If not empty, use given username
if [ "$a" != "" ]; 
then 
    git config --global user.name "$a"
fi 

#Set email
if [ "$b" = "" ];
then 
    git config --global user.email "root@`wget http://ipecho.net/plain -O - -q ; echo`"
fi 
  
#If not empty, use given username
if [ "$b" != "" ]; 
then 
    git config --global user.email "$b"
fi 


