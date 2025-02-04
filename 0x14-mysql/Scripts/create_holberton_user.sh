#!/usr/bin/env bash
# Run on: web-01 & web-02
# Purpose: Create MySQL user 'holberton_user' with replication client privileges

echo "Creating MySQL user 'holberton_user'..."
mysql -u root -p -e "
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'holberton_user'@'localhost';
"
