-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: multragatan
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `wp_ab_appointments`
--

DROP TABLE IF EXISTS `wp_ab_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` int(10) unsigned DEFAULT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `google_event_id` varchar(255) DEFAULT NULL,
  `extras_duration` int(11) NOT NULL DEFAULT '0',
  `internal_note` text,
  PRIMARY KEY (`id`),
  KEY `series_id` (`series_id`),
  KEY `staff_id` (`staff_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `wp_ab_appointments_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `wp_ab_series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wp_ab_appointments_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wp_ab_appointments_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_appointments`
--

LOCK TABLES `wp_ab_appointments` WRITE;
/*!40000 ALTER TABLE `wp_ab_appointments` DISABLE KEYS */;
INSERT INTO `wp_ab_appointments` VALUES (1,NULL,1,1,'2017-10-23 09:00:00','2017-10-23 09:15:00',NULL,0,NULL);
/*!40000 ALTER TABLE `wp_ab_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_categories`
--

DROP TABLE IF EXISTS `wp_ab_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_categories`
--

LOCK TABLES `wp_ab_categories` WRITE;
/*!40000 ALTER TABLE `wp_ab_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ab_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_coupon_services`
--

DROP TABLE IF EXISTS `wp_ab_coupon_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_coupon_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `wp_ab_coupon_services_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `wp_ab_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wp_ab_coupon_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_coupon_services`
--

LOCK TABLES `wp_ab_coupon_services` WRITE;
/*!40000 ALTER TABLE `wp_ab_coupon_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ab_coupon_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_coupons`
--

DROP TABLE IF EXISTS `wp_ab_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL DEFAULT '',
  `discount` decimal(3,0) NOT NULL DEFAULT '0',
  `deduction` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usage_limit` int(10) unsigned NOT NULL DEFAULT '1',
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_coupons`
--

LOCK TABLES `wp_ab_coupons` WRITE;
/*!40000 ALTER TABLE `wp_ab_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ab_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_customer_appointments`
--

DROP TABLE IF EXISTS `wp_ab_customer_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_customer_appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `appointment_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned DEFAULT NULL,
  `payment_id` int(10) unsigned DEFAULT NULL,
  `number_of_persons` int(10) unsigned NOT NULL DEFAULT '1',
  `extras` text,
  `custom_fields` text,
  `status` enum('pending','approved','cancelled','rejected') NOT NULL DEFAULT 'approved',
  `token` varchar(255) DEFAULT NULL,
  `time_zone_offset` int(11) DEFAULT NULL,
  `locale` varchar(8) DEFAULT NULL,
  `compound_service_id` int(10) unsigned DEFAULT NULL,
  `compound_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `wp_ab_customer_appointments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `wp_ab_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wp_ab_customer_appointments_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `wp_ab_appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wp_ab_customer_appointments_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `wp_ab_payments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_customer_appointments`
--

LOCK TABLES `wp_ab_customer_appointments` WRITE;
/*!40000 ALTER TABLE `wp_ab_customer_appointments` DISABLE KEYS */;
INSERT INTO `wp_ab_customer_appointments` VALUES (1,1,1,NULL,NULL,1,'[]','[{\"id\":1,\"value\":\"It is great to come \"}]','approved','6689655c106ef23333e0a302b50d1d8f',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wp_ab_customer_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_customers`
--

DROP TABLE IF EXISTS `wp_ab_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wp_user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_customers`
--

LOCK TABLES `wp_ab_customers` WRITE;
/*!40000 ALTER TABLE `wp_ab_customers` DISABLE KEYS */;
INSERT INTO `wp_ab_customers` VALUES (1,NULL,'jenny','076534134','zendasw@gmail.com','');
/*!40000 ALTER TABLE `wp_ab_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_holidays`
--

DROP TABLE IF EXISTS `wp_ab_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `repeat_event` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `wp_ab_holidays_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_holidays`
--

LOCK TABLES `wp_ab_holidays` WRITE;
/*!40000 ALTER TABLE `wp_ab_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ab_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_notifications`
--

DROP TABLE IF EXISTS `wp_ab_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gateway` enum('email','sms') NOT NULL DEFAULT 'email',
  `type` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `copy` tinyint(1) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_notifications`
--

LOCK TABLES `wp_ab_notifications` WRITE;
/*!40000 ALTER TABLE `wp_ab_notifications` DISABLE KEYS */;
INSERT INTO `wp_ab_notifications` VALUES (1,'email','client_pending_appointment',0,0,'Your appointment information','<p>Dear {client_name}.</p>\n<p>This is a confirmation that you have booked {service_name}.</p>\n<p>We are waiting you at {company_address} on {appointment_date} at {appointment_time}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n'),(2,'email','client_pending_appointment_cart',0,0,'Your appointment information','<p>Dear {client_name}.</p>\n<p>This is a confirmation that you have booked the following items:</p>\n<p>{cart_info}</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n'),(3,'email','staff_pending_appointment',0,0,'New booking information','<p>Hello.</p>\n<p>You have new booking.</p>\n<p>Service: {service_name}<br />\nDate: {appointment_date}<br />\nTime: {appointment_time}<br />\nClient name: {client_name}<br />\nClient phone: {client_phone}<br />\nClient email: {client_email}</p>\n'),(4,'email','client_approved_appointment',0,0,'Your appointment information','<p>Dear {client_name}.</p>\n<p>This is a confirmation that you have booked {service_name}.</p>\n<p>We are waiting you at {company_address} on {appointment_date} at {appointment_time}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n'),(5,'email','client_approved_appointment_cart',0,0,'Your appointment information','<p>Dear {client_name}.</p>\n<p>This is a confirmation that you have booked the following items:</p>\n<p>{cart_info}</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n'),(6,'email','staff_approved_appointment',0,0,'New booking information','<p>Hello.</p>\n<p>You have new booking.</p>\n<p>Service: {service_name}<br />\nDate: {appointment_date}<br />\nTime: {appointment_time}<br />\nClient name: {client_name}<br />\nClient phone: {client_phone}<br />\nClient email: {client_email}</p>\n'),(7,'email','client_cancelled_appointment',0,0,'Booking cancellation','<p>Dear {client_name}.</p>\n<p>You have cancelled your booking of {service_name} on {appointment_date} at {appointment_time}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n'),(8,'email','staff_cancelled_appointment',0,0,'Booking cancellation','<p>Hello.</p>\n<p>The following booking has been cancelled.</p>\n<p>Service: {service_name}<br />\nDate: {appointment_date}<br />\nTime: {appointment_time}<br />\nClient name: {client_name}<br />\nClient phone: {client_phone}<br />\nClient email: {client_email}</p>\n'),(9,'email','client_rejected_appointment',0,0,'Booking rejection','<p>Dear {client_name}.</p>\n<p>Your booking of {service_name} on {appointment_date} at {appointment_time} has been rejected.</p>\n<p>Reason: {cancellation_reason}</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n'),(10,'email','staff_rejected_appointment',0,0,'Booking rejection','<p>Hello.</p>\n<p>The following booking has been rejected.</p>\n<p>Reason: {cancellation_reason}</p>\n<p>Service: {service_name}<br />\nDate: {appointment_date}<br />\nTime: {appointment_time}<br />\nClient name: {client_name}<br />\nClient phone: {client_phone}<br />\nClient email: {client_email}</p>\n'),(11,'email','client_new_wp_user',0,0,'New customer','<p>Hello.</p>\n<p>An account was created for you at {site_address}</p>\n<p>Your user details:<br />\nuser: {new_username}<br />\npassword: {new_password}</p>\n<p>Thanks.</p>\n'),(12,'email','client_reminder',0,0,'Your appointment at {company_name}','<p>Dear {client_name}.</p>\n<p>We would like to remind you that you have booked {service_name} tomorrow on {appointment_time}. We are waiting you at {company_address}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n'),(13,'email','client_follow_up',0,0,'Your visit to {company_name}','<p>Dear {client_name}.</p>\n<p>Thank you for choosing {company_name}. We hope you were satisfied with your {service_name}.</p>\n<p>Thank you and we look forward to seeing you again soon.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n'),(14,'email','staff_agenda',0,0,'Your agenda for {tomorrow_date}','<p>Hello.</p>\n<p>Your agenda for tomorrow is:</p>\n<p>{next_day_agenda}</p>\n'),(15,'sms','client_pending_appointment',1,0,'','Dear {client_name}.\nThis is a confirmation that you have booked {service_name}.\nWe are waiting you at {company_address} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}'),(16,'sms','client_pending_appointment_cart',1,0,'','Dear {client_name}.\nThis is a confirmation that you have booked the following items:\n{cart_info}\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}'),(17,'sms','staff_pending_appointment',1,0,'','Hello.\nYou have new booking.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}'),(18,'sms','client_approved_appointment',1,0,'','Dear {client_name}.\nThis is a confirmation that you have booked {service_name}.\nWe are waiting you at {company_address} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}'),(19,'sms','client_approved_appointment_cart',1,0,'','Dear {client_name}.\nThis is a confirmation that you have booked the following items:\n{cart_info}\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}'),(20,'sms','staff_approved_appointment',1,0,'','Hello.\nYou have new booking.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}'),(21,'sms','client_cancelled_appointment',1,0,'','Dear {client_name}.\nYou have cancelled your booking of {service_name} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}'),(22,'sms','staff_cancelled_appointment',1,0,'','Hello.\nThe following booking has been cancelled.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}'),(23,'sms','client_rejected_appointment',1,0,'','Dear {client_name}.\nYour booking of {service_name} on {appointment_date} at {appointment_time} has been rejected.\nReason: {cancellation_reason}\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}'),(24,'sms','staff_rejected_appointment',1,0,'','Hello.\nThe following booking has been rejected.\nReason: {cancellation_reason}\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}'),(25,'sms','client_new_wp_user',1,0,'','Hello.\nAn account was created for you at {site_address}\nYour user details:\nuser: {new_username}\npassword: {new_password}\n\nThanks.'),(26,'sms','client_reminder',0,0,'','Dear {client_name}.\nWe would like to remind you that you have booked {service_name} tomorrow on {appointment_time}. We are waiting you at {company_address}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}'),(27,'sms','client_follow_up',0,0,'','Dear {client_name}.\nThank you for choosing {company_name}. We hope you were satisfied with your {service_name}.\nThank you and we look forward to seeing you again soon.\n{company_name}\n{company_phone}\n{company_website}'),(28,'sms','staff_agenda',0,0,'','Hello.\nYour agenda for tomorrow is:\n{next_day_agenda}');
/*!40000 ALTER TABLE `wp_ab_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_payments`
--

DROP TABLE IF EXISTS `wp_ab_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `type` enum('local','coupon','paypal','authorize_net','stripe','2checkout','payu_latam','payson','mollie','woocommerce') NOT NULL DEFAULT 'local',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','completed') NOT NULL DEFAULT 'completed',
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_payments`
--

LOCK TABLES `wp_ab_payments` WRITE;
/*!40000 ALTER TABLE `wp_ab_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ab_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_schedule_item_breaks`
--

DROP TABLE IF EXISTS `wp_ab_schedule_item_breaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_schedule_item_breaks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_schedule_item_id` int(10) unsigned NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_schedule_item_id` (`staff_schedule_item_id`),
  CONSTRAINT `wp_ab_schedule_item_breaks_ibfk_1` FOREIGN KEY (`staff_schedule_item_id`) REFERENCES `wp_ab_staff_schedule_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_schedule_item_breaks`
--

LOCK TABLES `wp_ab_schedule_item_breaks` WRITE;
/*!40000 ALTER TABLE `wp_ab_schedule_item_breaks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ab_schedule_item_breaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_sent_notifications`
--

DROP TABLE IF EXISTS `wp_ab_sent_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_sent_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_appointment_id` int(10) unsigned DEFAULT NULL,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `gateway` enum('email','sms') NOT NULL DEFAULT 'email',
  `type` varchar(60) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_appointment_id` (`customer_appointment_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `wp_ab_sent_notifications_ibfk_1` FOREIGN KEY (`customer_appointment_id`) REFERENCES `wp_ab_customer_appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wp_ab_sent_notifications_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_sent_notifications`
--

LOCK TABLES `wp_ab_sent_notifications` WRITE;
/*!40000 ALTER TABLE `wp_ab_sent_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ab_sent_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_series`
--

DROP TABLE IF EXISTS `wp_ab_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_series` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repeat` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_series`
--

LOCK TABLES `wp_ab_series` WRITE;
/*!40000 ALTER TABLE `wp_ab_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_ab_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_services`
--

DROP TABLE IF EXISTS `wp_ab_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '900',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `color` varchar(255) NOT NULL DEFAULT '#FFFFFF',
  `capacity` int(11) NOT NULL DEFAULT '1',
  `padding_left` int(11) NOT NULL DEFAULT '0',
  `padding_right` int(11) NOT NULL DEFAULT '0',
  `info` text,
  `type` enum('simple','compound') NOT NULL DEFAULT 'simple',
  `sub_services` text NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `wp_ab_services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `wp_ab_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_services`
--

LOCK TABLES `wp_ab_services` WRITE;
/*!40000 ALTER TABLE `wp_ab_services` DISABLE KEYS */;
INSERT INTO `wp_ab_services` VALUES (1,NULL,'Fransar',900,0.00,'#81d742',1,0,0,'','simple','[]',NULL,NULL,'public',9999),(2,NULL,'Naglar',900,0.00,'#072DDB',1,0,0,'','simple','[]',NULL,NULL,'public',9999);
/*!40000 ALTER TABLE `wp_ab_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_staff`
--

DROP TABLE IF EXISTS `wp_ab_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wp_user_id` bigint(20) unsigned DEFAULT NULL,
  `attachment_id` int(10) unsigned DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `info` text,
  `google_data` text,
  `google_calendar_id` varchar(255) DEFAULT NULL,
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_staff`
--

LOCK TABLES `wp_ab_staff` WRITE;
/*!40000 ALTER TABLE `wp_ab_staff` DISABLE KEYS */;
INSERT INTO `wp_ab_staff` VALUES (1,0,0,'Jenny','','','',NULL,NULL,'public',9999);
/*!40000 ALTER TABLE `wp_ab_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_staff_schedule_items`
--

DROP TABLE IF EXISTS `wp_ab_staff_schedule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_staff_schedule_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `day_index` int(10) unsigned NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids_idx` (`staff_id`,`day_index`),
  CONSTRAINT `wp_ab_staff_schedule_items_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_staff_schedule_items`
--

LOCK TABLES `wp_ab_staff_schedule_items` WRITE;
/*!40000 ALTER TABLE `wp_ab_staff_schedule_items` DISABLE KEYS */;
INSERT INTO `wp_ab_staff_schedule_items` VALUES (1,1,1,'08:00:00','18:00:00'),(2,1,2,'08:00:00','18:00:00'),(3,1,3,'08:00:00','18:00:00'),(4,1,4,'08:00:00','18:00:00'),(5,1,5,'08:00:00','18:00:00'),(6,1,6,'08:00:00','18:00:00'),(7,1,7,'08:00:00','18:00:00');
/*!40000 ALTER TABLE `wp_ab_staff_schedule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_ab_staff_services`
--

DROP TABLE IF EXISTS `wp_ab_staff_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ab_staff_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deposit` varchar(100) NOT NULL DEFAULT '100%',
  `capacity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids_idx` (`staff_id`,`service_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `wp_ab_staff_services_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wp_ab_staff_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_ab_staff_services`
--

LOCK TABLES `wp_ab_staff_services` WRITE;
/*!40000 ALTER TABLE `wp_ab_staff_services` DISABLE KEYS */;
INSERT INTO `wp_ab_staff_services` VALUES (1,1,1,0.00,'100%',1),(2,1,2,0.00,'100%',1);
/*!40000 ALTER TABLE `wp_ab_staff_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_bookings`
--

DROP TABLE IF EXISTS `wp_bup_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_bookings` (
  `booking_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `booking_user_id` int(11) NOT NULL,
  `booking_service_id` int(11) NOT NULL,
  `booking_staff_id` int(11) NOT NULL,
  `booking_cart_id` int(11) NOT NULL DEFAULT '0',
  `booking_template_id` int(1) NOT NULL DEFAULT '0',
  `booking_date` date NOT NULL,
  `booking_time_from` datetime NOT NULL,
  `booking_time_to` datetime NOT NULL,
  `booking_time_offset` int(11) NOT NULL DEFAULT '0',
  `booking_status` int(1) NOT NULL DEFAULT '0',
  `booking_qty` int(11) NOT NULL DEFAULT '1',
  `booking_qty_2` int(11) NOT NULL DEFAULT '0',
  `booking_amount` decimal(11,2) NOT NULL,
  `booking_key` varchar(250) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_bookings`
--

LOCK TABLES `wp_bup_bookings` WRITE;
/*!40000 ALTER TABLE `wp_bup_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_bookings_meta`
--

DROP TABLE IF EXISTS `wp_bup_bookings_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_bookings_meta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `meta_booking_id` int(11) NOT NULL,
  `meta_booking_name` varchar(300) NOT NULL,
  `meta_booking_value` longtext,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_bookings_meta`
--

LOCK TABLES `wp_bup_bookings_meta` WRITE;
/*!40000 ALTER TABLE `wp_bup_bookings_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_bookings_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_carts`
--

DROP TABLE IF EXISTS `wp_bup_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_carts` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_key` varchar(250) NOT NULL,
  `cart_date` date NOT NULL,
  `cart_amount` decimal(11,2) NOT NULL,
  `cart_status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `cart_key` (`cart_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_carts`
--

LOCK TABLES `wp_bup_carts` WRITE;
/*!40000 ALTER TABLE `wp_bup_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_categories`
--

DROP TABLE IF EXISTS `wp_bup_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_categories` (
  `cate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cate_template_id` int(11) NOT NULL DEFAULT '0',
  `cate_name` varchar(300) NOT NULL,
  `cate_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_categories`
--

LOCK TABLES `wp_bup_categories` WRITE;
/*!40000 ALTER TABLE `wp_bup_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_filter_staff`
--

DROP TABLE IF EXISTS `wp_bup_filter_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_filter_staff` (
  `fstaff_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fstaff_staff_id` int(11) NOT NULL,
  `fstaff_location_id` int(11) NOT NULL,
  PRIMARY KEY (`fstaff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_filter_staff`
--

LOCK TABLES `wp_bup_filter_staff` WRITE;
/*!40000 ALTER TABLE `wp_bup_filter_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_filter_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_filters`
--

DROP TABLE IF EXISTS `wp_bup_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_name` varchar(300) NOT NULL,
  `filter_email` varchar(300) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_filters`
--

LOCK TABLES `wp_bup_filters` WRITE;
/*!40000 ALTER TABLE `wp_bup_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_orders`
--

DROP TABLE IF EXISTS `wp_bup_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_booking_id` int(11) NOT NULL,
  `order_method_name` varchar(60) NOT NULL,
  `order_key` varchar(250) NOT NULL,
  `order_txt_id` varchar(60) NOT NULL,
  `order_status` varchar(60) NOT NULL,
  `order_amount` decimal(11,2) NOT NULL,
  `order_qty` int(11) NOT NULL DEFAULT '1',
  `order_date` date NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_orders`
--

LOCK TABLES `wp_bup_orders` WRITE;
/*!40000 ALTER TABLE `wp_bup_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_service_rates`
--

DROP TABLE IF EXISTS `wp_bup_service_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_service_rates` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `rate_service_id` int(11) NOT NULL,
  `rate_staff_id` int(11) NOT NULL,
  `rate_price` decimal(11,2) NOT NULL,
  `rate_capacity` int(11) NOT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_service_rates`
--

LOCK TABLES `wp_bup_service_rates` WRITE;
/*!40000 ALTER TABLE `wp_bup_service_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_service_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_service_variable_pricing`
--

DROP TABLE IF EXISTS `wp_bup_service_variable_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_service_variable_pricing` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `rate_service_id` int(11) NOT NULL,
  `rate_price` decimal(11,2) NOT NULL,
  `rate_person` int(11) NOT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_service_variable_pricing`
--

LOCK TABLES `wp_bup_service_variable_pricing` WRITE;
/*!40000 ALTER TABLE `wp_bup_service_variable_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_service_variable_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_services`
--

DROP TABLE IF EXISTS `wp_bup_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_title` varchar(300) NOT NULL,
  `service_color` varchar(10) DEFAULT NULL,
  `service_font_color` varchar(10) DEFAULT NULL,
  `service_duration` int(11) NOT NULL,
  `service_padding_before` int(11) NOT NULL DEFAULT '0',
  `service_padding_after` int(11) NOT NULL DEFAULT '0',
  `service_capacity` int(11) NOT NULL DEFAULT '1',
  `service_allow_multiple` int(1) DEFAULT NULL,
  `service_pricing_calculation_type` int(1) DEFAULT '1',
  `service_category_id` int(11) NOT NULL,
  `service_icon` varchar(50) NOT NULL,
  `service_price` decimal(11,2) NOT NULL,
  `service_price_2` decimal(11,2) DEFAULT '0.00',
  `service_type` int(1) NOT NULL DEFAULT '0',
  `service_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_services`
--

LOCK TABLES `wp_bup_services` WRITE;
/*!40000 ALTER TABLE `wp_bup_services` DISABLE KEYS */;
INSERT INTO `wp_bup_services` VALUES (1,'Fransar','#81d742','',1800,0,0,2,0,1,0,'',5999.00,NULL,0,0),(2,'Fransar','#81d742','',900,0,0,2,0,1,0,'',599.00,NULL,0,0),(3,'a','','',900,0,0,1,0,1,0,'',599.00,NULL,0,0);
/*!40000 ALTER TABLE `wp_bup_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_staff_availability`
--

DROP TABLE IF EXISTS `wp_bup_staff_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_staff_availability` (
  `avail_id` int(11) NOT NULL AUTO_INCREMENT,
  `avail_staff_id` int(11) NOT NULL,
  `avail_day` int(11) NOT NULL,
  `avail_from` time NOT NULL,
  `avail_to` time NOT NULL,
  PRIMARY KEY (`avail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_staff_availability`
--

LOCK TABLES `wp_bup_staff_availability` WRITE;
/*!40000 ALTER TABLE `wp_bup_staff_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_staff_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bup_staff_availability_breaks`
--

DROP TABLE IF EXISTS `wp_bup_staff_availability_breaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bup_staff_availability_breaks` (
  `break_id` int(11) NOT NULL AUTO_INCREMENT,
  `break_staff_id` int(11) NOT NULL,
  `break_staff_day` int(11) NOT NULL,
  `break_time_from` time NOT NULL,
  `break_time_to` time NOT NULL,
  PRIMARY KEY (`break_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bup_staff_availability_breaks`
--

LOCK TABLES `wp_bup_staff_availability_breaks` WRITE;
/*!40000 ALTER TABLE `wp_bup_staff_availability_breaks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bup_staff_availability_breaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_hugeit_maps_circles`
--

DROP TABLE IF EXISTS `wp_hugeit_maps_circles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_hugeit_maps_circles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci,
  `center_lat` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `center_lng` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `radius` int(50) NOT NULL DEFAULT '50000',
  `line_width` int(3) NOT NULL DEFAULT '5',
  `line_opacity` float NOT NULL DEFAULT '0.8',
  `line_color` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'FF2B39',
  `fill_color` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '4FFF72',
  `fill_opacity` float NOT NULL DEFAULT '0.4',
  `hover_line_opacity` float NOT NULL DEFAULT '0.6',
  `hover_line_color` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'FF5C5C',
  `hover_fill_color` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '96FFA1',
  `hover_fill_opacity` float NOT NULL DEFAULT '0.3',
  `show_marker` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_hugeit_maps_circles`
--

LOCK TABLES `wp_hugeit_maps_circles` WRITE;
/*!40000 ALTER TABLE `wp_hugeit_maps_circles` DISABLE KEYS */;
INSERT INTO `wp_hugeit_maps_circles` VALUES (1,1,'My First Circle','40.805493843894','-76.316528320312',50000,5,0.8,'FF2B39','4FFF72',0.4,0.6,'FF5C5C','96FFA1',0.3,0);
/*!40000 ALTER TABLE `wp_hugeit_maps_circles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_hugeit_maps_directions`
--

DROP TABLE IF EXISTS `wp_hugeit_maps_directions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_hugeit_maps_directions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci,
  `start_lat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `start_lng` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `end_lat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `end_lng` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `line_color` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'FF0F0F',
  `line_width` int(2) NOT NULL DEFAULT '5',
  `line_opacity` float NOT NULL DEFAULT '0.9',
  `show_steps` int(1) NOT NULL DEFAULT '0',
  `travel_mode` enum('DRIVING','WALKING','BICYCLING','TRANSIT') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'DRIVING',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_hugeit_maps_directions`
--

LOCK TABLES `wp_hugeit_maps_directions` WRITE;
/*!40000 ALTER TABLE `wp_hugeit_maps_directions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_hugeit_maps_directions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_hugeit_maps_maps`
--

DROP TABLE IF EXISTS `wp_hugeit_maps_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_hugeit_maps_maps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_520_ci,
  `type` enum('ROADMAP','SATELLITE','HYBRID','TERRAIN') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ROADMAP',
  `zoom` int(2) NOT NULL DEFAULT '2',
  `border_radius` int(2) NOT NULL DEFAULT '0',
  `center_lat` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `center_lng` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `pan_controller` int(1) unsigned NOT NULL DEFAULT '1',
  `zoom_controller` int(1) unsigned NOT NULL DEFAULT '1',
  `type_controller` int(1) unsigned NOT NULL DEFAULT '1',
  `scale_controller` int(1) unsigned NOT NULL DEFAULT '1',
  `street_view_controller` int(1) unsigned NOT NULL DEFAULT '1',
  `overview_map_controller` int(1) unsigned NOT NULL DEFAULT '1',
  `width` int(3) NOT NULL DEFAULT '100',
  `height` int(3) NOT NULL DEFAULT '450',
  `align` enum('left','right','center') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'left',
  `wheel_scroll` int(1) unsigned NOT NULL DEFAULT '1',
  `draggable` int(1) unsigned NOT NULL DEFAULT '1',
  `language` text COLLATE utf8mb4_unicode_520_ci,
  `min_zoom` int(2) NOT NULL DEFAULT '0',
  `max_zoom` int(2) NOT NULL DEFAULT '22',
  `info_type` enum('click','hover') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'click',
  `open_infowindows_onload` int(1) unsigned NOT NULL DEFAULT '0',
  `traffic_layer` int(1) unsigned NOT NULL DEFAULT '0',
  `bike_layer` int(1) unsigned NOT NULL DEFAULT '0',
  `transit_layer` int(1) unsigned NOT NULL DEFAULT '0',
  `styling_hue` varchar(7) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `styling_lightness` int(3) NOT NULL DEFAULT '0',
  `styling_gamma` int(2) unsigned NOT NULL DEFAULT '1',
  `styling_saturation` int(3) NOT NULL DEFAULT '0',
  `animation` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'none',
  `locator_enabled` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_hugeit_maps_maps`
--

LOCK TABLES `wp_hugeit_maps_maps` WRITE;
/*!40000 ALTER TABLE `wp_hugeit_maps_maps` DISABLE KEYS */;
INSERT INTO `wp_hugeit_maps_maps` VALUES (1,'My First Map','ROADMAP',15,0,'59.3306685','18.0579323',1,1,1,1,1,1,100,300,'center',1,1,'location based',0,22,'click',0,0,0,0,'',0,1,0,'none',0);
/*!40000 ALTER TABLE `wp_hugeit_maps_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_hugeit_maps_markers`
--

DROP TABLE IF EXISTS `wp_hugeit_maps_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_hugeit_maps_markers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(11) unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci,
  `lat` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `lng` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `animation` enum('BOUNCE','DROP','NONE') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'NONE',
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `img` text COLLATE utf8mb4_unicode_520_ci,
  `size` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_hugeit_maps_markers`
--

LOCK TABLES `wp_hugeit_maps_markers` WRITE;
/*!40000 ALTER TABLE `wp_hugeit_maps_markers` DISABLE KEYS */;
INSERT INTO `wp_hugeit_maps_markers` VALUES (3,1,'','59.3306685','18.0579323','NONE','',NULL,NULL),(4,1,'','59.3306685','18.0579323','NONE','',NULL,NULL);
/*!40000 ALTER TABLE `wp_hugeit_maps_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_hugeit_maps_polygons`
--

DROP TABLE IF EXISTS `wp_hugeit_maps_polygons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_hugeit_maps_polygons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(11) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci,
  `data` longtext COLLATE utf8mb4_unicode_520_ci,
  `line_opacity` varchar(3) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0.9',
  `line_color` varchar(6) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'FF0F0F',
  `fill_opacity` varchar(3) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0.5',
  `fill_color` varchar(6) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '5DFF0D',
  `url` text COLLATE utf8mb4_unicode_520_ci,
  `hover_line_opacity` varchar(3) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0.5',
  `hover_line_color` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'FF80B7',
  `hover_fill_opacity` varchar(3) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0.5',
  `hover_fill_color` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '75FF7E',
  `line_width` int(2) NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_hugeit_maps_polygons`
--

LOCK TABLES `wp_hugeit_maps_polygons` WRITE;
/*!40000 ALTER TABLE `wp_hugeit_maps_polygons` DISABLE KEYS */;
INSERT INTO `wp_hugeit_maps_polygons` VALUES (1,1,'My First Polygon','(40.538851525354666, -74.3060302734375),(40.16208338164619, -73.9764404296875),(39.40224434029277, -74.3499755859375),(38.950865400920016, -74.8883056640625),(39.13858199058352, -75.0091552734375),(39.46164364205549, -75.5035400390625),(39.774769485295465, -75.4815673828125),(39.86758762451019, -75.0201416015625)','0.9','E2574C','0.5','F6C37A','http://www.huge-it.com','0.8','FF80B7','0.5','75FF7E',5);
/*!40000 ALTER TABLE `wp_hugeit_maps_polygons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_hugeit_maps_polylines`
--

DROP TABLE IF EXISTS `wp_hugeit_maps_polylines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_hugeit_maps_polylines` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(11) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci,
  `data` text COLLATE utf8mb4_unicode_520_ci,
  `line_opacity` varchar(5) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0.9',
  `line_color` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '18A326',
  `line_width` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '5',
  `hover_line_color` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '11A000',
  `hover_line_opacity` float NOT NULL DEFAULT '0.5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_hugeit_maps_polylines`
--

LOCK TABLES `wp_hugeit_maps_polylines` WRITE;
/*!40000 ALTER TABLE `wp_hugeit_maps_polylines` DISABLE KEYS */;
INSERT INTO `wp_hugeit_maps_polylines` VALUES (1,1,'My First Polyline','(42.24071874922666, -71.81488037109375),(42.1532233123986, -71.95770263671875),(42.13082130188811, -72.06207275390625),(42.14507804381756, -72.125244140625),(42.18579390537848, -72.2186279296875),(42.16340342422401, -72.2845458984375),(42.1837587346522, -72.3175048828125),(42.1552594657786, -72.36968994140625),(42.169510705216595, -72.4822998046875),(42.157295553651636, -72.630615234375),(42.13896840458089, -72.72674560546875),(42.165439250064324, -72.850341796875),(42.173581898327754, -72.92312622070312),(42.2366518803206, -73.00277709960938),(42.24478535602799, -73.10714721679688),(42.30169032824452, -73.17306518554688),(42.3016903282445, -73.34884643554688),(42.37883631647602, -73.45596313476562),(42.41940144722477, -73.54385375976562),(42.47209690919285, -73.63174438476562),(42.482225570025925, -73.67294311523438),(42.50652766705062, -73.78005981445312),(42.34027515373573, -73.85421752929688),(42.173581898327754, -73.93112182617188),(41.9921602333763, -73.99703979492188),(41.91249742196845, -74.04098510742188),(41.83682786072714, -74.17831420898438),(41.79179268262892, -74.23599243164062),(41.75492216766298, -74.36782836914062),(41.70777900286713, -74.38430786132812),(41.582579601430346, -74.48318481445312),(41.36238012945534, -74.70291137695312)','0.9','18A326','4','11A000',0.5);
/*!40000 ALTER TABLE `wp_hugeit_maps_polylines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_hugeit_maps_stores`
--

DROP TABLE IF EXISTS `wp_hugeit_maps_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_hugeit_maps_stores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locator_addr` varchar(80) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locator_phone` varchar(80) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locator_days` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locator_lat` float(10,6) NOT NULL,
  `locator_lng` float(10,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_hugeit_maps_stores`
--

LOCK TABLES `wp_hugeit_maps_stores` WRITE;
/*!40000 ALTER TABLE `wp_hugeit_maps_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_hugeit_maps_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://127.0.0.1/wp','yes'),(2,'home','http://127.0.0.1/wp','yes'),(3,'blogname','Sky Garden Salon','yes'),(4,'blogdescription','Another beautiful you','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','zendasw@gmail.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','1','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','0','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/index.php/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'rewrite_rules','a:90:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:57:\"index.php/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:45:\"index.php/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:54:\"index.php/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:49:\"index.php/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:30:\"index.php/tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:42:\"index.php/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:24:\"index.php/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:55:\"index.php/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:50:\"index.php/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:31:\"index.php/type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:43:\"index.php/type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:25:\"index.php/type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:42:\"index.php/feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:37:\"index.php/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:18:\"index.php/embed/?$\";s:21:\"index.php?&embed=true\";s:30:\"index.php/page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:37:\"index.php/comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=36&cpage=$matches[1]\";s:51:\"index.php/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:46:\"index.php/comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:27:\"index.php/comments/embed/?$\";s:21:\"index.php?&embed=true\";s:54:\"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:49:\"index.php/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:30:\"index.php/search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:42:\"index.php/search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:24:\"index.php/search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:57:\"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:45:\"index.php/author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:79:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:55:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:49:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:66:\"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:42:\"index.php/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:54:\"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:36:\"index.php/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:53:\"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:48:\"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:29:\"index.php/([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:41:\"index.php/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:23:\"index.php/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:68:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:78:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:98:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:74:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:63:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:87:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:75:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:71:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:57:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:67:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:87:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:63:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:48:\"index.php/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:37:\"index.php/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"index.php/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"index.php/.?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"index.php/(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:30:\"index.php/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:50:\"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:45:\"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:38:\"index.php/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:45:\"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:34:\"index.php/(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:3:{i:0;s:27:\"booking-ultra-pro/index.php\";i:1;s:51:\"bookly-responsive-appointment-booking-tool/main.php\";i:2;s:25:\"google-maps/googlemap.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','a:3:{i:0;s:54:\"/var/www/html/wp/wp-content/themes/skt-spa/sidebar.php\";i:2;s:52:\"/var/www/html/wp/wp-content/themes/skt-spa/style.css\";i:3;s:0:\"\";}','no'),(40,'template','skt-spa','yes'),(41,'stylesheet','skt-spa','yes'),(42,'comment_whitelist','1','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','0','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','38590','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','','yes'),(51,'blog_public','0','yes'),(52,'default_link_category','2','yes'),(53,'show_on_front','page','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','1','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','mystery','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','none','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','0','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','5','yes'),(73,'page_comments','0','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','asc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:3:{i:1;a:0:{}i:2;a:4:{s:5:\"title\";s:0:\"\";s:4:\"text\";s:0:\"\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(81,'uninstall_plugins','a:1:{s:51:\"bookly-responsive-appointment-booking-tool/main.php\";a:2:{i:0;s:21:\"BooklyLite\\Lib\\Plugin\";i:1;s:9:\"uninstall\";}}','no'),(82,'timezone_string','','yes'),(83,'page_for_posts','0','yes'),(84,'page_on_front','36','yes'),(85,'default_post_format','0','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','0','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'initial_db_version','38590','yes'),(92,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(93,'fresh_site','0','yes'),(94,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(95,'widget_recent-posts','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;s:9:\"show_date\";b:0;}s:12:\"_multiwidget\";i:1;}','yes'),(96,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(98,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(99,'sidebars_widgets','a:4:{s:19:\"wp_inactive_widgets\";a:3:{i:0;s:10:\"archives-2\";i:1;s:14:\"recent-posts-2\";i:2;s:6:\"meta-2\";}s:9:\"sidebar-1\";a:0:{}s:11:\"twitter-wid\";a:0:{}s:13:\"array_version\";i:3;}','yes'),(100,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(101,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(104,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(105,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(106,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(107,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(108,'cron','a:5:{i:1523921898;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1523921950;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1523924675;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1523968885;a:1:{s:20:\"bookly_daily_routine\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(109,'theme_mods_twentyseventeen','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1507335269;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),(120,'_site_transient_timeout_browser_53c835787f4d2406131985633c1842d0','1507937914','no'),(121,'_site_transient_browser_53c835787f4d2406131985633c1842d0','a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"50.0\";s:8:\"platform\";s:5:\"Linux\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"56\";s:7:\"upgrade\";b:1;s:8:\"insecure\";b:1;s:6:\"mobile\";b:0;}','no'),(122,'can_compress_scripts','0','no'),(129,'_site_transient_timeout_wporg_theme_feature_list','1507346037','no'),(130,'_site_transient_wporg_theme_feature_list','a:3:{s:6:\"Layout\";a:7:{i:0;s:11:\"grid-layout\";i:1;s:10:\"one-column\";i:2;s:11:\"two-columns\";i:3;s:13:\"three-columns\";i:4;s:12:\"four-columns\";i:5;s:12:\"left-sidebar\";i:6;s:13:\"right-sidebar\";}s:8:\"Features\";a:20:{i:0;s:19:\"accessibility-ready\";i:1;s:10:\"buddypress\";i:2;s:17:\"custom-background\";i:3;s:13:\"custom-colors\";i:4;s:13:\"custom-header\";i:5;s:11:\"custom-menu\";i:6;s:12:\"editor-style\";i:7;s:21:\"featured-image-header\";i:8;s:15:\"featured-images\";i:9;s:15:\"flexible-header\";i:10;s:14:\"footer-widgets\";i:11;s:20:\"front-page-post-form\";i:12;s:19:\"full-width-template\";i:13;s:12:\"microformats\";i:14;s:12:\"post-formats\";i:15;s:20:\"rtl-language-support\";i:16;s:11:\"sticky-post\";i:17;s:13:\"theme-options\";i:18;s:17:\"threaded-comments\";i:19;s:17:\"translation-ready\";}s:7:\"Subject\";a:9:{i:0;s:4:\"blog\";i:1;s:10:\"e-commerce\";i:2;s:9:\"education\";i:3;s:13:\"entertainment\";i:4;s:14:\"food-and-drink\";i:5;s:7:\"holiday\";i:6;s:4:\"news\";i:7;s:11:\"photography\";i:8;s:9:\"portfolio\";}}','no'),(137,'current_theme','SKT Spa','yes'),(138,'theme_mods_skt-spa','a:5:{i:0;b:0;s:18:\"custom_css_post_id\";i:-1;s:10:\"hide_boxes\";s:0:\"\";s:10:\"gplus_link\";s:0:\"\";s:11:\"linked_link\";s:0:\"\";}','yes'),(139,'theme_switched','','yes'),(151,'recently_activated','a:0:{}','yes'),(152,'widget_hugeit_maps_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(153,'hugeit_maps_version','2.2.6','yes'),(154,'_transient_timeout_plugin_slugs','1508099481','no'),(155,'_transient_plugin_slugs','a:5:{i:0;s:19:\"akismet/akismet.php\";i:1;s:27:\"booking-ultra-pro/index.php\";i:2;s:51:\"bookly-responsive-appointment-booking-tool/main.php\";i:3;s:9:\"hello.php\";i:4;s:25:\"google-maps/googlemap.php\";}','no'),(157,'hugeit_maps_api_key',' AIzaSyByiLiACqJg4_WdcjejchMAhGztMJMZV1U ','yes'),(163,'_site_transient_timeout_browser_b0e14a603fb7485782db9b8afe25c280','1508588129','no'),(164,'_site_transient_browser_b0e14a603fb7485782db9b8afe25c280','a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"56.0\";s:8:\"platform\";s:5:\"Linux\";s:10:\"update_url\";s:24:\"https://www.firefox.com/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"56\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(165,'_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b','1508026530','no'),(166,'_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b','<div class=\"rss-widget\"><ul><li>An error has occurred, which probably means the feed is down. Try again later.</li></ul></div><div class=\"rss-widget\"><ul><li>An error has occurred, which probably means the feed is down. Try again later.</li></ul></div>','no'),(167,'_site_transient_timeout_community-events-1aecf33ab8525ff212ebdffbb438372e','1508026531','no'),(168,'_site_transient_community-events-1aecf33ab8525ff212ebdffbb438372e','a:2:{s:8:\"location\";a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}s:6:\"events\";a:1:{i:0;a:7:{s:4:\"type\";s:8:\"wordcamp\";s:5:\"title\";s:18:\"WordCamp Stockholm\";s:3:\"url\";s:35:\"https://2017.stockholm.wordcamp.org\";s:6:\"meetup\";N;s:10:\"meetup_url\";N;s:4:\"date\";s:19:\"2017-11-20 00:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:18:\"Stockholm,  Sweden\";s:7:\"country\";s:2:\"SE\";s:8:\"latitude\";d:59.330103000000001;s:9:\"longitude\";d:18.055915200000001;}}}}','no'),(174,'bookly_data_loaded','1','yes'),(175,'bookly_db_version','13.1','yes'),(176,'bookly_installation_time','1507984885','yes'),(177,'bookly_grace_start','1509194485','yes'),(178,'bookly_envato_purchase_code','','yes'),(179,'bookly_enabled','1','yes'),(180,'bookly_app_color','#57dd2a','yes'),(181,'bookly_app_required_employee','0','yes'),(182,'bookly_app_show_blocked_timeslots','1','yes'),(183,'bookly_app_show_calendar','0','yes'),(184,'bookly_app_show_day_one_column','1','yes'),(185,'bookly_app_show_progress_tracker','0','yes'),(186,'bookly_app_staff_name_with_price','1','yes'),(187,'bookly_api_server_error_time','0','yes'),(188,'bookly_l10n_button_apply','Apply','yes'),(189,'bookly_l10n_button_back','Back','yes'),(190,'bookly_l10n_button_book_more','Book More','yes'),(191,'bookly_l10n_button_next','Next','yes'),(192,'bookly_l10n_info_cart_step','Below you can find a list of services selected for booking.\nClick BOOK MORE if you want to add more services.','yes'),(193,'bookly_l10n_info_complete_step','Thank you! Your booking is complete. An email with details of your booking has been sent to you.','yes'),(194,'bookly_l10n_info_coupon','The total price for the booking is {total_price}.','yes'),(195,'bookly_l10n_info_details_step','You selected a booking for {service_name} by {staff_name} at {service_time} on {service_date}. The price for the service is {service_price}.\nPlease provide your details in the form below to proceed with booking.','yes'),(196,'bookly_l10n_info_details_step_guest','','yes'),(197,'bookly_l10n_info_payment_step','Please tell us how you would like to pay:','yes'),(198,'bookly_l10n_info_service_step','Please select service:','yes'),(199,'bookly_l10n_info_time_step','Below you can find a list of available time slots for {service_name} by {staff_name}.\nClick on a time slot to proceed with booking.','yes'),(200,'bookly_l10n_label_category','Category','yes'),(201,'bookly_l10n_label_ccard_code','Card Security Code','yes'),(202,'bookly_l10n_label_ccard_expire','Expiration Date','yes'),(203,'bookly_l10n_label_ccard_number','Credit Card Number','yes'),(204,'bookly_l10n_label_coupon','Coupon','yes'),(205,'bookly_l10n_label_email','Email','yes'),(206,'bookly_l10n_label_employee','Employee','yes'),(207,'bookly_l10n_label_finish_by','Finish by','yes'),(208,'bookly_l10n_label_name','Name','yes'),(209,'bookly_l10n_label_number_of_persons','Number of persons','yes'),(210,'bookly_l10n_label_pay_ccard','I will pay now with Credit Card','yes'),(211,'bookly_l10n_label_pay_locally','I will pay locally','yes'),(212,'bookly_l10n_label_pay_mollie','I will pay now with Mollie','yes'),(213,'bookly_l10n_label_pay_paypal','I will pay now with PayPal','yes'),(214,'bookly_l10n_label_phone','Phone','yes'),(215,'bookly_l10n_label_select_date','I\'m available on or after','yes'),(216,'bookly_l10n_label_service','Service','yes'),(217,'bookly_l10n_label_start_from','Start from','yes'),(218,'bookly_l10n_option_category','Select category','yes'),(219,'bookly_l10n_option_employee','Any','yes'),(220,'bookly_l10n_option_service','Select service','yes'),(221,'bookly_l10n_required_email','Please tell us your email','yes'),(222,'bookly_l10n_required_employee','Please select an employee','yes'),(223,'bookly_l10n_required_name','Please tell us your name','yes'),(224,'bookly_l10n_required_phone','Please tell us your phone','yes'),(225,'bookly_l10n_required_service','Please select a service','yes'),(226,'bookly_l10n_step_cart','Cart','yes'),(227,'bookly_l10n_step_details','Details','yes'),(228,'bookly_l10n_step_done','Done','yes'),(229,'bookly_l10n_step_payment','Payment','yes'),(230,'bookly_l10n_step_service','Service','yes'),(231,'bookly_l10n_step_time','Time','yes'),(232,'bookly_cart_enabled','0','yes'),(233,'bookly_cart_show_columns','a:6:{s:7:\"service\";a:1:{s:4:\"show\";i:1;}s:4:\"date\";a:1:{s:4:\"show\";i:1;}s:4:\"time\";a:1:{s:4:\"show\";i:1;}s:8:\"employee\";a:1:{s:4:\"show\";i:1;}s:5:\"price\";a:1:{s:4:\"show\";i:1;}s:7:\"deposit\";a:1:{s:4:\"show\";i:1;}}','yes'),(234,'bookly_co_logo_attachment_id','','yes'),(235,'bookly_co_name','','yes'),(236,'bookly_co_address','','yes'),(237,'bookly_co_phone','','yes'),(238,'bookly_co_website','','yes'),(239,'bookly_cst_create_account','0','yes'),(240,'bookly_cst_new_account_role','subscriber','yes'),(241,'bookly_cst_phone_default_country','auto','yes'),(242,'bookly_cst_default_country_code','','yes'),(243,'bookly_cst_cancel_action','cancel','yes'),(244,'bookly_cst_combined_notifications','0','yes'),(245,'bookly_custom_fields','[{\"type\":\"textarea\",\"label\":\"Notes\",\"required\":false,\"id\":1,\"services\":[]}]','yes'),(246,'bookly_custom_fields_per_service','0','yes'),(247,'bookly_email_sender','zendasw@gmail.com','yes'),(248,'bookly_email_sender_name','Jenny Salon','yes'),(249,'bookly_email_send_as','html','yes'),(250,'bookly_email_reply_to_customers','1','yes'),(251,'bookly_gc_client_id','','yes'),(252,'bookly_gc_client_secret','','yes'),(253,'bookly_gc_event_title','{service_name}','yes'),(254,'bookly_gc_limit_events','50','yes'),(255,'bookly_gc_two_way_sync','1','yes'),(256,'bookly_lite_uninstall_remove_bookly_data','0','yes'),(257,'bookly_gen_time_slot_length','15','yes'),(258,'bookly_gen_service_duration_as_slot_length','0','yes'),(259,'bookly_gen_default_appointment_status','approved','yes'),(260,'bookly_gen_min_time_prior_booking','0','yes'),(261,'bookly_gen_min_time_prior_cancel','0','yes'),(262,'bookly_gen_approve_page_url','http://127.0.0.1/wp','yes'),(263,'bookly_gen_cancel_page_url','http://127.0.0.1/wp','yes'),(264,'bookly_gen_cancel_denied_page_url','http://127.0.0.1/wp','yes'),(265,'bookly_gen_max_days_for_booking','365','yes'),(266,'bookly_gen_use_client_time_zone','0','yes'),(267,'bookly_gen_final_step_url','','yes'),(268,'bookly_gen_allow_staff_edit_profile','1','yes'),(269,'bookly_gen_link_assets_method','enqueue','yes'),(270,'bookly_cron_reminder_times','a:3:{s:16:\"client_follow_up\";i:21;s:15:\"client_reminder\";i:18;s:12:\"staff_agenda\";i:18;}','yes'),(271,'bookly_grace_notifications','a:3:{s:6:\"bookly\";s:1:\"0\";s:7:\"add-ons\";i:0;s:4:\"sent\";s:1:\"0\";}','yes'),(272,'bookly_grace_hide_admin_notice_time','0','yes'),(273,'bookly_sms_token','','yes'),(274,'bookly_sms_administrator_phone','','yes'),(275,'bookly_sms_notify_low_balance','1','yes'),(276,'bookly_sms_notify_weekly_summary','1','yes'),(277,'bookly_sms_notify_weekly_summary_sent','41','yes'),(278,'bookly_wc_enabled','0','yes'),(279,'bookly_wc_product','','yes'),(280,'bookly_l10n_wc_cart_info_name','Appointment','yes'),(281,'bookly_l10n_wc_cart_info_value','Date: {appointment_date}\nTime: {appointment_time}\nService: {service_name}','yes'),(282,'bookly_bh_monday_start','08:00','yes'),(283,'bookly_bh_monday_end','18:00','yes'),(284,'bookly_bh_tuesday_start','08:00','yes'),(285,'bookly_bh_tuesday_end','18:00','yes'),(286,'bookly_bh_wednesday_start','08:00','yes'),(287,'bookly_bh_wednesday_end','18:00','yes'),(288,'bookly_bh_thursday_end','18:00','yes'),(289,'bookly_bh_thursday_start','08:00','yes'),(290,'bookly_bh_friday_start','08:00','yes'),(291,'bookly_bh_friday_end','18:00','yes'),(292,'bookly_bh_saturday_start','','yes'),(293,'bookly_bh_saturday_end','','yes'),(294,'bookly_bh_sunday_start','','yes'),(295,'bookly_bh_sunday_end','','yes'),(296,'bookly_pmt_currency','USD','yes'),(297,'bookly_pmt_coupons','0','yes'),(298,'bookly_pmt_local','1','yes'),(299,'bookly_pmt_paypal','disabled','yes'),(300,'bookly_pmt_paypal_sandbox','0','yes'),(301,'bookly_pmt_paypal_api_password','','yes'),(302,'bookly_pmt_paypal_api_signature','','yes'),(303,'bookly_pmt_paypal_api_username','','yes'),(304,'bookly_pmt_paypal_id','','yes'),(305,'bookly_pmt_authorize_net','disabled','yes'),(306,'bookly_pmt_authorize_net_api_login_id','','yes'),(307,'bookly_pmt_authorize_net_transaction_key','','yes'),(308,'bookly_pmt_authorize_net_sandbox','0','yes'),(309,'bookly_pmt_stripe','disabled','yes'),(310,'bookly_pmt_stripe_publishable_key','','yes'),(311,'bookly_pmt_stripe_secret_key','','yes'),(312,'bookly_pmt_2checkout','disabled','yes'),(313,'bookly_pmt_2checkout_api_secret_word','','yes'),(314,'bookly_pmt_2checkout_api_seller_id','','yes'),(315,'bookly_pmt_2checkout_sandbox','0','yes'),(316,'bookly_pmt_payu_latam','disabled','yes'),(317,'bookly_pmt_payu_latam_api_account_id','','yes'),(318,'bookly_pmt_payu_latam_api_key','','yes'),(319,'bookly_pmt_payu_latam_api_merchant_id','','yes'),(320,'bookly_pmt_payu_latam_sandbox','0','yes'),(321,'bookly_pmt_payson','disabled','yes'),(322,'bookly_pmt_payson_api_agent_id','','yes'),(323,'bookly_pmt_payson_api_key','','yes'),(324,'bookly_pmt_payson_api_receiver_email','','yes'),(325,'bookly_pmt_payson_fees_payer','PRIMARYRECEIVER','yes'),(326,'bookly_pmt_payson_funding','a:1:{i:0;s:10:\"CREDITCARD\";}','yes'),(327,'bookly_pmt_payson_sandbox','0','yes'),(328,'bookly_pmt_mollie','disabled','yes'),(329,'bookly_pmt_mollie_api_key','','yes'),(335,'_site_transient_timeout_available_translations','1507996960','no'),(336,'_site_transient_available_translations','a:110:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-02 13:13:49\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-29 08:49:40\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:5:\"4.7.6\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.6/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-22 18:59:07\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-26 18:50:50\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.2/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-09 09:24:45\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:22:\"Продължение\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-01 12:57:10\";s:12:\"english_name\";s:7:\"Bengali\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-05 09:44:12\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"མུ་མཐུད།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-04 20:20:28\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-08 21:01:45\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 08:46:26\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:12:\"Čeština‎\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-19 16:27:32\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-03 23:25:51\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Forts&#230;t\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-01 18:14:36\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/4.8.2/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Fortfahren\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-01 18:14:59\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Fortfahren\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-09 11:51:58\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Fortfahren\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-09 11:53:31\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/4.8.2/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-10 19:51:38\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-02 03:57:05\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"4.7.6\";s:7:\"updated\";s:19:\"2017-01-26 15:53:43\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.6/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-25 19:47:01\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-08 11:31:20\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-25 10:03:08\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-26 10:38:53\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-01 17:54:52\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/es_CR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-30 16:09:17\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/es_VE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-31 15:12:02\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/es_MX.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-01 04:48:11\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/es_AR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-13 17:00:30\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/es_CO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-04 05:23:56\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/es_ES.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"es\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-09 09:36:22\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/es_PE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-28 20:09:49\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/es_CL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-05 17:50:24\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/es_GT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 16:37:11\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-19 12:08:05\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:3:\"4.8\";s:7:\"updated\";s:19:\"2017-06-09 15:50:45\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-28 11:00:29\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-28 09:14:18\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-10 19:40:03\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-28 12:37:07\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-26 12:45:35\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-31 06:54:10\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:5:\"4.4.2\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-12 21:37:24\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"להמשיך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-28 10:29:26\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"जारी\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-22 14:47:25\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:48:39\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Tovább\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-28 12:45:08\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:5:\"4.7.6\";s:7:\"updated\";s:19:\"2017-04-13 13:55:54\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.6/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-30 11:12:28\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-09 07:51:37\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"続ける\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-09 06:06:41\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-22 15:33:00\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.2/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-07 02:07:59\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-28 10:48:16\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:48:25\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"ຕໍ່\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-28 11:02:15\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"4.7.6\";s:7:\"updated\";s:19:\"2017-03-17 20:40:40\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.6/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"4.7.6\";s:7:\"updated\";s:19:\"2017-01-26 15:54:41\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.6/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-30 06:25:41\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:5:\"4.7.6\";s:7:\"updated\";s:19:\"2017-03-05 09:45:10\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.6/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.1.19\";s:7:\"updated\";s:19:\"2015-03-26 15:57:42\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.1.19/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ေဆာင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-02 21:02:39\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-31 08:47:10\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"जारीराख्नु \";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-02 15:25:12\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-13 12:25:56\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-30 07:58:32\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/4.8.2/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-25 10:02:16\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.2/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:7:\"Punjabi\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-20 08:02:58\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.1.19\";s:7:\"updated\";s:19:\"2015-03-29 22:19:48\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.1.19/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"دوام\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-30 17:15:54\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-13 11:55:41\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-29 08:57:23\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/4.8.2/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-09 20:13:14\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-23 11:17:01\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-30 08:21:26\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-12 12:51:50\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Nadaljujte\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"4.7.6\";s:7:\"updated\";s:19:\"2017-04-24 08:35:30\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.6/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-07-28 12:07:44\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-08 16:15:48\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-07 02:08:56\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-30 02:38:08\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-12 12:20:32\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-05 09:23:39\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:9:\"Uyƣurqə\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-19 19:56:39\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-03 08:22:57\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-28 11:44:02\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-10-03 09:08:47\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.8.2/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-27 14:50:31\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:16:\"香港中文版	\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-08-04 07:53:05\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"4.8.2\";s:7:\"updated\";s:19:\"2017-09-12 11:35:05\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.8.2/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}}','no'),(337,'WPLANG','','yes'),(361,'_transient_is_multi_author','0','yes'),(362,'_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a','1508023837','no'),(363,'_site_transient_poptags_40cd750bba9870f18aada2478b24840a','O:8:\"stdClass\":100:{s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4386;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2512;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2370;}s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:2348;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:1837;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1607;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:1598;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1438;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1360;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1354;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1347;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1278;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1272;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:1144;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1057;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1053;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:998;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:956;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:825;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:825;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:816;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:777;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:773;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:672;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:671;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:666;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:655;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:652;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:647;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:638;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:630;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:615;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:598;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:593;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:588;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:586;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:580;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:579;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:563;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:558;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:547;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:535;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:528;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:520;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:507;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:503;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:497;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:493;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:477;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:475;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:475;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:473;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:453;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:448;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:446;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:441;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:441;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:438;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:425;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:417;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:412;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:411;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:406;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:405;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:404;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:397;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:390;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:383;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:382;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:371;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:356;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:347;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:339;}s:9:\"multisite\";a:3:{s:4:\"name\";s:9:\"multisite\";s:4:\"slug\";s:9:\"multisite\";s:5:\"count\";i:333;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:332;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:332;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:331;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:330;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:330;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:327;}s:4:\"list\";a:3:{s:4:\"name\";s:4:\"list\";s:4:\"slug\";s:4:\"list\";s:5:\"count\";i:324;}s:3:\"url\";a:3:{s:4:\"name\";s:3:\"url\";s:4:\"slug\";s:3:\"url\";s:5:\"count\";i:323;}s:4:\"meta\";a:3:{s:4:\"name\";s:4:\"meta\";s:4:\"slug\";s:4:\"meta\";s:5:\"count\";i:323;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:319;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:306;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:302;}s:6:\"simple\";a:3:{s:4:\"name\";s:6:\"simple\";s:4:\"slug\";s:6:\"simple\";s:5:\"count\";i:300;}s:16:\"custom-post-type\";a:3:{s:4:\"name\";s:16:\"custom post type\";s:4:\"slug\";s:16:\"custom-post-type\";s:5:\"count\";i:294;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:294;}s:3:\"tag\";a:3:{s:4:\"name\";s:3:\"tag\";s:4:\"slug\";s:3:\"tag\";s:5:\"count\";i:292;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:290;}s:11:\"advertising\";a:3:{s:4:\"name\";s:11:\"advertising\";s:4:\"slug\";s:11:\"advertising\";s:5:\"count\";i:287;}s:7:\"adsense\";a:3:{s:4:\"name\";s:7:\"adsense\";s:4:\"slug\";s:7:\"adsense\";s:5:\"count\";i:284;}s:6:\"author\";a:3:{s:4:\"name\";s:6:\"author\";s:4:\"slug\";s:6:\"author\";s:5:\"count\";i:283;}s:4:\"html\";a:3:{s:4:\"name\";s:4:\"html\";s:4:\"slug\";s:4:\"html\";s:5:\"count\";i:280;}s:8:\"lightbox\";a:3:{s:4:\"name\";s:8:\"lightbox\";s:4:\"slug\";s:8:\"lightbox\";s:5:\"count\";i:278;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:276;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:276;}s:7:\"tinymce\";a:3:{s:4:\"name\";s:7:\"tinyMCE\";s:4:\"slug\";s:7:\"tinymce\";s:5:\"count\";i:273;}s:7:\"captcha\";a:3:{s:4:\"name\";s:7:\"captcha\";s:4:\"slug\";s:7:\"captcha\";s:5:\"count\";i:271;}}','no'),(368,'bup_options','a:42:{s:24:\"messaging_send_from_name\";s:20:\"Booking Ultra Plugin\";s:20:\"bup_time_slot_length\";i:15;s:29:\"bup_calendar_time_slot_length\";i:15;s:28:\"bup_calendar_days_to_display\";i:7;s:27:\"gateway_free_default_status\";i:0;s:27:\"gateway_bank_default_status\";i:0;s:25:\"google_map_profile_active\";i:1;s:14:\"bup_noti_admin\";s:3:\"yes\";s:14:\"bup_noti_staff\";s:3:\"yes\";s:15:\"bup_noti_client\";s:3:\"yes\";s:24:\"google_calendar_template\";s:12:\"service_name\";s:15:\"currency_symbol\";s:1:\"$\";s:23:\"email_new_booking_admin\";s:567:\"Hello Admin \r\n\r\nA new booking has been received. Below are the details of the appointment.\r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nClient: {{bup_client_name}}\r\nPhone: {{bup_client_phone}}\r\nClient Email: {{bup_client_email}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nCost: {{bup_booking_cost}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\nPlease, use the following link in case you\'d like to approve this appointment.\r\n{{bup_booking_approval_url}}\";s:31:\"email_new_booking_subject_admin\";s:41:\"New Appointment Request has been received\";s:23:\"email_new_booking_staff\";s:422:\"{{bup_staff_name}},\r\n\r\nYou have a new appointment. \r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nClient: {{bup_client_name}}\r\nPhone: {{bup_client_phone}}\r\nClient Email: {{bup_client_email}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nCost: {{bup_booking_cost}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:31:\"email_new_booking_subject_staff\";s:26:\"You have a new appointment\";s:24:\"email_new_booking_client\";s:500:\"{{bup_client_name}},\r\n\r\nThank you for booking {{bup_booking_service}}. Below are the details of your appointment.\r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nCost: {{bup_booking_cost}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\nPlease, use the following link in case you\'d like to cancel your appointment.\r\n{{bup_booking_cancelation_url}}\";s:32:\"email_new_booking_subject_client\";s:30:\"Thank you for your appointment\";s:16:\"email_reschedule\";s:341:\"{{bup_client_name}},\r\n\r\nYour appointment has been rescheduled . \r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nCost: {{bup_booking_cost}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:22:\"email_reschedule_staff\";s:348:\"{{bup_staff_name}},\r\n\r\nOne of your appointments has been rescheduled . \r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nCost: {{bup_booking_cost}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:22:\"email_reschedule_admin\";s:358:\"Dear Admin,\r\n\r\nThis is a confirmation that an appointment has been rescheduled . \r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nCost: {{bup_booking_cost}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:24:\"email_reschedule_subject\";s:22:\"Appointment Reschedule\";s:30:\"email_reschedule_subject_staff\";s:22:\"Appointment Reschedule\";s:30:\"email_reschedule_subject_admin\";s:22:\"Appointment Reschedule\";s:18:\"email_bank_payment\";s:426:\"{{bup_client_name}},\r\n\r\nPlease deposit the payment in the following bank account: \r\n\r\n<strong>Bank Name</strong>: \r\n<strong>Account Number</strong>: \r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nCost: {{bup_booking_cost}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:26:\"email_bank_payment_subject\";s:19:\"Appointment Details\";s:24:\"email_bank_payment_admin\";s:552:\"Hello Admin \r\n\r\nA new appointment with local payment has been submitted. \r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nClient: {{bup_client_name}}\r\nPhone: {{bup_client_phone}}\r\nClient Email: {{bup_client_email}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nCost: {{bup_booking_cost}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\nPlease, use the following link in case you\'d like to approve this appointment.\r\n{{bup_booking_approval_url}}\";s:32:\"email_bank_payment_admin_subject\";s:15:\"New Appointment\";s:24:\"email_bank_payment_staff\";s:576:\"{{bup_staff_name}},\r\n\r\nDear staff member, new appointment with local payment has been submitted. \r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nClient: {{bup_client_name}}\r\nPhone: {{bup_client_phone}}\r\nClient Email: {{bup_client_email}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nCost: {{bup_booking_cost}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\nPlease, use the following link in case you\'d like to approve this appointment.\r\n{{bup_booking_approval_url}}\";s:32:\"email_bank_payment_staff_subject\";s:26:\"You have a new Appointment\";s:31:\"email_appo_status_changed_admin\";s:354:\"Hello Admin \r\n\r\nThe status of the following appointment has changed. \r\n\r\nNew Status: {{bup_booking_status}}\r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:39:\"email_appo_status_changed_admin_subject\";s:26:\"Appointment Status Changed\";s:31:\"email_appo_status_changed_staff\";s:361:\"{{bup_staff_name}},\r\n\r\nThe status of the following appointment has changed. \r\n\r\nNew Status: {{bup_booking_status}}\r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:39:\"email_appo_status_changed_staff_subject\";s:26:\"Appointment Status Changed\";s:32:\"email_appo_status_changed_client\";s:353:\"{{bup_client_name}},\r\n\r\nThe status of your appointment has changed. \r\n\r\nNew Status: {{bup_booking_status}}\r\n\r\n<strong>Appointment Details:</strong>\r\n\r\nService: {{bup_booking_service}}\r\nDate: {{bup_booking_date}}\r\nTime: {{bup_booking_time}}\r\nWith: {{bup_booking_staff}}\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:40:\"email_appo_status_changed_client_subject\";s:26:\"Appointment Status Changed\";s:27:\"email_password_change_staff\";s:170:\"{{bup_staff_name}},\r\n\r\nThis is a notification that your password has been changed. \r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:35:\"email_password_change_staff_subject\";s:16:\"Password Changed\";s:29:\"email_reset_link_message_body\";s:245:\"{{bup_staff_name}},\r\n\r\nPlease use the following link to reset your password.\r\n\r\n{{bup_reset_link}}\r\n\r\nIf you did not request a new password delete this email.\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:32:\"email_reset_link_message_subject\";s:14:\"Password Reset\";s:37:\"email_welcome_staff_link_message_body\";s:269:\"{{bup_staff_name}},\r\n\r\nYour login details for your account are as follows:\r\n\r\nUsername: {{bup_user_name}}\r\nPlease use the following link to reset your password.\r\n\r\n{{bup_reset_link}}\r\n\r\nBest Regards!\r\n{{bup_company_name}}\r\n{{bup_company_phone}}\r\n{{bup_company_url}}\r\n\r\n\";s:40:\"email_welcome_staff_link_message_subject\";s:20:\"Your Account Details\";}','yes'),(369,'bup_pro_active','1','yes'),(371,'bup_profile_fields','a:2:{i:80;a:7:{s:8:\"position\";s:2:\"50\";s:4:\"type\";s:9:\"separator\";s:4:\"name\";s:16:\"Appointment Info\";s:7:\"private\";i:0;s:16:\"show_in_register\";i:1;s:7:\"deleted\";i:0;s:17:\"show_to_user_role\";i:0;}i:170;a:14:{s:8:\"position\";s:3:\"200\";s:4:\"icon\";s:6:\"pencil\";s:5:\"field\";s:8:\"textarea\";s:4:\"type\";s:8:\"usermeta\";s:4:\"meta\";s:13:\"special_notes\";s:4:\"name\";s:8:\"Comments\";s:8:\"can_hide\";i:0;s:8:\"can_edit\";i:1;s:16:\"show_in_register\";i:1;s:7:\"private\";i:0;s:6:\"social\";i:0;s:7:\"deleted\";i:0;s:10:\"allow_html\";i:1;s:9:\"help_text\";s:0:\"\";}}','yes'),(372,'bup_business_hours','a:5:{i:1;a:2:{s:4:\"from\";s:5:\"08:00\";s:2:\"to\";s:5:\"18:00\";}i:2;a:2:{s:4:\"from\";s:5:\"08:00\";s:2:\"to\";s:5:\"18:00\";}i:3;a:2:{s:4:\"from\";s:5:\"08:00\";s:2:\"to\";s:5:\"18:00\";}i:4;a:2:{s:4:\"from\";s:5:\"08:00\";s:2:\"to\";s:5:\"18:00\";}i:5;a:2:{s:4:\"from\";s:5:\"08:00\";s:2:\"to\";s:5:\"18:00\";}}','yes'),(373,'bup_pro_improvement_12','1','yes'),(374,'bup_pro_improvement_14','1','yes'),(382,'_site_transient_timeout_theme_roots','1523908066','no'),(383,'_site_transient_theme_roots','a:4:{s:7:\"skt-spa\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}','no'),(385,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.5-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.5-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.5\";s:7:\"version\";s:5:\"4.9.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.5-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.5-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.5\";s:7:\"version\";s:5:\"4.9.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1523906272;s:15:\"version_checked\";s:5:\"4.8.6\";s:12:\"translations\";a:0:{}}','no'),(386,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1523906275;s:7:\"checked\";a:4:{s:7:\"skt-spa\";s:5:\"1.7.1\";s:13:\"twentyfifteen\";s:3:\"1.8\";s:15:\"twentyseventeen\";s:3:\"1.3\";s:13:\"twentysixteen\";s:3:\"1.3\";}s:8:\"response\";a:3:{s:13:\"twentyfifteen\";a:4:{s:5:\"theme\";s:13:\"twentyfifteen\";s:11:\"new_version\";s:3:\"1.9\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentyfifteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentyfifteen.1.9.zip\";}s:15:\"twentyseventeen\";a:4:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.1.5.zip\";}s:13:\"twentysixteen\";a:4:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.1.4.zip\";}}s:12:\"translations\";a:0:{}}','no'),(387,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1523906274;s:8:\"response\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:27:\"booking-ultra-pro/index.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:31:\"w.org/plugins/booking-ultra-pro\";s:4:\"slug\";s:17:\"booking-ultra-pro\";s:6:\"plugin\";s:27:\"booking-ultra-pro/index.php\";s:11:\"new_version\";s:6:\"1.0.70\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/booking-ultra-pro/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/booking-ultra-pro.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:70:\"https://ps.w.org/booking-ultra-pro/assets/icon-128x128.png?rev=1856083\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/booking-ultra-pro/assets/banner-1544x500.png?rev=1856083\";s:2:\"1x\";s:72:\"https://ps.w.org/booking-ultra-pro/assets/banner-772x250.png?rev=1856083\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:51:\"bookly-responsive-appointment-booking-tool/main.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:56:\"w.org/plugins/bookly-responsive-appointment-booking-tool\";s:4:\"slug\";s:42:\"bookly-responsive-appointment-booking-tool\";s:6:\"plugin\";s:51:\"bookly-responsive-appointment-booking-tool/main.php\";s:11:\"new_version\";s:6:\"14.5.1\";s:3:\"url\";s:73:\"https://wordpress.org/plugins/bookly-responsive-appointment-booking-tool/\";s:7:\"package\";s:92:\"https://downloads.wordpress.org/plugin/bookly-responsive-appointment-booking-tool.14.5.1.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:95:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/icon-128x128.png?rev=1005009\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:98:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/banner-1544x500.png?rev=1726755\";s:2:\"1x\";s:97:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/banner-772x250.png?rev=1726755\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}}}','no'),(388,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:17:\"zendasw@gmail.com\";s:7:\"version\";s:5:\"4.8.6\";s:9:\"timestamp\";i:1523906274;}','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(6,6,'_edit_last','1'),(7,6,'_edit_lock','1507991275:1'),(8,6,'_wp_page_template','default'),(9,8,'_edit_last','1'),(10,8,'_edit_lock','1507336014:1'),(11,8,'_wp_page_template','default'),(12,10,'_menu_item_type','custom'),(13,10,'_menu_item_menu_item_parent','0'),(14,10,'_menu_item_object_id','10'),(15,10,'_menu_item_object','custom'),(16,10,'_menu_item_target',''),(17,10,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(18,10,'_menu_item_xfn',''),(19,10,'_menu_item_url','http://127.0.0.1/wp/'),(20,10,'_menu_item_orphaned','1507335930'),(21,11,'_menu_item_type','post_type'),(22,11,'_menu_item_menu_item_parent','0'),(23,11,'_menu_item_object_id','6'),(24,11,'_menu_item_object','page'),(25,11,'_menu_item_target',''),(26,11,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(27,11,'_menu_item_xfn',''),(28,11,'_menu_item_url',''),(29,11,'_menu_item_orphaned','1507335930'),(30,12,'_menu_item_type','post_type'),(31,12,'_menu_item_menu_item_parent','0'),(32,12,'_menu_item_object_id','8'),(33,12,'_menu_item_object','page'),(34,12,'_menu_item_target',''),(35,12,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(36,12,'_menu_item_xfn',''),(37,12,'_menu_item_url',''),(38,12,'_menu_item_orphaned','1507335930'),(39,13,'_menu_item_type','post_type'),(40,13,'_menu_item_menu_item_parent','0'),(41,13,'_menu_item_object_id','2'),(42,13,'_menu_item_object','page'),(43,13,'_menu_item_target',''),(44,13,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(45,13,'_menu_item_xfn',''),(46,13,'_menu_item_url',''),(47,13,'_menu_item_orphaned','1507335930'),(48,19,'_menu_item_type','custom'),(49,19,'_menu_item_menu_item_parent','0'),(50,19,'_menu_item_object_id','19'),(51,19,'_menu_item_object','custom'),(52,19,'_menu_item_target',''),(53,19,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(54,19,'_menu_item_xfn',''),(55,19,'_menu_item_url','http://127.0.0.1/wp/'),(56,19,'_menu_item_orphaned','1507986264'),(57,20,'_menu_item_type','post_type'),(58,20,'_menu_item_menu_item_parent','0'),(59,20,'_menu_item_object_id','6'),(60,20,'_menu_item_object','page'),(61,20,'_menu_item_target',''),(62,20,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(63,20,'_menu_item_xfn',''),(64,20,'_menu_item_url',''),(65,20,'_menu_item_orphaned','1507986264'),(66,21,'_menu_item_type','post_type'),(67,21,'_menu_item_menu_item_parent','0'),(68,21,'_menu_item_object_id','8'),(69,21,'_menu_item_object','page'),(70,21,'_menu_item_target',''),(71,21,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(72,21,'_menu_item_xfn',''),(73,21,'_menu_item_url',''),(74,21,'_menu_item_orphaned','1507986264'),(75,22,'_menu_item_type','post_type'),(76,22,'_menu_item_menu_item_parent','0'),(77,22,'_menu_item_object_id','2'),(78,22,'_menu_item_object','page'),(79,22,'_menu_item_target',''),(80,22,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(81,22,'_menu_item_xfn',''),(82,22,'_menu_item_url',''),(83,22,'_menu_item_orphaned','1507986264'),(84,23,'_menu_item_type','custom'),(85,23,'_menu_item_menu_item_parent','0'),(86,23,'_menu_item_object_id','23'),(87,23,'_menu_item_object','custom'),(88,23,'_menu_item_target',''),(89,23,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(90,23,'_menu_item_xfn',''),(91,23,'_menu_item_url','http://127.0.0.1/wp/'),(92,23,'_menu_item_orphaned','1507986721'),(93,24,'_menu_item_type','post_type'),(94,24,'_menu_item_menu_item_parent','0'),(95,24,'_menu_item_object_id','6'),(96,24,'_menu_item_object','page'),(97,24,'_menu_item_target',''),(98,24,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(99,24,'_menu_item_xfn',''),(100,24,'_menu_item_url',''),(101,24,'_menu_item_orphaned','1507986721'),(102,25,'_menu_item_type','post_type'),(103,25,'_menu_item_menu_item_parent','0'),(104,25,'_menu_item_object_id','8'),(105,25,'_menu_item_object','page'),(106,25,'_menu_item_target',''),(107,25,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(108,25,'_menu_item_xfn',''),(109,25,'_menu_item_url',''),(110,25,'_menu_item_orphaned','1507986721'),(111,26,'_menu_item_type','post_type'),(112,26,'_menu_item_menu_item_parent','0'),(113,26,'_menu_item_object_id','2'),(114,26,'_menu_item_object','page'),(115,26,'_menu_item_target',''),(116,26,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(117,26,'_menu_item_xfn',''),(118,26,'_menu_item_url',''),(119,26,'_menu_item_orphaned','1507986721'),(120,27,'_menu_item_type','custom'),(121,27,'_menu_item_menu_item_parent','0'),(122,27,'_menu_item_object_id','27'),(123,27,'_menu_item_object','custom'),(124,27,'_menu_item_target',''),(125,27,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(126,27,'_menu_item_xfn',''),(127,27,'_menu_item_url','http://127.0.0.1/wp/'),(128,27,'_menu_item_orphaned','1507986726'),(129,28,'_menu_item_type','post_type'),(130,28,'_menu_item_menu_item_parent','0'),(131,28,'_menu_item_object_id','6'),(132,28,'_menu_item_object','page'),(133,28,'_menu_item_target',''),(134,28,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(135,28,'_menu_item_xfn',''),(136,28,'_menu_item_url',''),(137,28,'_menu_item_orphaned','1507986726'),(138,29,'_menu_item_type','post_type'),(139,29,'_menu_item_menu_item_parent','0'),(140,29,'_menu_item_object_id','8'),(141,29,'_menu_item_object','page'),(142,29,'_menu_item_target',''),(143,29,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(144,29,'_menu_item_xfn',''),(145,29,'_menu_item_url',''),(146,29,'_menu_item_orphaned','1507986726'),(147,30,'_menu_item_type','post_type'),(148,30,'_menu_item_menu_item_parent','0'),(149,30,'_menu_item_object_id','2'),(150,30,'_menu_item_object','page'),(151,30,'_menu_item_target',''),(152,30,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(153,30,'_menu_item_xfn',''),(154,30,'_menu_item_url',''),(155,30,'_menu_item_orphaned','1507986726'),(160,32,'_menu_item_type','custom'),(161,32,'_menu_item_menu_item_parent','0'),(162,32,'_menu_item_object_id','32'),(163,32,'_menu_item_object','custom'),(164,32,'_menu_item_target',''),(165,32,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(166,32,'_menu_item_xfn',''),(167,32,'_menu_item_url','http://127.0.0.1/wp/'),(168,32,'_menu_item_orphaned','1507987022'),(169,33,'_menu_item_type','post_type'),(170,33,'_menu_item_menu_item_parent','0'),(171,33,'_menu_item_object_id','6'),(172,33,'_menu_item_object','page'),(173,33,'_menu_item_target',''),(174,33,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(175,33,'_menu_item_xfn',''),(176,33,'_menu_item_url',''),(177,33,'_menu_item_orphaned','1507987022'),(178,34,'_menu_item_type','post_type'),(179,34,'_menu_item_menu_item_parent','0'),(180,34,'_menu_item_object_id','8'),(181,34,'_menu_item_object','page'),(182,34,'_menu_item_target',''),(183,34,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(184,34,'_menu_item_xfn',''),(185,34,'_menu_item_url',''),(186,34,'_menu_item_orphaned','1507987022'),(187,35,'_menu_item_type','post_type'),(188,35,'_menu_item_menu_item_parent','0'),(189,35,'_menu_item_object_id','2'),(190,35,'_menu_item_object','page'),(191,35,'_menu_item_target',''),(192,35,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(193,35,'_menu_item_xfn',''),(194,35,'_menu_item_url',''),(195,35,'_menu_item_orphaned','1507987022'),(196,36,'_edit_last','1'),(197,36,'_wp_page_template','default'),(198,36,'_edit_lock','1507990516:1');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (2,1,'2017-10-06 23:38:18','2017-10-06 23:38:18','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://127.0.0.1/wp/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','','2017-10-06 23:38:18','2017-10-06 23:38:18','',0,'http://127.0.0.1/wp/?page_id=2',0,'page','',0),(6,1,'2017-10-07 00:24:52','2017-10-07 00:24:52','[bookly-form]','Booking online','','publish','closed','closed','','booking-online','','','2017-10-14 14:29:40','2017-10-14 14:29:40','',0,'http://127.0.0.1/wp/?page_id=6',0,'page','',0),(7,1,'2017-10-07 00:24:52','2017-10-07 00:24:52','','Booking online','','inherit','closed','closed','','6-revision-v1','','','2017-10-07 00:24:52','2017-10-07 00:24:52','',6,'http://127.0.0.1/wp/index.php/2017/10/07/6-revision-v1/',0,'revision','',0),(8,1,'2017-10-07 00:25:20','2017-10-07 00:25:20','[huge_it_maps id=\"1\"]','Hitta hit','','publish','closed','closed','','hitta-hit','','','2017-10-07 00:28:44','2017-10-07 00:28:44','',0,'http://127.0.0.1/wp/?page_id=8',0,'page','',0),(9,1,'2017-10-07 00:25:20','2017-10-07 00:25:20','','Hitta hit','','inherit','closed','closed','','8-revision-v1','','','2017-10-07 00:25:20','2017-10-07 00:25:20','',8,'http://127.0.0.1/wp/index.php/2017/10/07/8-revision-v1/',0,'revision','',0),(10,1,'2017-10-07 00:25:30','0000-00-00 00:00:00','','Home','','draft','closed','closed','','','','','2017-10-07 00:25:30','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=10',1,'nav_menu_item','',0),(11,1,'2017-10-07 00:25:30','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-07 00:25:30','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=11',1,'nav_menu_item','',0),(12,1,'2017-10-07 00:25:30','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-07 00:25:30','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=12',1,'nav_menu_item','',0),(13,1,'2017-10-07 00:25:30','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-07 00:25:30','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=13',1,'nav_menu_item','',0),(14,1,'2017-10-07 00:28:44','2017-10-07 00:28:44','[huge_it_maps id=\"1\"]','Hitta hit','','inherit','closed','closed','','8-revision-v1','','','2017-10-07 00:28:44','2017-10-07 00:28:44','',8,'http://127.0.0.1/wp/index.php/2017/10/07/8-revision-v1/',0,'revision','',0),(16,1,'2017-10-14 12:42:01','2017-10-14 12:42:01','[bookly-appointments-list columns=\"category,service,staff,date,time,status,cancel\" show_column_titles=\"1\"]','Booking online','','inherit','closed','closed','','6-revision-v1','','','2017-10-14 12:42:01','2017-10-14 12:42:01','',6,'http://127.0.0.1/wp/index.php/2017/10/14/6-revision-v1/',0,'revision','',0),(17,1,'2017-10-14 12:43:02','2017-10-14 12:43:02','[bookly-appointments-list columns=\"category,service,staff,date,time,status,cancel\" show_column_titles=\"1\"]\n\n&nbsp;','Booking online','','inherit','closed','closed','','6-autosave-v1','','','2017-10-14 12:43:02','2017-10-14 12:43:02','',6,'http://127.0.0.1/wp/index.php/2017/10/14/6-autosave-v1/',0,'revision','',0),(18,1,'2017-10-14 12:43:06','2017-10-14 12:43:06','[bookly-appointments-list columns=\"category,service,staff,date,time,status,cancel\" show_column_titles=\"1\"]\r\n\r\n[bookly-form]','Booking online','','inherit','closed','closed','','6-revision-v1','','','2017-10-14 12:43:06','2017-10-14 12:43:06','',6,'http://127.0.0.1/wp/index.php/2017/10/14/6-revision-v1/',0,'revision','',0),(19,1,'2017-10-14 13:04:24','0000-00-00 00:00:00','','Home','','draft','closed','closed','','','','','2017-10-14 13:04:24','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=19',1,'nav_menu_item','',0),(20,1,'2017-10-14 13:04:24','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:04:24','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=20',1,'nav_menu_item','',0),(21,1,'2017-10-14 13:04:24','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:04:24','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=21',1,'nav_menu_item','',0),(22,1,'2017-10-14 13:04:24','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:04:24','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=22',1,'nav_menu_item','',0),(23,1,'2017-10-14 13:12:01','0000-00-00 00:00:00','','Home','','draft','closed','closed','','','','','2017-10-14 13:12:01','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=23',1,'nav_menu_item','',0),(24,1,'2017-10-14 13:12:01','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:12:01','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=24',1,'nav_menu_item','',0),(25,1,'2017-10-14 13:12:01','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:12:01','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=25',1,'nav_menu_item','',0),(26,1,'2017-10-14 13:12:01','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:12:01','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=26',1,'nav_menu_item','',0),(27,1,'2017-10-14 13:12:06','0000-00-00 00:00:00','','Home','','draft','closed','closed','','','','','2017-10-14 13:12:06','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=27',1,'nav_menu_item','',0),(28,1,'2017-10-14 13:12:06','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:12:06','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=28',1,'nav_menu_item','',0),(29,1,'2017-10-14 13:12:06','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:12:06','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=29',1,'nav_menu_item','',0),(30,1,'2017-10-14 13:12:06','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:12:06','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=30',1,'nav_menu_item','',0),(32,1,'2017-10-14 13:17:02','0000-00-00 00:00:00','','Home','','draft','closed','closed','','','','','2017-10-14 13:17:02','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=32',1,'nav_menu_item','',0),(33,1,'2017-10-14 13:17:02','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:17:02','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=33',1,'nav_menu_item','',0),(34,1,'2017-10-14 13:17:02','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:17:02','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=34',1,'nav_menu_item','',0),(35,1,'2017-10-14 13:17:02','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2017-10-14 13:17:02','0000-00-00 00:00:00','',0,'http://127.0.0.1/wp/?p=35',1,'nav_menu_item','',0),(36,1,'2017-10-14 14:17:36','2017-10-14 14:17:36','','','','publish','closed','closed','','36-2','','','2017-10-14 14:17:36','2017-10-14 14:17:36','',0,'http://127.0.0.1/wp/?page_id=36',0,'page','',0),(37,1,'2017-10-14 14:17:36','2017-10-14 14:17:36','','','','inherit','closed','closed','','36-revision-v1','','','2017-10-14 14:17:36','2017-10-14 14:17:36','',36,'http://127.0.0.1/wp/index.php/2017/10/14/36-revision-v1/',0,'revision','',0),(40,1,'2017-10-14 14:29:40','2017-10-14 14:29:40','[bookly-form]','Booking online','','inherit','closed','closed','','6-revision-v1','','','2017-10-14 14:29:40','2017-10-14 14:29:40','',6,'http://127.0.0.1/wp/index.php/2017/10/14/6-revision-v1/',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,0);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','jenny'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'locale',''),(11,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(12,1,'wp_user_level','10'),(13,1,'dismissed_wp_pointers',''),(14,1,'show_welcome_panel','1'),(15,1,'session_tokens','a:1:{s:64:\"24ee4f9e952bed9f883d8e41aea29a3adab756fe3ec6f4208538589626e4688b\";a:4:{s:10:\"expiration\";i:1508542714;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:76:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0\";s:5:\"login\";i:1507333114;}}'),(16,1,'wp_dashboard_quick_press_last_post_id','15'),(17,1,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),(18,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),(19,1,'metaboxhidden_nav-menus','a:1:{i:0;s:12:\"add-post_tag\";}'),(20,1,'bookly_filter_appointments_list','a:5:{s:2:\"id\";s:0:\"\";s:5:\"staff\";s:2:\"-1\";s:8:\"customer\";s:2:\"-1\";s:7:\"service\";s:2:\"-1\";s:6:\"status\";s:2:\"-1\";}'),(21,1,'bookly_dismiss_contact_us_notice','1'),(22,1,'wp_user-settings','mfold=o&editor=tinymce'),(23,1,'wp_user-settings-time','1507991375'),(24,2,'nickname','tom'),(25,2,'first_name',''),(26,2,'last_name',''),(27,2,'description',''),(28,2,'rich_editing','true'),(29,2,'comment_shortcuts','false'),(30,2,'admin_color','fresh'),(31,2,'use_ssl','0'),(32,2,'show_admin_bar_front','true'),(33,2,'locale',''),(34,2,'wp_capabilities','a:1:{s:10:\"subscriber\";b:1;}'),(35,2,'wp_user_level','0'),(36,2,'dismissed_wp_pointers',''),(37,2,'bup_is_staff_member','1');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'jenny','$P$BhV8jeeIcFcvUyzURnPRG3imnps4550','jenny','zendasw@gmail.com','','2017-10-06 23:38:18','',0,'jenny'),(2,'tom','$P$B5IE9Z0djMwgQOUX63t4/R/wdn6Dcy/','tom','tom@gmail.com','','2017-10-14 20:33:01','',0,'Tom');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-17 15:55:38
