/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : 127.0.0.1:3306
Source Database       : liujilu

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-07-31 03:04:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(10) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(15) DEFAULT NULL COMMENT '昵称',
  `email` varchar(15) DEFAULT NULL COMMENT '邮箱',
  `number` varchar(15) DEFAULT NULL COMMENT 'Q号码',
  `password` varchar(25) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(11) DEFAULT NULL COMMENT '状态：0 锁定、 1 正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '名字', '昵称', '158@qq.com', '158464', '密文密码', '2017-07-30 02:10:25', '2017-07-31 02:10:32', '1');
INSERT INTO `sys_user` VALUES ('2', '测试', '测试昵称', '154@qq.com', '456', '测试密码', '2017-07-31 02:26:51', '2017-07-31 02:26:49', '1');
