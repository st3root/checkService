create database servicestatus;
use servicestatus
CREATE TABLE `status` (
  `ip` varchar(190) NOT NULL,
  `port` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
