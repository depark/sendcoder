/*
Navicat MySQL Data Transfer

Source Server         : benji
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sendcoder

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-08-03 18:24:30
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
INSERT INTO `auth_permission` VALUES ('22', 'Can add service', '8', 'add_service');
INSERT INTO `auth_permission` VALUES ('23', 'Can change service', '8', 'change_service');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete service', '8', 'delete_service');
INSERT INTO `auth_permission` VALUES ('25', 'Can add project', '9', 'add_project');
INSERT INTO `auth_permission` VALUES ('26', 'Can change project', '9', 'change_project');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete project', '9', 'delete_project');

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
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$pdNgtIt3MiEV$b3boPO4zOWOmbdtZoTDzY0bReSmPbXUTaLUYCb5jKAA=', '2017-08-01 10:00:16.879810', '1', 'admin', '', '', '', '1', '1', '2017-08-01 10:00:05.501159');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-08-01 10:08:08.956811', '1', '172.16.1.191', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-08-02 01:21:09.362281', '10', '172.16.1.130', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-08-02 01:21:28.069351', '11', '172.16.1.123', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2017-08-02 01:21:31.380540', '1', 'gov', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2017-08-02 01:21:56.779993', '12', '172.16.1.118', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2017-08-02 01:22:12.706904', '13', '172.16.1.133', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2017-08-02 01:22:16.029094', '2', 'edu-app', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2017-08-02 01:22:41.610557', '14', '172.16.1.127', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2017-08-02 01:23:09.490152', '15', '172.16.1.121', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2017-08-02 01:23:12.909348', '3', 'pro', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2017-08-02 01:23:37.535756', '16', '172.16.1.119', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2017-08-02 01:23:55.874805', '17', '172.16.1.120', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2017-08-02 01:23:58.011927', '4', 'pro-app', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2017-08-02 01:24:42.135451', '18', '172.16.1.116', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2017-08-02 01:25:00.794518', '19', '172.16.1.114', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2017-08-02 01:25:03.136652', '5', 'saas-pro', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2017-08-02 01:25:25.654940', '20', '172.16.1.128', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2017-08-02 01:25:47.081166', '21', '172.16.1.148', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2017-08-02 01:25:51.992447', '6', 'order-admin', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2017-08-02 01:26:21.673144', '22', '172.16.1.136', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2017-08-02 01:26:43.097370', '23', '172.16.1.122', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2017-08-02 01:26:44.449447', '7', 'order', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2017-08-02 01:27:02.830498', '24', '172.16.1.132', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2017-08-02 01:27:22.414618', '25', '172.16.1.140', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2017-08-02 01:27:23.983708', '8', 'wechat', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2017-08-02 01:27:43.168806', '26', '172.16.1.129', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2017-08-02 01:27:59.031713', '27', '172.16.1.141', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2017-08-02 01:28:00.163778', '9', 'operate', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2017-08-02 01:28:22.075031', '28', '172.16.1.105', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2017-08-02 01:28:40.383078', '29', '172.16.1.142', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2017-08-02 01:28:41.731155', '10', 'saas-job', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2017-08-02 01:29:04.977485', '30', '172.16.1.115', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2017-08-02 01:29:30.964971', '31', '172.16.1.143', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2017-08-02 01:29:32.690070', '11', 'saas-push-job', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2017-08-02 01:29:56.834451', '32', '172.16.1.125', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2017-08-02 01:30:11.547292', '33', '172.16.1.144', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2017-08-02 01:30:13.132383', '12', 'saas-warning-job', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2017-08-02 01:30:47.961375', '34', '172.16.1.113', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2017-08-02 01:31:05.781394', '35', '172.16.1.117', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2017-08-02 01:31:25.641530', '36', '172.16.1.149', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2017-08-02 01:31:50.952978', '37', '172.16.1.150', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2017-08-02 01:31:52.788083', '13', 'saas-handle', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2017-08-02 01:32:16.182421', '38', '172.16.1.139', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2017-08-02 01:34:09.905926', '39', '172.16.1.146', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2017-08-02 01:34:15.475244', '14', 'common-handle', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2017-08-02 01:34:38.577566', '40', '172.16.1.108', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2017-08-02 01:34:57.768663', '41', '172.16.1.145', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2017-08-02 01:35:00.275807', '15', 'edu-handle', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2017-08-02 02:25:24.346774', '42', '192.168.1.27', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2017-08-02 02:25:40.812715', '43', '192.168.1.28', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2017-08-02 02:25:55.603561', '44', '192.168.1.29', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2017-08-02 09:16:31.094690', '45', '172.16.1.242', '1', '[{\"added\": {}}]', '7', '1');

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
INSERT INTO `django_content_type` VALUES ('9', 'sendshow', 'project');
INSERT INTO `django_content_type` VALUES ('8', 'sendshow', 'service');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-08-01 09:53:31.551626');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-08-01 09:53:40.519139');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-08-01 09:53:43.118288');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-08-01 09:53:43.156290');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-08-01 09:53:44.111345');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-08-01 09:53:44.710379');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-08-01 09:53:45.374417');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-08-01 09:53:45.408419');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-08-01 09:53:45.996453');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-08-01 09:53:46.024454');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-08-01 09:53:46.080457');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-08-01 09:53:46.668491');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2017-08-01 09:53:47.177520');
INSERT INTO `django_migrations` VALUES ('14', 'sendshow', '0001_initial', '2017-08-01 09:56:31.085895');
INSERT INTO `django_migrations` VALUES ('15', 'sendshow', '0002_remove_host_other_ip', '2017-08-01 09:57:54.535668');
INSERT INTO `django_migrations` VALUES ('16', 'sendshow', '0003_auto_20170801_1802', '2017-08-01 10:02:49.399534');
INSERT INTO `django_migrations` VALUES ('17', 'sendshow', '0004_auto_20170801_1805', '2017-08-01 10:05:36.879113');
INSERT INTO `django_migrations` VALUES ('18', 'sendshow', '0005_auto_20170801_1806', '2017-08-01 10:06:36.349514');

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
INSERT INTO `django_session` VALUES ('svzqpb9m994yxr01mh9xp28x9ajphea9', 'ZWZmYTMwZGU4YzAzM2RjZGY4ZTg2MGZhMTdhNTZiOTNmOWI0M2FjMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4Nzk0YTRkM2YzMTE4YzAyMjQ3MTBkYmQ0M2RlOTkzNGVmZmM2ZGE4In0=', '2017-08-15 10:00:16.936813');

-- ----------------------------
-- Table structure for sendshow_host
-- ----------------------------
DROP TABLE IF EXISTS `sendshow_host`;
CREATE TABLE `sendshow_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) NOT NULL,
  `hostname` varchar(128) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `cpu` varchar(200) DEFAULT NULL,
  `memory` varchar(20) DEFAULT NULL,
  `system` varchar(32) DEFAULT NULL,
  `disk` varchar(30) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `date_added` datetime(6) DEFAULT NULL,
  `is_vitual` int(11) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  UNIQUE KEY `hostname` (`hostname`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_host
-- ----------------------------
INSERT INTO `sendshow_host` VALUES ('1', '172.16.1.191', 'centos191', '22', 'root', 'sport123!@#', null, null, null, null, '1', '0', '2017-08-02 09:19:57.341487', '1', null);
INSERT INTO `sendshow_host` VALUES ('2', '172.16.1.192', 'centos192', '22', 'root', 'sport123!@#', null, null, null, null, '1', '0', '2017-08-02 09:19:56.739452', '1', null);
INSERT INTO `sendshow_host` VALUES ('3', '172.16.1.193', 'centos193', '22', 'root', 'sport123!@#', null, null, null, null, '1', '0', '2017-08-02 09:19:57.321485', '1', null);
INSERT INTO `sendshow_host` VALUES ('4', '172.16.1.194', 'centos194', '22', 'root', 'sport123!@#', null, null, null, null, '1', '0', '2017-08-02 09:19:57.349487', '1', null);
INSERT INTO `sendshow_host` VALUES ('5', '172.16.1.195', 'centos195', '22', 'root', 'sport123!@#', null, null, null, null, '1', '0', '2017-08-02 09:20:01.329715', '1', null);
INSERT INTO `sendshow_host` VALUES ('6', '172.16.1.196', 'centos196', '22', 'root', 'sport123!@#', null, null, null, null, '1', '0', '2017-08-02 09:19:56.729452', '1', null);
INSERT INTO `sendshow_host` VALUES ('7', '172.16.1.197', 'centos197', '22', 'root', 'sport123!@#', null, null, null, null, '1', '0', '2017-08-02 09:19:56.749453', '1', null);
INSERT INTO `sendshow_host` VALUES ('8', '172.16.1.198', 'centos198', '22', 'root', 'sport123!@#', null, null, null, null, '1', '0', '2017-08-02 09:19:57.336486', '1', null);
INSERT INTO `sendshow_host` VALUES ('9', '172.16.1.199', 'centos199', '22', 'root', 'sport123!@#', null, null, null, null, '1', '0', '2017-08-02 09:19:57.347487', '1', null);
INSERT INTO `sendshow_host` VALUES ('10', '172.16.1.130', 'gov-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.266425', '0', null);
INSERT INTO `sendshow_host` VALUES ('11', '172.16.1.123', 'gov-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.300427', '0', null);
INSERT INTO `sendshow_host` VALUES ('12', '172.16.1.118', 'edu-app-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.337429', '0', null);
INSERT INTO `sendshow_host` VALUES ('13', '172.16.1.133', 'edu-app-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.325428', '0', null);
INSERT INTO `sendshow_host` VALUES ('14', '172.16.1.127', 'pro-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.305427', '0', null);
INSERT INTO `sendshow_host` VALUES ('15', '172.16.1.121', 'pro-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.323428', '0', null);
INSERT INTO `sendshow_host` VALUES ('16', '172.16.1.119', 'pro-app-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.332429', '0', null);
INSERT INTO `sendshow_host` VALUES ('17', '172.16.1.120', 'pro-app-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.317428', '0', null);
INSERT INTO `sendshow_host` VALUES ('18', '172.16.1.116', 'saas-pro-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.324428', '0', null);
INSERT INTO `sendshow_host` VALUES ('19', '172.16.1.114', 'saas-pro-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.339429', '0', null);
INSERT INTO `sendshow_host` VALUES ('20', '172.16.1.128', 'order-admin-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.338429', '0', null);
INSERT INTO `sendshow_host` VALUES ('21', '172.16.1.148', 'order-admin-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.318428', '0', null);
INSERT INTO `sendshow_host` VALUES ('22', '172.16.1.136', 'order-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.308428', '0', null);
INSERT INTO `sendshow_host` VALUES ('23', '172.16.1.122', 'order-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.304427', '0', null);
INSERT INTO `sendshow_host` VALUES ('24', '172.16.1.132', 'wechat-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.337429', '0', null);
INSERT INTO `sendshow_host` VALUES ('25', '172.16.1.140', 'wechat-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.319428', '0', null);
INSERT INTO `sendshow_host` VALUES ('26', '172.16.1.129', 'operate-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.309428', '0', null);
INSERT INTO `sendshow_host` VALUES ('27', '172.16.1.141', 'operate-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.335429', '0', null);
INSERT INTO `sendshow_host` VALUES ('28', '172.16.1.105', 'saas-job-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.314428', '0', null);
INSERT INTO `sendshow_host` VALUES ('29', '172.16.1.142', 'saas-job-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.306427', '0', null);
INSERT INTO `sendshow_host` VALUES ('30', '172.16.1.115', 'saas-push-job-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.324428', '0', null);
INSERT INTO `sendshow_host` VALUES ('31', '172.16.1.143', 'saas-push-job-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.332429', '0', null);
INSERT INTO `sendshow_host` VALUES ('32', '172.16.1.125', 'saas-warning-job-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.343430', '0', null);
INSERT INTO `sendshow_host` VALUES ('33', '172.16.1.144', 'saas-warning-job-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '0', '2017-08-02 09:19:56.307427', '0', null);
INSERT INTO `sendshow_host` VALUES ('34', '172.16.1.113', 'saas-handle-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '1', '2017-08-02 09:19:56.321428', '0', null);
INSERT INTO `sendshow_host` VALUES ('35', '172.16.1.117', 'saas-handle-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '1', '2017-08-02 09:19:56.330429', '0', null);
INSERT INTO `sendshow_host` VALUES ('36', '172.16.1.149', 'saas-handle-03', '22', 'root', 'sport123!@#', null, null, null, null, '2', '1', '2017-08-02 09:19:56.336429', '0', null);
INSERT INTO `sendshow_host` VALUES ('37', '172.16.1.150', 'saas-handle-04', '22', 'root', 'sport123!@#', null, null, null, null, '2', '1', '2017-08-02 09:19:56.323428', '0', null);
INSERT INTO `sendshow_host` VALUES ('38', '172.16.1.139', 'co', '22', 'root', 'sport123!@#', null, null, null, null, '2', '1', '2017-08-02 09:19:56.313428', '0', null);
INSERT INTO `sendshow_host` VALUES ('39', '172.16.1.146', 'common-handle-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '1', '2017-08-02 09:19:56.341429', '0', null);
INSERT INTO `sendshow_host` VALUES ('40', '172.16.1.108', 'edu-handle-01', '22', 'root', 'sport123!@#', null, null, null, null, '2', '1', '2017-08-02 09:19:56.340429', '0', null);
INSERT INTO `sendshow_host` VALUES ('41', '172.16.1.145', 'edu-handle-02', '22', 'root', 'sport123!@#', null, null, null, null, '2', '1', '2017-08-02 09:19:56.307427', '0', null);
INSERT INTO `sendshow_host` VALUES ('42', '192.168.1.27', 'test-01', '22', 'root', '123456', null, null, null, null, '1', '0', '2017-08-02 09:19:57.318485', '0', null);
INSERT INTO `sendshow_host` VALUES ('43', '192.168.1.28', 'test-02', '22', 'root', '12345678', null, null, null, null, '2', '0', '2017-08-02 09:19:56.335429', '0', null);
INSERT INTO `sendshow_host` VALUES ('44', '192.168.1.29', 'test-03', '22', 'root', null, null, null, null, null, '2', '0', '2017-08-02 09:19:56.344430', '0', null);
INSERT INTO `sendshow_host` VALUES ('45', '172.16.1.242', 'jump', '22', 'root', 'sport123!@#', null, null, null, null, '1', '2', '2017-08-02 09:19:57.352487', '0', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_project
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_project_type
-- ----------------------------

-- ----------------------------
-- Table structure for sendshow_service
-- ----------------------------
DROP TABLE IF EXISTS `sendshow_service`;
CREATE TABLE `sendshow_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_service
-- ----------------------------
INSERT INTO `sendshow_service` VALUES ('1', 'gov', '0');
INSERT INTO `sendshow_service` VALUES ('2', 'edu-app', '0');
INSERT INTO `sendshow_service` VALUES ('3', 'pro', '0');
INSERT INTO `sendshow_service` VALUES ('4', 'pro-app', '0');
INSERT INTO `sendshow_service` VALUES ('5', 'saas-pro', '0');
INSERT INTO `sendshow_service` VALUES ('6', 'order-admin', '0');
INSERT INTO `sendshow_service` VALUES ('7', 'order', '0');
INSERT INTO `sendshow_service` VALUES ('8', 'wechat', '0');
INSERT INTO `sendshow_service` VALUES ('9', 'operate', '0');
INSERT INTO `sendshow_service` VALUES ('10', 'saas-job', '0');
INSERT INTO `sendshow_service` VALUES ('11', 'saas-push-job', '0');
INSERT INTO `sendshow_service` VALUES ('12', 'saas-warning-job', '0');
INSERT INTO `sendshow_service` VALUES ('13', 'saas-handle', '1');
INSERT INTO `sendshow_service` VALUES ('14', 'common-handle', '1');
INSERT INTO `sendshow_service` VALUES ('15', 'edu-handle', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sendshow_service_hosts
-- ----------------------------
INSERT INTO `sendshow_service_hosts` VALUES ('1', '1', '10');
INSERT INTO `sendshow_service_hosts` VALUES ('2', '1', '11');
INSERT INTO `sendshow_service_hosts` VALUES ('3', '2', '12');
INSERT INTO `sendshow_service_hosts` VALUES ('4', '2', '13');
INSERT INTO `sendshow_service_hosts` VALUES ('5', '3', '14');
INSERT INTO `sendshow_service_hosts` VALUES ('6', '3', '15');
INSERT INTO `sendshow_service_hosts` VALUES ('7', '4', '16');
INSERT INTO `sendshow_service_hosts` VALUES ('8', '4', '17');
INSERT INTO `sendshow_service_hosts` VALUES ('9', '5', '18');
INSERT INTO `sendshow_service_hosts` VALUES ('10', '5', '19');
INSERT INTO `sendshow_service_hosts` VALUES ('11', '6', '20');
INSERT INTO `sendshow_service_hosts` VALUES ('12', '6', '21');
INSERT INTO `sendshow_service_hosts` VALUES ('13', '7', '22');
INSERT INTO `sendshow_service_hosts` VALUES ('14', '7', '23');
INSERT INTO `sendshow_service_hosts` VALUES ('15', '8', '24');
INSERT INTO `sendshow_service_hosts` VALUES ('16', '8', '25');
INSERT INTO `sendshow_service_hosts` VALUES ('17', '9', '26');
INSERT INTO `sendshow_service_hosts` VALUES ('18', '9', '27');
INSERT INTO `sendshow_service_hosts` VALUES ('19', '10', '28');
INSERT INTO `sendshow_service_hosts` VALUES ('20', '10', '29');
INSERT INTO `sendshow_service_hosts` VALUES ('21', '11', '30');
INSERT INTO `sendshow_service_hosts` VALUES ('22', '11', '31');
INSERT INTO `sendshow_service_hosts` VALUES ('23', '12', '32');
INSERT INTO `sendshow_service_hosts` VALUES ('24', '12', '33');
INSERT INTO `sendshow_service_hosts` VALUES ('25', '13', '34');
INSERT INTO `sendshow_service_hosts` VALUES ('26', '13', '35');
INSERT INTO `sendshow_service_hosts` VALUES ('27', '13', '36');
INSERT INTO `sendshow_service_hosts` VALUES ('28', '13', '37');
INSERT INTO `sendshow_service_hosts` VALUES ('29', '14', '38');
INSERT INTO `sendshow_service_hosts` VALUES ('30', '14', '39');
INSERT INTO `sendshow_service_hosts` VALUES ('31', '15', '40');
INSERT INTO `sendshow_service_hosts` VALUES ('32', '15', '41');
