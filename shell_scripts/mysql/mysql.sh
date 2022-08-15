#!/bin/bash

#script to conect to mysql database and print the conect of table products;

DB_USER=root
DB_PASSWD=root
DB_PORT=3306
DB_HOST=127.0.0.1
DB_NAME=inventory

SQL_Query='select * from inventory'

mysql -u $DB_USER -p$DB_PASSWD -P $DB_PORT -h $DB_HOST -D $DB_NAME <<EOF 
$SQL_Query
EOF
