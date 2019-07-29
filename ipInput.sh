#Initializing two variables 
a=$1
b=""
  
#If empty return public ip address 
if [ "$a" = "" ];
then 
    echo `wget http://ipecho.net/plain -O - -q ; echo`
fi 
  
#If not empty, use given ip address
if [ "$a" != "$b" ]; 
then 
    echo "$a"
fi 
