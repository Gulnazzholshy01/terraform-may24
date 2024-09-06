#!/bin/bash
yum update -y
yum install -y http
systemctl start httpd
systemctl enable httpd
echo "<html><body><h1>Session-4 IS DONE, THANK YOU! </h1></body></html>" > /var/www/html/index.html
   