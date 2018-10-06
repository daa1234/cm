/*
Navicat MySQL Data Transfer

Source Server         : 测试环境
Source Server Version : 50614
Source Host           : 121.46.0.227:31211
Source Database       : oscloud_test

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-04-24 17:27:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for baby91_resources
-- ----------------------------
DROP TABLE IF EXISTS `baby91_resources`;
CREATE TABLE `baby91_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `molde` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `updateUserId` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK313594D50DD7AA` (`updateUserId`),
  KEY `FK3135947C711B6` (`pid`),
  KEY `FK31359468A30D9D` (`createUserId`),
  CONSTRAINT `FK31359468A30D9D` FOREIGN KEY (`createUserId`) REFERENCES `baby91_user` (`id`),
  CONSTRAINT `FK3135947C711B6` FOREIGN KEY (`pid`) REFERENCES `baby91_resources` (`id`),
  CONSTRAINT `FK313594D50DD7AA` FOREIGN KEY (`updateUserId`) REFERENCES `baby91_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of baby91_resources
-- ----------------------------
INSERT INTO `baby91_resources` VALUES ('1', '2016-03-22 10:32:18', '2016-03-22 10:32:18', 'menu', '系统设置', '', '14', null, '', null, null, null);
INSERT INTO `baby91_resources` VALUES ('2', '2016-03-22 10:33:53', '2016-03-22 10:33:53', 'menu', '角色管理', '', '1', null, '/jsp/privilege/role/role_list.jsp', null, null, '1');
INSERT INTO `baby91_resources` VALUES ('3', '2016-03-22 10:34:38', '2016-03-22 10:34:38', 'menu', '菜单管理', '', '2', null, '/jsp/privilege/menu/menu_list.jsp', null, null, '1');
INSERT INTO `baby91_resources` VALUES ('86', '2017-04-24 16:04:36', '2017-04-24 16:04:36', 'menu', '用户管理', '', '1', null, '', null, null, null);
INSERT INTO `baby91_resources` VALUES ('87', '2017-04-24 16:05:15', '2017-04-24 16:05:15', 'menu', '系统用户管理', '', '1', null, '/jsp/user/systemUser/userList.jsp', null, null, '86');
INSERT INTO `baby91_resources` VALUES ('88', '2017-04-24 16:37:46', '2017-04-24 16:37:46', 'menu', '医生用户管理', '', '2', null, '/jsp/user/doctor/list.jsp', null, null, '86');
INSERT INTO `baby91_resources` VALUES ('89', '2017-04-24 16:38:16', '2017-04-24 16:38:16', 'menu', '患者用户管理', '', '3', null, '/jsp/user/sicker/list.jsp', null, null, '86');
