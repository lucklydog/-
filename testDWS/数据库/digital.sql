/*
SQLyog v10.2 
MySQL - 5.5.27 : Database - digital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`digital` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `digital`;

/*Table structure for table `admin_info` */

DROP TABLE IF EXISTS `admin_info`;

CREATE TABLE `admin_info` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `role` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

/*Data for the table `admin_info` */

insert  into `admin_info`(`id`,`name`,`pwd`,`role`) values (1,'admin','123456',1),(2,'my','123456',2),(3,'sj','123456',2),(4,'lxf','123456',2);

/*Table structure for table `functions` */

DROP TABLE IF EXISTS `functions`;

CREATE TABLE `functions` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '功能菜单',
  `parentid` int(4) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `isleaf` bit(1) DEFAULT NULL,
  `nodeorder` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

/*Data for the table `functions` */

insert  into `functions`(`id`,`name`,`parentid`,`url`,`isleaf`,`nodeorder`) values (1,'DW管理系统后台',0,NULL,'\0',0),(2,'党员信息管理',1,NULL,'\0',1),(3,'党员信息',2,NULL,'',1),(4,'支部列表',2,NULL,'',2),(5,'用户管理',1,NULL,'\0',2),(6,'用户列表',5,NULL,'',1),(7,'管理员列表',5,NULL,'',2),(11,'退出系统',1,NULL,'',1);




/*Table structure for table `powers` */

DROP TABLE IF EXISTS `powers`;

CREATE TABLE `powers` (
  `aid` int(4) NOT NULL,
  `fid` int(4) NOT NULL,
  PRIMARY KEY (`aid`,`fid`),
  KEY `fid` (`fid`),
  KEY `aid` (`aid`),
  CONSTRAINT `powers_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin_info` (`id`),
  CONSTRAINT `powers_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `functions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `powers` */

insert  into `powers`(`aid`,`fid`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11);



DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

/*Data for the table `type` */

insert  into `type`(`id`,`name`) values (1,'第一支部'),(2,'第二支部'),(3,'第三支部');

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userName` varchar(16) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  `status` int(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

insert  into `user_info`(`id`,`userName`,`password`,`status`) values (1,'tom','123456',1),(2,'john','123456',1);

/* Procedure structure for procedure `sp_sale` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_sale` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sale`(c int)
BEGIN	
	declare stmt varchar(2000);
	set @sqlstr=concat("SELECT p.id AS id, p.name AS NAME,SUM(od.num) AS total ,SUM(od.num)*price AS money
	FROM order_detail od, product_info p 
	WHERE p.id=od.p_id 
	GROUP BY p.id,p.name,p.price ORDER BY total DESC LIMIT 1,",c);
     prepare stmt from @sqlstr;
     execute stmt;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
