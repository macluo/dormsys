-- MySQL dump 10.13  Distrib 5.6.11, for osx10.7 (x86_64)
--
-- Host: localhost    Database: CSC540_Project1
-- ------------------------------------------------------
-- Server version	5.6.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buildings_apts`
--

DROP TABLE IF EXISTS `buildings_apts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buildings_apts` (
  `unit_no` varchar(20) NOT NULL DEFAULT '',
  `manager_fname` varchar(20) DEFAULT NULL,
  `manager_lname` varchar(20) DEFAULT NULL,
  `phone_no` char(10) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `upper_class_only` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`unit_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_apts`
--

DROP TABLE IF EXISTS `family_apts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_apts` (
  `apt_no` varchar(10) NOT NULL DEFAULT '',
  `no_bedrm` int(11) DEFAULT NULL,
  `no_bath` int(11) DEFAULT NULL,
  `rent` float DEFAULT NULL,
  `occupant` char(10) DEFAULT NULL,
  PRIMARY KEY (`apt_no`),
  KEY `occupant` (`occupant`),
  CONSTRAINT `family_apts_ibfk_1` FOREIGN KEY (`occupant`) REFERENCES `students` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_members`
--

DROP TABLE IF EXISTS `family_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_members` (
  `sid` char(10) NOT NULL,
  `fname` varchar(20) NOT NULL DEFAULT '',
  `lname` varchar(20) NOT NULL DEFAULT '',
  `mname` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`sid`,`fname`,`lname`),
  CONSTRAINT `family_members_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `housing_requests`
--

DROP TABLE IF EXISTS `housing_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housing_requests` (
  `req_no` int(11) NOT NULL DEFAULT '0',
  `sid` char(10) NOT NULL,
  `app_status` int(11) DEFAULT NULL,
  `parking` tinyint(1) DEFAULT NULL,
  `park_class` int(11) DEFAULT NULL,
  `pref_nearby` tinyint(1) DEFAULT NULL,
  `building_pref_1` varchar(10) DEFAULT NULL,
  `building_pref_2` varchar(10) DEFAULT NULL,
  `building_pref_3` varchar(10) DEFAULT NULL,
  `apt_pref_1` varchar(10) DEFAULT NULL,
  `apt_pref_2` varchar(10) DEFAULT NULL,
  `apt_pref_3` varchar(10) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `pay_option` int(11) DEFAULT NULL,
  `movein_date` date DEFAULT NULL,
  PRIMARY KEY (`req_no`),
  KEY `sid` (`sid`),
  KEY `park_class` (`park_class`),
  KEY `building_pref_1` (`building_pref_1`),
  KEY `building_pref_2` (`building_pref_2`),
  KEY `building_pref_3` (`building_pref_3`),
  KEY `apt_pref_1` (`apt_pref_1`),
  KEY `apt_pref_2` (`apt_pref_2`),
  KEY `apt_pref_3` (`apt_pref_3`),
  CONSTRAINT `housing_requests_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`),
  CONSTRAINT `housing_requests_ibfk_2` FOREIGN KEY (`park_class`) REFERENCES `parking_class` (`class_id`),
  CONSTRAINT `housing_requests_ibfk_3` FOREIGN KEY (`building_pref_1`) REFERENCES `buildings_apts` (`unit_no`),
  CONSTRAINT `housing_requests_ibfk_4` FOREIGN KEY (`building_pref_2`) REFERENCES `buildings_apts` (`unit_no`),
  CONSTRAINT `housing_requests_ibfk_5` FOREIGN KEY (`building_pref_3`) REFERENCES `buildings_apts` (`unit_no`),
  CONSTRAINT `housing_requests_ibfk_6` FOREIGN KEY (`apt_pref_1`) REFERENCES `family_apts` (`apt_no`),
  CONSTRAINT `housing_requests_ibfk_7` FOREIGN KEY (`apt_pref_2`) REFERENCES `family_apts` (`apt_no`),
  CONSTRAINT `housing_requests_ibfk_8` FOREIGN KEY (`apt_pref_3`) REFERENCES `family_apts` (`apt_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `inv_no` int(11) NOT NULL AUTO_INCREMENT,
  `duedate` date DEFAULT NULL,
  `payment_due` float DEFAULT NULL,
  `sid` char(10) DEFAULT NULL,
  `lease_no` int(11) NOT NULL,
  `paid_date` date DEFAULT NULL,
  `pay_method` varchar(10) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `bill_start_date` date DEFAULT NULL,
  `bill_end_date` date DEFAULT NULL,
  PRIMARY KEY (`inv_no`),
  KEY `sid` (`sid`),
  KEY `lease_no` (`lease_no`),
  CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`lease_no`) REFERENCES `signed_leases` (`lease_no`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maintenance_requests`
--

DROP TABLE IF EXISTS `maintenance_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_requests` (
  `ticket_no` int(11) NOT NULL AUTO_INCREMENT,
  `severity` varchar(10) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `apt_no` varchar(10) DEFAULT NULL,
  `place_no` varchar(20) DEFAULT NULL,
  `unit_no` varchar(20) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  `sid` char(10) NOT NULL,
  PRIMARY KEY (`ticket_no`),
  KEY `sid` (`sid`),
  KEY `apt_no` (`apt_no`),
  KEY `place_no` (`place_no`),
  KEY `unit_no` (`unit_no`),
  CONSTRAINT `maintenance_requests_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`),
  CONSTRAINT `maintenance_requests_ibfk_2` FOREIGN KEY (`apt_no`) REFERENCES `family_apts` (`apt_no`),
  CONSTRAINT `maintenance_requests_ibfk_3` FOREIGN KEY (`place_no`) REFERENCES `rooms` (`place_no`),
  CONSTRAINT `maintenance_requests_ibfk_4` FOREIGN KEY (`unit_no`) REFERENCES `buildings_apts` (`unit_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parking_class`
--

DROP TABLE IF EXISTS `parking_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_class` (
  `class_id` int(11) NOT NULL DEFAULT '0',
  `class` varchar(10) DEFAULT NULL,
  `fee` float DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parking_lots`
--

DROP TABLE IF EXISTS `parking_lots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_lots` (
  `lot_no` int(11) NOT NULL DEFAULT '0',
  `nearby_housing` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`lot_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parking_requests`
--

DROP TABLE IF EXISTS `parking_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_requests` (
  `req_no` int(11) NOT NULL AUTO_INCREMENT,
  `sid` char(10) NOT NULL,
  `app_status` int(11) DEFAULT NULL,
  `vehicle_type` int(11) DEFAULT NULL,
  `pref_nearby` tinyint(1) DEFAULT NULL,
  `is_disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`req_no`),
  KEY `sid` (`sid`),
  CONSTRAINT `parking_requests_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parking_spots`
--

DROP TABLE IF EXISTS `parking_spots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_spots` (
  `spot_no` char(10) NOT NULL DEFAULT '',
  `class_id` int(11) DEFAULT NULL,
  `lot_no` int(11) NOT NULL,
  `occupant` char(10) DEFAULT NULL,
  PRIMARY KEY (`spot_no`),
  KEY `lot_no` (`lot_no`),
  KEY `class_id` (`class_id`),
  KEY `occupant` (`occupant`),
  CONSTRAINT `parking_spots_ibfk_3` FOREIGN KEY (`occupant`) REFERENCES `students` (`sid`),
  CONSTRAINT `parking_spots_ibfk_1` FOREIGN KEY (`lot_no`) REFERENCES `parking_lots` (`lot_no`),
  CONSTRAINT `parking_spots_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `parking_class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `pid` char(10) NOT NULL DEFAULT '',
  `password` char(20) NOT NULL,
  `p_type` varchar(10) DEFAULT NULL,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) NOT NULL,
  `nationality` varchar(10) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `phone` char(15) DEFAULT NULL,
  `alt_phone` char(15) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc_housing`
--

DROP TABLE IF EXISTS `proc_housing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc_housing` (
  `staff_id` char(10) NOT NULL DEFAULT '',
  `req_no` int(11) NOT NULL DEFAULT '0',
  `process_date` date DEFAULT NULL,
  `process_comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staff_id`,`req_no`),
  KEY `req_no` (`req_no`),
  CONSTRAINT `proc_housing_ibfk_1` FOREIGN KEY (`req_no`) REFERENCES `housing_requests` (`req_no`) ON DELETE CASCADE,
  CONSTRAINT `proc_housing_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc_maintenance`
--

DROP TABLE IF EXISTS `proc_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc_maintenance` (
  `staff_id` char(10) NOT NULL DEFAULT '',
  `ticket_no` int(11) NOT NULL DEFAULT '0',
  `process_date` date DEFAULT NULL,
  `process_comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staff_id`,`ticket_no`),
  KEY `ticket_no` (`ticket_no`),
  CONSTRAINT `proc_maintenance_ibfk_3` FOREIGN KEY (`ticket_no`) REFERENCES `maintenance_requests` (`ticket_no`),
  CONSTRAINT `proc_maintenance_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc_termination`
--

DROP TABLE IF EXISTS `proc_termination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc_termination` (
  `staff_id` char(10) NOT NULL DEFAULT '',
  `t_req_no` int(11) NOT NULL DEFAULT '0',
  `process_date` date DEFAULT NULL,
  `process_comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staff_id`,`t_req_no`),
  KEY `t_req_no` (`t_req_no`),
  CONSTRAINT `proc_termination_ibfk_3` FOREIGN KEY (`t_req_no`) REFERENCES `termination_requests` (`t_req_no`),
  CONSTRAINT `proc_termination_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `unit_no` varchar(20) NOT NULL,
  `place_no` varchar(10) NOT NULL DEFAULT '',
  `room_no` int(11) DEFAULT NULL,
  `rent` float DEFAULT NULL,
  `occupant` char(10) DEFAULT NULL,
  PRIMARY KEY (`place_no`),
  KEY `unit_no` (`unit_no`),
  KEY `occupant` (`occupant`),
  CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`occupant`) REFERENCES `students` (`sid`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`unit_no`) REFERENCES `buildings_apts` (`unit_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters` (
  `no` int(11) NOT NULL DEFAULT '0',
  `year` int(11) DEFAULT NULL,
  `term` char(10) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signed_leases`
--

DROP TABLE IF EXISTS `signed_leases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signed_leases` (
  `lease_no` int(11) NOT NULL AUTO_INCREMENT,
  `sid` char(10) NOT NULL,
  `place_no` varchar(10) DEFAULT NULL,
  `apt_no` varchar(10) DEFAULT NULL,
  `rent` float DEFAULT NULL,
  `parking_fee` float DEFAULT NULL,
  `start_sem` int(11) DEFAULT NULL,
  `end_sem` int(11) DEFAULT NULL,
  `deposit` float DEFAULT NULL,
  `pay_option` int(11) DEFAULT NULL,
  `parking_spot` char(10) DEFAULT NULL,
  `permit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`lease_no`),
  UNIQUE KEY `permit_id` (`permit_id`),
  UNIQUE KEY `chk_duplicate` (`sid`,`start_sem`,`end_sem`),
  KEY `parking_spot` (`parking_spot`),
  KEY `place_no` (`place_no`),
  KEY `apt_no` (`apt_no`),
  CONSTRAINT `signed_leases_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`),
  CONSTRAINT `signed_leases_ibfk_2` FOREIGN KEY (`parking_spot`) REFERENCES `parking_spots` (`spot_no`),
  CONSTRAINT `signed_leases_ibfk_3` FOREIGN KEY (`place_no`) REFERENCES `rooms` (`place_no`),
  CONSTRAINT `signed_leases_ibfk_4` FOREIGN KEY (`apt_no`) REFERENCES `family_apts` (`apt_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffs` (
  `staff_id` char(10) NOT NULL DEFAULT '',
  `works_in_building` varchar(20) DEFAULT NULL,
  `works_in_apt` varchar(10) DEFAULT NULL,
  `job_title` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `works_in_building` (`works_in_building`),
  KEY `works_in_apt` (`works_in_apt`),
  CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `persons` (`pid`),
  CONSTRAINT `staffs_ibfk_2` FOREIGN KEY (`works_in_building`) REFERENCES `buildings_apts` (`unit_no`),
  CONSTRAINT `staffs_ibfk_3` FOREIGN KEY (`works_in_apt`) REFERENCES `family_apts` (`apt_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `sid` char(10) NOT NULL DEFAULT '',
  `s_type` varchar(5) DEFAULT NULL,
  `add_comment` varchar(100) DEFAULT NULL,
  `s_status` int(11) DEFAULT NULL,
  `smoke` tinyint(1) DEFAULT NULL,
  `spec_sneeds` varchar(50) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `kin_street` varchar(50) DEFAULT NULL,
  `kin_city` varchar(50) DEFAULT NULL,
  `kin_country` varchar(50) DEFAULT NULL,
  `kin_fname` varchar(20) NOT NULL,
  `kin_lname` varchar(20) NOT NULL,
  `kin_phone` char(10) NOT NULL,
  `kin_middle_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `persons` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `termination_requests`
--

DROP TABLE IF EXISTS `termination_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `termination_requests` (
  `t_req_no` int(11) NOT NULL AUTO_INCREMENT,
  `lease_no` int(11) NOT NULL,
  `insp_date` date DEFAULT NULL,
  `app_status` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  PRIMARY KEY (`t_req_no`),
  KEY `lease_no` (`lease_no`),
  CONSTRAINT `termination_requests_ibfk_1` FOREIGN KEY (`lease_no`) REFERENCES `signed_leases` (`lease_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-05 15:29:31
INSERT INTO schema_migrations (version) VALUES ('1');

INSERT INTO schema_migrations (version) VALUES ('3');

INSERT INTO schema_migrations (version) VALUES ('4');

INSERT INTO schema_migrations (version) VALUES ('5');

INSERT INTO schema_migrations (version) VALUES ('6');

INSERT INTO schema_migrations (version) VALUES ('7');

INSERT INTO schema_migrations (version) VALUES ('8');

