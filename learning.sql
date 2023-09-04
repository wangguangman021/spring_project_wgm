/*
 Navicat Premium Data Transfer

 Source Server         : localhost-2
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : learning

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 09/06/2022 23:52:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adv
-- ----------------------------
DROP TABLE IF EXISTS `adv`;
CREATE TABLE `adv` (
  `id` bigint unsigned NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `adv_title` varchar(255) NOT NULL COMMENT '广告标题',
  `adv_img` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `adv_url` varchar(255) NOT NULL COMMENT '广告链接',
  `adv_target` varchar(255) NOT NULL DEFAULT '' COMMENT '广告跳转方式',
  `adv_location` tinyint NOT NULL DEFAULT '1' COMMENT '广告位置(1首页轮播)',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `plat_show` tinyint NOT NULL DEFAULT '0' COMMENT '位置(0电脑端，1微信端)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='广告信息';

-- ----------------------------
-- Records of adv
-- ----------------------------
BEGIN;
INSERT INTO `adv` VALUES (1521714680412786690, '2022-05-04 12:53:46', '2022-05-04 12:53:46', 1, 1, '广告1', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/56864006b32b45dd85f9e922ee631aed.png', 'www,baidu.com', '_blank', 1, '2019-05-02 16:00:00', '2024-05-30 16:00:00', 0);
INSERT INTO `adv` VALUES (1521714802773217282, '2022-05-04 12:54:15', '2022-05-04 12:54:15', 1, 1, 'guanga2', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/402050c441114006bf913a1032ef5349.png', 'www.baidu.com', '_blank', 1, '2019-05-02 16:00:00', '2024-05-30 16:00:00', 0);
INSERT INTO `adv` VALUES (1521714861623496706, '2022-05-04 12:54:29', '2022-05-04 12:54:29', 1, 1, 'guangao3', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/22f5758b1865427984e9ed175f6d7750.png', 'www.baiodu.com', '_blank', 1, '2018-12-31 16:00:00', '2024-05-30 16:00:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `lecturer_user_no` bigint NOT NULL DEFAULT '0' COMMENT '讲师用户编码',
  `category_id1` bigint DEFAULT '0' COMMENT '一级分类ID',
  `category_id2` bigint DEFAULT '0' COMMENT '二级分类ID',
  `category_id3` bigint DEFAULT '0' COMMENT '三级分类ID',
  `course_name` varchar(255) NOT NULL DEFAULT '' COMMENT '课程名称',
  `course_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '课程封面',
  `introduce_id` bigint DEFAULT '0' COMMENT '课程介绍ID',
  `is_free` tinyint NOT NULL DEFAULT '0' COMMENT '是否免费：1免费，0收费',
  `course_original` decimal(11,2) DEFAULT NULL COMMENT '原价',
  `course_discount` decimal(11,2) DEFAULT NULL COMMENT '优惠价',
  `is_putaway` tinyint NOT NULL DEFAULT '1' COMMENT '是否上架(1:上架，0:下架)',
  `course_sort` int NOT NULL DEFAULT '0' COMMENT '课程排序(前端显示使用)',
  `count_buy` int NOT NULL DEFAULT '0' COMMENT '购买人数',
  `count_study` int NOT NULL DEFAULT '0' COMMENT '学习人数',
  `period_total` int NOT NULL DEFAULT '0' COMMENT '总课时数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课程信息';

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` VALUES (1474013547238285313, '2021-12-23 21:50:09', '2021-12-23 21:50:09', 1, 1, 2018112015051635, 1473679590000975873, 1473681173518508034, 1473682058319519745, 'Java 基础', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/d000405342b74743862037533522e38b.jpeg', 1474013547192147970, 0, 9.90, 9.90, 1, 0, 8, 0, 1);
INSERT INTO `course` VALUES (1474022012811763713, '2021-12-23 22:21:14', '2021-12-23 22:21:14', 1, 1, 2018112015051635, 1473679590000975873, 1473681173518508034, 1473682085989343233, 'SpringBoot框架源码', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/c6fb40dfec50405ba55e8a67411696b9.png', 1474022012794986498, 1, 0.00, 0.00, 1, 0, 0, 0, 3);
INSERT INTO `course` VALUES (1474410936327487489, '2021-12-25 00:06:51', '2021-12-25 00:06:51', 1, 1, 2021122423403946, 1473679590000975873, 1473681424224641026, 1473681605489876994, 'Spring21天入门到精通', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/11486b3d318a471284846e73aa4020d9.png', 1474410936243601409, 1, 0.00, 0.00, 1, 0, 0, 140, 9);
INSERT INTO `course` VALUES (1492513175231270914, '2022-02-12 23:00:59', '2022-02-12 23:00:59', 1, 1, 2021122423403946, 1473679590000975873, 1473681329404010498, 0, 'Python3', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/8245a3f7a09642b9a9ec6a2ea525a029.png', 1492513175155773441, 1, 0.00, 0.00, 1, 0, 0, 37, 1);
INSERT INTO `course` VALUES (1495302197351624706, '2022-02-20 16:03:38', '2022-02-20 16:03:38', 1, 8, 2021122423403946, 1473679590000975873, 1473681424224641026, 1473681605489876994, '系统架构师高级课程', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/4c95ada641c343d2805db9ff98ac6dd8.jpeg', 1495302197250961410, 1, 0.00, 0.00, 1, 0, 0, 110, 4);
COMMIT;

-- ----------------------------
-- Table structure for course_audit
-- ----------------------------
DROP TABLE IF EXISTS `course_audit`;
CREATE TABLE `course_audit` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `audit_status` int NOT NULL DEFAULT '0' COMMENT '审核状态(0:待审核,1:审核通过,2:审核不通过)',
  `audit_opinion` varchar(1024) DEFAULT NULL COMMENT '审核意见',
  `lecturer_user_no` bigint NOT NULL DEFAULT '0' COMMENT '讲师用户编码',
  `category_id1` bigint DEFAULT '0' COMMENT '一级分类ID',
  `category_id2` bigint DEFAULT '0' COMMENT '二级分类ID',
  `category_id3` bigint DEFAULT '0' COMMENT '三级分类ID',
  `course_name` varchar(255) NOT NULL DEFAULT '' COMMENT '课程名称',
  `course_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '课程封面',
  `introduce_id` bigint DEFAULT '0' COMMENT '课程介绍ID',
  `is_free` tinyint NOT NULL DEFAULT '0' COMMENT '是否免费：1免费，0收费',
  `course_original` decimal(11,2) DEFAULT NULL COMMENT '原价',
  `course_discount` decimal(11,2) DEFAULT NULL COMMENT '优惠价',
  `is_putaway` tinyint NOT NULL DEFAULT '1' COMMENT '是否上架(1:上架，0:下架)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课程信息-审核';

-- ----------------------------
-- Records of course_audit
-- ----------------------------
BEGIN;
INSERT INTO `course_audit` VALUES (1474022012811763713, '2021-12-23 22:20:08', '2021-12-23 22:20:08', 1, 1, 1, NULL, 2018112015051635, 1473679590000975873, 1473681173518508034, 1473682085989343233, 'SpringBoot框架源码', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/c6fb40dfec50405ba55e8a67411696b9.png', 1474022012794986498, 1, 0.00, 0.00, 1);
INSERT INTO `course_audit` VALUES (1474410936327487489, '2021-12-25 00:05:35', '2021-12-25 00:05:35', 1, 1, 1, '8', 2021122423403946, 1473679590000975873, 1473681424224641026, 1473681605489876994, 'Spring21天入门到精通', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/11486b3d318a471284846e73aa4020d9.png', 1474410936243601409, 1, 0.00, 0.00, 1);
INSERT INTO `course_audit` VALUES (1492513175231270914, '2022-02-12 22:57:25', '2022-02-12 22:57:25', 1, 1, 1, '', 2021122423403946, 1473679590000975873, 1473681329404010498, 0, 'Python3', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/8245a3f7a09642b9a9ec6a2ea525a029.png', 1492513175155773441, 1, 0.00, 0.00, 1);
INSERT INTO `course_audit` VALUES (1495302197351624706, '2022-02-20 15:39:59', '2022-02-20 15:39:59', 1, 8, 1, '', 2021122423403946, 1473679590000975873, 1473681424224641026, 1473681605489876994, '系统架构师高级课程', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/4c95ada641c343d2805db9ff98ac6dd8.jpeg', 1495302197250961410, 1, 0.00, 0.00, 1);
COMMIT;

-- ----------------------------
-- Table structure for course_category
-- ----------------------------
DROP TABLE IF EXISTS `course_category`;
CREATE TABLE `course_category` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父分类ID',
  `category_type` tinyint NOT NULL DEFAULT '1' COMMENT '分类类型(1课程，2资源)',
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `floor` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '层级',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课程分类';

-- ----------------------------
-- Records of course_category
-- ----------------------------
BEGIN;
INSERT INTO `course_category` VALUES (1473679590000975873, '2021-12-22 23:39:28', '2021-12-22 23:39:28', 1, 100, 0, 1, 'IT/互联网', 1, NULL);
INSERT INTO `course_category` VALUES (1473679648939335681, '2021-12-22 23:39:42', '2021-12-22 23:39:42', 1, 1, 0, 1, '设计/创作', 1, NULL);
INSERT INTO `course_category` VALUES (1473679735593656321, '2021-12-22 23:40:03', '2021-12-22 23:40:03', 1, 1, 0, 1, '考试/考证', 1, NULL);
INSERT INTO `course_category` VALUES (1473679822445109249, '2021-12-22 23:40:23', '2021-12-22 23:40:23', 1, 1, 0, 1, '职业/职场', 1, NULL);
INSERT INTO `course_category` VALUES (1473679882801143809, '2021-12-22 23:40:38', '2021-12-22 23:40:38', 1, 1, 0, 1, '语言/留学', 1, NULL);
INSERT INTO `course_category` VALUES (1473679987407085570, '2021-12-22 23:41:03', '2021-12-22 23:41:03', 1, 1, 0, 1, '兴趣/生活', 1, NULL);
INSERT INTO `course_category` VALUES (1473680447920693249, '2021-12-22 23:42:53', '2021-12-22 23:42:53', 1, 1, 1473679987407085570, 1, '播音主持', 2, NULL);
INSERT INTO `course_category` VALUES (1473680521543311361, '2021-12-22 23:43:10', '2021-12-22 23:43:10', 1, 1, 1473679987407085570, 1, '投资理财', 2, NULL);
INSERT INTO `course_category` VALUES (1473680553013174273, '2021-12-22 23:43:18', '2021-12-22 23:43:18', 1, 1, 1473679987407085570, 1, '生活百科', 2, NULL);
INSERT INTO `course_category` VALUES (1473680608025665538, '2021-12-22 23:43:31', '2021-12-22 23:43:31', 1, 1, 1473679987407085570, 1, '人文社科', 2, NULL);
INSERT INTO `course_category` VALUES (1473680640883843073, '2021-12-22 23:43:39', '2021-12-22 23:43:39', 1, 1, 1473679987407085570, 1, '运动健康', 2, NULL);
INSERT INTO `course_category` VALUES (1473680717631217665, '2021-12-22 23:43:57', '2021-12-22 23:43:57', 1, 1, 1473679987407085570, 1, '音乐乐器', 2, NULL);
INSERT INTO `course_category` VALUES (1473680769082744834, '2021-12-22 23:44:09', '2021-12-22 23:44:09', 1, 1, 1473680717631217665, 1, '音乐基础', 3, NULL);
INSERT INTO `course_category` VALUES (1473680828344066049, '2021-12-22 23:44:23', '2021-12-22 23:44:23', 1, 1, 1473680717631217665, 1, '唱歌发声', 3, NULL);
INSERT INTO `course_category` VALUES (1473680858794713089, '2021-12-22 23:44:31', '2021-12-22 23:44:31', 1, 1, 1473680717631217665, 1, '音乐制作', 3, NULL);
INSERT INTO `course_category` VALUES (1473680901958295553, '2021-12-22 23:44:41', '2021-12-22 23:44:41', 1, 1, 1473680640883843073, 1, '减肥健身', 3, NULL);
INSERT INTO `course_category` VALUES (1473681087145205761, '2021-12-22 23:45:25', '2021-12-22 23:45:25', 1, 1, 1473679590000975873, 1, '前沿技术', 2, NULL);
INSERT INTO `course_category` VALUES (1473681145123069954, '2021-12-22 23:45:39', '2021-12-22 23:45:39', 1, 1, 1473679590000975873, 1, '互联网运营', 2, NULL);
INSERT INTO `course_category` VALUES (1473681173518508034, '2021-12-22 23:45:46', '2021-12-22 23:45:46', 1, 1, 1473679590000975873, 1, 'Java开发', 2, NULL);
INSERT INTO `course_category` VALUES (1473681213691551746, '2021-12-22 23:45:55', '2021-12-22 23:45:55', 1, 1, 1473679590000975873, 1, '互联网产品', 2, NULL);
INSERT INTO `course_category` VALUES (1473681295941853185, '2021-12-22 23:46:15', '2021-12-22 23:46:15', 1, 1, 1473679590000975873, 1, '后台开发', 2, NULL);
INSERT INTO `course_category` VALUES (1473681329404010498, '2021-12-22 23:46:23', '2021-12-22 23:46:23', 1, 1, 1473679590000975873, 1, 'Python开发', 2, NULL);
INSERT INTO `course_category` VALUES (1473681358185324545, '2021-12-22 23:46:30', '2021-12-22 23:46:30', 1, 1, 1473679590000975873, 1, '前端开发', 2, NULL);
INSERT INTO `course_category` VALUES (1473681387604172801, '2021-12-22 23:46:37', '2021-12-22 23:46:37', 1, 1, 1473679590000975873, 1, '移动开发', 2, NULL);
INSERT INTO `course_category` VALUES (1473681424224641026, '2021-12-22 23:46:45', '2021-12-22 23:46:45', 1, 1, 1473679590000975873, 1, '大数据', 2, NULL);
INSERT INTO `course_category` VALUES (1473681478230499329, '2021-12-22 23:46:58', '2021-12-22 23:46:58', 1, 1, 1473681424224641026, 1, '数据分析', 3, NULL);
INSERT INTO `course_category` VALUES (1473681528927051778, '2021-12-22 23:47:10', '2021-12-22 23:47:10', 1, 1, 1473681424224641026, 1, '大数据', 3, NULL);
INSERT INTO `course_category` VALUES (1473681558798884866, '2021-12-22 23:47:17', '2021-12-22 23:47:17', 1, 1, 1473681424224641026, 1, '机器学习', 3, NULL);
INSERT INTO `course_category` VALUES (1473681605489876994, '2021-12-22 23:47:29', '2021-12-22 23:47:29', 1, 1, 1473681424224641026, 1, '计算机视觉', 3, NULL);
INSERT INTO `course_category` VALUES (1473681639727980545, '2021-12-22 23:47:37', '2021-12-22 23:47:37', 1, 1, 1473681387604172801, 1, 'IOS', 3, NULL);
INSERT INTO `course_category` VALUES (1473681666143707137, '2021-12-22 23:47:43', '2021-12-22 23:47:43', 1, 1, 1473681387604172801, 1, '其他', 3, NULL);
INSERT INTO `course_category` VALUES (1473681695579332610, '2021-12-22 23:47:50', '2021-12-22 23:47:50', 1, 1, 1473681358185324545, 1, 'HTML5', 3, NULL);
INSERT INTO `course_category` VALUES (1473681732585676801, '2021-12-22 23:47:59', '2021-12-22 23:47:59', 1, 1, 1473681358185324545, 1, '前端基础', 3, NULL);
INSERT INTO `course_category` VALUES (1473681777347289089, '2021-12-22 23:48:10', '2021-12-22 23:48:10', 1, 1, 1473681732585676801, 1, 'HTML', 4, NULL);
INSERT INTO `course_category` VALUES (1473681798310420481, '2021-12-22 23:48:15', '2021-12-22 23:48:15', 1, 1, 1473681732585676801, 1, 'CSS', 4, NULL);
INSERT INTO `course_category` VALUES (1473681831437033474, '2021-12-22 23:48:22', '2021-12-22 23:48:22', 1, 1, 1473681695579332610, 1, 'JavaScript', 4, NULL);
INSERT INTO `course_category` VALUES (1473681855122268161, '2021-12-22 23:48:28', '2021-12-22 23:48:28', 1, 1, 1473681695579332610, 1, 'VUE', 4, NULL);
INSERT INTO `course_category` VALUES (1473681934025515010, '2021-12-22 23:48:47', '2021-12-22 23:48:47', 1, 1, 1473681295941853185, 1, 'C/C++开发', 3, NULL);
INSERT INTO `course_category` VALUES (1473681961628229633, '2021-12-22 23:48:53', '2021-12-22 23:48:53', 1, 1, 1473681295941853185, 1, 'Go', 3, NULL);
INSERT INTO `course_category` VALUES (1473681989524545538, '2021-12-22 23:49:00', '2021-12-22 23:49:00', 1, 1, 1473681295941853185, 1, 'PHP', 3, NULL);
INSERT INTO `course_category` VALUES (1473682058319519745, '2021-12-22 23:49:17', '2021-12-22 23:49:17', 1, 1, 1473681173518508034, 1, 'Java基础', 3, NULL);
INSERT INTO `course_category` VALUES (1473682085989343233, '2021-12-22 23:49:23', '2021-12-22 23:49:23', 1, 1, 1473681173518508034, 1, 'Java进阶', 3, NULL);
INSERT INTO `course_category` VALUES (1473682112094691330, '2021-12-22 23:49:29', '2021-12-22 23:49:29', 1, 1, 1473681173518508034, 1, 'Java高级', 3, NULL);
INSERT INTO `course_category` VALUES (1473682171628642305, '2021-12-22 23:49:44', '2021-12-22 23:49:44', 1, 1, 1473682058319519745, 1, 'Java语法', 4, NULL);
INSERT INTO `course_category` VALUES (1473682224619479041, '2021-12-22 23:49:56', '2021-12-22 23:49:56', 1, 1, 1473682058319519745, 1, 'Java框架', 4, NULL);
INSERT INTO `course_category` VALUES (1473682260635967489, '2021-12-22 23:50:05', '2021-12-22 23:50:05', 1, 1, 1473682085989343233, 1, '中间件', 4, NULL);
INSERT INTO `course_category` VALUES (1473682296446935042, '2021-12-22 23:50:13', '2021-12-22 23:50:13', 1, 1, 1473682112094691330, 1, '源码分析', 4, NULL);
COMMIT;

-- ----------------------------
-- Table structure for course_chapter
-- ----------------------------
DROP TABLE IF EXISTS `course_chapter`;
CREATE TABLE `course_chapter` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT '课程ID',
  `chapter_name` varchar(64) NOT NULL COMMENT '章节名称',
  `chapter_desc` varchar(255) DEFAULT NULL COMMENT '章节描述',
  `is_free` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否免费：1免费，0收费',
  `chapter_original` decimal(11,2) DEFAULT NULL COMMENT '原价',
  `chapter_discount` decimal(11,2) DEFAULT NULL COMMENT '优惠价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='章节信息';

-- ----------------------------
-- Records of course_chapter
-- ----------------------------
BEGIN;
INSERT INTO `course_chapter` VALUES (1080756594904076290, '2019-01-03 17:50:39', '2019-01-03 17:50:39', 1, 1, 1080756535567257601, '第一章', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1474013609842466818, '2021-12-23 21:50:09', '2021-12-23 21:50:09', 1, 1, 1474013547238285313, 'Java 语法', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1474022080012902401, '2021-12-23 22:21:14', '2021-12-23 22:21:14', 1, 1, 1474022012811763713, '双十二拒绝Dos，全方位搞定HashMap', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1474022111231107073, '2021-12-23 22:21:14', '2021-12-23 22:21:14', 1, 2, 1474022012811763713, '让面试官刮目相看的JVM底层原理与性能调优', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1474022146303877121, '2021-12-23 22:21:14', '2021-12-23 22:21:14', 1, 3, 1474022012811763713, '京东10W_S高并发线上接口实战', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1474410995374899201, '2021-12-25 00:06:51', '2021-12-25 00:06:51', 1, 1, 1474410936327487489, 'Spring了解', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1474411026974785538, '2021-12-25 00:06:51', '2021-12-25 00:06:51', 1, 2, 1474410936327487489, 'Spring用法', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1474411052698451969, '2021-12-25 00:06:51', '2021-12-25 00:06:51', 1, 3, 1474410936327487489, 'Spring语法', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1474411105068531714, '2021-12-25 00:06:51', '2021-12-25 00:06:51', 1, 4, 1474410936327487489, 'Spring源码', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1477922230686990337, '2022-01-03 16:39:05', '2022-01-03 16:39:05', 1, 5, 1474410936327487489, '课室5', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1492513228033363969, '2022-02-12 23:00:59', '2022-02-12 23:00:59', 1, 1, 1492513175231270914, 'python基础', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1495302254389964802, '2022-02-20 16:03:38', '2022-02-20 16:03:38', 1, 1, 1495302197351624706, '基础练习', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1495302295141822466, '2022-02-20 16:03:38', '2022-02-20 16:03:38', 1, 2, 1495302197351624706, '高级练习', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter` VALUES (1495302329438646274, '2022-02-20 16:03:38', '2022-02-20 16:03:38', 1, 3, 1495302197351624706, '在高级练习', NULL, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for course_chapter_audit
-- ----------------------------
DROP TABLE IF EXISTS `course_chapter_audit`;
CREATE TABLE `course_chapter_audit` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `audit_status` int DEFAULT NULL COMMENT '审核状态(0:待审核;1:审核通过;2:审核不通过)',
  `audit_opinion` varchar(1024) DEFAULT NULL COMMENT '审核意见',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT '课程ID',
  `chapter_name` varchar(64) NOT NULL COMMENT '章节名称',
  `chapter_desc` varchar(255) DEFAULT NULL COMMENT '章节描述',
  `is_free` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否免费：1免费，0收费',
  `chapter_original` decimal(11,2) DEFAULT NULL COMMENT '原价',
  `chapter_discount` decimal(11,2) DEFAULT NULL COMMENT '优惠价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='章节信息-审核';

-- ----------------------------
-- Records of course_chapter_audit
-- ----------------------------
BEGIN;
INSERT INTO `course_chapter_audit` VALUES (1249546933273939969, '2020-04-13 11:56:19', '2020-04-13 11:56:19', 1, 1, 0, NULL, 1085453180200448002, '演示章节1', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1249546948755116034, '2020-04-13 11:56:22', '2020-04-13 11:56:22', 1, 2, 0, NULL, 1085453180200448002, '演示章节2', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1249546969437229057, '2020-04-13 11:56:27', '2020-04-13 11:56:27', 1, 3, 0, NULL, 1085453180200448002, '演示章节3', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1474013609842466818, '2021-12-23 21:46:45', '2021-12-23 21:46:45', 1, 1, 1, NULL, 1474013547238285313, 'Java 语法', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1474022080012902401, '2021-12-23 22:20:24', '2021-12-23 22:20:24', 1, 1, 1, NULL, 1474022012811763713, '双十二拒绝Dos，全方位搞定HashMap', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1474022111231107073, '2021-12-23 22:20:31', '2021-12-23 22:20:31', 1, 2, 1, NULL, 1474022012811763713, '让面试官刮目相看的JVM底层原理与性能调优', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1474022146303877121, '2021-12-23 22:20:40', '2021-12-23 22:20:40', 1, 3, 1, NULL, 1474022012811763713, '京东10W_S高并发线上接口实战', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1474410995374899201, '2021-12-25 00:05:49', '2021-12-25 00:05:49', 1, 1, 1, NULL, 1474410936327487489, 'Spring了解', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1474411026974785538, '2021-12-25 00:05:56', '2021-12-25 00:05:56', 1, 2, 1, NULL, 1474410936327487489, 'Spring用法', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1474411052698451969, '2021-12-25 00:06:02', '2021-12-25 00:06:02', 1, 3, 1, NULL, 1474410936327487489, 'Spring语法', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1474411105068531714, '2021-12-25 00:06:15', '2021-12-25 00:06:15', 1, 4, 1, NULL, 1474410936327487489, 'Spring源码', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1477922230686990337, '2022-01-03 16:38:12', '2022-01-03 16:38:12', 1, 5, 1, NULL, 1474410936327487489, '课室5', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1492513228033363969, '2022-02-12 22:57:37', '2022-02-12 22:57:37', 1, 1, 1, NULL, 1492513175231270914, 'python基础', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1495302254389964802, '2022-02-20 15:40:13', '2022-02-20 15:40:13', 1, 1, 1, NULL, 1495302197351624706, '基础练习', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1495302295141822466, '2022-02-20 15:40:23', '2022-02-20 15:40:23', 1, 2, 1, NULL, 1495302197351624706, '高级练习', NULL, 0, NULL, NULL);
INSERT INTO `course_chapter_audit` VALUES (1495302329438646274, '2022-02-20 15:40:31', '2022-02-20 15:40:31', 1, 3, 1, NULL, 1495302197351624706, '在高级练习', NULL, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for course_chapter_period
-- ----------------------------
DROP TABLE IF EXISTS `course_chapter_period`;
CREATE TABLE `course_chapter_period` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT '课程ID',
  `chapter_id` bigint NOT NULL DEFAULT '0' COMMENT '章节ID',
  `period_name` varchar(255) NOT NULL COMMENT '课时名称',
  `period_desc` varchar(255) DEFAULT NULL COMMENT '课时描述',
  `is_free` tinyint NOT NULL DEFAULT '0' COMMENT '是否免费：1免费，0收费',
  `period_original` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `period_discount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '优惠价',
  `count_buy` int NOT NULL DEFAULT '0' COMMENT '购买人数',
  `count_study` int NOT NULL DEFAULT '0' COMMENT '学习人数',
  `is_doc` tinyint NOT NULL DEFAULT '0' COMMENT '是否存在文档(1存在，0否)',
  `doc_name` varchar(255) DEFAULT NULL COMMENT '文档名称',
  `doc_url` varchar(255) DEFAULT NULL COMMENT '文档地址',
  `is_video` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否存在视频(1存在，0否)',
  `video_no` bigint DEFAULT NULL COMMENT '视频编号',
  `video_name` varchar(255) DEFAULT NULL COMMENT '视频名称',
  `video_length` varchar(36) DEFAULT NULL COMMENT '时长',
  `video_vid` varchar(50) DEFAULT NULL COMMENT '视频VID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课时信息';

-- ----------------------------
-- Records of course_chapter_period
-- ----------------------------
BEGIN;
INSERT INTO `course_chapter_period` VALUES (1066954337870966785, '2019-01-03 17:50:39', '2019-01-22 11:01:14', 1, 1, 1080756535567257601, 1080756594904076290, '系统的简单介绍和如何部署', NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '1', 1066978796845690881, '系统的简单介绍和如何部署', '00:23:00', 'e2fe557cf3efdf0077fd03ead862dfe7_e');
INSERT INTO `course_chapter_period` VALUES (1474014126656217090, '2021-12-23 21:50:09', '2021-12-23 21:50:09', 1, 1, 1474013547238285313, 1474013609842466818, 'java语法', NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period` VALUES (1474022660227751937, '2021-12-23 22:27:13', '2021-12-23 22:27:13', 1, 1, 1474022012811763713, 1474022080012902401, 'RocketMQ底层原理及性能调优实战', NULL, 1, 0.00, 0.00, 0, 0, 1, '附表2A：毕业论文（设计）开题报告.doc', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/231ac73ff142426d9d7ba0300d2a63b5.doc', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period` VALUES (1474023746665734146, '2021-12-23 22:27:14', '2021-12-23 22:27:14', 1, 1, 1474022012811763713, 1474022111231107073, 'Java框架', '', 1, 0.00, 0.00, 0, 0, 1, '视屏1.mp4', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/85c8dbb5e27242e99dcb0d27d7f9a377.mp4', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period` VALUES (1474036224804020225, '2021-12-23 23:16:55', '2021-12-23 23:16:55', 1, 1, 1474022012811763713, 1474022146303877121, 'Java背景', NULL, 1, 0.00, 0.00, 0, 0, 1, '视屏2.mp4', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/b9796c9d9e3d4aee9946e6283938d548.mp4', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period` VALUES (1474411191198564354, '2021-12-25 00:06:51', '2021-12-25 00:06:51', 3, 1, 1474410936327487489, 1474410995374899201, '课程1', '', 1, 0.00, 0.00, 0, 0, 0, '', '', '1', 1477268395886964738, '视屏2.mp4', NULL, NULL);
INSERT INTO `course_chapter_period` VALUES (1477271685030801409, '2022-01-02 01:34:48', '2022-01-02 01:34:48', 3, 1, 1474410936327487489, 1474410995374899201, '课程2', NULL, 1, 0.00, 0.00, 0, 0, 0, '', '', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period` VALUES (1477271823178592258, '2022-01-02 01:34:48', '2022-01-02 01:34:48', 3, 1, 1474410936327487489, 1474410995374899201, '44', '', 1, 0.00, 0.00, 0, 0, 1, 'qrcode.png', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/0196ab5d3775430889a1147e7eb73182.png', '1', 1477332075257278466, '视屏1.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1477339498915311618, '2022-01-02 02:03:56', '2022-01-02 02:03:56', 1, 1, 1474410936327487489, 1474410995374899201, '视频1', '', 1, 0.00, 0.00, 0, 0, 1, 'qrcode.png', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/721117384b37423d9ed244c3dd497d51.png', '1', 1477341609338122242, '视屏3.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1477464952691245057, '2022-01-02 10:30:52', '2022-01-02 10:30:52', 1, 1, 1474410936327487489, 1474410995374899201, '视频2', NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '1', 1477339540698968065, '视屏2.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1477466021232197634, '2022-01-02 10:30:52', '2022-01-02 10:30:52', 1, 1, 1474410936327487489, 1474410995374899201, '视频3', '', 1, 0.00, 0.00, 0, 0, 1, '中文中文1233wewewew.docx', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/81a2a9454f2d4a4693a6f81941b01928.docx', '1', 1477341609338122242, '视屏3.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1477466424879431682, '2022-01-02 10:30:52', '2022-01-02 10:30:52', 3, 1, 1474410936327487489, 1474410995374899201, '视频4', NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '1', 1477339540698968065, '视屏2.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1477467260699357185, '2022-01-02 10:30:52', '2022-01-02 10:30:52', 1, 1, 1474410936327487489, 1474410995374899201, '4', NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '1', 1477341609338122242, '视屏3.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1477922262907633666, '2022-01-03 16:39:05', '2022-01-03 16:39:05', 1, 1, 1474410936327487489, 1477922230686990337, '5', NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '1', 1477922282130128897, '视屏1.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1492513362586636289, '2022-02-12 23:00:59', '2022-02-12 23:00:59', 1, 1, 1492513175231270914, 1492513228033363969, '课时1-视频', NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '1', 1492513718997618689, '视屏1.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1495302403111596033, '2022-02-20 16:03:38', '2022-02-20 16:03:38', 1, 1, 1495302197351624706, 1495302254389964802, '基础练习题目1', NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '1', 1495302490780938242, '视屏1.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1495307688509255681, '2022-02-20 16:03:38', '2022-02-20 16:03:38', 1, 1, 1495302197351624706, 1495302254389964802, '了；爱你习2', NULL, 1, 0.00, 0.00, 0, 0, 0, '', '', '1', 1495307715692539906, '视屏2.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1495307840930263041, '2022-02-20 16:03:38', '2022-02-20 16:03:38', 1, 1, 1495302197351624706, 1495302295141822466, '222', NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '1', 1495307861188751361, '视屏3.mp4', '0', '0');
INSERT INTO `course_chapter_period` VALUES (1495308046140780545, '2022-02-20 16:03:38', '2022-02-20 16:03:38', 1, 1, 1495302197351624706, 1495302329438646274, '3333', NULL, 1, 0.00, 0.00, 0, 0, 1, 'b7a7957c34f1b8dfcc85220af8e1353c.jpg', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/7431fecdde3a4c7897f48e21e8b00629.jpg', '0', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for course_chapter_period_audit
-- ----------------------------
DROP TABLE IF EXISTS `course_chapter_period_audit`;
CREATE TABLE `course_chapter_period_audit` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `audit_status` int NOT NULL DEFAULT '0' COMMENT '审核状态(0:待审核;1:审核通过;2:审核不通过)',
  `audit_opinion` varchar(1024) DEFAULT NULL COMMENT '审核意见',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT '课程ID',
  `chapter_id` bigint NOT NULL DEFAULT '0' COMMENT '章节ID',
  `period_desc` varchar(255) DEFAULT NULL COMMENT '课时描述',
  `is_free` tinyint NOT NULL DEFAULT '0' COMMENT '是否免费：1免费，0收费',
  `period_original` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `period_discount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '优惠价',
  `count_buy` int NOT NULL DEFAULT '0' COMMENT '购买人数',
  `count_study` int NOT NULL DEFAULT '0' COMMENT '学习人数',
  `is_doc` tinyint NOT NULL DEFAULT '0' COMMENT '是否存在文档(1存在，0否)',
  `doc_name` varchar(255) DEFAULT NULL COMMENT '文档名称',
  `doc_url` varchar(255) DEFAULT NULL COMMENT '文档地址',
  `period_name` varchar(255) NOT NULL DEFAULT '' COMMENT '课时名称',
  `is_video` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否存在视频(1存在，0否)',
  `video_no` bigint DEFAULT NULL COMMENT '视频编号',
  `video_name` varchar(255) DEFAULT NULL COMMENT '视频名称',
  `video_length` varchar(36) DEFAULT NULL COMMENT '时长',
  `video_vid` varchar(50) DEFAULT NULL COMMENT '视频VID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课时信息-审核';

-- ----------------------------
-- Records of course_chapter_period_audit
-- ----------------------------
BEGIN;
INSERT INTO `course_chapter_period_audit` VALUES (1249547013871685634, '2020-04-13 11:56:38', '2020-04-13 11:56:38', 1, 1, 0, NULL, 1085453180200448002, 1249546933273939969, NULL, 0, 0.00, 0.00, 0, 0, 0, NULL, NULL, '演示课时1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1249547028929236994, '2020-04-13 11:56:41', '2020-04-13 11:56:41', 1, 1, 0, NULL, 1085453180200448002, 1249546933273939969, NULL, 0, 0.00, 0.00, 0, 0, 0, NULL, NULL, '演示课时2', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1249547049011564546, '2020-04-13 11:56:46', '2020-04-13 11:56:46', 1, 1, 0, NULL, 1085453180200448002, 1249546933273939969, NULL, 0, 0.00, 0.00, 0, 0, 0, NULL, NULL, '演示课时3', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1473683802197876738, '2021-12-22 23:56:12', '2021-12-22 23:56:12', 1, 1, 0, NULL, 1080758482462511106, 1473683723974107137, NULL, 0, 0.00, 0.00, 0, 0, 1, '【极乐净土】咬人猫-有咩酱-赤九玖❤155小分队o(*≧▽≦)ツ - 001 - 【极乐净土】咬人猫-有咩酱-赤九玖❤155小分队o(*≧▽≦)ツ.mp4', '/Users/chen/temp/learn/doc/1473683776742645761.mp4', '11', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1474014126656217090, '2021-12-23 21:48:48', '2021-12-23 21:48:48', 1, 1, 1, NULL, 1474013547238285313, 1474013609842466818, NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, 'java语法', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1474022660227751937, '2021-12-23 22:22:42', '2021-12-23 22:22:42', 1, 1, 1, NULL, 1474022012811763713, 1474022080012902401, NULL, 1, 0.00, 0.00, 0, 0, 1, '附表2A：毕业论文（设计）开题报告.doc', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/231ac73ff142426d9d7ba0300d2a63b5.doc', 'RocketMQ底层原理及性能调优实战', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1474023746665734146, '2021-12-23 22:27:01', '2021-12-23 22:27:01', 1, 1, 1, NULL, 1474022012811763713, 1474022111231107073, '', 1, 0.00, 0.00, 0, 0, 1, '视屏1.mp4', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/85c8dbb5e27242e99dcb0d27d7f9a377.mp4', 'Java框架', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1474036224804020225, '2021-12-23 23:16:36', '2021-12-23 23:16:36', 1, 1, 1, NULL, 1474022012811763713, 1474022146303877121, NULL, 1, 0.00, 0.00, 0, 0, 1, '视屏2.mp4', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/b9796c9d9e3d4aee9946e6283938d548.mp4', 'Java背景', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1474411191198564354, '2021-12-25 00:06:35', '2021-12-25 00:06:35', 3, 1, 1, NULL, 1474410936327487489, 1474410995374899201, '', 1, 0.00, 0.00, 0, 0, 0, '', '', '课程1', '1', 1477268395886964738, '视屏2.mp4', NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1477271685030801409, '2022-01-01 21:33:10', '2022-01-01 21:33:10', 3, 1, 1, NULL, 1474410936327487489, 1474410995374899201, NULL, 1, 0.00, 0.00, 0, 0, 0, '', '', '课程2', '0', NULL, NULL, NULL, NULL);
INSERT INTO `course_chapter_period_audit` VALUES (1477271823178592258, '2022-01-01 21:33:43', '2022-01-01 21:33:43', 3, 1, 1, NULL, 1474410936327487489, 1474410995374899201, '', 1, 0.00, 0.00, 0, 0, 1, 'qrcode.png', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/0196ab5d3775430889a1147e7eb73182.png', '44', '1', 1477332075257278466, '视屏1.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1477339498915311618, '2022-01-02 02:02:38', '2022-01-02 02:02:38', 1, 1, 1, NULL, 1474410936327487489, 1474410995374899201, '', 1, 0.00, 0.00, 0, 0, 1, 'qrcode.png', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/721117384b37423d9ed244c3dd497d51.png', '视频1', '1', 1477341609338122242, '视屏3.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1477464952691245057, '2022-01-02 10:21:09', '2022-01-02 10:21:09', 1, 1, 1, NULL, 1474410936327487489, 1474410995374899201, NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '视频2', '1', 1477339540698968065, '视屏2.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1477466021232197634, '2022-01-02 10:25:24', '2022-01-02 10:25:24', 1, 1, 1, NULL, 1474410936327487489, 1474410995374899201, '', 1, 0.00, 0.00, 0, 0, 1, '中文中文1233wewewew.docx', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/81a2a9454f2d4a4693a6f81941b01928.docx', '视频3', '1', 1477341609338122242, '视屏3.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1477466424879431682, '2022-01-02 10:27:00', '2022-01-02 10:27:00', 3, 1, 1, NULL, 1474410936327487489, 1474410995374899201, NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '视频4', '1', 1477339540698968065, '视屏2.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1477467260699357185, '2022-01-02 10:30:19', '2022-01-02 10:30:19', 1, 1, 1, NULL, 1474410936327487489, 1474410995374899201, NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '4', '1', 1477341609338122242, '视屏3.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1477922262907633666, '2022-01-03 16:38:20', '2022-01-03 16:38:20', 1, 1, 1, NULL, 1474410936327487489, 1477922230686990337, NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '5', '1', 1477922282130128897, '视屏1.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1492513362586636289, '2022-02-12 22:58:09', '2022-02-12 22:58:09', 1, 1, 1, NULL, 1492513175231270914, 1492513228033363969, NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '课时1-视频', '1', 1492513718997618689, '视屏1.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1495302403111596033, '2022-02-20 15:40:48', '2022-02-20 15:40:48', 1, 1, 1, NULL, 1495302197351624706, 1495302254389964802, NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '基础练习题目1', '1', 1495302490780938242, '视屏1.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1495307688509255681, '2022-02-20 16:01:49', '2022-02-20 16:01:49', 1, 1, 1, NULL, 1495302197351624706, 1495302254389964802, NULL, 1, 0.00, 0.00, 0, 0, 0, '', '', '了；爱你习2', '1', 1495307715692539906, '视屏2.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1495307840930263041, '2022-02-20 16:02:25', '2022-02-20 16:02:25', 1, 1, 1, NULL, 1495302197351624706, 1495302295141822466, NULL, 1, 0.00, 0.00, 0, 0, 0, NULL, NULL, '222', '1', 1495307861188751361, '视屏3.mp4', '0', '0');
INSERT INTO `course_chapter_period_audit` VALUES (1495308046140780545, '2022-02-20 16:03:14', '2022-02-20 16:03:14', 1, 1, 1, NULL, 1495302197351624706, 1495302329438646274, NULL, 1, 0.00, 0.00, 0, 0, 1, 'b7a7957c34f1b8dfcc85220af8e1353c.jpg', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/7431fecdde3a4c7897f48e21e8b00629.jpg', '3333', '0', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for course_comment
-- ----------------------------
DROP TABLE IF EXISTS `course_comment`;
CREATE TABLE `course_comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` varchar(100) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `content` varchar(200) NOT NULL,
  `create_time` varchar(40) NOT NULL,
  `update_time` varchar(40) NOT NULL,
  `score` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1534920928633380867 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of course_comment
-- ----------------------------
BEGIN;
INSERT INTO `course_comment` VALUES (1477667629903708162, '1474410936327487489', '2018112209531803', '课程真的很不错！', '2022-01-02 15:46:31.366', '2022-01-02 15:46:31.366', '');
INSERT INTO `course_comment` VALUES (1477668762575482882, '1474410936327487489', '2018112209531803', '课程真的很不错2！', '2022-01-02 15:51:01.413', '2022-01-02 15:51:01.413', '5');
INSERT INTO `course_comment` VALUES (1477858123661213698, '1474410936327487489', '2021122423403946', '55', '2022-01-03 04:23:28.615', '2022-01-03 04:23:28.615', '5');
INSERT INTO `course_comment` VALUES (1477858172721987586, '1474410936327487489', '2021122423403946', '6666', '2022-01-03 04:23:40.312', '2022-01-03 04:23:40.312', '5');
INSERT INTO `course_comment` VALUES (1477858185300705281, '1474410936327487489', '2021122423403946', '6666', '2022-01-03 04:23:43.31', '2022-01-03 04:23:43.31', '5');
INSERT INTO `course_comment` VALUES (1477858544576397313, '1474410936327487489', '2021122423403946', '888', '2022-01-03 04:25:08.969', '2022-01-03 04:25:08.969', '5');
INSERT INTO `course_comment` VALUES (1477864972489875458, '1474022012811763713', '2021122423403946', '不错！', '2022-01-03 04:50:41.505', '2022-01-03 04:50:41.505', '5');
INSERT INTO `course_comment` VALUES (1477922086700728321, '1474022012811763713', '2021122423403946', '222', '2022-01-03 08:37:38.591', '2022-01-03 08:37:38.591', '5');
INSERT INTO `course_comment` VALUES (1477922086990135298, '1474022012811763713', '2021122423403946', '222', '2022-01-03 08:37:38.66', '2022-01-03 08:37:38.66', '5');
INSERT INTO `course_comment` VALUES (1492440367469989889, '1474022012811763713', '2021122423403946', '000', '2022-02-12 10:08:06.463', '2022-02-12 10:08:06.463', '5');
INSERT INTO `course_comment` VALUES (1492485134564233218, '1474410936327487489', '2021122423403946', '全国总冠军并出道 [2]  。2007年参加歌唱类选秀《快乐男声》，获得总决赛第四名；随后发行的EP《最美的太阳》拿下亚马逊年度唱片销量冠军 [1]  。2008年发行专辑《明天过后》，凭借该专辑获得北京流行音乐典礼11项提名 ', '2022-02-12 13:05:59.771', '2022-02-12 13:05:59.771', '5');
INSERT INTO `course_comment` VALUES (1492491874215133186, '1474410936327487489', '2021122423403946', '同年获得韩国MAMA亚洲最佳歌手奖 [4]  。2012年在人民大会堂开启个人首轮巡演 [5]  ； 同年获得湖南省“五个一”工程奖 [6]  。2013年首次参加央视春晚，演唱歌曲《给我你的爱》 [7]  ', '2022-02-12 13:32:48.292', '2022-02-12 13:32:48.75', '9');
INSERT INTO `course_comment` VALUES (1492500697994756097, '1474013547238285313', '2021122423403946', '胡歌曾经将电影《心灵捕手》看了好几遍。  影片中，马特·达蒙饰演的那位天才过目不忘，有着常人没有的天赋，却是问题少年。  挖掘他的人，认为他肯定可以做到一个令人望尘莫及的高度。但天才少年永远不愿意迈出他原本的、熟悉的那个圈子。', '2022-02-12 14:07:50.381', '2022-02-12 14:07:50.381', '5');
INSERT INTO `course_comment` VALUES (1495314885687455745, '1495302197351624706', '2021122423403946', '总体的说，课程的很值得学习，大家可以试一下', '2022-02-20 08:30:25.012', '2022-02-20 08:30:25.012', '9');
INSERT INTO `course_comment` VALUES (1502852171027222529, '1492513175231270914', '2022031311385226', '11111111', '2022-03-13 03:40:53.876', '2022-03-13 03:40:53.876', '5');
INSERT INTO `course_comment` VALUES (1509483252606345218, '1492513175231270914', '2022033118320856', '22', '2022-03-31 10:50:26.921', '2022-03-31 10:50:26.921', '2');
INSERT INTO `course_comment` VALUES (1534920928633380866, '1492513175231270914', '2021122423403946', '22', '2022-06-09 15:30:41.495', '2022-06-09 15:30:41.495', '23');
COMMIT;

-- ----------------------------
-- Table structure for course_introduce
-- ----------------------------
DROP TABLE IF EXISTS `course_introduce`;
CREATE TABLE `course_introduce` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `introduce` longtext NOT NULL COMMENT '课程简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课程介绍信息';

-- ----------------------------
-- Records of course_introduce
-- ----------------------------
BEGIN;
INSERT INTO `course_introduce` VALUES (1080756535550480385, '2019-01-03 17:23:30', '2019-01-03 17:23:30', '<p>项目地址：</p><p><a href=\"http://git.oschina.net/roncoocom/roncoo-adminlte-springmvc\">龙果开源-后台管理系统</a>&nbsp;<a href=\"http://git.oschina.net/roncoocom/roncoo-adminlte-springmvc\">http://git.oschina.net/roncoocom/roncoo-adminlte-springmvc</a></p><p><strong>技术交流群：546588570</strong></p><p><br></p><p>项目介绍</p><p>1. 框架完全是基于Spring IO platform，绝对拥抱Spring，版本的依赖关系再不用担心。&nbsp;<br>2. 前端基于&nbsp;<a href=\"https://github.com/roncoo/roncoo-adminLTE/\">龙果开源-后台管理UI Roncoo AdminLTE</a>，高端大气上档次。&nbsp;<br>3. 实现了邮件发送功能，邮件增删改查功能&nbsp;<br>4. 代码自动生成工具使用了&nbsp;<a href=\"https://github.com/roncoo/roncoo-mybatis-generator\">龙果开源-Mybatis代码自动生成工具</a>&nbsp;<br><br>项目愿景&nbsp;<br>根据实际项目的需求，实现一个适合由单应用扩展到多应用的架构。在项目的最初设定就是一个适合多模块扩展的架构，最初是单应用架构，以包区分模块。当项目需求增大的时候，会先实现多机部署，接下来进行项目拆分，进行集群部署。每个阶段都会整合一个架构，提供对应的解决方案。&nbsp;<br><br>技术框架&nbsp;<br>* 核心框架：Spring Framework&nbsp;<br>* 视图框架：Spring MVC&nbsp;<br>* 模板引擎：Freemark&nbsp;<br>* 持久层框架：Mybatis&nbsp;<br>* 数据库连接池：Alibaba Druid&nbsp;<br></p><p><br></p><p>目前最新集成功能：</p><p>使用shiro集成权限模块</p><p>集成Spring Session，解决了单节点问题</p><p><br></p><p>下步计划&nbsp;<br>继续优化，持续更新，增加各种demo实例&nbsp;<br>创建maven原型，实现快捷搭建项目架构&nbsp;&nbsp;&nbsp;<br></p>');
INSERT INTO `course_introduce` VALUES (1080758482454122498, '2019-01-03 17:31:14', '2019-01-03 17:31:14', '<p>龙果运维系统：基于cobbler的二次开发，方便不会的机房和运维人员快速装机，CMDB的快速添加，CMDB机柜平台，机柜和故障告警展示，zabbix 的模板管理，把CMDB同步到zabbix 数据库，然后批量绑定模板，删除维护周期，zabbix调用图片运维平台生成图形；后期更新基于saltstack 构建自动化扩容平台生态。</p><p><br></p><p>龙果运维平台开源地址：<a href=\"https://github.com/roncoo/roncoo-cmdb\">https://github.com/roncoo/roncoo-cmdb</a></p><p></p><p>Zabbix3.0入门到生产环境应用实战：</p><p><a href=\"http://www.roncoo.com/course/view/fb3050a5b34b42f39ccad83ebebc89c1\">http://www.roncoo.com/course/view/fb3050a5b34b42f39ccad83ebebc89c1</a></p><p><br></p>');
INSERT INTO `course_introduce` VALUES (1080759102695215105, '2019-01-03 17:33:42', '2019-01-03 17:33:42', '<p>龙果支付系统是国内首款开源的互联网支付系统，其核心目标是汇聚所有主流支付渠道，打造一款轻量、便捷、易用，且集支付、资金对账、资金清结算于一体的支付系统，满足互联网业务系统的收款和业务资金管理需求。&nbsp;<br><br>主要特点：&nbsp;<br>具备支付系统通用的支付、对账、清算、资金账户管理、支付订单管理等功能；&nbsp;<br>目前已接通“支付宝即时到账”和“微信扫码支付”通道；&nbsp;<br>支持直连和间连两种支付模式，任君选择；&nbsp;<br>通过支付网关，业务系统可以轻松实现统一支付接入；&nbsp;<br>搭配运营后台，支付数据的监控和管理可以兼得；&nbsp;<br>配套完善的系统使用文档，可轻松嵌入任何需要支付的场景；&nbsp;<br></p><p>龙果支付系统产品技术团队是一支拥有多年第三方支付系统设计研发经验的团队，会为龙果支付系统持续提供商业级的免费开源技术服务支持。</p><p><br></p><p>支付业务流程中所遇到的分布式事务问题可以参考：<a href=\"http://www.roncoo.com/article/detail/124243\">《微服务架构的分布式事务解决方案》</a></p><p><img alt=\"\" src=\"http://img.roncoo.com/education/course/2016/09_01/img/ba76a876e3ec4937bac9a66e6b710bb8.jpg\"></p><p>开源中国地址：<a href=\"http://www.oschina.net/p/roncoo-pay\">http://www.oschina.net/p/roncoo-pay</a></p><p><a href=\"http://git.oschina.net/roncoocom/roncoo-pay\">http://git.oschina.net/roncoocom/roncoo-pay</a></p><p>GitHub地址：<a href=\"https://github.com/roncoo/roncoo-pay\">https://github.com/roncoo/roncoo-pay</a></p><p>在线支付演示：<a href=\"http://demo.pay.roncoo.com/\">http://demo.pay.roncoo.com</a><br>后台运营管理：<a href=\"http://demo.pay.roncoo.com/boss\">http://demo.pay.roncoo.com/boss</a><br>系统操作说明：<a href=\"http://www.roncoo.com/article/detail/124375\">http://www.roncoo.com/article/detail/124375</a><br>系统详细介绍：<a href=\"http://www.roncoo.com/article/detail/124373\">http://www.roncoo.com/article/detail/124373</a><br>系统搭建部署：<a href=\"http://www.roncoo.com/article/detail/124511\">http://www.roncoo.com/article/detail/124511</a><br>官方QQ群：597865269 欢迎加入，共同探讨互联网金融支付行业业务、技术等</p><p>=============================================================</p><p>注：龙果支付系统也有商业版，商业版龙果支付系统是一套支付金融行业通用的支付系统，拥有独立的账户体系、用户体系、支付交易体系、代理分润体系、对账清结算体系。可以作为独立的运营的支付平台，接入各种银行通道或第三方支付通道，为下游商户或平台提供一站式支付业务应用解决方案；也可为电商、金融、保险、教育、医疗、交通等行业提供统一的支付业务接入和账户管理，实现业务平台统一的收款、结算、财务资金管理等功能。</p><p><strong>项目合作</strong></p><p><strong>联系人：吴老师（吴水成）<br>QQ：840765167&nbsp;<br></strong></p><p><strong>微信：wushuicheng</strong></p><p><strong>邮箱：wusc@roncoo.com</strong></p><p><strong><br></strong></p>');
INSERT INTO `course_introduce` VALUES (1080759557651369985, '2019-01-03 17:35:31', '2019-01-03 17:35:31', '<p>领课教育系统是广州市领课网络科技有限公司自主研发的一套各行业通用的在线教育系统软件，适用于垂直行业职业技能培训、企业内训、K12教育、知识付费内容平台等所有需要实现在线教育的应用场景。 系统拥有完善的在线教学功能，良好的用户体验，先进的技术架构，帮助教育机构或企业搭建一个高质量且自主可控的在线教育平台。</p><p><br></p><div><p>完善的在线教学功能：录播、直播、题库、资源、社区、营销、博客等</p></div><div><p>全面的系统技术交付：提供全套教育系统的程序源码、文档、脚本</p></div><div><p>体系化的培训指导：使用培训、代码及技术架构培训、部署培训、扩展开发指导等</p></div><div><p>灵活的定制化方案：可根据企业自身需求进行定制化功能开发</p><p><br></p><p>官网：<a href=\"https://edu.roncoo.net/\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">领课教育系统(https://edu.roncoo.net/)</a><br></p><p><br></p></div>');
INSERT INTO `course_introduce` VALUES (1085453180192059393, '2019-01-16 16:26:18', '2019-01-16 16:26:18', '<p></p>\n<p></p>\n<p></p>\n<p>该课程仅用于测试购买！</p><p><br></p>');
INSERT INTO `course_introduce` VALUES (1246446673559326721, '2020-04-04 22:36:59', '2020-04-04 22:36:59', '<p><ajavascript:\">龙果代码生成&nbsp;&nbsp;</ajavascript:\"><br></p><p><ajavascript:\"><br></ajavascript:\"></p>');
INSERT INTO `course_introduce` VALUES (1248473637711302658, '2020-04-10 12:51:25', '2020-04-10 12:51:25', '<p>龙果教程项目</p><p><br></p>');
INSERT INTO `course_introduce` VALUES (1248882669789958146, '2020-04-11 15:56:46', '2020-04-11 15:56:46', '<p>龙果集成项目</p><p><br></p>');
INSERT INTO `course_introduce` VALUES (1249286274741227521, '2020-04-12 18:40:33', '2020-04-12 18:40:33', '<p>龙果充值系统</p><p><br></p>');
INSERT INTO `course_introduce` VALUES (1474013547192147970, '2021-12-23 21:46:30', '2021-12-23 21:46:30', '<p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLCYOIxslk7EHLJMQPghncPRiaZ8axxjzrBId4QwvZIx9cDpicfDHKZPhrSJliaPsrbt4w/\"><br></p><p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLCYOIxslk7EHLJMQPghncPRiaZ8axxjzrBId4QwvZIx9cDpicfDHKZPhrSJliaPsrbt4w/\"><br></p>');
INSERT INTO `course_introduce` VALUES (1474022012794986498, '2021-12-23 22:20:08', '2021-12-23 22:20:08', '<p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLBHySc0ibOK8TRicFJl3eibMoharXCRpYuE2nuicL9UzNSME1ckgKOI9hicwzYicTOt9Hw1E/\"><br></p>');
INSERT INTO `course_introduce` VALUES (1474410936243601409, '2021-12-25 00:05:35', '2021-12-25 00:05:35', '<p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLAxEicPK4iaEVdVzWewlXvaWJCr8KIRBibHeoB2aaBMbf1ttw7yr970d6jTZWXeOJf0rE/\"><br></p>');
INSERT INTO `course_introduce` VALUES (1492513175155773441, '2022-02-12 22:57:25', '2022-02-12 22:57:25', '<p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLBVONdav2cqcIwCtAU9WIcIr9AKMic6icZnbzPrU8BZHwwqztJTdVhUL7C4qoU7OvXE0/\"><br></p>');
INSERT INTO `course_introduce` VALUES (1495302197250961410, '2022-02-20 15:39:59', '2022-02-20 15:39:59', '<p>1、学习效率高</p><p>2、学习课程多</p><p>3、课程项目实战经验丰富</p><p>4、联系多</p><p>5、写代码</p>');
COMMIT;

-- ----------------------------
-- Table structure for course_introduce_audit
-- ----------------------------
DROP TABLE IF EXISTS `course_introduce_audit`;
CREATE TABLE `course_introduce_audit` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `introduce` longtext NOT NULL COMMENT '课程简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课程介绍信息-审核';

-- ----------------------------
-- Records of course_introduce_audit
-- ----------------------------
BEGIN;
INSERT INTO `course_introduce_audit` VALUES (1474013547192147970, '2021-12-23 21:46:30', '2021-12-23 21:46:30', '<p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLCYOIxslk7EHLJMQPghncPRiaZ8axxjzrBId4QwvZIx9cDpicfDHKZPhrSJliaPsrbt4w/\"><br></p><p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLCYOIxslk7EHLJMQPghncPRiaZ8axxjzrBId4QwvZIx9cDpicfDHKZPhrSJliaPsrbt4w/\"><br></p>');
INSERT INTO `course_introduce_audit` VALUES (1474022012794986498, '2021-12-23 22:20:08', '2021-12-23 22:20:08', '<p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLBHySc0ibOK8TRicFJl3eibMoharXCRpYuE2nuicL9UzNSME1ckgKOI9hicwzYicTOt9Hw1E/\"><br></p>');
INSERT INTO `course_introduce_audit` VALUES (1474410936243601409, '2021-12-25 00:05:35', '2021-12-25 00:05:35', '<p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLAxEicPK4iaEVdVzWewlXvaWJCr8KIRBibHeoB2aaBMbf1ttw7yr970d6jTZWXeOJf0rE/\"><br></p>');
INSERT INTO `course_introduce_audit` VALUES (1492513175155773441, '2022-02-12 22:57:25', '2022-02-12 22:57:25', '<p><img src=\"https://10.idqqimg.com/qqke_course_info/ajNVdqHZLLBVONdav2cqcIwCtAU9WIcIr9AKMic6icZnbzPrU8BZHwwqztJTdVhUL7C4qoU7OvXE0/\"><br></p>');
INSERT INTO `course_introduce_audit` VALUES (1495302197250961410, '2022-02-20 15:39:59', '2022-02-20 15:39:59', '<p>1、学习效率高</p><p>2、学习课程多</p><p>3、课程项目实战经验丰富</p><p>4、联系多</p><p>5、写代码</p>');
COMMIT;

-- ----------------------------
-- Table structure for course_recommend
-- ----------------------------
DROP TABLE IF EXISTS `course_recommend`;
CREATE TABLE `course_recommend` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:有效;0:无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `category_id` bigint NOT NULL DEFAULT '0' COMMENT '分类ID',
  `course_id` bigint NOT NULL COMMENT '课程id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='课程推荐';

-- ----------------------------
-- Records of course_recommend
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for course_user_study
-- ----------------------------
DROP TABLE IF EXISTS `course_user_study`;
CREATE TABLE `course_user_study` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT '课程ID',
  `user_no` bigint NOT NULL COMMENT '用户编号',
  `period_total` int NOT NULL DEFAULT '0' COMMENT '总课时数',
  `period_study` int NOT NULL DEFAULT '0' COMMENT '已学习课时数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_course_id_user_no` (`course_id`,`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课程用户关联表';

-- ----------------------------
-- Records of course_user_study
-- ----------------------------
BEGIN;
INSERT INTO `course_user_study` VALUES (1249542694141218818, '2020-04-13 11:39:28', '2020-04-13 11:39:28', 1, 1, 1080759102707798018, 2018112015051635, 3, 1);
INSERT INTO `course_user_study` VALUES (1249545659979714561, '2020-04-13 11:51:15', '2020-04-13 11:51:15', 1, 1, 1080759557655564289, 2018112015051635, 17, 1);
INSERT INTO `course_user_study` VALUES (1249699193085808641, '2020-04-13 22:01:20', '2020-04-13 22:01:20', 1, 1, 1080758482462511106, 2018112015051635, 5, 1);
INSERT INTO `course_user_study` VALUES (1249869936624930817, '2020-04-14 09:19:49', '2020-04-14 09:19:49', 1, 1, 1080756535567257601, 2018112015051635, 0, 1);
INSERT INTO `course_user_study` VALUES (1477343209905471489, '2022-01-02 02:17:23', '2022-01-02 02:17:23', 1, 1, 1474410936327487489, 2021122423403946, 9, 133);
INSERT INTO `course_user_study` VALUES (1492514651643056130, '2022-02-12 23:03:17', '2022-02-12 23:03:17', 1, 1, 1492513175231270914, 2021122423403946, 1, 34);
INSERT INTO `course_user_study` VALUES (1495308291021025282, '2022-02-20 16:04:12', '2022-02-20 16:04:12', 1, 1, 1495302197351624706, 2021122423403946, 4, 113);
INSERT INTO `course_user_study` VALUES (1502852133882466306, '2022-03-13 11:40:45', '2022-03-13 11:40:45', 1, 1, 1492513175231270914, 2022031311385226, 1, 2);
INSERT INTO `course_user_study` VALUES (1509482957243457539, '2022-03-31 18:49:16', '2022-03-31 18:49:16', 1, 1, 1492513175231270914, 2022033118320856, 1, 1);
INSERT INTO `course_user_study` VALUES (1522572773636042754, '2022-05-06 21:43:31', '2022-05-06 21:43:31', 1, 1, 1474410936327487489, 2022050109344243, 9, 7);
COMMIT;

-- ----------------------------
-- Table structure for course_user_study_log
-- ----------------------------
DROP TABLE IF EXISTS `course_user_study_log`;
CREATE TABLE `course_user_study_log` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT '课程编号',
  `course_name` varchar(255) NOT NULL COMMENT '课程名称',
  `chapter_id` bigint NOT NULL DEFAULT '0' COMMENT '章节编号',
  `chapter_name` varchar(255) NOT NULL COMMENT '章节名称',
  `period_id` bigint NOT NULL DEFAULT '0' COMMENT '课时编号',
  `period_name` varchar(255) NOT NULL COMMENT '课时名称',
  `user_no` bigint NOT NULL DEFAULT '0' COMMENT '用户编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课程用户学习日志';

-- ----------------------------
-- Records of course_user_study_log
-- ----------------------------
BEGIN;
INSERT INTO `course_user_study_log` VALUES (1477343209926443009, '2022-01-02 02:17:23', 1474410936327487489, 'Spring21天入门到精通', 1474410995374899201, 'Spring了解', 1477339498915311618, '视频1', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1477468059798147073, '2022-01-02 10:33:30', 1474410936327487489, 'Spring21天入门到精通', 1474410995374899201, 'Spring了解', 1477467260699357185, '4', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1477468813371969538, '2022-01-02 10:36:29', 1474410936327487489, 'Spring21天入门到精通', 1474410995374899201, 'Spring了解', 1477466021232197634, '视频3', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1477468833206833153, '2022-01-02 10:36:34', 1474410936327487489, 'Spring21天入门到精通', 1474410995374899201, 'Spring了解', 1477464952691245057, '视频2', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1477922845534208002, '2022-01-03 16:40:39', 1474410936327487489, 'Spring21天入门到精通', 1477922230686990337, '课室5', 1477922262907633666, '5', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1492514651647250433, '2022-02-12 23:03:17', 1492513175231270914, 'Python3', 1492513228033363969, 'python基础', 1492513362586636289, '课时1-视频', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1495308291029413890, '2022-02-20 16:04:12', 1495302197351624706, '系统架构师高级课程', 1495302254389964802, '基础练习', 1495302403111596033, '基础练习题目1', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1495308291037802498, '2022-02-20 16:04:12', 1495302197351624706, '系统架构师高级课程', 1495302254389964802, '基础练习', 1495302403111596033, '基础练习题目1', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1495308326009909250, '2022-02-20 16:04:21', 1495302197351624706, '系统架构师高级课程', 1495302254389964802, '基础练习', 1495307688509255681, '了；爱你习2', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1495308326018297857, '2022-02-20 16:04:21', 1495302197351624706, '系统架构师高级课程', 1495302254389964802, '基础练习', 1495307688509255681, '了；爱你习2', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1495308359526592513, '2022-02-20 16:04:29', 1495302197351624706, '系统架构师高级课程', 1495302295141822466, '高级练习', 1495307840930263041, '222', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1495308359526592514, '2022-02-20 16:04:29', 1495302197351624706, '系统架构师高级课程', 1495302295141822466, '高级练习', 1495307840930263041, '222', 2021122423403946);
INSERT INTO `course_user_study_log` VALUES (1502852133903437825, '2022-03-13 11:40:45', 1492513175231270914, 'Python3', 1492513228033363969, 'python基础', 1492513362586636289, '课时1-视频', 2022031311385226);
INSERT INTO `course_user_study_log` VALUES (1509482957264429058, '2022-03-31 18:49:16', 1492513175231270914, 'Python3', 1492513228033363969, 'python基础', 1492513362586636289, '课时1-视频', 2022033118320856);
INSERT INTO `course_user_study_log` VALUES (1522572773686374401, '2022-05-06 21:43:31', 1474410936327487489, 'Spring21天入门到精通', 1474410995374899201, 'Spring了解', 1477466021232197634, '视频3', 2022050109344243);
INSERT INTO `course_user_study_log` VALUES (1522572796817960961, '2022-05-06 21:43:37', 1474410936327487489, 'Spring21天入门到精通', 1474410995374899201, 'Spring了解', 1477464952691245057, '视频2', 2022050109344243);
INSERT INTO `course_user_study_log` VALUES (1522572796817960962, '2022-05-06 21:43:37', 1474410936327487489, 'Spring21天入门到精通', 1474410995374899201, 'Spring了解', 1477464952691245057, '视频2', 2022050109344243);
INSERT INTO `course_user_study_log` VALUES (1522572800034992129, '2022-05-06 21:43:38', 1474410936327487489, 'Spring21天入门到精通', 1474410995374899201, 'Spring了解', 1477339498915311618, '视频1', 2022050109344243);
INSERT INTO `course_user_study_log` VALUES (1522572800034992130, '2022-05-06 21:43:38', 1474410936327487489, 'Spring21天入门到精通', 1474410995374899201, 'Spring了解', 1477339498915311618, '视频1', 2022050109344243);
INSERT INTO `course_user_study_log` VALUES (1522572810239733761, '2022-05-06 21:43:40', 1474410936327487489, 'Spring21天入门到精通', 1477922230686990337, '课室5', 1477922262907633666, '5', 2022050109344243);
INSERT INTO `course_user_study_log` VALUES (1522572810239733762, '2022-05-06 21:43:40', 1474410936327487489, 'Spring21天入门到精通', 1477922230686990337, '课室5', 1477922262907633666, '5', 2022050109344243);
COMMIT;

-- ----------------------------
-- Table structure for course_video
-- ----------------------------
DROP TABLE IF EXISTS `course_video`;
CREATE TABLE `course_video` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT '课程ID',
  `chapter_id` bigint NOT NULL DEFAULT '0' COMMENT '章节ID',
  `period_id` bigint DEFAULT NULL COMMENT '课时ID',
  `video_name` varchar(255) DEFAULT NULL COMMENT '视频名称',
  `video_no` bigint DEFAULT NULL COMMENT '视频编号',
  `video_status` tinyint NOT NULL DEFAULT '0' COMMENT '视频状态(1待上传，2上传成功，3上传失败)',
  `video_length` varchar(36) DEFAULT NULL COMMENT '时长',
  `video_vid` varchar(50) DEFAULT NULL COMMENT '视频ID',
  `video_oas_id` varchar(255) DEFAULT NULL COMMENT '阿里云oas',
  `url` varchar(200) DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='课程视频信息';

-- ----------------------------
-- Records of course_video
-- ----------------------------
BEGIN;
INSERT INTO `course_video` VALUES (1477339540698968066, '2022-01-02 02:02:48', '2022-01-02 02:02:48', 1, 1, 1474410936327487489, 1474410995374899201, 0, '视屏2.mp4', 1477339540698968065, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/57a9df0c0f0b4cd89bd85d9c5b817203.mp4');
INSERT INTO `course_video` VALUES (1477339660433764353, '2022-01-02 02:02:48', '2022-01-02 02:02:48', 3, 1, 1474410936327487489, 1474410995374899201, 1477339498915311618, '视屏2.mp4', 1477339540698968065, 2, '0', '0', '0', NULL);
INSERT INTO `course_video` VALUES (1477341609350705154, '2022-01-02 02:11:02', '2022-01-02 02:11:02', 1, 1, 1474410936327487489, 1474410995374899201, 0, '视屏3.mp4', 1477341609338122242, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/fd59b3b7eb1645af977c2c3ff90da6c7.mp4');
INSERT INTO `course_video` VALUES (1477342193860521986, '2022-01-02 02:11:02', '2022-01-02 02:11:02', 1, 1, 1474410936327487489, 1474410995374899201, 1477339498915311618, '视屏3.mp4', 1477341609338122242, 2, '0', '0', '0', NULL);
INSERT INTO `course_video` VALUES (1477465023142969345, '2022-01-02 02:02:48', '2022-01-02 02:02:48', 1, 1, 1474410936327487489, 1474410995374899201, 1477464952691245057, '视屏2.mp4', 1477339540698968065, 2, '0', '0', '0', NULL);
INSERT INTO `course_video` VALUES (1477466038013607937, '2022-01-02 02:11:02', '2022-01-02 02:11:02', 1, 1, 1474410936327487489, 1474410995374899201, 1477466021232197634, '视屏3.mp4', 1477341609338122242, 2, '0', '0', '0', NULL);
INSERT INTO `course_video` VALUES (1477466674402770946, '2022-01-02 02:02:48', '2022-01-02 02:02:48', 3, 1, 1474410936327487489, 1474410995374899201, 1477466424879431682, '视屏2.mp4', 1477339540698968065, 2, '0', '0', '0', NULL);
INSERT INTO `course_video` VALUES (1477467279913463810, '2022-01-02 02:11:02', '2022-01-02 02:11:02', 1, 1, 1474410936327487489, 1474410995374899201, 1477467260699357185, '视屏3.mp4', 1477341609338122242, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/fd59b3b7eb1645af977c2c3ff90da6c7.mp4');
INSERT INTO `course_video` VALUES (1477922282138517505, '2022-01-03 16:38:25', '2022-01-03 16:38:25', 1, 1, 1474410936327487489, 1477922230686990337, 0, '视屏1.mp4', 1477922282130128897, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/83ab1a2eabfe421db0ea865cea75266e.mp4');
INSERT INTO `course_video` VALUES (1477922359913496578, '2022-01-03 16:38:25', '2022-01-03 16:38:25', 1, 1, 1474410936327487489, 1477922230686990337, 1477922262907633666, '视屏1.mp4', 1477922282130128897, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/83ab1a2eabfe421db0ea865cea75266e.mp4');
INSERT INTO `course_video` VALUES (1492513719006007297, '2022-02-12 22:59:34', '2022-02-12 22:59:34', 1, 1, 1492513175231270914, 1492513228033363969, 0, '视屏1.mp4', 1492513718997618689, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/c03737c50d6d43e6945d693d35769f8a.mp4');
INSERT INTO `course_video` VALUES (1492513982597042178, '2022-02-12 22:59:34', '2022-02-12 22:59:34', 1, 1, 1492513175231270914, 1492513228033363969, 1492513362586636289, '视屏1.mp4', 1492513718997618689, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/c03737c50d6d43e6945d693d35769f8a.mp4');
INSERT INTO `course_video` VALUES (1495302490789326849, '2022-02-20 15:41:09', '2022-02-20 15:41:09', 1, 1, 1495302197351624706, 1495302254389964802, 0, '视屏1.mp4', 1495302490780938242, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/b6fa8f1ca213481e8d9de69e5e5e4447.mp4');
INSERT INTO `course_video` VALUES (1495307630195847169, '2022-02-20 15:41:09', '2022-02-20 15:41:09', 1, 1, 1495302197351624706, 1495302254389964802, 1495302403111596033, '视屏1.mp4', 1495302490780938242, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/b6fa8f1ca213481e8d9de69e5e5e4447.mp4');
INSERT INTO `course_video` VALUES (1495307715696734209, '2022-02-20 16:01:55', '2022-02-20 16:01:55', 1, 1, 1495302197351624706, 1495302254389964802, 0, '视屏2.mp4', 1495307715692539906, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/4d4ce7ef3cc0462eb6c61b72a11827e7.mp4');
INSERT INTO `course_video` VALUES (1495307795736637442, '2022-02-20 16:01:55', '2022-02-20 16:01:55', 1, 1, 1495302197351624706, 1495302254389964802, 1495307688509255681, '视屏2.mp4', 1495307715692539906, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/4d4ce7ef3cc0462eb6c61b72a11827e7.mp4');
INSERT INTO `course_video` VALUES (1495307861192945666, '2022-02-20 16:02:30', '2022-02-20 16:02:30', 1, 1, 1495302197351624706, 1495302295141822466, 0, '视屏3.mp4', 1495307861188751361, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/55809dad413c467f8c26d81e1c634b45.mp4');
INSERT INTO `course_video` VALUES (1495307919506354178, '2022-02-20 16:02:30', '2022-02-20 16:02:30', 1, 1, 1495302197351624706, 1495302295141822466, 1495307840930263041, '视屏3.mp4', 1495307861188751361, 2, '0', '0', '0', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/55809dad413c467f8c26d81e1c634b45.mp4');
COMMIT;

-- ----------------------------
-- Table structure for dic
-- ----------------------------
DROP TABLE IF EXISTS `dic`;
CREATE TABLE `dic` (
  `id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `field_name` varchar(50) NOT NULL DEFAULT '' COMMENT '字段名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='数据字典';

-- ----------------------------
-- Records of dic
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for dic_list
-- ----------------------------
DROP TABLE IF EXISTS `dic_list`;
CREATE TABLE `dic_list` (
  `id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `field_id` bigint NOT NULL DEFAULT '0' COMMENT '字段ID',
  `field_key` varchar(255) NOT NULL COMMENT '字段KEY',
  `field_value` varchar(255) NOT NULL COMMENT '字段VALUE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='数据字典明细表';

-- ----------------------------
-- Records of dic_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file_storage
-- ----------------------------
DROP TABLE IF EXISTS `file_storage`;
CREATE TABLE `file_storage` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `file_no` bigint NOT NULL COMMENT '文件编号',
  `file_name` varchar(128) NOT NULL COMMENT '文件名称',
  `file_url` varchar(255) NOT NULL COMMENT '文件地址',
  `file_type` tinyint NOT NULL DEFAULT '2' COMMENT '文件类型(1:附件;2;图片;3:视频)',
  `file_size` bigint NOT NULL COMMENT '文件大小',
  `file_classify` tinyint DEFAULT '2' COMMENT '文件类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='文件存储表';

-- ----------------------------
-- Records of file_storage
-- ----------------------------
BEGIN;
INSERT INTO `file_storage` VALUES (1473678349711728641, '2021-12-22 23:34:33', 1473678332653494273, '630c412126fb43ff4314f40d2e8a9275.jpg', '/Users/chen/temp/learn/pic/1473678332653494273.jpg', 2, 291486, 2);
INSERT INTO `file_storage` VALUES (1473678444075180035, '2021-12-22 23:34:55', 1473678444075180034, '4eb9095bc8f096aebce8438f8f5308fb.jpg', '/Users/chen/temp/learn/pic/1473678444075180034.jpg', 2, 193855, 2);
INSERT INTO `file_storage` VALUES (1473678712196063234, '2021-12-22 23:35:59', 1473678712196063233, '337ae2303ba316fd23b8abb590675163.jpg', '/Users/chen/temp/learn/pic/1473678712196063233.jpg', 2, 255650, 2);
INSERT INTO `file_storage` VALUES (1473683776746840065, '2021-12-22 23:56:06', 1473683776742645761, '【极乐净土】咬人猫-有咩酱-赤九玖❤155小分队o(*≧▽≦)ツ - 001 - 【极乐净土】咬人猫-有咩酱-赤九玖❤155小分队o(*≧▽≦)ツ.mp4', '/Users/chen/temp/learn/doc/1473683776742645761.mp4', 2, 47975622, 1);
COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lecturer
-- ----------------------------
DROP TABLE IF EXISTS `lecturer`;
CREATE TABLE `lecturer` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `lecturer_user_no` bigint NOT NULL COMMENT '讲师用户编号',
  `lecturer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '讲师名称',
  `lecturer_mobile` char(11) NOT NULL DEFAULT '' COMMENT '讲师手机',
  `lecturer_email` varchar(100) DEFAULT NULL COMMENT '讲师邮箱',
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `head_img_url` varchar(255) DEFAULT NULL COMMENT '头像',
  `introduce` varchar(2048) DEFAULT NULL COMMENT '简介',
  `lecturer_proportion` decimal(5,4) NOT NULL DEFAULT '0.0000' COMMENT '讲师分成比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='讲师信息';

-- ----------------------------
-- Records of lecturer
-- ----------------------------
BEGIN;
INSERT INTO `lecturer` VALUES (1064776676173942786, '2018-11-20 15:44:14', '2018-11-20 15:44:14', 1, 1, 2018112015051635, '讲师', '13800138001', '297115770@qq.com', '', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/76a242408682477a9dcbe7c93bddc81a.jpeg', '<div><p>#百家故事#</p><p><br></p></div><div><p></p><p>胡歌曾经将电影《心灵捕手》看了好几遍。</p><p></p></div><div><p></p><p>影片中，马特·达蒙饰演的那位天才过目不忘，有着常人没有的天赋，却是问题少年。</p><p></p></div><div><p></p><p>挖掘他的人，认为他肯定可以做到一个令人望尘莫及的高度。但天才少年永远不愿意迈出他原本的、熟悉的那个圈子。</p><p></p></div><div><p></p><p>胡歌觉得，自己其实也有一点这样的性格。</p><p></p></div><div><p></p><p>出道17年、今天刚满39周岁，回顾胡歌的演艺之路，他一如既往地敏感、克制，对自我的审查异常严格。</p><p></p></div><div><p></p><p>胡歌似乎永远在反思，自己到底配得上大家的喜爱吗？</p><p></p></div><div><p></p><p>他是仙剑系列极少还没在现实成家的主角之一，被称为仙剑留守儿童。又因“十年前（2005年）是李逍遥、十年后是梅长苏”，因而得天独厚，得以潇洒肆意。</p><p></p></div><div><p></p><p>所以难得的，在同龄男明星随着年岁增长流露出“爹味”的时候，胡歌仍能流露出一种孩子气的天真，和洒脱的少年感。</p><p></p></div><div><p></p><p>二十年少、三十而立，近四十正少年。</p></div>', 0.6000);
INSERT INTO `lecturer` VALUES (1474410011724558337, '2021-12-25 00:02:13', '2021-12-25 00:02:13', 1, 1, 2021122423403946, 'CHEN', '18370093079', '18370093079@qq.com', NULL, '', '<div label-module=\"para\">张杰（Jason Zhang），1982年12月20日出生于四川省成都市，中国流行男歌手<sup>&nbsp;[1]</sup><a name=\"ref_[1]_4955404\">&nbsp;</a>&nbsp;。</div><div label-module=\"para\">2004年参加歌唱类选秀《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%88%91%E5%9E%8B%E6%88%91%E7%A7%80/232671\">我型我秀</a>》，获得全国总冠军并出道<sup>&nbsp;[2]</sup><a name=\"ref_[2]_4955404\">&nbsp;</a>&nbsp;。2007年参加歌唱类选秀《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BF%AB%E4%B9%90%E7%94%B7%E5%A3%B0/83949\">快乐男声</a>》，获得总决赛第四名；随后发行的EP《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9C%80%E7%BE%8E%E7%9A%84%E5%A4%AA%E9%98%B3/8248865\">最美的太阳</a>》拿下亚马逊年度唱片销量冠军<sup>&nbsp;[1]</sup><a name=\"ref_[1]_4955404\">&nbsp;</a>&nbsp;。2008年发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%98%8E%E5%A4%A9%E8%BF%87%E5%90%8E/28904\">明天过后</a>》，凭借该专辑获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8C%97%E4%BA%AC%E6%B5%81%E8%A1%8C%E9%9F%B3%E4%B9%90%E5%85%B8%E7%A4%BC/8880224\">北京流行音乐典礼</a>11项提名<sup>&nbsp;[3]</sup><a name=\"ref_[3]_4955404\">&nbsp;</a>&nbsp;。2010年发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%BF%99%EF%BC%8C%E5%B0%B1%E6%98%AF%E7%88%B1/14903451\">这，就是爱</a>》；同年获得韩国<a target=\"_blank\" href=\"https://baike.baidu.com/item/MAMA/3178282\">MAMA</a>亚洲最佳歌手奖<sup>&nbsp;[4]</sup><a name=\"ref_[4]_4955404\">&nbsp;</a>&nbsp;。2012年在人民大会堂开启个人首轮巡演<sup>&nbsp;[5]</sup><a name=\"ref_[5]_4955404\">&nbsp;</a>&nbsp;； 同年获得湖南省“五个一”工程奖<sup>&nbsp;[6]</sup><a name=\"ref_[6]_4955404\">&nbsp;</a>&nbsp;。2013年首次参加央视春晚，演唱歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BB%99%E6%88%91%E4%BD%A0%E7%9A%84%E7%88%B1/5095880\">给我你的爱</a>》<sup>&nbsp;[7]</sup><a name=\"ref_[7]_4955404\">&nbsp;</a>&nbsp;。<br></div>', 0.7000);
COMMIT;

-- ----------------------------
-- Table structure for lecturer_audit
-- ----------------------------
DROP TABLE IF EXISTS `lecturer_audit`;
CREATE TABLE `lecturer_audit` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `audit_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '审核状态(0:待审核,1:审核通过,2:审核不通过)',
  `audit_opinion` varchar(1024) DEFAULT NULL COMMENT '审核意见',
  `lecturer_user_no` bigint NOT NULL COMMENT '讲师用户编号',
  `lecturer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '讲师名称',
  `lecturer_mobile` char(11) NOT NULL DEFAULT '' COMMENT '讲师手机',
  `lecturer_email` varchar(100) NOT NULL DEFAULT '' COMMENT '讲师邮箱',
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `head_img_url` varchar(255) DEFAULT NULL COMMENT '头像',
  `introduce` varchar(2048) DEFAULT NULL COMMENT '简介',
  `lecturer_proportion` decimal(5,4) NOT NULL DEFAULT '0.0000' COMMENT '讲师分成比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='讲师信息-审核';

-- ----------------------------
-- Records of lecturer_audit
-- ----------------------------
BEGIN;
INSERT INTO `lecturer_audit` VALUES (1064776676173942786, '2018-11-20 15:06:36', '2018-11-20 15:06:36', 1, 1, 1, '1', 2018112015051635, '讲师', '13800138001', '297115770@qq.com', '', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/76a242408682477a9dcbe7c93bddc81a.jpeg', '<div><p>#百家故事#</p><p><br></p></div><div><p></p><p>胡歌曾经将电影《心灵捕手》看了好几遍。</p><p></p></div><div><p></p><p>影片中，马特·达蒙饰演的那位天才过目不忘，有着常人没有的天赋，却是问题少年。</p><p></p></div><div><p></p><p>挖掘他的人，认为他肯定可以做到一个令人望尘莫及的高度。但天才少年永远不愿意迈出他原本的、熟悉的那个圈子。</p><p></p></div><div><p></p><p>胡歌觉得，自己其实也有一点这样的性格。</p><p></p></div><div><p></p><p>出道17年、今天刚满39周岁，回顾胡歌的演艺之路，他一如既往地敏感、克制，对自我的审查异常严格。</p><p></p></div><div><p></p><p>胡歌似乎永远在反思，自己到底配得上大家的喜爱吗？</p><p></p></div><div><p></p><p>他是仙剑系列极少还没在现实成家的主角之一，被称为仙剑留守儿童。又因“十年前（2005年）是李逍遥、十年后是梅长苏”，因而得天独厚，得以潇洒肆意。</p><p></p></div><div><p></p><p>所以难得的，在同龄男明星随着年岁增长流露出“爹味”的时候，胡歌仍能流露出一种孩子气的天真，和洒脱的少年感。</p><p></p></div><div><p></p><p>二十年少、三十而立，近四十正少年。</p></div>', 0.6000);
INSERT INTO `lecturer_audit` VALUES (1474410011724558337, '2021-12-25 00:01:54', '2021-12-25 00:01:54', 1, 1, 0, '', 2021122423403946, 'CHEN', '18370093079', '18370093079@qq.com', NULL, 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/08ec97434a2741d39bcbed2833eb6cab.jpeg', '<div label-module=\"para\">张杰（Jason Zhang），1982年12月20日出生于四川省成都市，中国流行男歌手<sup>&nbsp;[1]</sup><a name=\"ref_[1]_4955404\">&nbsp;</a>&nbsp;。</div><div label-module=\"para\">2004年参加歌唱类选秀《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%88%91%E5%9E%8B%E6%88%91%E7%A7%80/232671\">我型我秀</a>》，获得全国总冠军并出道<sup>&nbsp;[2]</sup><a name=\"ref_[2]_4955404\">&nbsp;</a>&nbsp;。2007年参加歌唱类选秀《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BF%AB%E4%B9%90%E7%94%B7%E5%A3%B0/83949\">快乐男声</a>》，获得总决赛第四名；随后发行的EP《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9C%80%E7%BE%8E%E7%9A%84%E5%A4%AA%E9%98%B3/8248865\">最美的太阳</a>》拿下亚马逊年度唱片销量冠军<sup>&nbsp;[1]</sup><a name=\"ref_[1]_4955404\">&nbsp;</a>&nbsp;。2008年发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%98%8E%E5%A4%A9%E8%BF%87%E5%90%8E/28904\">明天过后</a>》，凭借该专辑获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8C%97%E4%BA%AC%E6%B5%81%E8%A1%8C%E9%9F%B3%E4%B9%90%E5%85%B8%E7%A4%BC/8880224\">北京流行音乐典礼</a>11项提名<sup>&nbsp;[3]</sup><a name=\"ref_[3]_4955404\">&nbsp;</a>&nbsp;。2010年发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%BF%99%EF%BC%8C%E5%B0%B1%E6%98%AF%E7%88%B1/14903451\">这，就是爱</a>》；同年获得韩国<a target=\"_blank\" href=\"https://baike.baidu.com/item/MAMA/3178282\">MAMA</a>亚洲最佳歌手奖<sup>&nbsp;[4]</sup><a name=\"ref_[4]_4955404\">&nbsp;</a>&nbsp;。2012年在人民大会堂开启个人首轮巡演<sup>&nbsp;[5]</sup><a name=\"ref_[5]_4955404\">&nbsp;</a>&nbsp;； 同年获得湖南省“五个一”工程奖<sup>&nbsp;[6]</sup><a name=\"ref_[6]_4955404\">&nbsp;</a>&nbsp;。2013年首次参加央视春晚，演唱歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BB%99%E6%88%91%E4%BD%A0%E7%9A%84%E7%88%B1/5095880\">给我你的爱</a>》<sup>&nbsp;[7]</sup><a name=\"ref_[7]_4955404\">&nbsp;</a>&nbsp;。<br></div>', 0.7000);
COMMIT;

-- ----------------------------
-- Table structure for lecturer_ext
-- ----------------------------
DROP TABLE IF EXISTS `lecturer_ext`;
CREATE TABLE `lecturer_ext` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `lecturer_user_no` bigint NOT NULL COMMENT '讲师用户编号',
  `total_income` decimal(11,2) NOT NULL COMMENT '总收入',
  `history_money` decimal(11,2) NOT NULL COMMENT '已提金额',
  `enable_balances` decimal(11,2) NOT NULL COMMENT '可提余额',
  `freeze_balances` decimal(11,2) NOT NULL COMMENT '冻结金额',
  `sign` char(32) NOT NULL COMMENT 'sign',
  `bank_card_no` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `bank_branch_name` varchar(255) DEFAULT NULL COMMENT '银行支行名称',
  `bank_user_name` varchar(255) DEFAULT NULL COMMENT '银行开户名',
  `bank_id_card_no` varchar(255) DEFAULT NULL COMMENT '银行身份证号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='讲师账户信息表';

-- ----------------------------
-- Records of lecturer_ext
-- ----------------------------
BEGIN;
INSERT INTO `lecturer_ext` VALUES (1064776676232663041, '2018-11-20 15:06:36', '2019-10-28 12:19:01', 1, 1, 2018112015051635, 58.51, 0.00, 58.51, 0.00, 'c7e1420ef86de758fb74de8b009d0898', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `lecturer_ext` VALUES (1474410011753918466, '2021-12-25 00:01:54', '2021-12-25 00:01:54', 1, 1, 2021122423403946, 0.00, 0.00, 0.00, 0.00, '9efe31d7fa72cd2108526b45c424912b', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for lecturer_profit
-- ----------------------------
DROP TABLE IF EXISTS `lecturer_profit`;
CREATE TABLE `lecturer_profit` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lecturer_user_no` bigint NOT NULL COMMENT '讲师用户编号',
  `bank_card_no` varchar(255) NOT NULL COMMENT '银行卡号',
  `bank_name` varchar(255) NOT NULL COMMENT '银行名称',
  `bank_branch_name` varchar(255) NOT NULL COMMENT '银行支行名称',
  `bank_user_name` varchar(255) NOT NULL COMMENT '银行开户名',
  `bank_id_card_no` varchar(255) NOT NULL COMMENT '银行身份证号',
  `lecturer_profit` decimal(11,2) DEFAULT NULL COMMENT '讲师收入',
  `platform_profit` decimal(11,2) DEFAULT NULL COMMENT '平台收入',
  `profit_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '分润状态（1确认中，2成功，3失败）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='讲师提现日志表';

-- ----------------------------
-- Records of lecturer_profit
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `msg_type` tinyint NOT NULL DEFAULT '1' COMMENT '短信类型(1系统消息,2其他)',
  `msg_title` varchar(255) NOT NULL COMMENT '短信标题',
  `msg_text` text COMMENT '短信内容',
  `is_time_send` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否定时发送（1是，0否）',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_send` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已发送(1是;0否)',
  `is_top` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶(1是;0否)',
  `back_remark` varchar(255) DEFAULT NULL COMMENT '后台备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='站内信息表';

-- ----------------------------
-- Records of msg
-- ----------------------------
BEGIN;
INSERT INTO `msg` VALUES (1103192777748422657, '2019-03-06 15:18:39', '2019-03-06 15:18:39', 1, 1, 1, '测试1', '<p>测试1<br /></p>', 0, NULL, 0, 0, NULL);
INSERT INTO `msg` VALUES (1103633181496246274, '2019-03-07 20:27:07', '2019-03-07 20:27:07', 1, 1, 1, '系统更新', '<p></p>\n<p>系统维护中!!!!!</p>\n<p></p>\n<p><br /></p>', 0, NULL, 0, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for msg_template
-- ----------------------------
DROP TABLE IF EXISTS `msg_template`;
CREATE TABLE `msg_template` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(1023) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='消息模板';

-- ----------------------------
-- Records of msg_template
-- ----------------------------
BEGIN;
INSERT INTO `msg_template` VALUES (1103634877106552834, '2019-03-07 20:33:52', '2019-03-07 20:33:52', 1, 1, '', '尊敬的{{name}}用户，您有一个{{courseName}}课程抵用券即将过期');
COMMIT;

-- ----------------------------
-- Table structure for msg_user
-- ----------------------------
DROP TABLE IF EXISTS `msg_user`;
CREATE TABLE `msg_user` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `msg_id` bigint NOT NULL COMMENT '短信ID',
  `user_no` bigint NOT NULL DEFAULT '0' COMMENT '用户编号',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `msg_type` tinyint NOT NULL DEFAULT '1' COMMENT '短信类型(1系统消息,2其他)',
  `msg_title` varchar(255) NOT NULL COMMENT '短信标题',
  `is_read` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否阅读(1是;0否)',
  `is_top` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶(1是;0否)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='站内信用户记录表';

-- ----------------------------
-- Records of msg_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for nav_bar
-- ----------------------------
DROP TABLE IF EXISTS `nav_bar`;
CREATE TABLE `nav_bar` (
  `id` bigint NOT NULL DEFAULT '0' COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `nav_title` varchar(255) DEFAULT NULL COMMENT '导航标题',
  `nav_url` varchar(255) DEFAULT NULL COMMENT '导航url',
  `target` varchar(255) DEFAULT NULL COMMENT '跳转方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='头部导航';

-- ----------------------------
-- Records of nav_bar
-- ----------------------------
BEGIN;
INSERT INTO `nav_bar` VALUES (1064696486139854849, '2018-11-20 09:47:57', '2018-11-20 09:47:57', 1, 5, '首页', '/index', '_self');
INSERT INTO `nav_bar` VALUES (1064696486139854850, '2018-11-07 17:09:32', '2018-11-07 17:09:32', 1, 4, '课程中心', '/list', '_self');
INSERT INTO `nav_bar` VALUES (1064696486139854851, '2019-01-16 15:49:36', '2019-01-16 15:49:36', 1, 3, '讲师招募', '/recruit', '_self');
INSERT INTO `nav_bar` VALUES (1085443582223257602, '2019-01-16 15:49:36', '2019-01-16 15:49:36', 1, 2, '最新资讯', '/terrace/1248904685884661762', '_blank');
COMMIT;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `lecturer_user_no` bigint NOT NULL COMMENT '讲师用户编号',
  `lecturer_name` varchar(50) NOT NULL COMMENT '讲师名称',
  `user_no` bigint NOT NULL COMMENT '用户编号',
  `mobile` varchar(11) NOT NULL COMMENT '用户电话',
  `register_time` datetime DEFAULT NULL COMMENT '用户注册时间',
  `order_no` bigint NOT NULL COMMENT '订单号',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT '课程ID',
  `course_name` varchar(50) NOT NULL COMMENT '课程名称',
  `price_payable` decimal(11,2) DEFAULT NULL COMMENT '应付金额',
  `price_discount` decimal(11,2) DEFAULT NULL COMMENT '优惠金额',
  `price_paid` decimal(11,2) DEFAULT NULL COMMENT '实付金额',
  `platform_profit` decimal(11,2) DEFAULT NULL COMMENT '平台收入',
  `lecturer_profit` decimal(11,2) DEFAULT NULL COMMENT '讲师收入',
  `trade_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '交易类型：1线上支付，2线下支付',
  `pay_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付方式：1微信支付，2支付宝支付',
  `channel_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '购买渠道：1web',
  `order_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态：1待支付，2成功支付，3支付失败，4已关闭',
  `is_show_lecturer` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示给讲师(1是，0否)',
  `is_show_user` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示给用户看(1是，0否)',
  `remark_cus` varchar(255) DEFAULT NULL COMMENT '客户备注',
  `remark` varchar(255) DEFAULT NULL COMMENT '后台备注',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单信息表';

-- ----------------------------
-- Records of order_info
-- ----------------------------
BEGIN;
INSERT INTO `order_info` VALUES (1534926152815173634, '2022-06-09 23:51:27', '2022-06-09 23:51:27', 2018112015051635, '讲师', 2021122423403946, '18370093079', '2021-12-24 23:40:39', 20220609235127546, 1474013547238285313, 'Java 基础', 9.90, 0.00, 9.90, 3.96, 5.94, 1, 1, 1, 2, 1, 1, '', NULL, '2022-06-09 15:51:28');
COMMIT;

-- ----------------------------
-- Table structure for order_pay
-- ----------------------------
DROP TABLE IF EXISTS `order_pay`;
CREATE TABLE `order_pay` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `order_no` bigint NOT NULL COMMENT '订单号',
  `serial_number` bigint NOT NULL DEFAULT '0' COMMENT '流水号',
  `order_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态：1待支付，2成功支付，3支付失败，4已关闭，5已退款, 6订单解绑',
  `pay_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付方式：1微信支付，2支付宝支付，3积分支付，4手工录单',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单支付信息表';

-- ----------------------------
-- Records of order_pay
-- ----------------------------
BEGIN;
INSERT INTO `order_pay` VALUES (1534926152848728066, '2022-06-09 23:51:27', 20220609235127546, 202206092351273836, 2, 1, '2022-06-09 15:51:28');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `client_id` char(34) NOT NULL DEFAULT '' COMMENT '客户端ID',
  `client_secret` char(32) NOT NULL DEFAULT '' COMMENT '客户端密匙',
  `client_name` varchar(50) NOT NULL DEFAULT '' COMMENT '客户端名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='平台信息';

-- ----------------------------
-- Records of platform
-- ----------------------------
BEGIN;
INSERT INTO `platform` VALUES (1013992693696151553, '2018-07-03 11:48:46', '2018-07-03 11:48:46', 1, 1, 'lkb65617f842ad4c37895a733b8de43cbb', '16525ad4b35842679c17806ee86639a2', '在线学习', '演示系统');
COMMIT;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` bigint unsigned NOT NULL COMMENT '主键',
  `parent_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `level` int unsigned NOT NULL DEFAULT '0' COMMENT '级别',
  `province_code` varchar(9) NOT NULL DEFAULT '' COMMENT '区域编码（国标）',
  `center_lng` decimal(12,9) NOT NULL COMMENT '中心经度',
  `center_lat` decimal(12,9) NOT NULL COMMENT '中心维度',
  `province_id` int NOT NULL COMMENT '省Id',
  `province_name` varchar(50) NOT NULL COMMENT '省名称',
  `city_id` int NOT NULL COMMENT '市Id',
  `city_code` varchar(50) NOT NULL DEFAULT '' COMMENT '城市编码',
  `city_name` varchar(50) NOT NULL DEFAULT '' COMMENT '市名称',
  `region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '区域名称',
  `district_name` varchar(50) NOT NULL DEFAULT '' COMMENT '区名称',
  `merger_name` varchar(100) NOT NULL DEFAULT '' COMMENT '全路径名称',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='行政区域表';

-- ----------------------------
-- Records of region
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for send_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `send_sms_log`;
CREATE TABLE `send_sms_log` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `template` varchar(36) NOT NULL COMMENT '短信模板',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `sms_code` varchar(12) NOT NULL COMMENT '验证码',
  `is_success` tinyint NOT NULL DEFAULT '0' COMMENT '是否发送成功(1发送成功，0:发送失败)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户发送短信日志';

-- ----------------------------
-- Records of send_sms_log
-- ----------------------------
BEGIN;
INSERT INTO `send_sms_log` VALUES (106542293996261781, '2019-08-15 10:52:30', 'SMS_59740002', '13800138001', '561143', 0);
INSERT INTO `send_sms_log` VALUES (1065422939962617857, '2019-08-15 10:52:30', 'SMS_59740002', '13800138001', '231155', 0);
INSERT INTO `send_sms_log` VALUES (1474008682781003778, '2021-12-23 21:27:10', 'SMS_190266483', '18370093079', '940697', 0);
INSERT INTO `send_sms_log` VALUES (1474008691551293442, '2021-12-23 21:27:12', 'SMS_190266483', '18370093079', '367526', 0);
INSERT INTO `send_sms_log` VALUES (1474008700195753986, '2021-12-23 21:27:14', 'SMS_190266483', '18370093079', '479083', 0);
INSERT INTO `send_sms_log` VALUES (1474008705572851714, '2021-12-23 21:27:15', 'SMS_190266483', '18370093079', '944988', 0);
INSERT INTO `send_sms_log` VALUES (1474008705572851715, '2021-12-23 21:27:15', 'SMS_190266483', '18370093079', '518969', 0);
INSERT INTO `send_sms_log` VALUES (1474008705585434626, '2021-12-23 21:27:15', 'SMS_190266483', '18370093079', '098143', 0);
INSERT INTO `send_sms_log` VALUES (1474008781766578177, '2021-12-23 21:27:33', 'SMS_190266483', '18370093079', '412742', 0);
INSERT INTO `send_sms_log` VALUES (1474008815241318402, '2021-12-23 21:27:41', 'SMS_190266483', '18370093079', '364890', 0);
INSERT INTO `send_sms_log` VALUES (1474008860938260481, '2021-12-23 21:27:52', 'SMS_190266483', '18370093079', '589024', 0);
INSERT INTO `send_sms_log` VALUES (1474009918313910274, '2021-12-23 21:32:04', 'SMS_190266483', '18370093079', '160574', 0);
INSERT INTO `send_sms_log` VALUES (1474396253004550146, '2021-12-24 23:07:14', 'SMS_190266483', '18370093079', '975308', 0);
INSERT INTO `send_sms_log` VALUES (1474404559120969730, '2021-12-24 23:40:14', 'SMS_190266483', '18370093079', '744807', 1);
INSERT INTO `send_sms_log` VALUES (1474409680382930945, '2021-12-25 00:00:35', 'SMS_190266483', '18370093079', '948424', 1);
INSERT INTO `send_sms_log` VALUES (1474945225100132354, '2021-12-26 11:28:39', 'SMS_190266483', '18370093078', '690893', 1);
INSERT INTO `send_sms_log` VALUES (1474945903646244865, '2021-12-26 11:31:21', 'SMS_190266483', '18370093077', '084993', 1);
INSERT INTO `send_sms_log` VALUES (1474982391188586498, '2021-12-26 13:56:20', 'SMS_190266483', '18370093076', '366718', 1);
INSERT INTO `send_sms_log` VALUES (1502851588560044033, '2022-03-13 11:38:35', 'SMS_190266483', '18370090001', '988989', 1);
INSERT INTO `send_sms_log` VALUES (1509477858706219010, '2022-03-31 18:29:00', 'SMS_190266483', '18370093076', '674180', 0);
INSERT INTO `send_sms_log` VALUES (1509478005083234306, '2022-03-31 18:29:35', 'SMS_190266483', '18370093078', '769908', 1);
INSERT INTO `send_sms_log` VALUES (1509478007176192002, '2022-03-31 18:29:36', 'SMS_190266483', '18370093078', '640225', 1);
INSERT INTO `send_sms_log` VALUES (1509478579941957634, '2022-03-31 18:31:52', 'SMS_190266483', '18370093070', '725741', 1);
INSERT INTO `send_sms_log` VALUES (1509520701470564354, '2022-03-31 21:19:15', 'SMS_190266483', '18370093079', '756829', 0);
INSERT INTO `send_sms_log` VALUES (1509520711041966081, '2022-03-31 21:19:17', 'SMS_190266483', '18370093079', '163975', 0);
INSERT INTO `send_sms_log` VALUES (1509520855342800897, '2022-03-31 21:19:52', 'SMS_190266483', '18370093070', '312092', 0);
INSERT INTO `send_sms_log` VALUES (1509520895834611713, '2022-03-31 21:20:01', 'SMS_190266483', '18370093071', '444190', 0);
INSERT INTO `send_sms_log` VALUES (1509521484060602369, '2022-03-31 21:22:22', 'SMS_190266483', '18370093071', '018172', 0);
INSERT INTO `send_sms_log` VALUES (1509521679318036482, '2022-03-31 21:23:08', 'SMS_190266483', '18370093071', '225728', 0);
INSERT INTO `send_sms_log` VALUES (1520576205756166145, '2022-05-01 09:29:53', 'SMS_190266483', '18002577506', '097553', 1);
INSERT INTO `send_sms_log` VALUES (1520576570987769858, '2022-05-01 09:31:20', 'SMS_190266483', '18002577506', '324643', 1);
INSERT INTO `send_sms_log` VALUES (1520577213982937090, '2022-05-01 09:33:53', 'SMS_190266483', '18002577506', '705709', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys
-- ----------------------------
DROP TABLE IF EXISTS `sys`;
CREATE TABLE `sys` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `video_type` tinyint NOT NULL DEFAULT '1' COMMENT '视频存储平台（1保利威视，2七牛）',
  `polyv_useid` varchar(512) DEFAULT NULL COMMENT 'useid',
  `polyv_writetoken` varchar(255) DEFAULT NULL COMMENT 'writetoken',
  `polyv_readtoken` varchar(255) DEFAULT NULL COMMENT 'readtoken',
  `polyv_secretkey` varchar(255) DEFAULT NULL COMMENT 'secretkey',
  `file_type` tinyint NOT NULL DEFAULT '1' COMMENT '文件存储类型（1阿里云，2七牛）',
  `aliyun_access_key_id` varchar(255) DEFAULT NULL COMMENT 'access_key_id',
  `aliyun_access_key_secret` varchar(255) DEFAULT NULL COMMENT 'access_key_secret',
  `aliyun_oss_url` varchar(255) DEFAULT NULL COMMENT 'oss_url',
  `aliyun_oss_bucket` varchar(255) DEFAULT NULL COMMENT 'oss_bucket',
  `aliyun_oss_endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint（地域节点）',
  `aliyun_oas_vault` varchar(255) DEFAULT NULL COMMENT 'oas_vault',
  `pay_type` tinyint NOT NULL DEFAULT '1' COMMENT '支付通道（1龙果支付，2其他）',
  `pay_url` varchar(255) DEFAULT NULL COMMENT '支付请求',
  `pay_key` varchar(255) DEFAULT NULL COMMENT 'roncoo_key',
  `pay_secret` varchar(255) DEFAULT NULL COMMENT 'roncoo_secret',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `sms_code` varchar(50) DEFAULT NULL COMMENT 'sms_code',
  `sign_name` varchar(255) DEFAULT NULL COMMENT '短信签名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of sys
-- ----------------------------
BEGIN;
INSERT INTO `sys` VALUES (1, '2021-12-29 01:00:00', '1899-12-30 01:00:00', 1, 1, 1, '******', '******', '******', '******', 1, 'LTAI5tEaip5YYGHpK4TFV4ut', 'KxMdqBqAv3s1jYeNeWhKwdUEoA0RYD', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/', 'cllearning', 'oss-cn-shenzhen.aliyuncs.com', '', 1, '******', '******', '******', '******', 'SMS_190266483', '搜房网');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint unsigned NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_no` bigint unsigned NOT NULL DEFAULT '0' COMMENT '操作人',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `ip` varchar(255) DEFAULT '' COMMENT 'IP地址',
  `operation` varchar(255) DEFAULT '' COMMENT '用户操作',
  `method` varchar(255) DEFAULT '' COMMENT '请求方法',
  `path` varchar(255) DEFAULT '' COMMENT '请求路径',
  `content` varchar(5000) DEFAULT '' COMMENT '请求参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='后台操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `parent_id` bigint unsigned NOT NULL COMMENT '父ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT '' COMMENT '路由路径',
  `api_url` varchar(255) DEFAULT '' COMMENT '接口URL',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `menu_type` tinyint NOT NULL DEFAULT '1' COMMENT '菜单类型(1：目录   2：菜单   3：按钮)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1261195709403193347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='菜单信息';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1153478139284656129, '2019-07-23 09:33:11', '2019-07-23 09:33:11', 1, 10, 0, '常用功能', 'order', '', NULL, '订单管理', 1);
INSERT INTO `sys_menu` VALUES (1153478416205189122, '2019-07-23 09:34:17', '2019-07-23 09:34:17', 1, 9, 0, '首页管理', 'homepage', '', NULL, '首页管理', 1);
INSERT INTO `sys_menu` VALUES (1153478559176429569, '2019-07-23 09:34:51', '2019-07-23 09:34:51', 1, 8, 0, '课程管理', 'course', '', NULL, '课程管理', 1);
INSERT INTO `sys_menu` VALUES (1153478694937661442, '2019-07-23 09:35:23', '2019-07-23 09:35:23', 1, 7, 0, '讲师管理', 'lecturer', '', NULL, '讲师管理', 1);
INSERT INTO `sys_menu` VALUES (1153478801917579265, '2019-07-23 09:35:49', '2019-07-23 09:35:49', 1, 6, 0, '学员管理', 'user', '', NULL, '学员管理', 1);
INSERT INTO `sys_menu` VALUES (1153493010483089409, '2019-07-23 10:32:17', '2019-07-23 10:32:17', 1, 2, 1153478139284656129, '课程订单', '/order/orderInfo', '/course/pc/order/info/list', NULL, '订单列表', 2);
INSERT INTO `sys_menu` VALUES (1153493835884367873, '2019-07-23 10:35:33', '2019-07-23 10:35:33', 1, 8, 1153478416205189122, '轮播管理', '/homepage/adv/pc', '/course/pc/adv/list', NULL, 'PC端设置', 2);
INSERT INTO `sys_menu` VALUES (1153494438295474177, '2019-07-23 10:37:57', '2019-07-23 10:37:57', 1, 9, 1153478416205189122, '专区管理', '/homepage/zone/pc', '/course/pc/zone/list', NULL, 'PC端设置', 2);
INSERT INTO `sys_menu` VALUES (1153494935626682369, '2019-07-23 10:39:56', '2019-07-23 10:39:56', 1, 10, 1153478416205189122, '头部导航', '/homepage/website/navBar', '/system/pc/nav/bar/list', NULL, '头部导航列表接口', 2);
INSERT INTO `sys_menu` VALUES (1153495031810461697, '2019-07-23 10:40:18', '2019-07-23 10:40:18', 1, 7, 1153478416205189122, '底部文章', '/homepage/website/websiteNav', '/system/pc/website/nav/list', NULL, '底部导航', 2);
INSERT INTO `sys_menu` VALUES (1153495155055890433, '2019-07-23 10:40:48', '2019-07-23 10:40:48', 1, 6, 1153478416205189122, '友情链接', '/homepage/website/websiteLink', '/system/pc/website/link/list', NULL, '友情链接', 2);
INSERT INTO `sys_menu` VALUES (1153495948102307842, '2019-07-23 10:43:57', '2019-07-23 10:43:57', 1, 3, 1153478559176429569, '课程列表', '/course/course/course', '/course/pc/course/list', NULL, '课程列表', 2);
INSERT INTO `sys_menu` VALUES (1153496094022144002, '2019-07-23 10:44:32', '2019-07-23 10:44:32', 1, 2, 1153478559176429569, '课程审核', '/course/course/audit', '/course/pc/course/audit/list', NULL, '课程审核列表', 2);
INSERT INTO `sys_menu` VALUES (1153496241066053634, '2019-07-23 10:45:07', '2019-07-23 10:45:07', 1, 1, 1153478559176429569, '分类管理', '/course/category/category', '/course/pc/course/category/list', NULL, '分类列表', 2);
INSERT INTO `sys_menu` VALUES (1153496795896975361, '2019-07-23 10:47:19', '2019-07-23 10:47:19', 1, 3, 1153478694937661442, '讲师列表', '/lecturer/lecturer/lecturer', '/user/pc/lecturer/list', NULL, '讲师列表', 2);
INSERT INTO `sys_menu` VALUES (1153497106191585282, '2019-07-23 10:48:33', '2019-07-23 10:48:33', 1, 2, 1153478694937661442, '讲师审核', '/lecturer/lecturer/audit', '/user/pc/lecturer/audit/list', NULL, '讲师审核列表', 2);
INSERT INTO `sys_menu` VALUES (1153497221941792770, '2019-07-23 10:49:01', '2019-07-23 10:49:01', 1, 1, 1153478694937661442, '分润列表', '/lecturer/profit/profit', '/user/pc/lecturer/profit/list', NULL, '分润列表', 2);
INSERT INTO `sys_menu` VALUES (1153498121905213442, '2019-07-23 10:52:35', '2019-07-23 10:52:35', 1, 1, 0, '权限管理', '/pms', '', NULL, '权限管理', 1);
INSERT INTO `sys_menu` VALUES (1153498480237187073, '2019-07-23 10:54:01', '2019-07-23 10:54:01', 1, 5, 0, '站点管理', '/website', '', NULL, '站点管理', 1);
INSERT INTO `sys_menu` VALUES (1153498652677607425, '2019-07-23 10:54:42', '2019-07-23 10:54:42', 1, 2, 0, '平台管理', '/platform', '', NULL, '平台管理', 1);
INSERT INTO `sys_menu` VALUES (1153498940276838401, '2019-07-23 10:55:50', '2019-07-23 10:55:50', 1, 3, 1153498121905213442, '用户管理', '/sys/pms/user', '/system/pc/sys/user/list', NULL, '用户管理', 2);
INSERT INTO `sys_menu` VALUES (1153499292782923778, '2019-07-23 10:57:14', '2019-07-23 10:57:14', 1, 2, 1153498121905213442, '角色管理', '/sys/pms/role', '/system/pc/sys/role/list', NULL, '角色管理', 2);
INSERT INTO `sys_menu` VALUES (1153499423880089601, '2019-07-23 10:57:46', '2019-07-23 10:57:46', 1, 1, 1153498121905213442, '菜单管理', '/sys/pms/menu', '/system/pc/menu/list', NULL, '菜单管理', 2);
INSERT INTO `sys_menu` VALUES (1153500580878848001, '2019-07-23 11:02:21', '2019-07-23 11:02:21', 1, 5, 1153498480237187073, '站点设置', '/sys/website/website', '/system/pc/website/view', NULL, '站点设置', 2);
INSERT INTO `sys_menu` VALUES (1153500772986359810, '2019-07-23 11:03:07', '2019-07-23 11:03:07', 1, 2, 1153498480237187073, '系统设置', '/sys/website/sys', '/system/pc/sys/view', NULL, '系统设置', 2);
INSERT INTO `sys_menu` VALUES (1153501173945044993, '2019-07-23 11:04:43', '2019-07-23 11:04:43', 1, 1, 1153498652677607425, '应用管理', '/sys/platform/platform', '/user/pc/platform/list', NULL, '应用管理', 2);
INSERT INTO `sys_menu` VALUES (1154683387156230146, '2019-07-26 17:22:25', '2019-07-26 17:22:25', 1, 1, 1153493010483089409, '订单查看', '', '/course/pc/order/info/view', NULL, '订单查看', 3);
INSERT INTO `sys_menu` VALUES (1154683761573359618, '2019-07-26 17:23:54', '2019-07-26 17:23:54', 1, 1, 1153493010483089409, '统计订单收入情况', '', '/course/pc/order/info/statistical', NULL, NULL, 3);
INSERT INTO `sys_menu` VALUES (1156030262547324930, '2019-07-30 10:34:26', '2019-07-30 10:34:26', 1, 1, 1153493835884367873, '添加', '', '/course/pc/adv/add', NULL, '跳添加页面弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156030361037971458, '2019-07-30 10:34:49', '2019-07-30 10:34:49', 1, 1, 1153493835884367873, '保存', '', '/course/pc/adv/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156030992003899394, '2019-07-30 10:37:20', '2019-07-30 10:37:20', 1, 1, 1153493835884367873, '更新', '', '/course/pc/adv/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156032108988997634, '2019-07-30 10:41:46', '2019-07-30 10:41:46', 1, 1, 1153494438295474177, '添加', '', '/course/pc/zone/add', NULL, '添加页面', 3);
INSERT INTO `sys_menu` VALUES (1156032296088510465, '2019-07-30 10:42:31', '2019-07-30 10:42:31', 1, 1, 1153494438295474177, '保存', '', '/course/pc/zone/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156032474489036801, '2019-07-30 10:43:13', '2019-07-30 10:43:13', 1, 1, 1153494438295474177, '删除', '', '/course/pc/zone/delete', NULL, '删除', 3);
INSERT INTO `sys_menu` VALUES (1156033449756991490, '2019-07-30 10:47:06', '2019-07-30 10:47:06', 1, 1, 1153494438295474177, '修改', '', '/course/pc/zone/view', NULL, '修改页面', 3);
INSERT INTO `sys_menu` VALUES (1156033853009960961, '2019-07-30 10:48:42', '2019-07-30 10:48:42', 1, 1, 1153494438295474177, '更新', '', '/course/pc/zone/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156035023040421889, '2019-07-30 10:53:21', '2019-07-30 10:53:21', 1, 1, 1153494438295474177, '专区课程', NULL, '/course/pc/zone/course/list', NULL, '专区课程新窗口打开', 3);
INSERT INTO `sys_menu` VALUES (1156035443800416257, '2019-07-30 10:55:01', '2019-07-30 10:55:01', 1, 1, 1156035023040421889, '添加', '', '/course/pc/course/list', NULL, '添加课程列出接口', 3);
INSERT INTO `sys_menu` VALUES (1156035689204948994, '2019-07-30 10:56:00', '2019-07-30 10:56:00', 1, 1, 1156035023040421889, '保存', '', '/course/pc/zone/course/save', NULL, '保存添加', 3);
INSERT INTO `sys_menu` VALUES (1156036045850812417, '2019-07-30 10:57:25', '2019-07-30 10:57:25', 1, 1, 1156035023040421889, '删除', '', '/course/pc/zone/course/delete', NULL, '专区课程删除接口', 3);
INSERT INTO `sys_menu` VALUES (1156036539059019777, '2019-07-30 10:59:22', '2019-07-30 10:59:22', 1, 1, 1156035023040421889, '修改', '', '/course/pc/zone/course/edit', NULL, '修改弹窗页面', 3);
INSERT INTO `sys_menu` VALUES (1156036653299277825, '2019-07-30 10:59:49', '2019-07-30 10:59:49', 1, 1, 1156035023040421889, '更新', '', '/course/pc/zone/course/update', NULL, '专区课程接口', 3);
INSERT INTO `sys_menu` VALUES (1156036831607529473, '2019-07-30 11:00:32', '2019-07-30 11:00:32', 1, 1, 1153493835884367873, '修改', '', '/course/pc/adv/edit', NULL, '修改页面弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156037020263129089, '2019-07-30 11:01:17', '2019-07-30 11:01:17', 1, 1, 1153493835884367873, '删除', '', '/course/pc/adv/delete', NULL, '删除接口', 3);
INSERT INTO `sys_menu` VALUES (1156039623340466178, '2019-07-30 11:11:38', '2019-07-30 11:11:38', 1, 1, 1153494935626682369, '添加', '', '/system/pc/nav/bar/add', NULL, '添加弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156039959035781122, '2019-07-30 11:12:58', '2019-07-30 11:12:58', 1, 1, 1153494935626682369, '保存', '', '/system/pc/nav/bar/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156040289144283137, '2019-07-30 11:14:16', '2019-07-30 11:14:16', 1, 1, 1153494935626682369, '删除', '', '/system/pc/nav/bar/delete', NULL, '删除接口', 3);
INSERT INTO `sys_menu` VALUES (1156040630476742658, '2019-07-30 11:15:38', '2019-07-30 11:15:38', 1, 1, 1153494935626682369, '修改', '', '/system/pc/nav/bar/edit', NULL, '修改弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156040868612546562, '2019-07-30 11:16:34', '2019-07-30 11:16:34', 1, 1, 1153494935626682369, '更新', '', '/system/pc/nav/bar/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156041685298061313, '2019-07-30 11:19:49', '2019-07-30 11:19:49', 1, 7, 1153495031810461697, '添加', '', '/system/pc/website/nav/add', NULL, '添加弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156042299306418177, '2019-07-30 11:22:16', '2019-07-30 11:22:16', 1, 6, 1153495031810461697, '保存', '', '/system/pc/website/nav/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156042595428474882, '2019-07-30 11:23:26', '2019-07-30 11:23:26', 1, 5, 1153495031810461697, '删除', '', '/system/pc/website/nav/delete', NULL, '删除', 3);
INSERT INTO `sys_menu` VALUES (1156043168856940545, '2019-07-30 11:25:43', '2019-07-30 11:25:43', 1, 4, 1153495031810461697, '修改', '', '/system/pc/website/nav/edit', NULL, '修改弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156043234770427905, '2019-07-30 11:25:59', '2019-07-30 11:25:59', 1, 3, 1153495031810461697, '更新', '', '/system/pc/website/nav/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156045293838147585, '2019-07-30 11:34:10', '2019-07-30 11:34:10', 1, 2, 1153495031810461697, '文章管理', NULL, '/system/pc/website/nav/article/view', NULL, '文章管理新窗口', 3);
INSERT INTO `sys_menu` VALUES (1156099141575385090, '2019-07-30 15:08:08', '2019-07-30 15:08:08', 1, 1, 1153495155055890433, '添加', '', '/system/pc/website/link/add', NULL, '添加弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156099301554528257, '2019-07-30 15:08:46', '2019-07-30 15:08:46', 1, 1, 1153495155055890433, '保存', '', '/system/pc/website/link/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156099420307857410, '2019-07-30 15:09:14', '2019-07-30 15:09:14', 1, 1, 1153495155055890433, '删除', '', '/system/pc/website/link/delete', NULL, '删除接口', 3);
INSERT INTO `sys_menu` VALUES (1156099620929806338, '2019-07-30 15:10:02', '2019-07-30 15:10:02', 1, 1, 1153495155055890433, '修改', '', '/system/pc/website/link/edit', NULL, '修改弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156099736667430914, '2019-07-30 15:10:30', '2019-07-30 15:10:30', 1, 1, 1153495155055890433, '更新', '', '/system/pc/website/link/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156102063474352129, '2019-07-30 15:19:44', '2019-07-30 15:19:44', 1, 1, 1153495948102307842, '修改', '', '/course/pc/course/get', NULL, '修改弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156102212472807425, '2019-07-30 15:20:20', '2019-07-30 15:20:20', 1, 1, 1153495948102307842, '更新', '', '/course/pc/course/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156106290552643585, '2019-07-30 15:36:32', '2019-07-30 15:36:32', 1, 1, 1153496094022144002, '修改、审核', '', '/course/pc/course/audit/view', NULL, '修改、弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156106778274701314, '2019-07-30 15:38:29', '2019-07-30 15:38:29', 1, 1, 1153496094022144002, '审核课程', '', '/course/pc/course/audit/audit', NULL, '审核课程', 3);
INSERT INTO `sys_menu` VALUES (1156106947468730369, '2019-07-30 15:39:09', '2019-07-30 15:39:09', 1, 1, 1153496094022144002, '更新', '', '/course/pc/course/audit/update', NULL, '更新', 3);
INSERT INTO `sys_menu` VALUES (1156389609588662274, '2019-07-31 10:22:21', '2019-07-31 10:22:21', 1, 1, 1153496241066053634, '添加', '', '/course/pc/course/category/add', NULL, '添加弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156389834885701634, '2019-07-31 10:23:15', '2019-07-31 10:23:15', 1, 1, 1153496241066053634, '保存', '', '/course/pc/course/category/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156390300390531073, '2019-07-31 10:25:06', '2019-07-31 10:25:06', 1, 1, 1153496241066053634, '修改', '', '/course/pc/course/category/view', NULL, '修改弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156390387736911873, '2019-07-31 10:25:26', '2019-07-31 10:25:26', 1, 1, 1153496241066053634, '更新', '', '/course/pc/course/category/update', NULL, '更新', 3);
INSERT INTO `sys_menu` VALUES (1156390708198514689, '2019-07-31 10:26:43', '2019-07-31 10:26:43', 1, 1, 1153496241066053634, '删除', '', '/course/pc/course/category/delete', NULL, '删除', 3);
INSERT INTO `sys_menu` VALUES (1156393404230017026, '2019-07-31 10:37:26', '2019-07-31 10:37:26', 1, 1, 1153496795896975361, '修改', '', '/user/pc/lecturer/view', NULL, '修改、查看、设置分成弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156393596735987714, '2019-07-31 10:38:11', '2019-07-31 10:38:11', 1, 1, 1153496795896975361, '更新', '', '/user/pc/lecturer/update', NULL, '更新', 3);
INSERT INTO `sys_menu` VALUES (1156394505545195522, '2019-07-31 10:41:48', '2019-07-31 10:41:48', 1, 1, 1153497106191585282, '添加', '', '/user/pc/lecturer/audit/add', NULL, '添加弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156395045071101953, '2019-07-31 10:43:57', '2019-07-31 10:43:57', 1, 1, 1153497106191585282, '保存', '', '/user/pc/lecturer/audit/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156395484629966849, '2019-07-31 10:45:42', '2019-07-31 10:45:42', 1, 1, 1153497106191585282, '修改', '', '/user/pc/lecturer/audit/view', NULL, '修改、查看弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156395794031190017, '2019-07-31 10:46:55', '2019-07-31 10:46:55', 1, 1, 1153497106191585282, '校验讲师是否存在', '', '/user/pc/lecturer/audit/check', NULL, '校验讲师是否存在', 3);
INSERT INTO `sys_menu` VALUES (1156395965360119810, '2019-07-31 10:47:36', '2019-07-31 10:47:36', 1, 1, 1153497106191585282, '更新', '', '/user/pc/lecturer/audit/update', NULL, '更新弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156396502923091970, '2019-07-31 10:49:44', '2019-07-31 10:49:44', 1, 1, 1153497106191585282, '审核页面', '', '/user/pc/lecturer/audit/isAudit', NULL, '审核弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156396635052056577, '2019-07-31 10:50:16', '2019-07-31 10:50:16', 1, 1, 1153497106191585282, '审核更新', '', '/user/pc/lecturer/audit/audit', NULL, '审核更新', 3);
INSERT INTO `sys_menu` VALUES (1156452734279098369, '2019-07-31 14:33:11', '2019-07-31 14:33:11', 1, 1, 1153497221941792770, '批量标记为已打款', '', '/user/pc/lecturer/profit/batch', NULL, '批量标记为已打款', 3);
INSERT INTO `sys_menu` VALUES (1156453190803922945, '2019-07-31 14:35:00', '2019-07-31 14:35:00', 1, 1, 1153497221941792770, '打款跳页面', '', '/user/pc/lecturer/profit/edit', NULL, '打款跳页面', 3);
INSERT INTO `sys_menu` VALUES (1156453747622944769, '2019-07-31 14:37:13', '2019-07-31 14:37:13', 1, 1, 1153497221941792770, '更新讲师打款状态', '', '/user/pc/lecturer/profit/update', NULL, '更新讲师打款状态', 3);
INSERT INTO `sys_menu` VALUES (1156467834150985729, '2019-07-31 15:33:11', '2019-07-31 15:33:11', 1, 1, 1153498940276838401, '添加', '', '/system/pc/sys/user/add', NULL, '添加弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156467976803459073, '2019-07-31 15:33:45', '2019-07-31 15:33:45', 1, 1, 1153498940276838401, '保存', '', '/system/pc/sys/user/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156468115706224642, '2019-07-31 15:34:18', '2019-07-31 15:34:18', 1, 1, 1153498940276838401, '删除', '', '/system/pc/sys/user/delete', NULL, '删除接口', 3);
INSERT INTO `sys_menu` VALUES (1156471160762540033, '2019-07-31 15:46:24', '2019-07-31 15:46:24', 1, 1, 1153498940276838401, '修改', '', '/system/pc/sys/user/view', NULL, '修改弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156471428245889026, '2019-07-31 15:47:28', '2019-07-31 15:47:28', 1, 1, 1153498940276838401, '更新', '', '/system/pc/sys/user/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156471546990829570, '2019-07-31 15:47:56', '2019-07-31 15:47:56', 1, 1, 1153498940276838401, '更新密码弹窗', '', '/system/pc/sys/user/password', NULL, '更新密码弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156471749651210241, '2019-07-31 15:48:45', '2019-07-31 15:48:45', 1, 1, 1153498940276838401, '更新密码', '', '/system/pc/sys/user/update/password', NULL, '更新密码接口', 3);
INSERT INTO `sys_menu` VALUES (1156472210034794497, '2019-07-31 15:50:34', '2019-07-31 15:50:34', 1, 1, 1153498940276838401, '设置角色', '', '/system/pc/sys/role/list', NULL, '设置角色弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156472470257803266, '2019-07-31 15:51:36', '2019-07-31 15:51:36', 1, 1, 1153498940276838401, '保存用户角色', '', '/system/pc/sys/role/user/save', NULL, '保存用户角色接口', 3);
INSERT INTO `sys_menu` VALUES (1156472761619324929, '2019-07-31 15:52:46', '2019-07-31 15:52:46', 1, 1, 1153498940276838401, '用户关联的角色', '', '/system/pc/sys/role/user/list', NULL, '获取用户关联的角色', 3);
INSERT INTO `sys_menu` VALUES (1156473195461353473, '2019-07-31 15:54:29', '2019-07-31 15:54:29', 1, 1, 1153498940276838401, '列出用户', '', '/user/pc/user/list', NULL, '列出用户', 3);
INSERT INTO `sys_menu` VALUES (1156473846425722881, '2019-07-31 15:57:04', '2019-07-31 15:57:04', 1, 1, 1153499292782923778, '添加', '', '/system/pc/sys/role/add', NULL, '添加弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156473962389839874, '2019-07-31 15:57:32', '2019-07-31 15:57:32', 1, 1, 1153499292782923778, '保存', '', '/system/pc/sys/role/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156474159387910146, '2019-07-31 15:58:19', '2019-07-31 15:58:19', 1, 1, 1153499292782923778, '删除', '', '/system/pc/sys/role/delete', NULL, '删除接口', 3);
INSERT INTO `sys_menu` VALUES (1156475549820657665, '2019-07-31 16:03:51', '2019-07-31 16:03:51', 1, 1, 1153499292782923778, '修改', '', '/system/pc/sys/role/view', NULL, '修改修改弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156475705584525314, '2019-07-31 16:04:28', '2019-07-31 16:04:28', 1, 1, 1153499292782923778, '更新', '', '/system/pc/sys/role/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156475975043391490, '2019-07-31 16:05:32', '2019-07-31 16:05:32', 1, 1, 1153499292782923778, '设置权限', '', '/system/pc/menu/list', NULL, '设置权限弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156476159274000386, '2019-07-31 16:06:16', '2019-07-31 16:06:16', 1, 1, 1153499292782923778, '菜单角色关联', '', '/system/pc/menu/role/list', NULL, '菜单角色关联', 3);
INSERT INTO `sys_menu` VALUES (1156476414988132353, '2019-07-31 16:07:17', '2019-07-31 16:07:17', 1, 1, 1153499292782923778, '保存角色菜单关联', '', '/system/pc/menu/role/save', NULL, '角色菜单关联接口', 3);
INSERT INTO `sys_menu` VALUES (1156477233678524418, '2019-07-31 16:10:32', '2019-07-31 16:10:32', 1, 1, 1153499423880089601, '添加', '', '/system/pc/menu/add', NULL, '添加弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156477357225943042, '2019-07-31 16:11:01', '2019-07-31 16:11:01', 1, 1, 1153499423880089601, '保存', '', '/system/pc/menu/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156477431565787138, '2019-07-31 16:11:19', '2019-07-31 16:11:19', 1, 1, 1153499423880089601, '删除', '', '/system/pc/menu/delete', NULL, '删除接口', 3);
INSERT INTO `sys_menu` VALUES (1156478453679923201, '2019-07-31 16:15:23', '2019-07-31 16:15:23', 1, 1, 1153499423880089601, '修改', '', '/system/pc/menu/view', NULL, '修改弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156478738817097730, '2019-07-31 16:16:31', '2019-07-31 16:16:31', 1, 1, 1153499423880089601, '更新', '', '/system/pc/menu/update', NULL, '更新', 3);
INSERT INTO `sys_menu` VALUES (1156763603487694849, '2019-08-01 11:08:28', '2019-08-01 11:08:28', 1, 1, 1153501173945044993, '添加', '', '/user/pc/platform/add', NULL, '添加弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156763684647477250, '2019-08-01 11:08:47', '2019-08-01 11:08:47', 1, 1, 1153501173945044993, '保存', '', '/user/pc/platform/save', NULL, '保存接口', 3);
INSERT INTO `sys_menu` VALUES (1156763793531609089, '2019-08-01 11:09:13', '2019-08-01 11:09:13', 1, 1, 1153501173945044993, '修改', '', '/user/pc/platform/view', NULL, '修改、查看弹窗', 3);
INSERT INTO `sys_menu` VALUES (1156763879334486018, '2019-08-01 11:09:34', '2019-08-01 11:09:34', 1, 1, 1153501173945044993, '更新', '', '/user/pc/platform/update', NULL, '更新', 3);
INSERT INTO `sys_menu` VALUES (1156766341252521985, '2019-08-01 11:19:21', '2019-08-01 11:19:21', 1, 1, 1153493010483089409, '讲师查看', '', '/user/pc/lecturer/view', NULL, '讲师查看', 3);
INSERT INTO `sys_menu` VALUES (1156767833694937090, '2019-08-01 11:25:16', '2019-08-01 11:25:16', 1, 1, 1153493010483089409, '更新备注', '', '/course/pc/order/info/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156770628078673921, '2019-08-01 11:36:23', '2019-08-01 11:36:23', 1, 1, 1153498480237187073, '系统更新', '', '/system/pc/sys/update', NULL, '系统更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156770804654678017, '2019-08-01 11:37:05', '2019-08-01 11:37:05', 1, 4, 1153498480237187073, '站点富文本上传图片', '', '/course/pc/upload/pic', NULL, '站点富文本上传图片接口', 3);
INSERT INTO `sys_menu` VALUES (1156770958275256321, '2019-08-01 11:37:41', '2019-08-01 11:37:41', 1, 3, 1153498480237187073, '站点更新', '', '/system/pc/website/update', NULL, '站点更新接口', 3);
INSERT INTO `sys_menu` VALUES (1156771497591447553, '2019-08-01 11:39:50', '2019-08-01 11:39:50', 1, 1, 1153495031810461697, '导航文章更新', '', '/system/pc/website/nav/article/update', NULL, '导航文章更新', 3);
INSERT INTO `sys_menu` VALUES (1156846769674223617, '2019-08-01 16:38:56', '2019-08-01 16:38:56', 1, 100, 0, '首页', 'dashboard', '', NULL, '首页', 1);
INSERT INTO `sys_menu` VALUES (1158305741493071874, '2019-08-05 17:16:22', '2019-08-05 17:16:22', 1, 1, 1153493010483089409, '用户查看', '', '/user/pc/user/ext/view', NULL, '用户查看', 3);
INSERT INTO `sys_menu` VALUES (1158310111785873409, '2019-08-05 17:33:44', '2019-08-05 17:33:44', 1, 1, 1153493010483089409, '修改备注', NULL, '/course/pc/order/info/edit', NULL, '修改备注', 3);
INSERT INTO `sys_menu` VALUES (1158323404529299458, '2019-08-05 18:26:33', '2019-08-05 18:26:33', 1, 1, 1153501173945044993, '删除', '', '/user/pc/platform/delete', NULL, '删除接口', 3);
INSERT INTO `sys_menu` VALUES (1160850528846749698, '2019-08-12 17:48:27', '2019-08-12 17:48:27', 1, 1, 1153478801917579265, '学员列表', '/user/ext', '/user/pc/user/ext/list', NULL, '学员列表', 2);
INSERT INTO `sys_menu` VALUES (1160851003339972610, '2019-08-12 17:50:20', '2019-08-12 17:50:20', 1, 1, 1160850528846749698, '修改', '', '/user/pc/user/ext/view', NULL, '修改、查看弹窗', 3);
INSERT INTO `sys_menu` VALUES (1160851295330639874, '2019-08-12 17:51:29', '2019-08-12 17:51:29', 1, 1, 1160850528846749698, '更新', '', '/user/pc/user/ext/update', NULL, '更新接口', 3);
INSERT INTO `sys_menu` VALUES (1160851552827351041, '2019-08-12 17:52:31', '2019-08-12 17:52:31', 1, 1, 1160850528846749698, '学习记录', '/user/ext/studyLog', '/course/pc/course/user/study/log/list', NULL, '用户学习记录', 3);
INSERT INTO `sys_menu` VALUES (1248901405712441346, '2020-04-11 17:11:13', '2020-04-11 17:11:13', 1, 1, 1153478139284656129, '支付订单', '/sys/log/orderPay', '/course/pc/order/pay/list', NULL, '支付订单', 2);
INSERT INTO `sys_menu` VALUES (1261195709403193346, '2020-05-15 15:24:23', '2020-05-15 15:24:23', 1, 1, 1153495031810461697, '添加站点导航文章', '', '/system/pc/website/nav/article/save', NULL, NULL, 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_role`;
CREATE TABLE `sys_menu_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `menu_id` bigint unsigned NOT NULL COMMENT '菜单ID',
  `role_id` bigint unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1474990504906084355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='菜单角色关联表';

-- ----------------------------
-- Records of sys_menu_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu_role` VALUES (1242375120400015362, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156846769674223617, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120400015363, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1158310111785873409, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120454541314, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1158305741493071874, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120462929922, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156766341252521985, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120471318530, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1154683761573359618, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120479707138, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1154683387156230146, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120488095745, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156036831607529473, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120496484353, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156030262547324930, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120504872962, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156036539059019777, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120513261569, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156035443800416257, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120517455874, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156033449756991490, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120525844482, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156032108988997634, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120534233090, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156040630476742658, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120538427393, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156039623340466178, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120546816002, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156041685298061313, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120551010305, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156043168856940545, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120559398913, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156045293838147585, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120563593218, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156099620929806338, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120571981826, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156099141575385090, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120576176130, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156102063474352129, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120576176131, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156106290552643585, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120576176132, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156390300390531073, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120576176133, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156389609588662274, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120601341954, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156393404230017026, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120605536257, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156396502923091970, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120613924865, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156395794031190017, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120618119169, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156395484629966849, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120626507777, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156394505545195522, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120630702082, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156453190803922945, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120639090689, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1160851003339972610, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120643284994, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156473195461353473, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120647479297, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156472761619324929, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120655867905, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156472210034794497, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120660062210, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156471546990829570, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120668450817, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156471160762540033, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120672645121, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156467834150985729, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120676839426, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156476159274000386, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120685228033, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156475975043391490, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120689422337, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156475549820657665, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120693616642, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156473846425722881, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120702005249, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156478453679923201, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120706199553, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156477233678524418, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120710393858, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153500580878848001, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120714588162, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153500772986359810, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120836222977, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156763793531609089, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120836222978, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156763603487694849, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120836222979, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153498794638020609, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120836222980, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153501424605040641, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120890748930, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153501541194108929, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120899137537, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153478139284656129, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120899137538, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153493010483089409, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120899137539, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153478416205189122, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120899137540, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153493592497295362, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120945274881, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153493835884367873, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120945274882, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153494219218587650, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120945274883, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153494438295474177, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120945274884, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1156035023040421889, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120945274885, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153494698514288641, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120974635010, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153494935626682369, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120978829314, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153495031810461697, 3);
INSERT INTO `sys_menu_role` VALUES (1242375120978829315, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153495155055890433, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121003995138, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153478559176429569, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121012383745, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153495582782623746, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121020772353, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153495948102307842, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121024966658, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153496094022144002, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121033355265, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153495768179249153, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121037549570, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153496241066053634, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121041743873, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153478694937661442, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121050132481, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153496406875279362, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121054326785, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153496795896975361, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121058521090, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153497106191585282, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121066909697, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153496706587660289, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121071104001, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153497221941792770, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121079492610, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153478801917579265, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121087881217, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1160850528846749698, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121100464129, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153478911053369345, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121108852738, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153498121905213442, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121121435650, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153498940276838401, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121129824258, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153499292782923778, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121138212865, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153499423880089601, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121146601473, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153498480237187073, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121154990082, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153498652677607425, 3);
INSERT INTO `sys_menu_role` VALUES (1242375121163378689, '2020-03-24 16:58:05', '2020-03-24 16:58:05', 1, 1, 1153501173945044993, 3);
INSERT INTO `sys_menu_role` VALUES (1474990504285327361, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156846769674223617, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504302104577, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153478139284656129, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504314687490, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153493010483089409, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504323076097, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1158310111785873409, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504331464706, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1158305741493071874, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504339853313, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156767833694937090, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504348241922, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156766341252521985, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504360824834, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1154683761573359618, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504369213442, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1154683387156230146, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504377602050, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1248901405712441346, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504381796353, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153478416205189122, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504394379265, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153494935626682369, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504398573569, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156040868612546562, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504402767874, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156040630476742658, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504411156481, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156040289144283137, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504419545090, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156039959035781122, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504423739393, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156039623340466178, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504427933697, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153494438295474177, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504436322306, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156035023040421889, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504444710913, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156036653299277825, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504453099522, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156036539059019777, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504457293826, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156036045850812417, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504465682433, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156035689204948994, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504469876738, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156035443800416257, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504474071041, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156033853009960961, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504478265345, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156033449756991490, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504486653953, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156032474489036801, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504490848257, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156032296088510465, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504495042561, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156032108988997634, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504499236865, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153493835884367873, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504503431169, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156037020263129089, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504511819778, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156036831607529473, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504520208385, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156030992003899394, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504528596994, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156030361037971458, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504532791298, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156030262547324930, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504536985602, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153495031810461697, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504541179905, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156041685298061313, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504545374210, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156042299306418177, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504549568514, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156042595428474882, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504557957122, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156043168856940545, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504562151426, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156043234770427905, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504566345730, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156045293838147585, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504570540033, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1261195709403193346, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504574734337, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156771497591447553, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504595705857, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153495155055890433, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504612483073, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156099736667430914, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504616677378, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156099620929806338, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504625065985, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156099420307857410, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504637648898, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156099301554528257, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504641843201, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156099141575385090, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504650231810, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153478559176429569, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504654426113, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153495948102307842, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504658620418, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156102212472807425, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504662814721, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156102063474352129, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504667009025, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153496094022144002, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504671203329, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156106947468730369, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504675397634, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156106778274701314, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504679591938, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156106290552643585, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504683786242, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153496241066053634, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504692174850, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156390708198514689, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504696369154, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156390387736911873, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504700563457, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156390300390531073, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504700563458, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156389834885701634, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504704757761, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156389609588662274, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504708952066, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153478694937661442, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504713146369, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153496795896975361, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504717340674, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156393596735987714, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504725729282, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156393404230017026, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504734117889, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153497106191585282, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504738312193, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156396635052056577, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504738312194, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156396502923091970, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504742506498, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156395965360119810, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504746700801, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156395794031190017, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504750895106, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156395484629966849, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504750895107, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156395045071101953, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504759283713, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156394505545195522, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504759283714, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153497221941792770, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504763478017, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156453747622944769, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504767672322, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156453190803922945, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504767672323, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1156452734279098369, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504771866626, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153478801917579265, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504776060930, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1160850528846749698, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504776060931, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1160851552827351041, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504780255234, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1160851295330639874, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504784449537, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1160851003339972610, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504788643841, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153498480237187073, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504792838145, '2021-12-26 14:28:34', '2021-12-26 14:28:34', 1, 1, 1153500580878848001, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504797032449, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156770804654678017, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504801226753, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156770958275256321, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504801226754, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1153500772986359810, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504805421057, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156770628078673921, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504809615361, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1153498652677607425, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504809615362, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1153501173945044993, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504813809665, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1158323404529299458, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504818003969, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156763879334486018, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504818003970, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156763793531609089, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504822198273, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156763684647477250, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504826392577, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156763603487694849, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504830586881, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1153498121905213442, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504830586882, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1153498940276838401, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504834781185, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156473195461353473, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504834781186, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156472761619324929, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504838975490, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156472470257803266, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504838975491, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156472210034794497, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504843169793, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156471749651210241, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504847364098, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156471546990829570, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504847364099, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156471428245889026, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504851558402, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156471160762540033, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504851558403, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156468115706224642, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504859947010, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156467976803459073, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504864141314, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156467834150985729, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504868335617, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1153499292782923778, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504872529922, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156476414988132353, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504872529923, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156476159274000386, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504876724226, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156475975043391490, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504880918529, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156475705584525314, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504880918530, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156475549820657665, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504885112833, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156474159387910146, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504885112834, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156473962389839874, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504889307137, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156473846425722881, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504893501442, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1153499423880089601, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504897695745, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156478738817097730, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504897695746, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156478453679923201, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504901890049, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156477431565787138, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504906084353, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156477357225943042, 1);
INSERT INTO `sys_menu_role` VALUES (1474990504906084354, '2021-12-26 14:28:35', '2021-12-26 14:28:35', 1, 1, 1156477233678524418, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `role_name` varchar(50) NOT NULL COMMENT '名称',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='角色信息';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '2018-02-06 15:47:52', '2018-03-30 15:12:07', 1, 1, '超级管理员', '全部权限');
INSERT INTO `sys_role` VALUES (3, '2018-12-28 18:23:38', '2018-12-28 18:23:38', 1, 1, '演示角色', '仅有查看功能');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `role_id` bigint unsigned NOT NULL COMMENT '角色ID',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1145889062897147907 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='角色用户关联表';

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_user` VALUES (1145639840180342785, '2019-07-01 18:28:22', '2019-07-01 18:28:22', 1, 1, 1, 1);
INSERT INTO `sys_role_user` VALUES (1145639840188731394, '2019-07-01 18:28:22', '2019-07-01 18:28:22', 1, 1, 3, 1);
INSERT INTO `sys_role_user` VALUES (1145889062897147906, '2019-07-02 10:58:42', '2019-07-02 10:58:42', 1, 1, 3, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `sort` int unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `user_no` bigint NOT NULL COMMENT '用户编号',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `AK_phone` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='后台用户信息';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, '2018-03-31 11:22:37', '2018-05-10 15:28:40', 1, 1, 2018033111202589416, '18800000000', '超级管理员', '超级管理员');
INSERT INTO `sys_user` VALUES (2, '2018-12-28 16:57:47', '2018-12-28 16:57:47', 1, 1, 2018112209531803, '13800000000', '普通用户', '演示权限');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `user_no` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `mobile_salt` varchar(36) NOT NULL COMMENT '密码盐',
  `mobile_psw` varchar(255) NOT NULL COMMENT '登录密码',
  `user_source` varchar(255) DEFAULT NULL COMMENT '用户来源(client_id)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_mobile` (`mobile`),
  UNIQUE KEY `uk_user_no` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户基本信息';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '1899-12-30 01:00:00', '1899-12-30 01:00:00', 1, 2018033111202589416, '18800000000', '59429d68a16540a676c6761c32e1a0c', 'fc341fbafb1cbfe5e2a7b94cb474f99e54140aff', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1064776676060696578, '2019-01-23 16:13:45', '2018-11-20 15:06:36', 1, 2018112015051635, '13800138001', '2c23d864cb1446728ace94def03d05ba', '94325a2f469e9b6b62511c90f0fc375e9045a59b', NULL);
INSERT INTO `user` VALUES (1065422939962617857, '2019-01-23 16:13:45', '2018-11-22 09:53:16', 1, 2018112209531803, '13800000000', '8739165ccb584dd9bded6763df80b8a2', '729a698197f772c87deb43c46bd1392be2642cfb', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1085798859812782081, '2019-01-23 16:13:45', '2019-01-17 15:19:54', 1, 2019011715195672, '13800138002', '13ea736462fc4207b1adc8d576e3f7bf', '4795feaab1ada747a9b9c34dc9c06521348e1e07', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1085800044884017154, '2019-01-23 16:13:45', '2019-01-17 15:24:36', 1, 2019011715243822, '13800138003', '2ed29fc0171f408c802cf01d32d9cf56', 'cdd67b81652023b99262f5af51927cb2216b269d', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1474404665119420417, '2021-12-24 23:40:39', '2021-12-24 23:40:39', 1, 2021122423403946, '18370093079', '0b7062e908ef47d79acc31ef00d3e255', '089e443e6fc5a28c7ec57c4163d892463141946f', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1474945333040545794, '2021-12-26 11:29:05', '2021-12-26 11:29:05', 1, 2021122611290585, '18370093078', 'bba704810f984972b7e157646237cf42', 'd1cb0c04d8d56d9b97d43b7fe185b5781697fa1c', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1474946028837830657, '2021-12-26 11:31:51', '2021-12-26 11:31:51', 1, 2021122611315156, '18370093077', 'fd4986147b12429187f7ddd703ff146c', '69fa3cfce695d839214aa6aeb9c412b0dce5fc79', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1474982449367777282, '2021-12-26 13:56:34', '2021-12-26 13:56:34', 1, 2021122613563488, '18370093076', '6f39668565d144dbae8502303b537497', 'd012bbf4766b5dba5f2f88df2c30f3fad78c6c38', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1502851663248015361, '2022-03-13 11:38:52', '2022-03-13 11:38:52', 1, 2022031311385226, '18370090001', '5ab4f7378a024cd298233fb64c30c89e', '92941524c27ba25a1fa29c7c3089af9704966463', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1509478645616369666, '2022-03-31 18:32:08', '2022-03-31 18:32:08', 1, 2022033118320856, '18370093070', '165f91f182894ed9b6d543d19735877f', '5f5ff312a49fffaa27a5fb9fb06020d8ae3ca6fb', 'lkb65617f842ad4c37895a733b8de43cbb');
INSERT INTO `user` VALUES (1520577420703404033, '2022-05-01 09:34:42', '2022-05-01 09:34:42', 1, 2022050109344243, '18002577506', '15505f7b4b57413ca2c911543468edbb', '76a491482b21e8315edea1ea9857b899047c8765', 'lkb65617f842ad4c37895a733b8de43cbb');
COMMIT;

-- ----------------------------
-- Table structure for user_ext
-- ----------------------------
DROP TABLE IF EXISTS `user_ext`;
CREATE TABLE `user_ext` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常，0:禁用)',
  `user_no` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT '1' COMMENT '用户类型(1用户，2讲师)',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '用户手机',
  `sex` tinyint unsigned DEFAULT '3' COMMENT '性别(1男，2女，3保密)',
  `age` int DEFAULT NULL COMMENT '年龄',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `head_img_url` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_mobile` (`mobile`),
  UNIQUE KEY `uk_user_no` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户教育信息';

-- ----------------------------
-- Records of user_ext
-- ----------------------------
BEGIN;
INSERT INTO `user_ext` VALUES (1064776676098445314, '2019-01-23 16:13:45', '2018-11-20 15:06:36', 1, 2018112015051635, 2, '13800138001', 3, 0, '领课', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/6011642b839d4f70b8c148f596caf4a9.jpeg', '测试讲师');
INSERT INTO `user_ext` VALUES (1065422939962617857, '2019-01-23 16:13:45', '2018-11-22 09:53:16', 1, 2018112209531803, 1, '13800000000', 3, 20, '小明', NULL, '测试用户-小明');
INSERT INTO `user_ext` VALUES (1085798859821170690, '2019-01-23 16:13:45', '2019-01-17 15:19:54', 1, 2019011715195672, 1, '13800138002', 1, 18, '小白', 'http://static-dev.roncoo.com/course/ebe919da49f14529a4fd7e9d8453a552.jpg', '测试用户-小白');
INSERT INTO `user_ext` VALUES (1085800044892405761, '2019-01-23 16:13:45', '2019-01-17 15:24:36', 1, 2019011715243822, 1, '13800138003', 3, 18, '小黑', 'http://static-dev.roncoo.com/course/2391cd733afc40db92754c3a501f9e60.jpg', '测试用户-小黑');
INSERT INTO `user_ext` VALUES (1474404665144586241, '2021-12-24 23:40:39', '2021-12-24 23:40:39', 1, 2021122423403946, 2, '18370093079', 1, 18, 'lalalaa', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/7ef45704bb71459e9701a06c6654bacf.jpg', NULL);
INSERT INTO `user_ext` VALUES (1474945333065711618, '2021-12-26 11:29:05', '2021-12-26 11:29:05', 1, 2021122611290585, 1, '18370093078', 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_ext` VALUES (1474946028854607873, '2021-12-26 11:31:51', '2021-12-26 11:31:51', 1, 2021122611315156, 1, '18370093077', 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_ext` VALUES (1474982449384554498, '2021-12-26 13:56:34', '2021-12-26 13:56:34', 1, 2021122613563488, 1, '18370093076', 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_ext` VALUES (1502851663264792578, '2022-03-13 11:38:52', '2022-03-13 11:38:52', 1, 2022031311385226, 1, '18370090001', 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_ext` VALUES (1509478645641535489, '2022-03-31 18:32:08', '2022-03-31 18:32:08', 1, 2022033118320856, 1, '18370093070', 2, 22, '张三', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/9f794ff3dca54a2fb26f0ccd46e1b141.jpg', NULL);
INSERT INTO `user_ext` VALUES (1520577420724375554, '2022-05-01 09:34:42', '2022-05-01 09:34:42', 1, 2022050109344243, 1, '18002577506', 3, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_log_login
-- ----------------------------
DROP TABLE IF EXISTS `user_log_login`;
CREATE TABLE `user_log_login` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_no` bigint NOT NULL COMMENT '用户编号',
  `client_id` char(34) NOT NULL DEFAULT '' COMMENT '客户端ID',
  `login_status` tinyint NOT NULL DEFAULT '1' COMMENT '登录状态(1成功，0失败)',
  `login_ip` varchar(255) DEFAULT NULL COMMENT '登录IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户错误登录日志';

-- ----------------------------
-- Records of user_log_login
-- ----------------------------
BEGIN;
INSERT INTO `user_log_login` VALUES (1471145450378649601, '2021-12-15 23:49:42', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1471457649424891905, '2021-12-16 20:30:16', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472065397648855041, '2021-12-18 12:45:15', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472065467723091970, '2021-12-18 12:45:31', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472065600380538882, '2021-12-18 12:46:03', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472065783537405954, '2021-12-18 12:46:47', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472065925728505857, '2021-12-18 12:47:21', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472428869330997250, '2021-12-19 12:49:33', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472428957788868609, '2021-12-19 12:49:54', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472429776869330946, '2021-12-19 12:53:09', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472429948852572161, '2021-12-19 12:53:50', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472483120061157377, '2021-12-19 16:25:07', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472484566647246850, '2021-12-19 16:30:52', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1472485066625060866, '2021-12-19 16:32:51', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473665852107702273, '2021-12-22 22:44:53', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473667254917840897, '2021-12-22 22:50:27', 2019011715243822, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473667398220431362, '2021-12-22 22:51:01', 2018112015051635, 'lkb65617f842ad4c37895a733b8de43cbb', 0, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473668158127652865, '2021-12-22 22:54:02', 2018112015051635, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473674349243285506, '2021-12-22 23:18:39', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473675851189993474, '2021-12-22 23:24:37', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473677647706902529, '2021-12-22 23:31:45', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473677683450761218, '2021-12-22 23:31:54', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473677820919074817, '2021-12-22 23:32:26', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1473991496171573249, '2021-12-23 20:18:52', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474010007371567106, '2021-12-23 21:32:26', 2018112015051635, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474042293710278657, '2021-12-23 23:40:43', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474392980902170625, '2021-12-24 22:54:14', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474396036297445378, '2021-12-24 23:06:22', 2018112015051635, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474404745771692033, '2021-12-24 23:40:59', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474409279558463490, '2021-12-24 23:59:00', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474410188040515586, '2021-12-25 00:02:36', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474758256506122242, '2021-12-25 23:05:42', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474758323732426753, '2021-12-25 23:05:58', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474945360131555329, '2021-12-26 11:29:11', 2021122611290585, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474946062761361409, '2021-12-26 11:31:59', 2021122611315156, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474982475800281089, '2021-12-26 13:56:40', 2021122613563488, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1474986560536477697, '2021-12-26 14:12:54', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477264847761625089, '2022-01-01 21:06:00', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477268037957636097, '2022-01-01 21:18:41', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477281353358692353, '2022-01-01 22:11:35', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477285285292199938, '2022-01-01 22:27:13', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477286464302665729, '2022-01-01 22:31:54', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477330784959373313, '2022-01-02 01:28:01', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477332465814118401, '2022-01-02 01:34:42', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477463878840393730, '2022-01-02 10:16:53', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477666641025298433, '2022-01-02 23:42:35', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477674072463765505, '2022-01-03 00:12:07', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477696360676454402, '2022-01-03 01:40:41', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477831432926785538, '2022-01-03 10:37:25', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477922410249326593, '2022-01-03 16:38:55', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477922427810877442, '2022-01-03 16:38:59', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1477929395019583489, '2022-01-03 17:06:41', 2018112209531803, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1492436546840731649, '2022-02-12 17:52:55', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1492440096467623937, '2022-02-12 18:07:01', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1492510599161094145, '2022-02-12 22:47:11', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1492512400933429250, '2022-02-12 22:54:20', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1492512952962555906, '2022-02-12 22:56:32', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1492541692471975938, '2022-02-13 00:50:44', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1492717018716073986, '2022-02-13 12:27:25', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1495290526776279042, '2022-02-20 14:53:37', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1495308098917744642, '2022-02-20 16:03:26', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1498683600088879106, '2022-03-01 23:36:29', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1498684895046684673, '2022-03-01 23:41:37', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1498686302130819073, '2022-03-01 23:47:13', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1498689154693746690, '2022-03-01 23:58:33', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1498690962262609921, '2022-03-02 00:05:44', 2018112015051635, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1502846701373800449, '2022-03-13 11:19:09', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1502851700535377922, '2022-03-13 11:39:01', 2022031311385226, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1502852441899581441, '2022-03-13 11:41:58', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1503387142880063490, '2022-03-14 23:06:41', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1503388908900151297, '2022-03-14 23:13:42', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1503659076012273665, '2022-03-15 17:07:15', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1503693921446850562, '2022-03-15 19:25:42', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1503697039651827714, '2022-03-15 19:38:06', 2018112015051635, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1503697067028049922, '2022-03-15 19:38:12', 2021122613563488, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1503702076855742466, '2022-03-15 19:58:07', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1509471522450923522, '2022-03-31 18:03:50', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1509479065835298817, '2022-03-31 18:33:48', 2022033118320856, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1509522047900889090, '2022-03-31 21:24:36', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1513718916688404481, '2022-04-12 11:21:27', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1513719591862296577, '2022-04-12 11:24:08', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1518263999173517314, '2022-04-25 00:22:00', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1518264279273332738, '2022-04-25 00:23:06', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1520577480342212610, '2022-05-01 09:34:56', 2022050109344243, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1521713270296268802, '2022-05-04 12:48:10', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1521737583938359298, '2022-05-04 14:24:47', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1522572705050681345, '2022-05-06 21:43:15', 2022050109344243, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1522573126607593474, '2022-05-06 21:44:56', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1522573309852540929, '2022-05-06 21:45:39', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1534914017104080898, '2022-06-09 23:03:13', 2018033111202589416, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1534914292992815106, '2022-06-09 23:04:19', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
INSERT INTO `user_log_login` VALUES (1534926117562068994, '2022-06-09 23:51:18', 2021122423403946, 'lkb65617f842ad4c37895a733b8de43cbb', 1, '127.0.0.0');
COMMIT;

-- ----------------------------
-- Table structure for user_log_modified
-- ----------------------------
DROP TABLE IF EXISTS `user_log_modified`;
CREATE TABLE `user_log_modified` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_no` bigint NOT NULL COMMENT '用户编号',
  `mobile_old` char(11) NOT NULL DEFAULT '' COMMENT '原手机号',
  `mobile_new` char(11) NOT NULL DEFAULT '' COMMENT '新手机',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户修改日志';

-- ----------------------------
-- Records of user_log_modified
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

-- ----------------------------
-- Table structure for website
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `logo_ico` varchar(255) DEFAULT NULL COMMENT 'org_logo_ico',
  `logo_img` varchar(255) DEFAULT NULL COMMENT 'org_logo_img',
  `website_title` varchar(255) DEFAULT NULL COMMENT '站点标题',
  `website_keyword` varchar(255) DEFAULT NULL COMMENT '站点关键词',
  `website_desc` varchar(255) DEFAULT NULL COMMENT '站点描述',
  `copyright` varchar(255) DEFAULT NULL COMMENT '站点版权',
  `icp` varchar(255) DEFAULT NULL COMMENT '备案号',
  `prn` varchar(255) DEFAULT NULL COMMENT '公安备案号',
  `weixin` varchar(255) DEFAULT NULL COMMENT '站点微信',
  `weixin_xcx` varchar(255) DEFAULT NULL COMMENT '小程序二维码',
  `weibo` varchar(255) DEFAULT NULL COMMENT '站点微博',
  `is_enable_statistics` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否开启统计',
  `statistics_code` varchar(255) DEFAULT NULL COMMENT '统计代码',
  `is_show_service` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示客服信息',
  `service1` varchar(50) DEFAULT NULL COMMENT '客服信息1',
  `service2` varchar(50) DEFAULT NULL COMMENT '客服信息2',
  `user_agreement` text COMMENT '用户协议',
  `recruit_title` varchar(255) DEFAULT '' COMMENT '招募标题',
  `recruit_info` text COMMENT '招募信息',
  `entry_agreement` text COMMENT '入驻协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='站点信息';

-- ----------------------------
-- Records of website
-- ----------------------------
BEGIN;
INSERT INTO `website` VALUES (934374967448227841, '2018-11-09 17:36:44', '2022-01-30 01:00:00', 1, 1, 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/logo4.png', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/logo3.png', '在线学习系统', '教育系统,在线教育,在线教育系统,教育,系统', '全行业都适用的在线教育系统', '在线学习系统 版权所有 &copy; 2021-2031', '京 ICP备00000000号-1', '京ICP备00000000号-1', 'https://cllearning.oss-cn-shenzhen.aliyuncs.com/course/3861ba976cae4ec2a4d8221f54b2c783.png', '', '', 1, '', 1, '1234567890', '1234567890', '<h2>用户协议</h2><p>尊敬的用户，欢迎使用由杭州维聚有限公司（下列简称为“维聚”或“白犀牛”）提供的服务。在使用前请您阅读如下服务协议，使用本应用即表示您同意接受本协议，本协议产生法律效力，特别涉及免除或者限制维聚责任的条款，请仔细阅读。如有任何问题，可向维聚咨询。</p><dl><dt>1. 服务条款的确认和接受</dt><dd>通过访问或使用本应用，表示用户同意接受本协议的所有条件和条款。</dd></dl><dl><dt>2. 服务条款的变更和修改</dt><dd>维聚有权在必要时修改服务条款，服务条款一旦发生变更，将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以放弃获得的本应用信息服务。如果用户继续享用本应用的信息服务，则视为接受服务条款的变更。本应用保留随时修改或中断服务而不需要通知用户的权利。本应用行使修改或中断服务的权利，不需对用户或第三方负责。</dd></dl><dl><dt>3. 用户行为</dt><dt>3.1 用户账号、密码和安全</dt><dd>用户一旦注册成功，便成为白犀牛的合法用户，将得到一个密码和帐号。同时，此账号密码可登录白犀牛的所有网页和APP。因此用户应采取合理措施维护其密码和帐号的安全。用户对利用该密码和帐号所进行的一切活动负全部责任；由该等活动所导致的任何损失或损害由用户承担，维聚不承担任何责任。 用户的密码和帐号遭到未授权的使用或发生其他任何安全问题，用户可以立即通知维聚，并且用户在每次连线结束，应结束帐号使用，否则用户可能得不到维聚的安全保护。对于用户长时间未使用的帐号，维聚有权予以关闭并注销其内容。</dd></dl><dl><dt>3.2 账号注册时的禁止行为</dt><dd>（1）请勿以党和国家领导人或其他社会名人的真实姓名、字号、艺名、笔名注册；</dd><dd>（2）冒充任何人或机构，或以虚伪不实的方式谎称或使人误认为与任何人或任何机构有关的名称；</dd><dd>（3）请勿注册和其他网友之名相近、相仿的名字；</dd><dd>（4）请勿注册不文明、不健康名字，或包含歧视、侮辱、猥亵类词语的名字；</dd><dd>（5）请勿注册易产生歧义、引起他人误解的名字；</dd></dl><dl><dt>3.3 用户在本应用上不得发布下列违法信息和照片：</dt><dd>（1）反对宪法所确定的基本原则的；</dd><dd>（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</dd><dd>（3）损害国家荣誉和利益的；</dd><dd>（4）煽动民族仇恨、民族歧视，破坏民族团结的；</dd><dd>（5）破坏国家宗教政策，宣扬邪教和封建迷信的；</dd><dd>（6）散布谣言，扰乱社会秩序，破坏社会稳定的；</dd><dd>（7）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</dd><dd>（8）侮辱或者诽谤他人，侵害他人合法权益的；</dd><dd>（9）含有法律、行政法规禁止的其他内容的；</dd><dd>（10）禁止骚扰、毁谤、威胁、仿冒网站其他用户；</dd><dd>（11）严禁煽动非法集会、结社、游行、示威、聚众扰乱社会秩序；</dd><dd>（12）严禁发布可能会妨害第三方权益的文件或者信息，例如（包括但不限于）：病毒代码、黑客程序、软件破解注册信息。</dd><dd>（13）禁止上传他人作品。其中包括你从互联网上下载、截图或收集的他人的作品；</dd><dd>（14）禁止上传广告、横幅、标志等网络图片；</dd></dl><dl><dt>4. 上传或发布的内容</dt><dd>用户上传的内容是指用户在白犀牛上传或发布的视频或其它任何形式的内容包括文字、图片、音频等。除非维聚收到相关通知，否则维聚将用户视为其在本应用上传或发布的内容的版权拥有人。作为内容的发表者，需自行对所发表内容负责，因所发表内容引发的一切纠纷，由该内容的发表者承担全部法律及连带责任。维聚不承担任何法律及连带责任。</dd></dl><dl><dd>对于经由本应用而传送的内容，维聚不保证前述其合法性、正当性、准确性、完整性或品质。用户在使用本应用时，有可能会接触到令人不快、不适当或令人厌恶的内容。在任何情况下，维聚均不对任何内容承担任何责任，包括但不限于任何内容发生任何错误或纰漏以及衍生的任何损失或损害。维聚有权（但无义务）自行拒绝或删除经由本应用提供的任何内容。</dd></dl><dl><dd>个人或单位如认为维聚存在侵犯自身合法权益的内容，应准备好具有法律效应的证明材料，及时与维聚取得联系，以便维聚迅速作出处理。</dd></dl><h2>隐私条款</h2><dl><dt>1.用户信息公开情况说明</dt><dd>尊重用户个人隐私是维聚的一项基本政策。所以，维聚不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本应用中的非公开内容，除非有下列情况：</dd><dd>（1）有关法律规定或维聚合法服务程序规定；</dd><dd>（2）在紧急情况下，为维护用户及公众的权益；</dd><dd>（3）为维护维聚的商标权、专利权及其他任何合法权益；</dd><dd>（4）其他需要公开、编辑或透露个人信息的情况；</dd></dl><dl><dd>在以下（包括但不限于）几种情况下，维聚有权使用用户的个人信息：</dd><dd>（1）在进行促销或抽奖时，维聚可能会与赞助商共享用户的个人信息，在这些情况下维聚会在发送用户信息之前进行提示，并且用户可以通过不参与来终止传送过程；</dd><dd>（2）维聚可以将用户信息与第三方数据匹配；</dd><dd>（3）维聚会通过透露合计用户统计数据，向未来的合作伙伴、广告商及其他第三方以及为了其他合法目的而描述维聚的服务；</dd></dl><dl><dt>2.隐私权政策适用范围</dt><dd>（1）用户在登录本应用服务器时留下的个人身份信息；</dd><dd>（2）用户通过本应用服务器与其他用户或非用户之间传送的各种资讯；</dd><dd>（3）本应用与商业伙伴共享的其他用户或非用户的各种信息；</dd></dl><dl><dt>3.资讯公开与共享</dt><dd>维聚不会将用户的个人信息和资讯故意透露、出租或出售给任何第三方。但以下情况除外：</dd><dd>（1）用户本人同意与第三方共享信息和资讯;</dd><dd>（2）只有透露用户的个人信息和资讯，才能提供用户所要求的某种产品和服务;</dd><dd>（3）应代表本应用提供产品或服务的主体的要求提供（除非我们另行通知，否则该等主体无权将相关用户个人信息和资讯用于提供产品和服务之外的其他用途）：根据法律法规或行政命令的要求提供;因外部审计需要而提供;用户违反了本应用服务条款或任何其他产品及服务的使用规定;经本站评估，用户的帐户存在风险，需要加以保护。</dd></dl><dl><dt>4.Cookies、日志档案和webbeacon</dt><dd>通过使用cookies，本应用向用户提供简单易行并富个性化的网络体验。cookies能帮助我们确定用户连接的页面和内容，并将该等信息储存。我们使用自己的cookies和webbeacon，用于以下用途：</dd><dd>（1）记住用户身份。例如：cookies和webbeacon有助于我们辨认用户作为我们的注册用户的身份，或保存用户向我们提供有关用户的喜好或其他信息；</dd><dd>（2）分析用户使用我们服务的情况。我们可利用cookies和webbeacon来了解用户使用我们的服务进行什么活动、或哪些网页或服务最受欢迎； 我们为上述目的使用cookies和webbeacon的同时，可能将通过cookies和webbeacon收集的非个人身份信息汇总提供给广告商和其他伙伴，用于分析您和其他用户如何使用我们的服务并用于广告服务。用户可以通过浏览器或用户选择机制拒绝或管理cookies或webbeacon。但请用户注意，如果用户停用cookies或webbeacon，我们有可能无法为您提供最佳的服务体验，某些服务也可能无法正常使用。</dd><dd>（3）当你使用本站的服务时，我们的主机会自动记录用户的浏览器在访问网站时所发送的信息和资讯。主机日志资讯包括但不限于用户的网路请求、IP地址、浏览器类型、浏览器使用的语言、请求的日期和时间，以及一个或多个可以对用户的浏览器进行辨识的cookie。</dd></dl><dl><dt>5.账户删除申请</dt><dd>用户有权在任何时候编辑用户在维聚的帐户信息和资讯，用户也可以填写相关申请表格，要求删除个人帐户，但是用户无条件同意在你的帐户删除后，该帐户内及与该帐户相关的信息和资讯仍然保留在本网站档案记录中，除上述第三条规定的情况外，维聚将为用户保密。</dd></dl>', '', '<h1>讲师招募</h1><div><p>想试水尝尝网络讲师的滋味？快加入慕课网讲师队伍吧！</p><div><h2>我们希望你：</h2><ol><li>-&nbsp;热衷分享；</li><li>-&nbsp;有3年以上的大型项目开发经验；</li><li>-&nbsp;至少精通前端开发技术、JAVA、Python、大数据开发、go语言开发、移动端开发，软件测试、UI设计中的一项；</li></ol><h2>你的收获：</h2><ol><li>-&nbsp;额外收入；</li><li>-&nbsp;技术的沉淀与分享；</li><li>-&nbsp;迅速增长的粉丝及业内知名度；</li></ol></div></div>', '<h2>入驻协议</h2><p>尊敬的用户，欢迎使用由杭州维聚有限公司（下列简称为“维聚”或“白犀牛”）提供的服务。在使用前请您阅读如下服务协议，使用本应用即表示您同意接受本协议，本协议产生法律效力，特别涉及免除或者限制维聚责任的条款，请仔细阅读。如有任何问题，可向维聚咨询。</p><dl><dt>1. 服务条款的确认和接受</dt><dd>通过访问或使用本应用，表示用户同意接受本协议的所有条件和条款。</dd></dl><dl><dt>2. 服务条款的变更和修改</dt><dd>维聚有权在必要时修改服务条款，服务条款一旦发生变更，将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以放弃获得的本应用信息服务。如果用户继续享用本应用的信息服务，则视为接受服务条款的变更。本应用保留随时修改或中断服务而不需要通知用户的权利。本应用行使修改或中断服务的权利，不需对用户或第三方负责。</dd></dl><dl><dt>3. 用户行为</dt><dt>3.1 用户账号、密码和安全</dt><dd>用户一旦注册成功，便成为白犀牛的合法用户，将得到一个密码和帐号。同时，此账号密码可登录白犀牛的所有网页和APP。因此用户应采取合理措施维护其密码和帐号的安全。用户对利用该密码和帐号所进行的一切活动负全部责任；由该等活动所导致的任何损失或损害由用户承担，维聚不承担任何责任。 用户的密码和帐号遭到未授权的使用或发生其他任何安全问题，用户可以立即通知维聚，并且用户在每次连线结束，应结束帐号使用，否则用户可能得不到维聚的安全保护。对于用户长时间未使用的帐号，维聚有权予以关闭并注销其内容。</dd></dl><dl><dt>3.2 账号注册时的禁止行为</dt><dd>（1）请勿以党和国家领导人或其他社会名人的真实姓名、字号、艺名、笔名注册；</dd><dd>（2）冒充任何人或机构，或以虚伪不实的方式谎称或使人误认为与任何人或任何机构有关的名称；</dd><dd>（3）请勿注册和其他网友之名相近、相仿的名字；</dd><dd>（4）请勿注册不文明、不健康名字，或包含歧视、侮辱、猥亵类词语的名字；</dd><dd>（5）请勿注册易产生歧义、引起他人误解的名字；</dd></dl><dl><dt>3.3 用户在本应用上不得发布下列违法信息和照片：</dt><dd>（1）反对宪法所确定的基本原则的；</dd><dd>（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</dd><dd>（3）损害国家荣誉和利益的；</dd><dd>（4）煽动民族仇恨、民族歧视，破坏民族团结的；</dd><dd>（5）破坏国家宗教政策，宣扬邪教和封建迷信的；</dd><dd>（6）散布谣言，扰乱社会秩序，破坏社会稳定的；</dd><dd>（7）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</dd><dd>（8）侮辱或者诽谤他人，侵害他人合法权益的；</dd><dd>（9）含有法律、行政法规禁止的其他内容的；</dd><dd>（10）禁止骚扰、毁谤、威胁、仿冒网站其他用户；</dd><dd>（11）严禁煽动非法集会、结社、游行、示威、聚众扰乱社会秩序；</dd><dd>（12）严禁发布可能会妨害第三方权益的文件或者信息，例如（包括但不限于）：病毒代码、黑客程序、软件破解注册信息。</dd><dd>（13）禁止上传他人作品。其中包括你从互联网上下载、截图或收集的他人的作品；</dd><dd>（14）禁止上传广告、横幅、标志等网络图片；</dd></dl><dl><dt>4. 上传或发布的内容</dt><dd>用户上传的内容是指用户在白犀牛上传或发布的视频或其它任何形式的内容包括文字、图片、音频等。除非维聚收到相关通知，否则维聚将用户视为其在本应用上传或发布的内容的版权拥有人。作为内容的发表者，需自行对所发表内容负责，因所发表内容引发的一切纠纷，由该内容的发表者承担全部法律及连带责任。维聚不承担任何法律及连带责任。</dd></dl><dl><dd>对于经由本应用而传送的内容，维聚不保证前述其合法性、正当性、准确性、完整性或品质。用户在使用本应用时，有可能会接触到令人不快、不适当或令人厌恶的内容。在任何情况下，维聚均不对任何内容承担任何责任，包括但不限于任何内容发生任何错误或纰漏以及衍生的任何损失或损害。维聚有权（但无义务）自行拒绝或删除经由本应用提供的任何内容。</dd></dl><dl><dd>个人或单位如认为维聚存在侵犯自身合法权益的内容，应准备好具有法律效应的证明材料，及时与维聚取得联系，以便维聚迅速作出处理。</dd></dl><h2>隐私条款</h2><dl><dt>1.用户信息公开情况说明</dt><dd>尊重用户个人隐私是维聚的一项基本政策。所以，维聚不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本应用中的非公开内容，除非有下列情况：</dd><dd>（1）有关法律规定或维聚合法服务程序规定；</dd><dd>（2）在紧急情况下，为维护用户及公众的权益；</dd><dd>（3）为维护维聚的商标权、专利权及其他任何合法权益；</dd><dd>（4）其他需要公开、编辑或透露个人信息的情况；</dd></dl><dl><dd>在以下（包括但不限于）几种情况下，维聚有权使用用户的个人信息：</dd><dd>（1）在进行促销或抽奖时，维聚可能会与赞助商共享用户的个人信息，在这些情况下维聚会在发送用户信息之前进行提示，并且用户可以通过不参与来终止传送过程；</dd><dd>（2）维聚可以将用户信息与第三方数据匹配；</dd><dd>（3）维聚会通过透露合计用户统计数据，向未来的合作伙伴、广告商及其他第三方以及为了其他合法目的而描述维聚的服务；</dd></dl><dl><dt>2.隐私权政策适用范围</dt><dd>（1）用户在登录本应用服务器时留下的个人身份信息；</dd><dd>（2）用户通过本应用服务器与其他用户或非用户之间传送的各种资讯；</dd><dd>（3）本应用与商业伙伴共享的其他用户或非用户的各种信息；</dd></dl><dl><dt>3.资讯公开与共享</dt><dd>维聚不会将用户的个人信息和资讯故意透露、出租或出售给任何第三方。但以下情况除外：</dd><dd>（1）用户本人同意与第三方共享信息和资讯;</dd><dd>（2）只有透露用户的个人信息和资讯，才能提供用户所要求的某种产品和服务;</dd><dd>（3）应代表本应用提供产品或服务的主体的要求提供（除非我们另行通知，否则该等主体无权将相关用户个人信息和资讯用于提供产品和服务之外的其他用途）：根据法律法规或行政命令的要求提供;因外部审计需要而提供;用户违反了本应用服务条款或任何其他产品及服务的使用规定;经本站评估，用户的帐户存在风险，需要加以保护。</dd></dl><dl><dt>4.Cookies、日志档案和webbeacon</dt><dd>通过使用cookies，本应用向用户提供简单易行并富个性化的网络体验。cookies能帮助我们确定用户连接的页面和内容，并将该等信息储存。我们使用自己的cookies和webbeacon，用于以下用途：</dd><dd>（1）记住用户身份。例如：cookies和webbeacon有助于我们辨认用户作为我们的注册用户的身份，或保存用户向我们提供有关用户的喜好或其他信息；</dd><dd>（2）分析用户使用我们服务的情况。我们可利用cookies和webbeacon来了解用户使用我们的服务进行什么活动、或哪些网页或服务最受欢迎； 我们为上述目的使用cookies和webbeacon的同时，可能将通过cookies和webbeacon收集的非个人身份信息汇总提供给广告商和其他伙伴，用于分析您和其他用户如何使用我们的服务并用于广告服务。用户可以通过浏览器或用户选择机制拒绝或管理cookies或webbeacon。但请用户注意，如果用户停用cookies或webbeacon，我们有可能无法为您提供最佳的服务体验，某些服务也可能无法正常使用。</dd><dd>（3）当你使用本站的服务时，我们的主机会自动记录用户的浏览器在访问网站时所发送的信息和资讯。主机日志资讯包括但不限于用户的网路请求、IP地址、浏览器类型、浏览器使用的语言、请求的日期和时间，以及一个或多个可以对用户的浏览器进行辨识的cookie。</dd></dl><dl><dt>5.账户删除申请</dt><dd>用户有权在任何时候编辑用户在维聚的帐户信息和资讯，用户也可以填写相关申请表格，要求删除个人帐户，但是用户无条件同意在你的帐户删除后，该帐户内及与该帐户相关的信息和资讯仍然保留在本网站档案记录中，除上述第三条规定的情况外，维聚将为用户保密。</dd></dl>');
COMMIT;

-- ----------------------------
-- Table structure for website_link
-- ----------------------------
DROP TABLE IF EXISTS `website_link`;
CREATE TABLE `website_link` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `link_name` varchar(50) NOT NULL COMMENT '名称',
  `link_url` varchar(255) NOT NULL COMMENT '链接',
  `link_target` varchar(50) NOT NULL COMMENT '跳转方式(_blank，_self)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='站点友情链接';

-- ----------------------------
-- Records of website_link
-- ----------------------------
BEGIN;
INSERT INTO `website_link` VALUES (1248243315170205698, '2020-04-09 21:36:12', '2020-04-09 21:36:12', 1, 10, 'IT云', 'https:/www.doityun.com', '_blank');
COMMIT;

-- ----------------------------
-- Table structure for website_nav
-- ----------------------------
DROP TABLE IF EXISTS `website_nav`;
CREATE TABLE `website_nav` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `parent_id` bigint unsigned NOT NULL COMMENT '父ID',
  `nav_name` varchar(50) NOT NULL COMMENT '导航名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='站点导航';

-- ----------------------------
-- Records of website_nav
-- ----------------------------
BEGIN;
INSERT INTO `website_nav` VALUES (1060107291291365377, '2018-11-07 17:52:03', '2018-11-07 17:52:03', 0, 1, 1060100633685209089, '课程合作');
INSERT INTO `website_nav` VALUES (1060115285643177985, '2018-11-07 18:23:49', '2018-11-07 18:23:49', 0, 1, 1060100633685209089, '项目合作');
INSERT INTO `website_nav` VALUES (1060708775632576514, '2018-11-09 09:42:11', '2018-11-09 09:42:11', 1, 1, 1060708747425882114, '用户协议');
INSERT INTO `website_nav` VALUES (1080719070034886658, '2019-01-03 14:54:38', '2019-01-03 14:54:38', 1, 1, 1060708747425882114, '讲师协议');
INSERT INTO `website_nav` VALUES (1141261565654659073, '2019-06-19 16:30:45', '2019-06-19 16:30:45', 1, 1, 0, '常见问题');
INSERT INTO `website_nav` VALUES (1141641907804475393, '2019-06-20 17:42:06', '2019-06-20 17:42:06', 1, 1, 0, '商务合作');
INSERT INTO `website_nav` VALUES (1240124422568402946, '2020-03-18 11:54:37', '2020-03-18 11:54:37', 1, 1, 0, '关于我们');
INSERT INTO `website_nav` VALUES (1248904685884661762, '2020-04-11 17:24:15', '2020-04-11 17:24:15', 1, 4, 1240124422568403000, '公司简介');
INSERT INTO `website_nav` VALUES (1248904738636423170, '2020-04-11 17:24:27', '2020-04-11 17:24:27', 1, 2, 1240124422568403000, '联系我们');
INSERT INTO `website_nav` VALUES (1248905111967227906, '2020-04-11 17:25:56', '2020-04-11 17:25:56', 1, 1, 1141261565654659073, '如何购买');
INSERT INTO `website_nav` VALUES (1248905407795683329, '2020-04-11 17:27:07', '2020-04-11 17:27:07', 1, 1, 1141641907804475393, '商业版购买');
INSERT INTO `website_nav` VALUES (1474993054279553025, '2021-12-26 14:38:42', '2021-12-26 14:38:42', 1, 1, 1240124422568402946, '公司简介');
INSERT INTO `website_nav` VALUES (1502853289090269185, '2022-03-13 11:45:20', '2022-03-13 11:45:20', 1, 1, 1240124422568402946, '联系我们');
INSERT INTO `website_nav` VALUES (1502853409617788929, '2022-03-13 11:45:49', '2022-03-13 11:45:49', 1, 1, 1240124422568402946, '3');
COMMIT;

-- ----------------------------
-- Table structure for website_nav_article
-- ----------------------------
DROP TABLE IF EXISTS `website_nav_article`;
CREATE TABLE `website_nav_article` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1有效, 0无效)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `nav_id` bigint NOT NULL COMMENT '导航ID',
  `art_title` varchar(255) NOT NULL COMMENT '文章标题',
  `art_pic` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `art_desc` text NOT NULL COMMENT '文章描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='站点导航文章';

-- ----------------------------
-- Records of website_nav_article
-- ----------------------------
BEGIN;
INSERT INTO `website_nav_article` VALUES (1474990750830710785, '2021-12-26 14:29:33', '2021-12-26 14:29:33', 1, 1, 1248904685884661762, '步履坚定', NULL, '<div><p>新华社北京12月5日电　题：步履坚定，共绘高质量发展新篇章——各地贯彻党的十九届六中全会精神纪实</p></div><div><p>新华社记者</p></div><div><p>发展，是解决一切问题的总钥匙。</p></div><div><p>党的十九届六中全会审议通过《中共中央关于党的百年奋斗重大成就和历史经验的决议》强调，必须实现创新成为第一动力、协调成为内生特点、绿色成为普遍形态、开放成为必由之路、共享成为根本目的的高质量发展。</p></div><div><p>近日新华社记者奔赴多地，到企业车间、基层一线、群众当中，亲历贯彻全会精神的火热气象，感受落实新发展理念蔚然成风。</p></div><div><p>提质增效，跃上发展新台阶</p></div><div><p>走进济钢集团，黑色钢铁已不见踪影。36岁的技术人员陈书超身着白大褂，正操作数控机床加工直径几微米的精密零部件。</p></div><div><p>对于转型发展，他有着切身收获：“企业从‘靠钢吃饭’到‘无钢发展’，我的工作也从铸造‘大黑粗’变成加工‘高精尖’，环境好了，收入也高了。”</p></div><div><p>2017年，有着60年历史的济钢关停全部钢铁生产线。如今，济钢度过转型阵痛，向新材料、高端装备制造转型。2021年，集团产值预计和退出钢铁产能前相当，但能耗、大气污染物排放均只有以前的“零头”。</p></div><div><p>“要努力提升技能，适应企业转型的新需要，以实际行动响应全会关于推动高质量发展的号召。”陈书超说。</p></div><div><p>12月的浙江安吉，依旧满目青翠。“保护生态环境就是保护生产力，改善生态环境就是发展生产力，我们深有体会。”浙江省湖州市委常委、安吉县委书记杨卫东说。</p></div><div><p>“绿水青山就是金山银山。”刚刚从山川乡大里村调研回来的他，掰着手指给记者盘算，“那里旅游资源丰富、客流充足，要把闲置办公楼等资源都盘活用好，同时想办法带动村民参与乡村旅游经营，壮大集体经济、为村民增收。”</p></div><div><p>从北到南、由西至东，各地干部群众高度认同全会总结的宝贵经验，将贯彻新发展理念作为自觉行动。</p></div><div><p>冬日南国，天蓝海碧。记者登上海南洋浦经济开发区国投洋浦港码头，近5万吨进口菜籽原料经检疫合格后，被装上一辆辆卡车，运往洋浦保税港区的澳斯卡粮油加工厂。</p></div><div><p>“我们既是开放战略的践行者，更是受益者，从自贸港加工增值政策获得巨大商机。”海南澳斯卡国际粮油有限公司总经理张慧介绍，自今年7月投产以来，公司已完成加工增值业务95票，免征关税约1758万元。</p></div><div><p>“全会提出全面深化改革开放，我们将依托国内超大规模市场优势，抢抓市场机遇，以高水平开放推动高质量发展。”张慧说。</p></div><div><p>改革创新，汇聚发展新动力</p></div><div><p>像一个金色大吊灯，又像一个多层的旋转木马……在中国科学技术大学物理学院的实验室里，特任教授曹刚正在为提升量子计算机的算力忙碌。</p></div><div><p>他所在的科研团队刚刚在半导体量子芯片研究上获得重要进展。</p></div><div><p>“全会要求推进科技自立自强，作为科技工作者倍感使命光荣、责任重大。”曹刚说，量子科技是关键核心技术领域。目前团队正在积极筹划新的科研计划，力争在新阶段实现从追赶到并跑、赶超的跨越。</p></div><div><p>冰天雪地的东北，沈阳鼓风机集团透平公司的智能化车间里，一台台数字化工位机有条不紊地工作，各种生产信息在显示屏上一目了然。</p></div><div><p>“全会提出坚持开拓创新，对我们这样的老字号国企来说，就是要赶上时代发展的浪潮，抓住新一代信息技术和产业变革的机遇，坚持在改革中实现转型发展。”沈鼓集团董事长戴继双说。</p></div><div><p>采访越深入，记者越真切地感受到，全会精神正激发大家拿出更大魄力、更加主动改革创新，推动各行各业加速转入高质量发展轨道。</p></div><div><p>揉面、拌馅、印花、烤制……在新疆伊犁的霍尔果斯馕产业园里，刚出炉的馕散发着诱人的香味。“最近又有来自俄罗斯和白俄罗斯的线上订单，得抓紧赶制240万个馕。”霍尔果斯金亿国际贸易（集团）有限公司董事长于成忠仔细查看生产进度。</p></div><div><p>霍尔果斯创新发展模式，通过引入金亿这样的外贸企业参与产品研发、改良种类，加快了馕产业走出国门的步伐。</p></div><div><p>“‘敢为天下先，走出了前人没有走出的路’。全会总结历史经验里的这句话，将激励我们全方位拓展产业链，用小馕饼撬动大产业。”于成忠信心十足。</p></div><div><p>奋发有为，共绘发展新篇章</p></div><div><p>推动高质量发展是一场关系经济社会全局的深刻变革，必须持之以恒加以推进。唯有锐意进取、奋发有为，才能实现这一伟大历史目标。</p></div><div><p>冬日的寒风里，胜利油田百万吨CCUS（碳捕获、利用与封存）示范工程13号站，正在进行最后的建设冲刺。工程将于年底投产，建成后每年可利用二氧化碳100万吨。</p></div><div><p>将二氧化碳用于石油开采，是胜利油田在“碳中和”领域的最新技术应用，可带来经济效益和生态效益双赢。</p></div><div><p>“全会提出，坚持人与自然和谐共生，这让我对二氧化碳驱油技术的推广应用有了更坚定的信心。”中国石化胜利油田注汽技术服务中心二氧化碳项目部经理屈龙涛表示。</p></div><div><p>“未来之城”雄安，已进入承接北京非首都功能疏解和大规模开发建设同步推进的关键阶段。</p></div><div><p>“十九届六中全会的胜利召开，是激励，更是召唤，让我们凝心聚力、倍增干劲。”雄安新区改革发展局局长于国义说，下一步将有序推进启动区和容东片区建设，把高质量发展贯穿于规划建设的全过程，打造样板工程。</p></div><div><p>高质量发展是以人民为中心的发展。</p></div><div><p>福建晋江，正在探路共同富裕县域示范。经历40多年发展，晋江目前培育壮大市场主体24万个，数以百万计的务工人员稳定就业。</p></div><div><p>重整行装再出发，锚定目标再超越。</p></div><div><p>“党的十九届六中全会通过的决议指出，坚定不移走全体人民共同富裕道路，为我们指明了方向。”泉州市委常委、晋江市委书记张文贤说，要始终把高质量发展的文章做好，激发市场主体活力，增强创业就业能力，均等化公共服务，让更多群众享受发展成果。（记者：姜琳、陈灏、闫起磊、关俏俏、徐海涛、邹明仲、岳德亮、吴茂辉、吴剑锋)</p></div>');
INSERT INTO `website_nav_article` VALUES (1474993089687867394, '2021-12-26 14:38:51', '2021-12-26 14:38:51', 1, 1, 1248904738636423170, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1474993114073550849, '2021-12-26 14:38:57', '2021-12-26 14:38:57', 1, 1, 1248905407795683329, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1474993142993276930, '2021-12-26 14:39:03', '2021-12-26 14:39:03', 1, 1, 1248905111967227906, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1474993567037411329, '2021-12-26 14:40:45', '2021-12-26 14:40:45', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1502852682812014593, '2022-03-13 11:42:55', '2022-03-13 11:42:55', 1, 1, 1248904738636423170, '1', NULL, '<div label-module=\"para\">禁止灌输原则。即教师不得向学生灌输某种或某几种特定的政治理论，以避免妨碍学生形成独立的判断力。</div><div label-module=\"para\">保持争论原则。教师在政治教育中必须保持中立，除了提供自己赞同的政治观点外，也应该提供相反的政治观点以供学生参考。</div><div label-module=\"para\">促进分析原则。政治教育的目的在于促进学生在基于个人利益的基础上对政治进行有效地分析。</div>');
INSERT INTO `website_nav_article` VALUES (1502852851871825922, '2022-03-13 11:43:36', '2022-03-13 11:43:36', 1, 1, 1474993054279553025, '1', NULL, '<p>2222222222</p>');
INSERT INTO `website_nav_article` VALUES (1502853047141842945, '2022-03-13 11:44:22', '2022-03-13 11:44:22', 1, 1, 1248904738636423170, '1', NULL, '<p>33333</p>');
INSERT INTO `website_nav_article` VALUES (1502853317406015490, '2022-03-13 11:45:27', '2022-03-13 11:45:27', 1, 1, 1502853289090269185, '22', NULL, '<p>22222</p>');
INSERT INTO `website_nav_article` VALUES (1502853344559939585, '2022-03-13 11:45:33', '2022-03-13 11:45:33', 1, 1, 1502853289090269185, '22', NULL, '<p>2222233333</p>');
INSERT INTO `website_nav_article` VALUES (1502853460620525570, '2022-03-13 11:46:01', '2022-03-13 11:46:01', 1, 1, 1502853409617788929, '8888', NULL, '<p><divcourier new\',=\"\" monospace;font-weight:=\"\" normal;font-size:=\"\" 12px;line-height:=\"\" 18px;white-space:=\"\" pre;\"=\"\"></divcourier></p><div><div label-module=\"para\"><b>博特斯巴赫共识</b>（Beutelsbacher Konsens）是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BE%B7%E5%9B%BD\">德国</a>巴登 - 符腾堡州政治教育中心与德国各州教育机构和各党派政治教育学者于1976年秋季在<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9B%B7%E5%A7%86%E6%96%AF-%E7%A9%86%E5%B0%94%E5%8E%BF\">雷姆斯-穆尔县</a>的博特斯巴赫镇举行的一次政治教育会议上所达成的共识，并确立了政治教育的三大原则。</div><div><a name=\"2\"></a><a name=\"sub9336370_2\"></a><a name=\"政治教育三大原则\"></a></div><div label-module=\"para-title\"><h2>政治教育三大原则</h2><a href=\"javascript:;\"><em></em>编辑</a><a href=\"javascript:;\"><em></em>&nbsp;播报</a></div><div label-module=\"para\">禁止灌输原则。即教师不得向学生灌输某种或某几种特定的政治理论，以避免妨碍学生形成独立的判断力。</div><div label-module=\"para\">保持争论原则。教师在政治教育中必须保持中立，除了提供自己赞同的政治观点外，也应该提供相反的政治观点以供学生参考。</div><div label-module=\"para\">促进分析原则。政治教育的目的在于促进学生在基于个人利益的基础上对政治进行有效地分</div></div>');
INSERT INTO `website_nav_article` VALUES (1502854234679328769, '2022-03-13 11:49:05', '2022-03-13 11:49:05', 1, 1, 1502853289090269185, '22', NULL, '<p>22222</p>');
INSERT INTO `website_nav_article` VALUES (1502854494663262209, '2022-03-13 11:50:07', '2022-03-13 11:50:07', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1502854836691976194, '2022-03-13 11:51:29', '2022-03-13 11:51:29', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1502854963238322178, '2022-03-13 11:51:59', '2022-03-13 11:51:59', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1502855652974837761, '2022-03-13 11:54:44', '2022-03-13 11:54:44', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1502855682649538561, '2022-03-13 11:54:51', '2022-03-13 11:54:51', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1502855803613265922, '2022-03-13 11:55:19', '2022-03-13 11:55:19', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1502855915315970050, '2022-03-13 11:55:46', '2022-03-13 11:55:46', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1502856035671523330, '2022-03-13 11:56:15', '2022-03-13 11:56:15', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
INSERT INTO `website_nav_article` VALUES (1502856333039288322, '2022-03-13 11:57:26', '2022-03-13 11:57:26', 1, 1, 1474993054279553025, '1', NULL, '<p>1</p>');
COMMIT;

-- ----------------------------
-- Table structure for zone
-- ----------------------------
DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常;0:禁用)',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `zone_name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `zone_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `zone_location` tinyint NOT NULL DEFAULT '0' COMMENT '位置(0电脑端，1微信端)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='专区';

-- ----------------------------
-- Records of zone
-- ----------------------------
BEGIN;
INSERT INTO `zone` VALUES (1014339060298440705, '2018-07-04 10:45:07', '2018-07-04 10:45:07', 1, 1000, '热门课程', '热门课程', 0);
INSERT INTO `zone` VALUES (1060472271471714305, '2018-11-08 18:02:24', '2018-11-08 18:02:24', 1, 100, '精品课程', '皆是精品', 0);
INSERT INTO `zone` VALUES (1474411324745203713, '2021-12-25 00:07:07', '2021-12-25 00:07:07', 1, 9999, '最新课程', '最新课程', 0);
INSERT INTO `zone` VALUES (1492819680061145089, '2022-02-13 19:15:21', '2022-02-13 19:15:21', 1, 10000, '推荐课程', '推荐课程', 0);
COMMIT;

-- ----------------------------
-- Table structure for zone_course
-- ----------------------------
DROP TABLE IF EXISTS `zone_course`;
CREATE TABLE `zone_course` (
  `id` bigint NOT NULL COMMENT '主键',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status_id` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:正常;0:禁用)',
  `sort` int NOT NULL COMMENT '排序',
  `zone_id` bigint NOT NULL DEFAULT '0' COMMENT '专区编号',
  `zone_location` tinyint NOT NULL DEFAULT '0' COMMENT '位置(0电脑端，1微信端)',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT '课程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='专区课程关联表';

-- ----------------------------
-- Records of zone_course
-- ----------------------------
BEGIN;
INSERT INTO `zone_course` VALUES (1474015598911447042, '2021-12-23 21:54:39', '2021-12-23 21:54:39', 1, 1, 1014339060298440705, 0, 1474013547238285313);
INSERT INTO `zone_course` VALUES (1474015670130728961, '2021-12-23 21:54:56', '2021-12-23 21:54:56', 1, 1, 1060472271471714305, 0, 1474013547238285313);
INSERT INTO `zone_course` VALUES (1474022344899977218, '2021-12-23 22:21:27', '2021-12-23 22:21:27', 1, 1, 1014339060298440705, 0, 1474022012811763713);
INSERT INTO `zone_course` VALUES (1474022377342918658, '2021-12-23 22:21:35', '2021-12-23 22:21:35', 1, 1, 1060472271471714305, 0, 1474022012811763713);
INSERT INTO `zone_course` VALUES (1474411376968482818, '2021-12-25 00:07:20', '2021-12-25 00:07:20', 1, 1, 1474411324745203713, 0, 1474410936327487489);
INSERT INTO `zone_course` VALUES (1474411392827146241, '2021-12-25 00:07:23', '2021-12-25 00:07:23', 1, 1, 1474411324745203713, 0, 1474022012811763713);
INSERT INTO `zone_course` VALUES (1474411402314661890, '2021-12-25 00:07:26', '2021-12-25 00:07:26', 1, 1, 1474411324745203713, 0, 1474013547238285313);
INSERT INTO `zone_course` VALUES (1492819597424967681, '2022-02-13 19:15:01', '2022-02-13 19:15:01', 1, 1, 1474411324745203713, 0, 1492513175231270914);
INSERT INTO `zone_course` VALUES (1492819736508088322, '2022-02-13 19:15:35', '2022-02-13 19:15:35', 1, 1, 1492819680061145089, 0, 1492513175231270914);
INSERT INTO `zone_course` VALUES (1492819747740434433, '2022-02-13 19:15:37', '2022-02-13 19:15:37', 1, 1, 1492819680061145089, 0, 1474410936327487489);
INSERT INTO `zone_course` VALUES (1492819757186007042, '2022-02-13 19:15:40', '2022-02-13 19:15:40', 1, 1, 1492819680061145089, 0, 1474022012811763713);
INSERT INTO `zone_course` VALUES (1492819770746191873, '2022-02-13 19:15:43', '2022-02-13 19:15:43', 1, 1, 1492819680061145089, 0, 1474013547238285313);
INSERT INTO `zone_course` VALUES (1495308229511557122, '2022-02-20 16:03:58', '2022-02-20 16:03:58', 1, 1, 1014339060298440705, 0, 1495302197351624706);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
