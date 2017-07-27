/*
Navicat MySQL Data Transfer

Source Server         : benji
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sendcoder

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-26 17:17:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add host', '7', 'add_host');
INSERT INTO `auth_permission` VALUES ('20', 'Can change host', '7', 'change_host');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete host', '7', 'delete_host');
INSERT INTO `auth_permission` VALUES ('22', 'Can add project', '8', 'add_project');
INSERT INTO `auth_permission` VALUES ('23', 'Can change project', '8', 'change_project');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete project', '8', 'delete_project');
INSERT INTO `auth_permission` VALUES ('25', 'Can add service', '9', 'add_service');
INSERT INTO `auth_permission` VALUES ('26', 'Can change service', '9', 'change_service');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete service', '9', 'delete_service');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$icH0e4r5X2Dg$K/Me7LRxcFrEs5PpeIK2OQ5lzHIpNHwtxzmD/ofgvQs=', '2017-07-26 05:51:09.671058', '1', 'admin', '', '', '', '1', '1', '2017-07-24 06:42:38.081450');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-07-24 06:58:46.121819', '1', '192.168.1.27', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-07-24 06:58:56.502413', '2', '192.168.1.28', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-07-24 06:59:24.037988', '2', '192.168.1.28', '2', '[{\"changed\": {\"fields\": [\"username\", \"password\", \"status\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2017-07-24 06:59:29.152280', '1', '192.168.1.27', '2', '[{\"changed\": {\"fields\": [\"status\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2017-07-24 07:08:11.793174', '3', '192.168.1.29', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2017-07-24 07:16:02.369089', '1', 'pro', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2017-07-24 07:17:22.149652', '1', '教委', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2017-07-24 07:17:49.348208', '2', 'dubbo-common', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2017-07-24 07:18:18.332866', '1', '教委', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2017-07-25 07:07:13.245597', '3', '192.168.1.29', '2', '[{\"changed\": {\"fields\": [\"monitor\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2017-07-25 07:19:41.827413', '2', '192.168.1.28', '2', '[{\"changed\": {\"fields\": [\"monitor\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2017-07-26 05:54:46.942485', '4', '172.16.1.121', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2017-07-26 05:55:13.596010', '5', '172.16.1.127', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2017-07-26 05:56:09.517208', '1', 'pro', '2', '[]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2017-07-26 06:09:57.478565', '6', '172.16.1.130', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2017-07-26 06:10:01.434791', '3', 'edu', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2017-07-26 06:18:54.739294', '7', '172.16.1.113', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2017-07-26 06:19:18.808671', '8', '172.16.1.117', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2017-07-26 06:19:35.893648', '9', '172.16.1.150', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2017-07-26 06:19:49.773442', '10', '172.16.1.149', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2017-07-26 06:19:58.544944', '8', '172.16.1.117', '2', '[{\"changed\": {\"fields\": [\"type\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2017-07-26 06:20:34.359992', '4', 'saas-pro-handler', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2017-07-26 06:35:44.348041', '4', 'saas-pro-handler', '2', '[{\"changed\": {\"fields\": [\"type\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2017-07-26 06:35:47.513222', '2', 'dubbo-common', '2', '[]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2017-07-26 06:35:47.667231', '2', 'dubbo-common', '2', '[]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2017-07-26 06:35:59.252893', '2', 'dubbo-common', '2', '[{\"changed\": {\"fields\": [\"type\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2017-07-26 08:27:39.226110', '1', '192.168.1.27', '2', '[{\"changed\": {\"fields\": [\"hostname\", \"username\", \"password\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2017-07-26 08:51:57.735532', '1', '192.168.1.27', '2', '[{\"changed\": {\"fields\": [\"password\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2017-07-26 09:10:19.893572', '3', '192.168.1.29', '2', '[{\"changed\": {\"fields\": [\"username\", \"password\"]}}]', '7', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'sendshow', 'host');
INSERT INTO `django_content_type` VALUES ('8', 'sendshow', 'project');
INSERT INTO `django_content_type` VALUES ('9', 'sendshow', 'service');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-07-24 06:40:03.975636');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-07-24 06:40:11.037040');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-07-24 06:40:12.586129');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-07-24 06:40:12.621131');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-07-24 06:40:13.552184');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-07-24 06:40:14.388232');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-07-24 06:40:14.940263');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-07-24 06:40:14.976265');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-07-24 06:40:15.358287');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-07-24 06:40:15.387289');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-07-24 06:40:15.438292');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-07-24 06:40:16.581357');
INSERT INTO `django_migrations` VALUES ('13', 'sendshow', '0001_initial', '2017-07-24 06:40:20.075557');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2017-07-24 06:40:20.580586');
INSERT INTO `django_migrations` VALUES ('15', 'sendshow', '0002_auto_20170724_1511', '2017-07-24 07:11:46.551457');
INSERT INTO `django_migrations` VALUES ('16', 'sendshow', '0003_auto_20170724_1515', '2017-07-24 07:15:38.288712');
INSERT INTO `django_migrations` VALUES ('17', 'sendshow', '0004_auto_20170725_0938', '2017-07-25 01:38:17.256763');
INSERT INTO `django_migrations` VALUES ('18', 'sendshow', '0005_auto_20170725_1111', '2017-07-25 03:11:25.993420');
INSERT INTO `django_migrations` VALUES ('19', 'sendshow', '0006_auto_20170725_1125', '2017-07-25 03:25:36.109044');
INSERT INTO `django_migrations` VALUES ('20', 'sendshow', '0007_auto_20170725_1132', '2017-07-25 03:32:35.608038');
INSERT INTO `django_migrations` VALUES ('21', 'sendshow', '0008_auto_20170726_1353', '2017-07-26 05:53:38.086547');
INSERT INTO `django_migrations` VALUES ('22', 'sendshow', '0009_auto_20170726_1413', '2017-07-26 06:14:03.173618');
INSERT INTO `django_migrations` VALUES ('23', 'sendshow', '0010_service_type', '2017-07-26 06:35:15.138370');
INSERT INTO `django_migrations` VALUES ('24', 'sendshow', '0011_auto_20170726_1615', '2017-07-26 08:15:13.032430');
INSERT INTO `django_migrations` VALUES ('25', 'sendshow', '0012_auto_20170726_1714', '2017-07-26 09:14:29.455846');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0817wrw5k85q3z45qlbngu6fl7x6bosl', 'OWViOTQ1ZGM5ZjY3MjA5OTU2NzZmZjA3MGM2MDI1ZWYzZTAwNDU1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNDZkY2ZiNGVkMmVhOWJhMWQ0NTY0MDA4NmVkNzcwNjM0MWRhMDk2In0=', '2017-08-09 05:51:09.701060');
INSERT INTO `django_session` VALUES ('9ilh30swi7uwpeixc46ucrs7g4poa7l6', 'OWViOTQ1ZGM5ZjY3MjA5OTU2NzZmZjA3MGM2MDI1ZWYzZTAwNDU1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNDZkY2ZiNGVkMmVhOWJhMWQ0NTY0MDA4NmVkNzcwNjM0MWRhMDk2In0=', '2017-08-07 06:56:59.582725');

-- ----------------------------
-- Table structure for sendshow_host
-- ----------------------------
DROP TABLE IF EXISTS `sendshow_host`;
CREATE TABLE `sendshow_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) NOT NULL,
  `other_ip` varchar(255) DEFAULT NULL,
  `hostname` varchar(128) NOT NULL,
  `port` int(11),
  `status` int(11) NOT NULL,
  `date_added` datetime(6) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `username` varchar(16),
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  UNIQUE KEY `sendshow_host_ip_33de78b9_uniq` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_host
-- ----------------------------
INSERT INTO `sendshow_host` VALUES ('1', '192.168.1.27', null, 'pro-tomcat-01', '22', '2', '2017-07-26 09:07:42.564573', null, '0', '123456', 'root');
INSERT INTO `sendshow_host` VALUES ('2', '192.168.1.28', null, 'edu', null, '2', '2017-07-26 09:07:42.616576', null, '0', null, null);
INSERT INTO `sendshow_host` VALUES ('3', '192.168.1.29', null, 'dubbo-common', null, '2', '2017-07-26 09:10:19.890571', null, '0', '12345678', 'root');
INSERT INTO `sendshow_host` VALUES ('4', '172.16.1.121', null, 'centos131', '22', '2', '2017-07-26 09:07:42.999598', 'pro-tomcat-01', '0', null, null);
INSERT INTO `sendshow_host` VALUES ('5', '172.16.1.127', null, 'centos127', '22', '2', '2017-07-26 09:07:43.153607', 'pro-tomcat-02', '0', null, null);
INSERT INTO `sendshow_host` VALUES ('6', '172.16.1.130', null, 'centos130', '22', '2', '2017-07-26 09:07:43.303615', 'edu-tomcat-01', '0', null, null);
INSERT INTO `sendshow_host` VALUES ('7', '172.16.1.113', null, 'saas-pro-handler-01', '22', '1', '2017-07-26 09:07:44.402678', null, '1', null, null);
INSERT INTO `sendshow_host` VALUES ('8', '172.16.1.117', null, 'saas-pro-handler-02', '22', '1', '2017-07-26 09:07:45.481740', null, '1', null, null);
INSERT INTO `sendshow_host` VALUES ('9', '172.16.1.150', null, 'saas-pro-handler-03', '22', '1', '2017-07-26 09:07:46.564802', null, '1', null, null);
INSERT INTO `sendshow_host` VALUES ('10', '172.16.1.149', null, 'saas-pro-handler-04', '22', '1', '2017-07-26 09:07:47.646864', null, '1', null, null);

-- ----------------------------
-- Table structure for sendshow_project
-- ----------------------------
DROP TABLE IF EXISTS `sendshow_project`;
CREATE TABLE `sendshow_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `person` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_project
-- ----------------------------
INSERT INTO `sendshow_project` VALUES ('1', '教委', '张三');

-- ----------------------------
-- Table structure for sendshow_project_type
-- ----------------------------
DROP TABLE IF EXISTS `sendshow_project_type`;
CREATE TABLE `sendshow_project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sendshow_project_type_project_id_service_id_6ec230be_uniq` (`project_id`,`service_id`),
  KEY `sendshow_project_type_service_id_211deb20_fk_sendshow_service_id` (`service_id`),
  CONSTRAINT `sendshow_project_type_project_id_b410b334_fk_sendshow_project_id` FOREIGN KEY (`project_id`) REFERENCES `sendshow_project` (`id`),
  CONSTRAINT `sendshow_project_type_service_id_211deb20_fk_sendshow_service_id` FOREIGN KEY (`service_id`) REFERENCES `sendshow_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_project_type
-- ----------------------------
INSERT INTO `sendshow_project_type` VALUES ('1', '1', '1');
INSERT INTO `sendshow_project_type` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for sendshow_service
-- ----------------------------
DROP TABLE IF EXISTS `sendshow_service`;
CREATE TABLE `sendshow_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_service
-- ----------------------------
INSERT INTO `sendshow_service` VALUES ('1', 'pro', '0');
INSERT INTO `sendshow_service` VALUES ('2', 'dubbo-common', '1');
INSERT INTO `sendshow_service` VALUES ('3', 'edu', '0');
INSERT INTO `sendshow_service` VALUES ('4', 'saas-pro-handler', '1');

-- ----------------------------
-- Table structure for sendshow_service_hosts
-- ----------------------------
DROP TABLE IF EXISTS `sendshow_service_hosts`;
CREATE TABLE `sendshow_service_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sendshow_service_hosts_service_id_host_id_8a0c2996_uniq` (`service_id`,`host_id`),
  KEY `sendshow_service_hosts_host_id_a3b01c42_fk_sendshow_host_id` (`host_id`),
  CONSTRAINT `sendshow_service_hos_service_id_76e288e7_fk_sendshow_` FOREIGN KEY (`service_id`) REFERENCES `sendshow_service` (`id`),
  CONSTRAINT `sendshow_service_hosts_host_id_a3b01c42_fk_sendshow_host_id` FOREIGN KEY (`host_id`) REFERENCES `sendshow_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_service_hosts
-- ----------------------------
INSERT INTO `sendshow_service_hosts` VALUES ('1', '1', '1');
INSERT INTO `sendshow_service_hosts` VALUES ('2', '1', '2');
INSERT INTO `sendshow_service_hosts` VALUES ('4', '1', '4');
INSERT INTO `sendshow_service_hosts` VALUES ('5', '1', '5');
INSERT INTO `sendshow_service_hosts` VALUES ('3', '2', '3');
INSERT INTO `sendshow_service_hosts` VALUES ('6', '3', '6');
INSERT INTO `sendshow_service_hosts` VALUES ('10', '4', '7');
INSERT INTO `sendshow_service_hosts` VALUES ('7', '4', '8');
INSERT INTO `sendshow_service_hosts` VALUES ('8', '4', '9');
INSERT INTO `sendshow_service_hosts` VALUES ('9', '4', '10');
