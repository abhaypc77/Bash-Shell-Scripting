(echo "Hi All,

 Please find below Health Check Report for Servers:

 `cat hc.logs`



Regards,
Abhay
"
 uuencode hc.logs hc.xls) | mail -s "Health Check Report" abhaypc77@gmail.com
