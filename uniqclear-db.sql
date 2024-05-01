-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: uniqcleardb
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(45) NOT NULL,
  `branch_address` varchar(95) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `contact_num` varchar(11) DEFAULT NULL,
  `sex` char(1) NOT NULL,
  `birthdate` date NOT NULL,
  `customer_type` varchar(45) NOT NULL,
  `customer_address` varchar(95) DEFAULT NULL,
  `branch_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `customer_branch_FK` (`branch_id`),
  CONSTRAINT `customer_branch_FK` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dealer_contract`
--

DROP TABLE IF EXISTS `dealer_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealer_contract` (
  `dealer_contract_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `dealer_contract_link` varchar(200) NOT NULL,
  `dealer_contract_date` date NOT NULL,
  `minimum_refills` int NOT NULL,
  `discount_rate` decimal(10,2) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dealer_contract_id`),
  KEY `dealer_contract_customer_id_FK` (`customer_id`),
  CONSTRAINT `dealer_contract_customer_id_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_add_discount_rate` AFTER INSERT ON `dealer_contract` FOR EACH ROW INSERT INTO dealer_discount_rate_history(dealer_contract_id, discount_rate, discount_rate_start_date) VALUES(NEW.dealer_contract_id, NEW.discount_rate, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_dealer_discount_rate` BEFORE UPDATE ON `dealer_contract` FOR EACH ROW BEGIN
	IF (NEW.discount_rate <> OLD.discount_rate) THEN
		INSERT INTO dealer_discount_rate_history(dealer_contract_id, discount_rate, discount_rate_start_date) VALUES(NEW.dealer_contract_id, NEW.discount_rate, NOW());
    END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dealer_discount_rate_history`
--

DROP TABLE IF EXISTS `dealer_discount_rate_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealer_discount_rate_history` (
  `daeler_discount_rate_history_id` int NOT NULL AUTO_INCREMENT,
  `dealer_contract_id` int NOT NULL,
  `discount_rate` decimal(10,2) NOT NULL,
  `discount_rate_start_date` datetime NOT NULL,
  PRIMARY KEY (`daeler_discount_rate_history_id`),
  KEY `dealer_discount_rate_history_dealer_contract_id_FK` (`dealer_contract_id`),
  CONSTRAINT `dealer_discount_rate_history_dealer_contract_id_FK` FOREIGN KEY (`dealer_contract_id`) REFERENCES `dealer_contract` (`dealer_contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `contact_num` varchar(11) DEFAULT NULL,
  `sex` char(1) NOT NULL,
  `birthdate` date NOT NULL,
  `employee_role` varchar(45) NOT NULL,
  `employee_address` varchar(95) DEFAULT NULL,
  `branch_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  KEY `employee_branch_id_fk` (`branch_id`),
  CONSTRAINT `employee_branch_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_add_employee` AFTER INSERT ON `employee` FOR EACH ROW INSERT INTO employee_branch_history(employee_id, branch_id, assignment_date) VALUES(NEW.employee_id, NEW.branch_id, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_employee_branch` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
	IF (NEW.branch_id <> OLD.branch_id) THEN
		INSERT INTO employee_branch_history(employee_id, branch_id, assignment_date) VALUES(NEW.employee_id, NEW.branch_id, NOW());
    END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_branch_history`
--

DROP TABLE IF EXISTS `employee_branch_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_branch_history` (
  `employee_branch_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `assignment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`employee_branch_id`),
  KEY `employee_branch_employee_id_FK` (`employee_id`),
  CONSTRAINT `employee_branch_employee_id_FK` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `expense_amount` decimal(10,2) NOT NULL,
  `expense_description` varchar(125) NOT NULL,
  `expense_date_time` datetime NOT NULL,
  `branch_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_id`),
  KEY `expenses_branch_id_FK` (`branch_id`),
  KEY `expense_employee_id_FK` (`employee_id`),
  CONSTRAINT `expense_employee_id_FK` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `expenses_branch_id_FK` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_price_history`
--

DROP TABLE IF EXISTS `item_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_price_history` (
  `price_history_id` int NOT NULL AUTO_INCREMENT,
  `non_rental_item_id` int NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `price_start_date` datetime NOT NULL,
  PRIMARY KEY (`price_history_id`),
  KEY `price_history_item_id_FK` (`non_rental_item_id`),
  CONSTRAINT `item_price_history_non_rental_id_FK` FOREIGN KEY (`non_rental_item_id`) REFERENCES `non_rental_item` (`non_rental_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_account`
--

DROP TABLE IF EXISTS `login_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_account` (
  `login_account_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `branch_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_account_id`),
  UNIQUE KEY `unique_user_name` (`user_name`),
  KEY `login_account_branch_id_FK` (`branch_id`),
  CONSTRAINT `login_account_branch_id_FK` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `non_rental_item`
--

DROP TABLE IF EXISTS `non_rental_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_rental_item` (
  `non_rental_item_id` int NOT NULL AUTO_INCREMENT,
  `non_rental_item_name` varchar(45) NOT NULL,
  `non_rental_item_price` decimal(10,2) NOT NULL,
  `isForSale` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  `restock_point` int NOT NULL DEFAULT '0',
  `branch_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`non_rental_item_id`),
  KEY `non_rental_item_branch_id_FK` (`branch_id`),
  CONSTRAINT `non_rental_item_branch_id_FK` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_add_non_rental_item` AFTER INSERT ON `non_rental_item` FOR EACH ROW INSERT INTO item_price_history(non_rental_item_id, item_price, price_start_date) VALUES(NEW.non_rental_item_id, NEW.non_rental_item_price, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_non_rental_item_price` BEFORE UPDATE ON `non_rental_item` FOR EACH ROW BEGIN
	IF (NEW.non_rental_item_price <> OLD.non_rental_item_price) THEN
		INSERT INTO item_price_history(non_rental_item_id, item_price, price_start_date) VALUES(NEW.non_rental_item_id, NEW.non_rental_item_price, NOW());
    END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `order_line_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `non_rental_item_id` int NOT NULL,
  `item_quantity` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_line_id`),
  KEY `order_line_order_id_FK` (`order_id`),
  KEY `order_line_item_id_FK` (`non_rental_item_id`),
  CONSTRAINT `order_line_non_rental_item_id_FK` FOREIGN KEY (`non_rental_item_id`) REFERENCES `non_rental_item` (`non_rental_item_id`),
  CONSTRAINT `order_line_order_id_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_type` varchar(45) NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `custom_discount` decimal(10,2) DEFAULT NULL,
  `custom_fee` decimal(10,2) DEFAULT NULL,
  `accumulated_promo_pts_applied` int NOT NULL DEFAULT '0',
  `isRefunded` tinyint(1) NOT NULL DEFAULT '0',
  `order_date_time` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `order_branch_id_FK` (`customer_id`),
  CONSTRAINT `order_customer_id_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  `payment_date_time` datetime NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_order_id_FK` (`order_id`),
  CONSTRAINT `payment_order_id_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `predefined_expense`
--

DROP TABLE IF EXISTS `predefined_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predefined_expense` (
  `pd_expense_id` int NOT NULL AUTO_INCREMENT,
  `pd_expense_name` varchar(45) NOT NULL,
  `pd_expense_amount` decimal(10,2) NOT NULL,
  `branch_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pd_expense_id`),
  KEY `pd_expense_branch_id_FK` (`branch_id`),
  CONSTRAINT `pd_expense_branch_id_FK` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promo`
--

DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo` (
  `promo_id` int NOT NULL AUTO_INCREMENT,
  `promo_description` varchar(125) NOT NULL,
  `promo_discount_amount` decimal(10,2) NOT NULL,
  `points_threshold` int NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `branch_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`promo_id`),
  KEY `promo_branch_id_FK` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_add_promo` AFTER INSERT ON `promo` FOR EACH ROW INSERT INTO promo_discount_history(promo_id, discount_amount, discount_start_date) VALUES(NEW.promo_id, NEW.promo_discount_amount, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_promo_discount_amount` BEFORE UPDATE ON `promo` FOR EACH ROW BEGIN
	IF (NEW.promo_discount_amount <> OLD.promo_discount_amount) THEN
		INSERT INTO promo_discount_history(promo_id, discount_amount, discount_start_date) VALUES(NEW.promo_id, NEW.promo_discount_amount, NOW());
    END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `promo_discount_history`
--

DROP TABLE IF EXISTS `promo_discount_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_discount_history` (
  `promo_history_id` int NOT NULL AUTO_INCREMENT,
  `promo_id` int NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `discount_start_date` datetime NOT NULL,
  PRIMARY KEY (`promo_history_id`),
  KEY `promo_history_promo_id_FK` (`promo_id`),
  CONSTRAINT `promo_history_promo_id_FK` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promo_record`
--

DROP TABLE IF EXISTS `promo_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_record` (
  `promo_record_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `promo_id` int NOT NULL,
  `unused_points` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`promo_record_id`),
  KEY `promo_record_customer_id_FK` (`customer_id`),
  KEY `promo_record_promo_id_FK` (`promo_id`),
  CONSTRAINT `promo_record_customer_id_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `promo_record_promo_id_FK` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rental_additional_fee_history`
--

DROP TABLE IF EXISTS `rental_additional_fee_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental_additional_fee_history` (
  `rental_additional_fee_history_id` int NOT NULL AUTO_INCREMENT,
  `rental_contract_id` int NOT NULL,
  `additional_fee` decimal(10,2) NOT NULL,
  `additional_fee_start_date` datetime NOT NULL,
  PRIMARY KEY (`rental_additional_fee_history_id`),
  KEY `rental_additional_fee_history_rental_contract_id_FK` (`rental_contract_id`),
  CONSTRAINT `rental_additional_fee_history_rental_contract_id_FK` FOREIGN KEY (`rental_contract_id`) REFERENCES `rental_contract` (`rental_contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rental_contract`
--

DROP TABLE IF EXISTS `rental_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental_contract` (
  `rental_contract_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `rental_contract_link` varchar(200) NOT NULL,
  `rental_contract_date` date NOT NULL,
  `minimum_refills` int NOT NULL,
  `additional_fee` decimal(10,2) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rental_contract_id`),
  KEY `rental_contract_customer_id_FK` (`customer_id`),
  CONSTRAINT `rental_contract_customer_id_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_add_rental_additional_fee` AFTER INSERT ON `rental_contract` FOR EACH ROW INSERT INTO rental_additional_fee_history(rental_contract_id, additional_fee, additional_fee_start_date) VALUES(NEW.rental_contract_id, NEW.additional_fee, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_rental_additional_fee` BEFORE UPDATE ON `rental_contract` FOR EACH ROW BEGIN
	IF (NEW.additional_fee <> OLD.additional_fee) THEN
		INSERT INTO rental_additional_fee_history(rental_contract_id, additional_fee, additional_fee_start_date) VALUES(NEW.rental_contract_id, NEW.additional_fee, NOW());
    END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rental_item`
--

DROP TABLE IF EXISTS `rental_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental_item` (
  `rental_item_id` int NOT NULL AUTO_INCREMENT,
  `rental_item_name` varchar(45) NOT NULL,
  `isBroken` tinyint(1) NOT NULL DEFAULT '0',
  `branch_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rental_item_id`),
  KEY `rental_item_branch_id_FK` (`branch_id`),
  CONSTRAINT `rental_item_branch_id_FK` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rented_in`
--

DROP TABLE IF EXISTS `rented_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rented_in` (
  `rented_in_id` int NOT NULL AUTO_INCREMENT,
  `rented_out_id` int NOT NULL,
  `in_datetime` datetime NOT NULL,
  PRIMARY KEY (`rented_in_id`),
  KEY `rented_in_rented_out_id_FK` (`rented_out_id`),
  CONSTRAINT `rented_in_rented_out_id_FK` FOREIGN KEY (`rented_out_id`) REFERENCES `rented_out` (`rented_out_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rented_out`
--

DROP TABLE IF EXISTS `rented_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rented_out` (
  `rented_out_id` int NOT NULL AUTO_INCREMENT,
  `rental_contract_id` int NOT NULL,
  `rental_item_id` int NOT NULL,
  `out_datetime` datetime NOT NULL,
  PRIMARY KEY (`rented_out_id`),
  KEY `rented_out_rental_item_id_FK` (`rental_item_id`),
  KEY `rented_out_rental_contract_id_FK` (`rental_contract_id`),
  CONSTRAINT `rented_out_rental_contract_id_FK` FOREIGN KEY (`rental_contract_id`) REFERENCES `rental_contract` (`rental_contract_id`),
  CONSTRAINT `rented_out_rental_item_id_FK` FOREIGN KEY (`rental_item_id`) REFERENCES `rental_item` (`rental_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 16:15:29
