--Remove annonymous users
DELETE FROM mysql.user WHERE User='';
--Prevent root from accessing remotely
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
--Remove test databases
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';