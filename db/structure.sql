-- MySQL dump 10.13  Distrib 5.6.11, for osx10.7 (x86_64)
--
-- Host: localhost    Database: CSC540_Project1a
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
  `unit_no` int(11) NOT NULL AUTO_INCREMENT,
  `manager_fname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_lname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `rent` float DEFAULT NULL,
  `deposit` float DEFAULT NULL,
  `upper_class` tinyint(1) DEFAULT NULL,
  `apt_no` int(11) DEFAULT NULL,
  `no_bath` int(11) DEFAULT NULL,
  PRIMARY KEY (`unit_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_apts`
--

DROP TABLE IF EXISTS `family_apts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_apts` (
  `apt_no` int(11) NOT NULL AUTO_INCREMENT,
  `unit_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_bedrm` int(11) DEFAULT NULL,
  `no_bath` int(11) DEFAULT NULL,
  `rent` float DEFAULT NULL,
  `deposit` float DEFAULT NULL,
  `occupant` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`apt_no`),
  KEY `occupant` (`occupant`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_members`
--

DROP TABLE IF EXISTS `family_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_members` (
  `sid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `housing_requests`
--

DROP TABLE IF EXISTS `housing_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housing_requests` (
  `req_no` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `app_status` int(11) DEFAULT NULL,
  `parking` tinyint(1) DEFAULT NULL,
  `park_class` int(11) DEFAULT NULL,
  `pref_nearby` tinyint(1) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `pay_option` int(11) DEFAULT NULL,
  `movein_date` date DEFAULT NULL,
  `building_pref_1` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `building_pref_2` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `building_pref_3` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apt_pref_1` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apt_pref_2` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apt_pref_3` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`req_no`),
  KEY `apt_pref_1` (`apt_pref_1`) USING BTREE,
  KEY `apt_pref_2` (`apt_pref_2`) USING BTREE,
  KEY `apt_pref_3` (`apt_pref_3`) USING BTREE,
  KEY `building_pref_1` (`building_pref_1`) USING BTREE,
  KEY `building_pref_2` (`building_pref_2`) USING BTREE,
  KEY `building_pref_3` (`building_pref_3`) USING BTREE,
  KEY `park_class` (`park_class`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `sid` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lease_no` int(11) NOT NULL,
  `paid_date` date DEFAULT NULL,
  `pay_method` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `bill_start_date` date DEFAULT NULL,
  `bill_end_date` date DEFAULT NULL,
  PRIMARY KEY (`inv_no`),
  KEY `lease_no` (`lease_no`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maintenance_requests`
--

DROP TABLE IF EXISTS `maintenance_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_requests` (
  `ticket_no` int(11) NOT NULL AUTO_INCREMENT,
  `severity` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `apt_no` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `app_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_no`),
  KEY `apt_no` (`apt_no`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE,
  KEY `unit_no` (`unit_no`,`place_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parking_class`
--

DROP TABLE IF EXISTS `parking_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fee` float DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parking_lots`
--

DROP TABLE IF EXISTS `parking_lots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_lots` (
  `lot_no` int(11) NOT NULL AUTO_INCREMENT,
  `nearby_housing` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lot_no`),
  KEY `nearby_housing` (`nearby_housing`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parking_requests`
--

DROP TABLE IF EXISTS `parking_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_requests` (
  `req_no` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `app_status` int(11) DEFAULT NULL,
  `vehicle_type` int(11) DEFAULT NULL,
  `pref_nearby` tinyint(1) DEFAULT NULL,
  `is_disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`req_no`),
  KEY `sid` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parking_spots`
--

DROP TABLE IF EXISTS `parking_spots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_spots` (
  `spot_no` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `lot_no` int(11) NOT NULL,
  `occupant` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`spot_no`),
  KEY `class_id` (`class_id`) USING BTREE,
  KEY `lot_no` (`lot_no`) USING BTREE,
  KEY `occupant` (`occupant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `p_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nationality` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc_housing`
--

DROP TABLE IF EXISTS `proc_housing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc_housing` (
  `staff_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `req_no` int(11) NOT NULL DEFAULT '0',
  `process_date` date DEFAULT NULL,
  `process_comments` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `req_no` (`req_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc_maintenance`
--

DROP TABLE IF EXISTS `proc_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc_maintenance` (
  `staff_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ticket_no` int(11) NOT NULL DEFAULT '0',
  `process_date` date DEFAULT NULL,
  `process_comments` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ticket_no` (`ticket_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc_termination`
--

DROP TABLE IF EXISTS `proc_termination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc_termination` (
  `staff_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t_req_no` int(11) NOT NULL DEFAULT '0',
  `process_date` date DEFAULT NULL,
  `process_comments` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `t_req_no` (`t_req_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `unit_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `place_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `room_no` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupant` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `occupant` (`occupant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signed_leases`
--

DROP TABLE IF EXISTS `signed_leases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signed_leases` (
  `lease_no` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `unit_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_no` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apt_no` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rent` float DEFAULT NULL,
  `parking_fee` float DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deposit` float DEFAULT NULL,
  `pay_option` int(11) DEFAULT NULL,
  `parking_spot` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`lease_no`),
  KEY `apt_no` (`apt_no`) USING BTREE,
  KEY `parking_spot` (`parking_spot`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE,
  KEY `unit_no` (`unit_no`,`place_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `works_in_building` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `works_in_apt` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_title` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `works_in_apt` (`works_in_apt`) USING BTREE,
  KEY `works_in_building` (`works_in_building`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `s_type` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_comment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_status` int(11) DEFAULT NULL,
  `smoke` tinyint(1) DEFAULT NULL,
  `spec_sneeds` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kin_street` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kin_city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kin_country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kin_fname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kin_lname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `kin_relationship` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kin_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `kin_middle_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_student` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `reason` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  PRIMARY KEY (`t_req_no`),
  KEY `lease_no` (`lease_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-08 13:49:54
INSERT INTO schema_migrations (version) VALUES ('1');

INSERT INTO schema_migrations (version) VALUES ('2');

INSERT INTO schema_migrations (version) VALUES ('3');

INSERT INTO schema_migrations (version) VALUES ('4');

