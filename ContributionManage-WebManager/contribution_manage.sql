/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : contribution_manage

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2017-08-14 17:36:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `resources`
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
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
  CONSTRAINT `FK31359468A30D9D` FOREIGN KEY (`createUserId`) REFERENCES `systemuser` (`id`),
  CONSTRAINT `FK3135947C711B6` FOREIGN KEY (`pid`) REFERENCES `resources` (`id`),
  CONSTRAINT `FK313594D50DD7AA` FOREIGN KEY (`updateUserId`) REFERENCES `systemuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of resources
-- ----------------------------
INSERT INTO `resources` VALUES ('1', null, null, 'menu', '用户管理', '1', '6', null, '', null, null, null);
INSERT INTO `resources` VALUES ('2', '2016-03-10 17:56:30', '2016-03-10 17:56:30', 'menu', '系统后台用户管理', '', '1', null, '/model/user/userlist.jsp', null, null, '1');
INSERT INTO `resources` VALUES ('37', '2016-03-22 10:32:18', '2016-03-22 10:32:18', 'menu', '系统设置', '', '14', null, '', null, null, null);
INSERT INTO `resources` VALUES ('38', '2016-03-22 10:33:53', '2016-03-22 10:33:53', 'menu', '角色管理', '', '1', null, '/model/privilege/role/role_list.jsp', null, null, '37');
INSERT INTO `resources` VALUES ('39', '2016-03-22 10:34:38', '2016-03-22 10:34:38', 'menu', '菜单管理', '', '2', null, '/model/privilege/menu/menu_list.jsp', null, null, '37');
INSERT INTO `resources` VALUES ('86', '2017-08-14 11:18:30', null, 'menu', '投稿管理', '', null, null, '', '1', null, null);
INSERT INTO `resources` VALUES ('87', '2017-08-14 11:19:02', null, 'menu', '稿件收集', '', null, null, '/model/contributionManage/contributionCollect.jsp', '1', null, '86');
INSERT INTO `resources` VALUES ('88', '2017-08-14 11:19:40', null, 'menu', '稿件审核', '', null, null, '/model/contributionManage/contributionAudit.jsp', '1', null, '86');
INSERT INTO `resources` VALUES ('89', '2017-08-14 11:20:16', null, 'menu', '稿件已审核', '', null, null, '/model/contributionManage/contributionAudited.jsp', '1', null, '86');
INSERT INTO `resources` VALUES ('90', '2017-08-14 11:20:46', null, 'menu', '稿件结算', '', null, null, '/model/contributionManage/unWithdrawList.jsp', '1', null, '86');
INSERT INTO `resources` VALUES ('91', '2017-08-14 11:21:15', null, 'menu', '稿件已结算', '', null, null, '/model/contributionManage/withdrawList.jsp', '1', null, '86');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `updateUserId` tinyblob,
  `code` varchar(255) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('4', '2017-08-14 11:03:21', '1', null, null, null, '0', '稿件收集', '', null);
INSERT INTO `role` VALUES ('5', '2017-08-14 11:03:39', '1', null, null, null, '0', '稿件审核', '', null);
INSERT INTO `role` VALUES ('6', '2017-08-14 11:04:13', '1', null, null, null, '0', '稿件结算', '', null);

-- ----------------------------
-- Table structure for `role_resource_re`
-- ----------------------------
DROP TABLE IF EXISTS `role_resource_re`;
CREATE TABLE `role_resource_re` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_resource_re
-- ----------------------------
INSERT INTO `role_resource_re` VALUES ('1', '86', '4', '1');
INSERT INTO `role_resource_re` VALUES ('2', '87', '4', '1');
INSERT INTO `role_resource_re` VALUES ('3', '86', '5', '1');
INSERT INTO `role_resource_re` VALUES ('4', '88', '5', '1');
INSERT INTO `role_resource_re` VALUES ('5', '89', '5', '1');
INSERT INTO `role_resource_re` VALUES ('6', '86', '6', '1');
INSERT INTO `role_resource_re` VALUES ('7', '90', '6', '1');
INSERT INTO `role_resource_re` VALUES ('8', '91', '6', '1');

-- ----------------------------
-- Table structure for `systemuser`
-- ----------------------------
DROP TABLE IF EXISTS `systemuser`;
CREATE TABLE `systemuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `updateUserId` tinyblob,
  `age` int(11) NOT NULL,
  `deleteFlag` int(11) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `identityNo` varchar(20) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `loginName` varchar(40) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `nickName` varchar(40) DEFAULT NULL,
  `password` text,
  `pinyinRealName` varchar(40) DEFAULT NULL,
  `realName` varchar(40) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `editEnable` bit(1) NOT NULL,
  `relevanceId` varchar(255) DEFAULT NULL,
  `roleType` int(11) DEFAULT NULL,
  `systemRoleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of systemuser
-- ----------------------------
INSERT INTO `systemuser` VALUES ('1', '2017-08-14 17:35:21', null, '2017-08-14 17:35:21', null, '0', '0', '', '', '', '', 'admin', '', 'admin', 'D14DDF154A81C510BDA68F8593F88292247533685B73062E388A32A4', '', 'admin', '1', '', null, '999', null);
