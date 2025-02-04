#!/usr/bin/env bash
# Run on: web-01
# Task: 1 - Create holberton_user and configure permissions
# Purpose: Set up MySQL user and database as required by ALX checker

mysql -u root -p <<EOF
-- Drop user if it already exists to prevent errors
DROP USER IF EXISTS 'holberton_user'@'localhost';
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';

-- Create database and table if they don't exist
CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;

CREATE TABLE IF NOT EXISTS nexus6 (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT
);

-- Ensure 'Leon' is in the table
INSERT IGNORE INTO nexus6 (name) VALUES ("Leon");

GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';

-- Drop and recreate replica user
DROP USER IF EXISTS 'replica_user'@'%';
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'replica_user';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';

GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';

-- Drop and recreate web02 user for replication
DROP USER IF EXISTS 'web02'@'34.201.61.21';
CREATE USER 'web02'@'34.201.61.21' IDENTIFIED BY 'web02';
GRANT REPLICATION SLAVE ON *.* TO 'web02'@'34.201.61.21';

FLUSH PRIVILEGES;
EOF
