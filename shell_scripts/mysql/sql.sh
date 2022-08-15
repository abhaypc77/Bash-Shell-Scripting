
#!/bin/bash

HOST=127.0.0.1
USER=root
PASS=root


mysql -h $HOST -u $USER -p$PASS  << EOF

show databases;
use inventory; 
show tables;
select * from abhishek;
EOF
