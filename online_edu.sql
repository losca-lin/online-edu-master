/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : online_edu

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 23/05/2023 01:06:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '菜单权限表',
  `pid` int(10) UNSIGNED NOT NULL COMMENT '父级id',
  `type` tinyint(3) UNSIGNED NOT NULL COMMENT '菜单类型，0顶部菜单、1聚合菜单、2页面菜单、3接口',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由名称或接口名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单路径(以http开头时，视为打开外部链接) 或 请求接口的地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单组件，只有叶子菜单才可配置',
  `meta` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单的route.meta配置项，json格式',
  `admin` tinyint(3) UNSIGNED NOT NULL COMMENT '0默认，1只有超级管理员才能使用',
  `enable` tinyint(3) UNSIGNED NOT NULL COMMENT '是否启用，0否1是',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '角色id',
  `name` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `permission_id` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色具有的权限ID串',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用，0否1是',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES (1, '默认管理员', '', 1, '2021-01-18 19:30:48', '2021-01-18 19:30:48');
INSERT INTO `acl_role` VALUES (2, '普通管理员', '', 1, '2021-05-02 22:03:57', '2021-05-02 22:03:57');
INSERT INTO `acl_role` VALUES (3, '课程管理员', '', 1, '2021-05-02 22:04:08', '2021-05-02 22:04:00');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `username` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户签名',
  `roleId` int(10) UNSIGNED NOT NULL COMMENT '角色id',
  `enable` tinyint(3) UNSIGNED NOT NULL COMMENT '是否启用，0否1是',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES (1, 'admin1', 'ea48576f30be1669971699c09ad05c94', '默认管理员', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230330-02-1211a83bc3c047e2abe718a2dfecc139.png', '默认管理员，默认启用', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 1, 1, '2023-03-30 20:03:59', '2021-01-18 19:40:03');
INSERT INTO `acl_user` VALUES (2, 'tch1', 'ea48576f30be1669971699c09ad05c94', '管理员1', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230330-03-876fd5cd8e1d40749904835d4fd513d8.jpeg', '管理员1号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2023-03-30 20:26:08', '2021-05-01 23:53:25');
INSERT INTO `acl_user` VALUES (3, 'tch2', 'ea48576f30be1669971699c09ad05c94', '管理员2', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230330-03-db9ea8fbf2a044a489643223f9e2440a.jpeg', '管理员2号号号号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2023-03-30 20:27:55', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (4, 'tch3', 'ea48576f30be1669971699c09ad05c94', '课程管理员3', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '课程管理员3号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 3, 1, '2023-05-11 12:08:50', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (5, 'tch4', 'ea48576f30be1669971699c09ad05c94', '管理员4', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员4号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:37', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (6, 'tch5', 'ea48576f30be1669971699c09ad05c94', '管理员5', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员5号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 0, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (7, 'tch6', 'ea48576f30be1669971699c09ad05c94', '管理员6', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员6号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (8, 'tch7', 'ea48576f30be1669971699c09ad05c94', '管理员7', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员7号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 0, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (11, 'tch10', 'ea48576f30be1669971699c09ad05c94', '管理员10', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员10号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (12, 'tch11', 'ea48576f30be1669971699c09ad05c94', '管理员11', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员11号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (13, 'tch12', 'ea48576f30be1669971699c09ad05c94', '管理员12', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员12号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 0, '2022-02-20 18:26:39', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (14, 'tch13', 'ea48576f30be1669971699c09ad05c94', '管理员13', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员13号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:39', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (15, 'tch14', 'ea48576f30be1669971699c09ad05c94', '管理员14', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员14号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:39', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (16, 'tch15', 'ea48576f30be1669971699c09ad05c94', '管理员15', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员15号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 0, '2022-02-20 18:26:39', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (17, 'tch16', 'ea48576f30be1669971699c09ad05c94', '管理员16', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员16号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:39', '2021-05-01 23:55:22');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '章节ID',
  `course_id` int(10) UNSIGNED NOT NULL COMMENT '课程ID',
  `title` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '章节名称',
  `sort` int(11) NULL DEFAULT 0 COMMENT '显示排序',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程章节表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES (70, 28, '11', 0, '2023-04-23 17:21:12', '2023-04-23 17:21:12');
INSERT INTO `edu_chapter` VALUES (71, 26, '算法基础', 0, '2023-04-22 15:40:43', '2023-04-22 15:40:43');
INSERT INTO `edu_chapter` VALUES (72, 38, '11', 0, '2023-05-10 22:24:36', '2023-05-10 22:24:36');

-- ----------------------------
-- Table structure for edu_chapter_tmp
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter_tmp`;
CREATE TABLE `edu_chapter_tmp`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '主键',
  `oid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '原章节ID',
  `course_id` int(10) UNSIGNED NOT NULL COMMENT '课程ID',
  `title` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '章节名称',
  `sort` int(11) NULL DEFAULT 0 COMMENT '显示排序',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_id`(`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程章节临时表（用于存放二次修改的数据）' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_chapter_tmp
-- ----------------------------
INSERT INTO `edu_chapter_tmp` VALUES (1641425881523339266, 0, 25, 'java历史', 0, '2023-03-30 21:03:21', '2023-03-30 21:03:21');
INSERT INTO `edu_chapter_tmp` VALUES (1654367532973678594, 0, 31, '11', 0, '2023-05-05 14:08:51', '2023-05-05 14:08:51');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '评论ID',
  `course_id` int(10) UNSIGNED NOT NULL COMMENT '课程id',
  `teacher_id` int(10) UNSIGNED NOT NULL COMMENT '讲师id',
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `content` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '评论内容',
  `mark` double UNSIGNED NULL DEFAULT NULL COMMENT '评分（满分5.00）',
  `status` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '评论状态 0审核中 1通过',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_member_id_course_id`(`member_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_comment
-- ----------------------------
INSERT INTO `edu_comment` VALUES (651, 25, 55, 1201, '111', 5, 1, '2023-04-23 16:45:20', '2023-04-23 16:44:55');
INSERT INTO `edu_comment` VALUES (652, 26, 56, 1201, '课程很好！', 5, 1, '2023-04-23 19:48:44', '2023-04-23 19:47:06');
INSERT INTO `edu_comment` VALUES (653, 28, 56, 1204, '11', 5, 1, '2023-05-05 14:11:27', '2023-05-05 14:11:14');
INSERT INTO `edu_comment` VALUES (654, 36, 58, 1201, '课程很好！', 5, 1, '2023-05-05 15:02:37', '2023-05-05 15:01:45');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '课程ID',
  `teacher_id` int(10) UNSIGNED NOT NULL COMMENT '课程讲师ID',
  `subject_id` int(10) UNSIGNED NOT NULL COMMENT '课程科目分类ID',
  `title` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '课程标题',
  `price` double(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NOT NULL COMMENT '总课时',
  `cover` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '课程封面图片路径',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程描述',
  `buy_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '销售数量',
  `view_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '浏览数量',
  `sort` int(11) NULL DEFAULT 0 COMMENT '显示排序',
  `enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上架下架，0下架 1上架',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '课程状态，草稿 审核 发表',
  `remarks` varchar(511) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES (26, 56, 56, 'Java进阶', 5.00, 1, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230427-Java进阶-137c9d98936745a3a9f28c94192d3aab.png', '<p>&nbsp; &nbsp; &nbsp; &nbsp;本课程主要讲授Java核心技术进阶部分，以Java多方位应用实践为主。课程主要内容包括：构建工具Maven，单元测试工具JUnit，高级文件处理、多线程和并发、网络、邮件、数据库、RMI、Java和其他语言交互等。本课程注重Java应用讲解，并通过大量例子程序进行辅助理解。学生学习本课程后，可以编写实用的Java程序，有能力编写涵盖大部分软件功能需求的程序。</p><p><br/></p><p><img src=\"https://ooss0001.oss-cn-beijing.aliyuncs.com/20230427-轮播图4-ca3c71062be540cfa92877214a953b56.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1, 0, 0, 1, 1, '', '2023-05-14 22:07:42', '2023-04-22 15:40:14');
INSERT INTO `edu_course` VALUES (27, 56, 56, '11', 0.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230423-01-3596e7741d4c4f08a4e9e6e29322c977.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-04-23 18:11:27', '2023-04-23 17:20:10');
INSERT INTO `edu_course` VALUES (28, 56, 56, '12', 2.00, 1, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230423-01-ac6a824929424862b8cb242a63a4b36b.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-05-14 23:27:58', '2023-04-23 17:21:07');
INSERT INTO `edu_course` VALUES (29, 56, 56, 'Java入门', 0.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230428-Java入门-8a3087e44b394b79afb2c3adc09c0ff4.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-04-28 14:00:08', '2023-04-27 16:23:37');
INSERT INTO `edu_course` VALUES (30, 56, 65, '高中数学', 2.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230427-高中数学-8cf6e6d65404465b85a64e376a9eb0ed.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-04-27 17:03:29', '2023-04-27 16:50:22');
INSERT INTO `edu_course` VALUES (31, 56, 66, '高中物理', 0.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230427-高中物理-8446755da08d42dcbbea0c650812f516.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-05-23 00:00:14', '2023-04-27 17:02:40');
INSERT INTO `edu_course` VALUES (32, 56, 62, '四六级', 5.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230428-四六级-32fd4d3e4882442aaf36d4bd24b44382.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-04-28 14:00:10', '2023-04-27 17:03:19');
INSERT INTO `edu_course` VALUES (33, 56, 69, '初中数学', 0.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230428-avatar-79b14050f8a94d2788bab9a9fc092db7.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-04-28 13:37:40', '2023-04-28 13:37:21');
INSERT INTO `edu_course` VALUES (34, 56, 60, '计算机技术', 0.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230428-轮播图4-89e398caf41a47cf9bdbc3384768ac71.png', '<p>11</p>', 0, 0, 0, 1, 2, '11', '2023-04-28 13:59:06', '2023-04-28 13:58:46');
INSERT INTO `edu_course` VALUES (35, 56, 63, '33', 1.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230505-avatar-3159f41fee2a439591cf8a92ce75f99d.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-05-05 14:09:32', '2023-05-05 14:07:58');
INSERT INTO `edu_course` VALUES (36, 58, 56, '软件工程', 0.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230505-01-fab3f9eefd93479a9048695dec6a04a7.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-05-05 14:59:11', '2023-05-05 14:58:54');
INSERT INTO `edu_course` VALUES (37, 58, 67, '33', 0.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230510-03-a792c632a82741e996188c75cc9f83b7.jpeg', '<p>11</p>', 0, 0, 0, 1, 2, '11', '2023-05-10 19:30:43', '2023-05-10 19:30:24');
INSERT INTO `edu_course` VALUES (38, 58, 71, 'xx', 0.00, 0, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230510-avatar-ddc19e7d160a47c0b446811924235da6.png', '<p>11</p>', 0, 0, 0, 1, 1, '', '2023-05-23 00:00:11', '2023-05-10 22:23:43');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '课程类别ID',
  `title` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '父ID',
  `sort` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '排序字段',
  `enable` tinyint(3) UNSIGNED NOT NULL COMMENT '是否启用，0否1是',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程科目分类表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES (55, 'IT·互联网', 0, 0, 1, '2023-03-30 20:47:40', '2023-03-30 20:47:40');
INSERT INTO `edu_subject` VALUES (56, 'java', 55, 1, 1, '2023-03-30 20:47:51', '2023-03-30 20:47:51');
INSERT INTO `edu_subject` VALUES (60, 'python', 55, 1, 1, '2023-04-19 09:19:22', '2023-04-19 09:19:22');
INSERT INTO `edu_subject` VALUES (61, '英语四六级', 0, 0, 1, '2023-05-12 14:50:08', '2023-04-23 19:50:32');
INSERT INTO `edu_subject` VALUES (62, 'CET-4', 61, 0, 1, '2023-04-23 19:50:45', '2023-04-23 19:50:45');
INSERT INTO `edu_subject` VALUES (63, 'CET-6', 61, 0, 1, '2023-04-23 19:50:55', '2023-04-23 19:50:55');
INSERT INTO `edu_subject` VALUES (64, '高中', 0, 0, 1, '2023-04-23 19:51:34', '2023-04-23 19:51:34');
INSERT INTO `edu_subject` VALUES (65, '数学', 64, 0, 1, '2023-04-23 19:51:43', '2023-04-23 19:51:43');
INSERT INTO `edu_subject` VALUES (66, '物理', 64, 0, 1, '2023-04-23 19:51:50', '2023-04-23 19:51:50');
INSERT INTO `edu_subject` VALUES (67, '化学', 64, 0, 1, '2023-04-23 19:51:56', '2023-04-23 19:51:56');
INSERT INTO `edu_subject` VALUES (68, '初中', 0, 0, 1, '2023-04-23 19:52:06', '2023-04-23 19:52:06');
INSERT INTO `edu_subject` VALUES (69, '数学', 68, 0, 1, '2023-04-23 19:52:15', '2023-04-23 19:52:15');
INSERT INTO `edu_subject` VALUES (70, '语文', 68, 0, 1, '2023-04-23 19:52:22', '2023-04-23 19:52:22');
INSERT INTO `edu_subject` VALUES (71, '英语', 68, 0, 1, '2023-04-23 19:52:28', '2023-04-23 19:52:28');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '讲师ID',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱地址',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '讲师姓名',
  `intro` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `avatar` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '讲师头像',
  `resume` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '讲师简历链接',
  `division` tinyint(4) NULL DEFAULT 80 COMMENT '分成比例，0-100',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `enable` tinyint(3) UNSIGNED NOT NULL COMMENT '是否启用，0否1是',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '讲师状态：审核通过；审核不通过；待审核',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '讲师表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES (56, '15660174409', '2926339294@qq.com', 'ea48576f30be1669971699c09ad05c94', '李老师', '曾担任阿里大文娱事业部Java高级后端工程师，长期扎根于一线编码开发、系统架构设计与项目管理，拥有多年开发与管理经验，目前是一名互联网行业的创业者； 出版的书籍：《分布式中间件技术实战（Java版）》、《Spring Boot企业级项目开发-入门到精通》 ，51CTO学院、CSDN学院、网易云课堂等教育平台知名讲师，教授学生上万人，拥有大量原创博客，博客访问量达百万人次； 追求技术，热爱分享，相信技术改变生活，技术成就梦想，一直在不断的学习和积累新的知识，秉承修罗之道，花名“阿修罗”（修罗debug）。 熟悉行业Java领域流行技术，包括Spring、SpringMVC、Hibernate、Mybatis、SpringBoot、SpringCloud等核心框架，拥有缓存组件Redis、消息中间件RabbitMQ、服务调度框架Dubbo、服务调度协调管理中心Zookeeper、分布式任务调度框架Elastic-Job、全文搜索引擎Elastic-Search等三方框架、有多年实战经验。', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230419-03-b1b6746518304f078680c8c673bfc8be.jpeg', '', 52, 0, 1, 0, '2023-05-11 12:06:23', '2023-04-19 09:07:17');
INSERT INTO `edu_teacher` VALUES (58, '13782185281', '2926339294@qq.com', 'aeb8f189a441f4511962055e3c30cd2c', '王老师', '11', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230505-03-36c12f5cd2cf4456822a64d2da3766c2.jpeg', '', 0, 0, 1, 0, '2023-05-05 14:24:56', '2023-05-05 14:24:56');
INSERT INTO `edu_teacher` VALUES (59, '13162458104', '2926339294@qq.com', 'aeb8f189a441f4511962055e3c30cd2c', '壹贰叁', '11', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230511-03-884d4cc082494af8a354d454d5cbaf14.jpeg', '', 50, 0, 1, 0, '2023-05-11 11:52:03', '2023-05-11 11:50:56');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '视频ID',
  `course_id` int(10) UNSIGNED NOT NULL COMMENT '课程ID',
  `chapter_id` int(10) UNSIGNED NOT NULL COMMENT '章节ID',
  `title` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '视频显示名称',
  `video_id` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '云端视频资源',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '播放次数',
  `free` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '是否可以试听：0免费 1收费',
  `duration` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '视频时长（秒）',
  `size` bigint(20) UNSIGNED NOT NULL COMMENT '视频源文件大小（字节）',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程视频' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES (257, 28, 70, 'Java的历史', '080b2f60e1be71ed80146723b78e0102', 0, 0, 0, '00:00', 230715, '2023-04-23 18:05:17', '2023-04-23 18:05:17');
INSERT INTO `edu_video` VALUES (258, 26, 71, 'Java的历史', 'd8202ba0e1c471ed80470675b3ed0102', 0, 0, 0, '00:00', 230715, '2023-04-23 18:54:03', '2023-04-23 18:54:03');

-- ----------------------------
-- Table structure for edu_video_tmp
-- ----------------------------
DROP TABLE IF EXISTS `edu_video_tmp`;
CREATE TABLE `edu_video_tmp`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '主键(视频ID)',
  `oid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '原视频ID',
  `course_id` int(10) UNSIGNED NOT NULL COMMENT '课程ID',
  `chapter_id` bigint(20) UNSIGNED NOT NULL COMMENT '章节ID',
  `title` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '视频显示名称',
  `video_id` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '云端视频资源',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '播放次数',
  `free` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '是否可以试听：0免费 1收费',
  `duration` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '视频时长（秒）',
  `size` bigint(20) UNSIGNED NOT NULL COMMENT '视频源文件大小（字节）',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE,
  INDEX `idx_id`(`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程视频表（用于存放二次修改的数据）' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_video_tmp
-- ----------------------------
INSERT INTO `edu_video_tmp` VALUES (1654367655963254786, 0, 31, 1654367532973678594, 'Java的历史', '57a48200eb0b71edb8246733a78e0102', 0, 0, 0, '00:00', 230715, '2023-05-05 14:09:21', '2023-05-05 14:09:21');

-- ----------------------------
-- Table structure for hm_banner
-- ----------------------------
DROP TABLE IF EXISTS `hm_banner`;
CREATE TABLE `hm_banner`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `title` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  `image_url` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `enable` tinyint(3) UNSIGNED NOT NULL COMMENT '是否启用，0否1是',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页banner表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hm_banner
-- ----------------------------
INSERT INTO `hm_banner` VALUES (11, '轮播图2', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230427-轮播图2-83e5dd74f1244b988c8c83b4c1af37ed.png', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/%E8%BD%AE%E6%92%AD%E5%9B%BE2.png', 1, 1, '2023-04-27 16:00:14', '2023-04-27 15:58:01');
INSERT INTO `hm_banner` VALUES (12, '轮播图3', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230427-轮播图3-7b1869e3c6144ff7b716b80f8a9fc527.png', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/%E8%BD%AE%E6%92%AD%E5%9B%BE3.png', 0, 1, '2023-05-22 23:57:57', '2023-04-27 15:58:54');
INSERT INTO `hm_banner` VALUES (13, '轮播图1', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230427-轮播图1-c4ccd0d516ab431da7776effeba7ede7.png', 'https://ooss0001.oss-cn-beijing.aliyuncs.com/%E8%BD%AE%E6%92%AD%E5%9B%BE1.png', 0, 1, '2023-04-27 16:01:55', '2023-04-27 15:59:28');

-- ----------------------------
-- Table structure for rel_course_member
-- ----------------------------
DROP TABLE IF EXISTS `rel_course_member`;
CREATE TABLE `rel_course_member`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` int(10) UNSIGNED NOT NULL COMMENT '课程Id',
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '学员Id',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_course`(`member_id`, `course_id`) USING BTREE COMMENT '联合索引(member_id, course_id)'
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程订阅-学员关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rel_course_member
-- ----------------------------
INSERT INTO `rel_course_member` VALUES (13, 35, 1201, '2023-05-15 21:30:28', '2023-05-15 21:30:28');
INSERT INTO `rel_course_member` VALUES (14, 26, 1201, '2023-05-15 21:32:05', '2023-05-15 21:32:05');
INSERT INTO `rel_course_member` VALUES (15, 28, 1201, '2023-05-15 21:32:53', '2023-05-15 21:32:53');

-- ----------------------------
-- Table structure for stat_daily
-- ----------------------------
DROP TABLE IF EXISTS `stat_daily`;
CREATE TABLE `stat_daily`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `date` datetime NOT NULL COMMENT '统计日期',
  `visit_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '访客数量',
  `register_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '注册人数',
  `login_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '活跃人数',
  `video_view_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '视频播放数',
  `course_buy_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '购买数量',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stat_daily
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '消息id',
  `from_id` int(10) UNSIGNED NOT NULL COMMENT '发送者Id',
  `from_role` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发送者角色(管理员、讲师...)',
  `to_id` int(10) UNSIGNED NOT NULL COMMENT '接受者id',
  `to_role` tinyint(3) UNSIGNED NOT NULL COMMENT '接受者角色(教师、学员...)',
  `title` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消息标题',
  `content` varchar(511) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `has_read` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '是否已读(0未读 1已读)',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_to_id`(`to_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_message
-- ----------------------------
INSERT INTO `sys_message` VALUES (21, 3, 1, 55, 3, '', '恭喜！您的课程《李某人》已通过审核上架！', 0, '2023-03-30 20:50:39', '2023-03-30 20:50:39');
INSERT INTO `sys_message` VALUES (22, 3, 1, 55, 3, '', '恭喜！您的课程《李某人》已通过审核上架！', 0, '2023-03-30 20:51:24', '2023-03-30 20:51:24');
INSERT INTO `sys_message` VALUES (23, 1, 1, 56, 3, '', '恭喜！您的课程《Java进阶》已通过审核上架！', 1, '2023-04-22 16:10:03', '2023-04-22 15:41:08');
INSERT INTO `sys_message` VALUES (24, 1, 1, 56, 3, '', '恭喜！您的课程《11》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-23 18:11:28');
INSERT INTO `sys_message` VALUES (25, 1, 1, 56, 3, '', '恭喜！您的课程《12》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-23 18:11:31');
INSERT INTO `sys_message` VALUES (26, 1, 1, 56, 3, '', '恭喜！您的课程《Java进阶》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-23 18:57:12');
INSERT INTO `sys_message` VALUES (27, 1, 1, 56, 3, '', '恭喜！您的课程《Java进阶》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-27 16:05:06');
INSERT INTO `sys_message` VALUES (28, 1, 1, 56, 3, '', '恭喜！您的课程《Java进阶》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-27 16:20:30');
INSERT INTO `sys_message` VALUES (29, 1, 1, 56, 3, '', '恭喜！您的课程《Java进阶》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-27 16:22:10');
INSERT INTO `sys_message` VALUES (30, 1, 1, 56, 3, '', '恭喜！您的课程《Java进阶》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-27 16:22:48');
INSERT INTO `sys_message` VALUES (31, 1, 1, 56, 3, '', '恭喜！您的课程《Java入门》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-27 16:23:48');
INSERT INTO `sys_message` VALUES (32, 1, 1, 56, 3, '', '恭喜！您的课程《高中数学》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-27 17:03:30');
INSERT INTO `sys_message` VALUES (33, 1, 1, 56, 3, '', '恭喜！您的课程《高中物理》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-27 17:03:31');
INSERT INTO `sys_message` VALUES (34, 1, 1, 56, 3, '', '恭喜！您的课程《四六级》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-27 17:03:33');
INSERT INTO `sys_message` VALUES (35, 1, 1, 56, 3, '', '恭喜！您的课程《初中数学》已通过审核上架！', 1, '2023-04-28 13:57:55', '2023-04-28 13:37:41');
INSERT INTO `sys_message` VALUES (36, 1, 1, 56, 3, '', '抱歉！您的课程《计算机技术》未通过审核！详情请检查备注！', 0, '2023-04-28 13:59:06', '2023-04-28 13:59:06');
INSERT INTO `sys_message` VALUES (37, 1, 1, 56, 3, '', '恭喜！您的课程《Java入门》已通过审核上架！', 0, '2023-04-28 14:00:08', '2023-04-28 14:00:08');
INSERT INTO `sys_message` VALUES (38, 1, 1, 56, 3, '', '恭喜！您的课程《四六级》已通过审核上架！', 0, '2023-04-28 14:00:11', '2023-04-28 14:00:11');
INSERT INTO `sys_message` VALUES (39, 1, 1, 56, 3, '', '恭喜！您的课程《33》已通过审核上架！', 0, '2023-05-05 14:09:33', '2023-05-05 14:09:33');
INSERT INTO `sys_message` VALUES (40, 2, 1, 58, 3, '', '恭喜！您的课程《软件工程》已通过审核上架！', 1, '2023-05-10 19:30:50', '2023-05-05 14:59:12');
INSERT INTO `sys_message` VALUES (41, 2, 1, 58, 3, '', '抱歉！您的课程《33》未通过审核！详情请检查备注！', 1, '2023-05-10 19:30:50', '2023-05-10 19:30:44');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号(datetime+unsigned int)',
  `course_id` int(10) UNSIGNED NOT NULL COMMENT '课程id',
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `total_fee` double(10, 2) NULL DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '支付类型（0 未支付 1：微信 2：支付宝）',
  `transaction_num` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '交易流水号',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付完成时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_member_id_course_id`(`member_id`, `course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (47, '202305152130051', 35, 1201, 1.00, 2, '2023051522001404290502007017', '2023-05-15 21:30:28', '2023-05-15 21:30:06', '2023-05-15 21:30:06');
INSERT INTO `t_order` VALUES (48, '202305152131231', 26, 1201, 5.00, 2, '2023051522001404290502007220', '2023-05-15 21:32:05', '2023-05-15 21:31:23', '2023-05-15 21:31:23');
INSERT INTO `t_order` VALUES (49, '202305152132371', 28, 1201, 2.00, 2, '2023051522001404290502007117', '2023-05-15 21:32:53', '2023-05-15 21:32:38', '2023-05-15 21:32:38');
INSERT INTO `t_order` VALUES (50, '202305230042231', 32, 1201, 5.00, 0, '', NULL, '2023-05-23 00:42:24', '2023-05-23 00:42:24');

-- ----------------------------
-- Table structure for uctr_member
-- ----------------------------
DROP TABLE IF EXISTS `uctr_member`;
CREATE TABLE `uctr_member`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱地址',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `sign` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户签名',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用，0否1是',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`mobile`) USING BTREE,
  UNIQUE INDEX `uk_nickname`(`nickname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of uctr_member
-- ----------------------------
INSERT INTO `uctr_member` VALUES (1201, '15660174409', '2926339294@qq.com', 'ea48576f30be1669971699c09ad05c94', '南栀', 1, 6, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230428-01-1391df303423485797936e263cda6ad6.png', '11', 1, '2023-05-10 21:22:07', '2023-04-21 20:12:18');
INSERT INTO `uctr_member` VALUES (1203, '13192052005', '2499618293@qq.com', 'ea48576f30be1669971699c09ad05c94', 'hah', 1, 6, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230330-02-052eb06de5004f4688d52baaee7c7c08.png', 'hah', 1, '2023-04-28 14:10:45', '2023-03-30 20:22:06');
INSERT INTO `uctr_member` VALUES (1204, '13598206748', '', 'ea48576f30be1669971699c09ad05c94', '13598206748', 2, 10, 'https://ooss0001.oss-cn-beijing.aliyuncs.com/20230428-avatar-be3caa384e38488bb6885508f54786ea.png', '', 1, '2023-04-28 14:09:35', '2023-04-28 14:02:38');
INSERT INTO `uctr_member` VALUES (1205, '13682159950', '', 'ea48576f30be1669971699c09ad05c94', '13682159950', 0, 0, '', '', 1, '2023-05-11 13:46:14', '2023-05-11 13:46:14');

SET FOREIGN_KEY_CHECKS = 1;
