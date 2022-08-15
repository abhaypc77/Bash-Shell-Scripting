
#!/bin/bash

DB_NAME=test

show_db ()
{
mysql << EOF
show databases;
EOF

}


show_tables ()
{
mysql << EOF

use $DB_NAME;
show tables;
EOF

}


show_data ()
{
echo -n "Enter Table name:"
read TABLE
echo "Table Data"
echo "**********"
mysql << EOF
use $DB_NAME;
select * from $TABLE;
EOF

}


add_data ()
{

TABLE=$1

mysql << EOF

use $DB_NAME;
Insert into $TABLE (productID, productCode, name, quantity, price) VALUES (1009, "Itm", "Shirt", 1, 500);
select * from $TABLE;
EOF


}


while [ 1 ]
do
  echo ""
  echo "Main Menu"
  echo "*********"
  echo "1. SHOW_DATABASE"
  echo "2. SHOW_TABLES"
  echo "3. SHOW_DATA"
  echo "4. ADD_ROWS"
  echo "5. EXIT"
  echo -n "Enter option..."
  read opt
  case $opt in
    1) echo "Database List"
       echo "*************"
       show_db
       echo ""
       ;;
      	  
    2) echo "Tables List"
       echo "***********" 
       show_tables 
       echo ""
       ;;

    3) show_data	
       echo ""
       ;;

    4) add_data products 		  
       ;;
      	  
    5) exit 0
       ;;

    *) exit -1
        	   
  esac   
done  
