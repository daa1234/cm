/*
Navicat MySQL Data Transfer

Source Server         : 测试环境
Source Server Version : 50614
Source Host           : 121.46.0.227:31211
Source Database       : oscloud_test

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-04-24 17:28:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for baby91_systemuser
-- ----------------------------
DROP TABLE IF EXISTS `baby91_systemuser`;
CREATE TABLE `baby91_systemuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `systemRoleId` int(11) DEFAULT NULL,
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
  `roleType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of baby91_systemuser
-- ----------------------------
INSERT INTO `baby91_systemuser` VALUES ('1', '2015-05-11 13:35:46', '2016-02-22 15:24:02', null, '0', '0', '', null, null, null, 'admin', '136526227730', '超管', '456D093973A2A87E03E79D8E67C3A2F1DB54A5370327198F4808F8C9', 'chaojiguanliyuan', '超级管理员', '1', '999');
