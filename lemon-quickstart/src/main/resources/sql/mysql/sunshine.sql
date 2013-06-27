/*
MySQL Data Transfer
Source Host: localhost
Source Database: sunshine
Target Host: localhost
Target Database: sunshine
Date: 2013-2-20 ���� 09:43:33
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `series` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ss_article
-- ----------------------------
DROP TABLE IF EXISTS `ss_article`;
CREATE TABLE `ss_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `version` int(11) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ss_code
-- ----------------------------
DROP TABLE IF EXISTS `ss_code`;
CREATE TABLE `ss_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seq` int(10) DEFAULT NULL COMMENT '˳',
  `enable` tinyint(1) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���';

-- ----------------------------
-- Table structure for ss_code_type
-- ----------------------------
DROP TABLE IF EXISTS `ss_code_type`;
CREATE TABLE `ss_code_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '码编',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seq` int(10) DEFAULT NULL COMMENT '˳',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '˵��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�����ͱ�';

-- ----------------------------
-- Table structure for ss_department
-- ----------------------------
DROP TABLE IF EXISTS `ss_department`;
CREATE TABLE `ss_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'UUID',
  `name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `pid` int(10) DEFAULT NULL COMMENT '上级部门ID',
  `seq` int(10) DEFAULT '0' COMMENT '同级部门顺序',
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ss_function
-- ----------------------------
DROP TABLE IF EXISTS `ss_function`;
CREATE TABLE `ss_function` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT 'UUID',
  `code` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '功能编码',
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '功能名称',
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '功能描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ss_menu
-- ----------------------------
DROP TABLE IF EXISTS `ss_menu`;
CREATE TABLE `ss_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'UUID',
  `pid` int(4) NOT NULL COMMENT '上级菜单',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单链接',
  `target` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单链接所在框架名',
  `relative` tinyint(1) DEFAULT NULL COMMENT '是否相对路径，0－否，1－是。',
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单图标路径',
  `seq` int(10) unsigned zerofill DEFAULT '0000000000' COMMENT '同级菜单顺序号',
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否启用，0－否，1－是。',
  `visible` tinyint(1) DEFAULT NULL COMMENT '是否可见，0－否，1－是。',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ss_role
-- ----------------------------
DROP TABLE IF EXISTS `ss_role`;
CREATE TABLE `ss_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'UUID',
  `code` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色编码',
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ss_role_res
-- ----------------------------
DROP TABLE IF EXISTS `ss_role_res`;
CREATE TABLE `ss_role_res` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'UUID',
  `role_id` int(10) DEFAULT NULL COMMENT '角色ID',
  `res_type` int(1) DEFAULT NULL COMMENT '资源类型，1－菜单，2－功能。',
  `res_id` int(10) DEFAULT NULL COMMENT '资源ID，两种：菜单ID或功能ID。',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ss_role_staff
-- ----------------------------
DROP TABLE IF EXISTS `ss_role_staff`;
CREATE TABLE `ss_role_staff` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'UUID',
  `role_id` int(10) DEFAULT NULL COMMENT '角色ID',
  `staff_id` int(10) DEFAULT NULL COMMENT '员工ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ss_staff
-- ----------------------------
DROP TABLE IF EXISTS `ss_staff`;
CREATE TABLE `ss_staff` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `login_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录名',
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `year_entry` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入职年份',
  `year_separation` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职离年份',
  `dept_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属部门',
  `position_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '岗位',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别，0－女，1－男',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `education` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教育程度，学历',
  `nation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '民族',
  `marital` tinyint(1) DEFAULT NULL COMMENT '婚否，0－未婚，1－已婚。',
  `household` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '籍贯',
  `profession` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专业',
  `address` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系地址',
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号码',
  `resume` text COLLATE utf8_unicode_ci COMMENT '简历信息',
  `evaluation` text COLLATE utf8_unicode_ci COMMENT '个人自评',
  `status` tinyint(1) DEFAULT NULL COMMENT '在职状态，0－离职，1－在职',
  `create_time` datetime DEFAULT NULL COMMENT '建创时间',
  `creator` int(10) DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modificator` int(10) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ss_staff_login
-- ----------------------------
DROP TABLE IF EXISTS `ss_staff_login`;
CREATE TABLE `ss_staff_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) DEFAULT NULL COMMENT '员工ID',
  `login_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `login_ip` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录IP',
  PRIMARY KEY (`id`),
  KEY `idx_staff_lg_staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='员工登录情况表';

-- ----------------------------
-- Table structure for ss_user
-- ----------------------------
DROP TABLE IF EXISTS `ss_user`;
CREATE TABLE `ss_user` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `login_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录名 = 邮箱',
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_ip` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL COMMENT '用户有效期',
  `pre_login_ip` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上次登入ip',
  `sex` int(1) DEFAULT NULL COMMENT '性别',
  `province` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省份',
  `city` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市',
  `mobile` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `qq` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'qq',
  `company_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司名称',
  `position` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职位',
  `web_site` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '附加信息',
  `type` int(1) DEFAULT '0' COMMENT '用户类型  0不可用 1试用用户 2付费用户',
  `audit_state` varchar(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '审核状态  0不通过 1已审核',
  `audit_info` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审核信息',
  `audit_editor` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审核者',
  `audit_datetime` datetime DEFAULT NULL COMMENT '审核日期',
  `province_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省份名称',
  `city_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市名称',
  `current_login` datetime DEFAULT NULL COMMENT '前当登录时间',
  `mail_notice` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1：邮件已通知，0：邮件未通知',
  `suggest_trial` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '建议试用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `ss_article` VALUES ('1', '厦门机场检验检疫业务综合楼、综合实验楼项目', '厦门机场检验检疫业务综合楼、综合实验楼项目', null, null);
INSERT INTO `ss_article` VALUES ('2', '泉州市鹏达广场1号-2号楼及地下室项目', '泉州市鹏达广场1号-2号楼及地下室项目', null, null);
INSERT INTO `ss_article` VALUES ('3', '龙岩市第一医院门诊综合楼工程', '龙岩市第一医院门诊综合楼工程', null, null);
INSERT INTO `ss_article` VALUES ('4', '州市南安官桥明发华昌国际城', '州市南安官桥明发华昌国际城', null, null);
INSERT INTO `ss_article` VALUES ('5', '厦门永业食品有限公司厂房及配套设施项目', '厦门永业食品有限公司厂房及配套设施项目', null, null);
INSERT INTO `ss_article` VALUES ('6', 'Maine man, 74, held in deaths of 6', 'Maine man, 74, held in deaths of teenage tenants', null, null);
INSERT INTO `ss_article` VALUES ('7', 'If cut, fiscal deal will pale 2012', 'If cut, fiscal deal will pale against expectations', null, null);
INSERT INTO `ss_article` VALUES ('8', 'Netflix CEO gets pay bump after ', 'Netflix CEO gets pay bump after 2012 cut', null, null);
INSERT INTO `ss_article` VALUES ('9', '6 Best iPhone Apps of 2012', '6 Best iPhone Apps of 2012', null, null);
INSERT INTO `ss_article` VALUES ('10', 'Big plans for Mars Curiosity rover in 2012', 'Big plans for Mars Curiosity rover in 2012', null, null);
INSERT INTO `ss_code` VALUES ('1', '1', 'test', 'test', '1', '1', '1', '1');
INSERT INTO `ss_code` VALUES ('2', '2', 'ee', 'e', '2', '1', '1', '1');
INSERT INTO `ss_code_type` VALUES ('1', 'test', 'test', null, '');
INSERT INTO `ss_code_type` VALUES ('2', '2', '2', null, '');
INSERT INTO `ss_department` VALUES ('1', '部门一', '0', null, '部门一');
INSERT INTO `ss_department` VALUES ('2', '菜单二', '0', '0', '菜单二');
INSERT INTO `ss_department` VALUES ('3', '菜单112', '2', null, '菜11');
INSERT INTO `ss_department` VALUES ('5', '部门1-1', '1', null, 'ddd');
INSERT INTO `ss_function` VALUES ('5', 'funciton.add', '新增', '新增的');
INSERT INTO `ss_function` VALUES ('4', 'funciton.delete', '删除', '删除的');
INSERT INTO `ss_menu` VALUES ('1', '0', '基础信息管理', '', null, null, null, '0000000002', '1', null);
INSERT INTO `ss_menu` VALUES ('2', '0', '系统管理', '', null, null, null, '0000000050', '1', null);
INSERT INTO `ss_menu` VALUES ('4', '2', '登录情况', '/admin/staff-login.jsp', null, null, null, '0000000000', '1', null);
INSERT INTO `ss_menu` VALUES ('6', '1', '员工管理', '/admin/staff.jsp', null, null, null, '0000000001', '1', null);
INSERT INTO `ss_menu` VALUES ('7', '1', '部门管理', '/admin/department.jsp', null, null, null, '0000000002', '1', null);
INSERT INTO `ss_menu` VALUES ('8', '2', '角色管理', '/admin/role.jsp', null, null, null, '0000000003', '1', null);
INSERT INTO `ss_menu` VALUES ('9', '2', '菜单管理', '/admin/menu.jsp', null, null, null, '0000000004', '1', null);
INSERT INTO `ss_menu` VALUES ('10', '2', '功能管理', '/admin/function.jsp', null, null, null, '0000000005', '1', null);
INSERT INTO `ss_menu` VALUES ('11', '2', '码表管理', '/admin/code.jsp', null, null, null, '0000000006', '1', null);
INSERT INTO `ss_menu` VALUES ('12', '2', '用户授权', '/admin/role-staff.jsp', null, null, null, '0000000001', '1', null);
INSERT INTO `ss_role` VALUES ('1', 'ROLE_ADMIN', '超级管理员', '超级管理员');
INSERT INTO `ss_role` VALUES ('3', 'ROLE_USER', '普通用户', '普通用户');
INSERT INTO `ss_role` VALUES ('4', 'ROLE_TEST', '测试', '测试');
INSERT INTO `ss_role_res` VALUES ('80', '1', '1', '4');
INSERT INTO `ss_role_res` VALUES ('79', '1', '1', '2');
INSERT INTO `ss_role_res` VALUES ('78', '1', '1', '7');
INSERT INTO `ss_role_res` VALUES ('77', '1', '1', '6');
INSERT INTO `ss_role_res` VALUES ('76', '1', '1', '1');
INSERT INTO `ss_role_res` VALUES ('81', '1', '1', '8');
INSERT INTO `ss_role_res` VALUES ('82', '1', '1', '9');
INSERT INTO `ss_role_res` VALUES ('83', '1', '1', '10');
INSERT INTO `ss_role_res` VALUES ('84', '1', '1', '11');
INSERT INTO `ss_role_res` VALUES ('85', '1', '1', '12');
INSERT INTO `ss_role_res` VALUES ('86', '3', '1', '1');
INSERT INTO `ss_role_res` VALUES ('87', '3', '1', '6');
INSERT INTO `ss_role_res` VALUES ('88', '3', '1', '7');
INSERT INTO `ss_role_staff` VALUES ('9', '1', '4');
INSERT INTO `ss_role_staff` VALUES ('10', '2', '4');
INSERT INTO `ss_role_staff` VALUES ('11', '4', '4');
INSERT INTO `ss_role_staff` VALUES ('20', '3', '2');
INSERT INTO `ss_role_staff` VALUES ('19', '1', '1');
INSERT INTO `ss_staff` VALUES ('2', '普通用户', 'user', '21232f297a57a5a743894a0e4a801fc3', '2013', null, '5', '软件开发', '1', '2012-01-01', '15985994163', '小学', '汉族', '1', '福建', '计算机类', '福建泉州', 'linchanghuang@gmail.com', '1222222222222', '<p>\r\n	ccdd<img alt=\"\" src=\"/static/upload/editor/image/2013-02/1360388403125.png\" style=\"width: 181px; height: 400px;\" /></p>', 'a', '1', null, null, null, null);
INSERT INTO `ss_staff` VALUES ('1', '超级管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2012', null, '0', '软件开发', '1', '2012-04-24', '15985994163', '小学', '汉族', '0', '福建', '计算机类', '福建泉州', 'linchanghuang@gmail.com', '1222222222222', '<p>\r\n	ccddaa</p>', 'b', '1', null, null, null, null);
INSERT INTO `ss_user` VALUES ('1', '泉州市南安官桥明发华昌国际城', 'xiao lin', '21232f297a57a5a743894a0e4a801fc3', null, null, null, null, null, null, null, null, null, null, '200000', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ss_user` VALUES ('2', '泉州市海联创业园营运中心B-2地', 'xiao zhang', '21232f297a57a5a743894a0e4a801fc3', null, null, null, null, null, null, null, null, null, null, '30000', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
