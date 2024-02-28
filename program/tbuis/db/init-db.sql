CREATE DATABASE IF NOT EXISTS `uis-web-db` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE USER 'uis-web'@'%' IDENTIFIED BY 'uis';
GRANT Create user ON *.* TO 'uis-web'@'%';
GRANT Event ON *.* TO 'uis-web'@'%';
GRANT File ON *.* TO 'uis-web'@'%';
GRANT Process ON *.* TO 'uis-web'@'%';
GRANT Reload ON *.* TO 'uis-web'@'%';
GRANT Replication slave ON *.* TO 'uis-web'@'%';
GRANT Show databases ON *.* TO 'uis-web'@'%';
GRANT Shutdown ON *.* TO 'uis-web'@'%';
GRANT Super ON *.* TO 'uis-web'@'%';
GRANT Create tablespace ON *.* TO 'uis-web'@'%';
GRANT Usage ON *.* TO 'uis-web'@'%';
GRANT Grant option ON *.* TO 'uis-web'@'%';

GRANT Alter ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Create ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Create view ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Delete ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Delete history ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Drop ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Grant option ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Index ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Insert ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT References ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Select ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Show view ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Trigger ON `uis-web-db`.* TO 'uis-web'@'%';
GRANT Update ON `uis-web-db`.* TO 'uis-web'@'%';

