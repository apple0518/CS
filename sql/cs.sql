/*
 Navicat Premium Data Transfer

 Source Server         : 1.117.94.109
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : cs

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 21/05/2021 17:03:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001795012A20878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001795012A20878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001795012A20878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'VM-4-5-centos1621587729906', 1621587802146, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1621587730000, -1, 5, 'PAUSED', 'CRON', 1621587730000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1621587735000, -1, 5, 'PAUSED', 'CRON', 1621587731000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1621587740000, -1, 5, 'PAUSED', 'CRON', 1621587731000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `state` int(255) NULL DEFAULT 0 COMMENT '评论的审核状态',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (7, 'admin', '文涛', 1, '2021-05-21 00:00:00');
INSERT INTO `comment` VALUES (8, '匿名用户', 'qwe', 1, NULL);
INSERT INTO `comment` VALUES (10, '匿名用户', '大理有什么景点', 1, '2021-05-11 14:58:27');
INSERT INTO `comment` VALUES (11, '匿名用户', '回复的', 0, '2021-05-11 15:05:39');
INSERT INTO `comment` VALUES (12, '匿名用户', 'asdf', 0, '2021-05-11 15:13:03');
INSERT INTO `comment` VALUES (13, '匿名用户', '你好啊', 1, '2021-05-12 13:41:38');
INSERT INTO `comment` VALUES (14, '匿名用户', '你们好', 1, '2021-05-13 17:00:48');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'comment', '评论表', '', NULL, 'Comment', 'crud', 'com.ruoyi.system', 'system', 'comment', 'Comment_check', 'ruoyi', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2021-05-09 18:30:56', '', '2021-05-09 22:47:40', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (5, '2', 'id', '主键', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-05-09 18:30:56', NULL, '2021-05-09 22:47:40');
INSERT INTO `gen_table_column` VALUES (6, '2', 'username', '用户名', 'varchar(255)', 'String', 'username', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-05-09 18:30:56', NULL, '2021-05-09 22:47:40');
INSERT INTO `gen_table_column` VALUES (7, '2', 'comment', '评论内容', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-05-09 18:30:56', NULL, '2021-05-09 22:47:40');
INSERT INTO `gen_table_column` VALUES (8, '2', 'state', '评论的审核状态', 'int(255)', 'Long', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'comment_state', 4, 'admin', '2021-05-09 18:30:56', NULL, '2021-05-09 22:47:40');
INSERT INTO `gen_table_column` VALUES (9, '2', 'time', '评论时间', 'datetime', 'Date', 'time', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2021-05-09 18:30:56', NULL, '2021-05-09 22:47:40');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-05-09 15:41:09', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-05-09 15:41:09', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-05-09 15:41:09', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-05-09 15:41:09', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-05-09 15:41:09', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-05-09 15:41:09', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-05-09 15:41:09', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-05-09 15:41:09', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-05-09 15:41:09', 'admin', '2021-05-09 15:48:29', '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '苍山管理局', 0, 'admin', '', '', '0', '0', 'admin', '2021-05-09 15:41:09', 'admin', '2021-05-09 15:57:35');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-05-09 15:41:09', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-05-09 15:41:09', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 100, '0,100', '超级管理员', 1, 'admin', '', '', '0', '0', 'admin', '2021-05-09 15:41:09', 'admin', '2021-05-09 15:57:35');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-05-09 15:41:09', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-05-09 15:41:09', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-05-09 15:41:09', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-05-09 15:41:09', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-05-09 15:41:09', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-05-09 15:41:09', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '评论审核', 2, 'admin', NULL, NULL, '0', '0', 'admin', '2021-05-09 15:57:49', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '未审核', '0', 'comment_state', '', 'warning', 'Y', '0', 'admin', '2021-05-09 22:46:39', 'admin', '2021-05-10 16:31:01', '');
INSERT INTO `sys_dict_data` VALUES (101, 1, '审核通过', '1', 'comment_state', '', 'primary', 'Y', '0', 'admin', '2021-05-09 22:47:18', 'admin', '2021-05-10 16:30:52', '');
INSERT INTO `sys_dict_data` VALUES (102, 2, '审核不通过', '2', 'comment_state', NULL, 'danger', 'Y', '0', 'admin', '2021-05-10 16:30:22', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '评论状态', 'comment_state', '0', 'admin', '2021-05-09 22:45:58', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-05-09 15:41:09', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 235 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 15:41:42');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 15:47:00');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-09 15:56:47');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 15:56:48');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-09 15:59:59');
INSERT INTO `sys_logininfor` VALUES (105, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 16:00:03');
INSERT INTO `sys_logininfor` VALUES (106, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-09 16:00:06');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 16:00:07');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 16:12:59');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 16:43:19');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 16:45:27');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-09 16:55:14');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 16:55:15');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-09 16:55:45');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 16:55:54');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 18:30:02');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 18:32:05');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 18:54:34');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 18:57:22');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 19:00:24');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 19:01:48');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 19:03:09');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 19:20:25');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 19:22:25');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 19:42:46');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 19:44:07');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 19:52:29');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 19:53:51');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:00:38');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:17:45');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:20:51');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:23:04');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:24:16');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:24:31');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:26:34');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:27:16');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:28:23');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:33:02');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:44:01');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:46:24');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:47:43');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:49:16');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 20:50:42');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 22:28:02');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 22:49:30');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 22:54:45');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-09 22:54:52');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-10 14:14:06');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 14:14:07');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 14:37:20');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 14:43:09');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 14:44:56');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 14:46:51');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:01:13');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:02:53');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:04:28');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:08:36');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:10:08');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:16:10');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:16:59');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:23:26');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:23:36');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:37:15');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:39:23');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:40:29');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:43:03');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:44:31');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:46:35');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:48:16');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:49:04');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:50:32');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:54:43');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:55:26');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 15:59:49');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 16:02:15');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 16:12:48');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 16:20:54');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 16:24:49');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 16:29:42');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 16:31:59');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 16:46:45');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 16:56:06');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 16:57:03');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 17:03:16');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 17:04:51');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 17:05:01');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 17:05:41');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 17:53:52');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 17:54:00');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-10 18:07:34');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-11 09:20:03');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-11 10:30:32');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-11 12:54:16');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-11 13:11:50');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-11 14:54:18');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-11 14:58:00');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-12 13:36:49');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-12 13:43:53');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-12 21:32:09');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-13 17:01:02');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-13 17:08:09');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-13 17:08:55');
INSERT INTO `sys_logininfor` VALUES (202, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:40:20');
INSERT INTO `sys_logininfor` VALUES (203, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:40:36');
INSERT INTO `sys_logininfor` VALUES (204, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:40:37');
INSERT INTO `sys_logininfor` VALUES (205, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:40:45');
INSERT INTO `sys_logininfor` VALUES (206, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:40:46');
INSERT INTO `sys_logininfor` VALUES (207, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:40:55');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:41:06');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:44:30');
INSERT INTO `sys_logininfor` VALUES (210, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:44:31');
INSERT INTO `sys_logininfor` VALUES (211, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:44:39');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:44:47');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:45:58');
INSERT INTO `sys_logininfor` VALUES (214, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:45:59');
INSERT INTO `sys_logininfor` VALUES (215, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:46:03');
INSERT INTO `sys_logininfor` VALUES (216, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:46:04');
INSERT INTO `sys_logininfor` VALUES (217, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:46:09');
INSERT INTO `sys_logininfor` VALUES (218, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:46:10');
INSERT INTO `sys_logininfor` VALUES (219, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:46:15');
INSERT INTO `sys_logininfor` VALUES (220, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:46:16');
INSERT INTO `sys_logininfor` VALUES (221, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:46:17');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:46:27');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:46:40');
INSERT INTO `sys_logininfor` VALUES (224, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:46:41');
INSERT INTO `sys_logininfor` VALUES (225, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:46:44');
INSERT INTO `sys_logininfor` VALUES (226, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:46:45');
INSERT INTO `sys_logininfor` VALUES (227, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 16:55:01');
INSERT INTO `sys_logininfor` VALUES (228, 'user', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 16:55:08');
INSERT INTO `sys_logininfor` VALUES (229, 'user', '39.129.48.5', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 17:02:43');
INSERT INTO `sys_logininfor` VALUES (230, 'user', '39.129.48.5', 'XX XX', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 17:03:02');
INSERT INTO `sys_logininfor` VALUES (231, 'user', '39.129.48.5', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 17:03:04');
INSERT INTO `sys_logininfor` VALUES (232, 'user', '39.129.48.5', 'XX XX', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 17:03:06');
INSERT INTO `sys_logininfor` VALUES (233, 'user', '39.129.48.5', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-05-21 17:03:08');
INSERT INTO `sys_logininfor` VALUES (234, 'user', '39.129.48.5', 'XX XX', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-05-21 17:03:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2008 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-05-09 15:41:09', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', 'menuItem', 'M', '1', '1', '', 'fa fa-video-camera', 'admin', '2021-05-09 15:41:09', 'admin', '2021-05-09 15:50:19', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-05-09 15:41:09', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '1', '0', '', 'fa fa-location-arrow', 'admin', '2021-05-09 15:41:09', 'admin', '2021-05-09 15:50:35', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-05-09 15:41:09', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-05-09 15:41:09', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-05-09 15:41:09', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-05-09 15:41:09', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-05-09 15:41:09', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-05-09 15:41:09', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-05-09 15:41:09', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-05-09 15:41:09', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-05-09 15:41:09', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-05-09 15:41:09', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-05-09 15:41:09', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-05-09 15:41:09', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-05-09 15:41:09', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-05-09 15:41:09', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-05-09 15:41:09', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-05-09 15:41:09', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-05-09 15:41:09', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-05-09 15:41:09', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-05-09 15:41:09', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-05-09 15:41:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '审核功能', 0, 3, '#', 'menuItem', 'M', '1', '1', '', 'fa fa-comments-o', 'admin', '2021-05-09 16:09:34', 'admin', '2021-05-21 16:45:57', '');
INSERT INTO `sys_menu` VALUES (2001, '评论审核', 2000, 1, '/system/comment', 'menuItem', 'C', '0', '1', 'system:comment:view', '#', 'admin', '2021-05-09 16:12:45', 'admin', '2021-05-09 16:13:27', 'Comment_check菜单');
INSERT INTO `sys_menu` VALUES (2002, 'Comment_check查询', 2001, 1, '#', '', 'F', '0', '1', 'system:comment:list', '#', 'admin', '2021-05-09 16:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, 'Comment_check新增', 2001, 2, '#', '', 'F', '0', '1', 'system:comment:add', '#', 'admin', '2021-05-09 16:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, 'Comment_check修改', 2001, 3, '#', '', 'F', '0', '1', 'system:comment:edit', '#', 'admin', '2021-05-09 16:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, 'Comment_check删除', 2001, 4, '#', '', 'F', '0', '1', 'system:comment:remove', '#', 'admin', '2021-05-09 16:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, 'Comment_check导出', 2001, 5, '#', '', 'F', '0', '1', 'system:comment:export', '#', 'admin', '2021-05-09 16:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '评论管理', 0, 6, '/system/comment', 'menuItem', 'C', '0', '0', 'system:comment:view', 'fa fa-paper-plane-o', 'admin', '2021-05-21 16:42:58', 'admin', '2021-05-21 16:46:38', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 270 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"9\"],\"configName\":[\"主框架页-是否开启页脚\"],\"configKey\":[\"sys.index.ignoreFooter\"],\"configValue\":[\"true\"],\"configType\":[\"N\"],\"remark\":[\"是否开启底部页脚显示（true显示，false隐藏）\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:48:19');
INSERT INTO `sys_oper_log` VALUES (101, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"9\"],\"configName\":[\"主框架页-是否开启页脚\"],\"configKey\":[\"sys.index.ignoreFooter\"],\"configValue\":[\"true\"],\"configType\":[\"Y\"],\"remark\":[\"是否开启底部页脚显示（true显示，false隐藏）\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:48:29');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:50:19');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:50:35');
INSERT INTO `sys_oper_log` VALUES (104, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:51:21');
INSERT INTO `sys_oper_log` VALUES (105, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:51:23');
INSERT INTO `sys_oper_log` VALUES (106, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"项目经理已分配,不能删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-09 15:51:25');
INSERT INTO `sys_oper_log` VALUES (107, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"董事长已分配,不能删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-09 15:51:29');
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/103', '127.0.0.1', '内网IP', '103', '{\r\n  \"msg\" : \"部门存在用户,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-05-09 15:51:44');
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', '内网IP', '107', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:51:47');
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/102', '127.0.0.1', '内网IP', '102', '{\r\n  \"msg\" : \"存在下级部门,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-05-09 15:51:49');
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/109', '127.0.0.1', '内网IP', '109', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:51:52');
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/108', '127.0.0.1', '内网IP', '108', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:51:54');
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/102', '127.0.0.1', '内网IP', '102', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:51:56');
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/106', '127.0.0.1', '内网IP', '106', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:51:58');
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/105', '127.0.0.1', '内网IP', '105', '{\r\n  \"msg\" : \"部门存在用户,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-05-09 15:52:00');
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/104', '127.0.0.1', '内网IP', '104', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:52:03');
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/103', '127.0.0.1', '内网IP', '103', '{\r\n  \"msg\" : \"部门存在用户,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-05-09 15:52:05');
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:52:14');
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2021-05-09 15:52:16');
INSERT INTO `sys_oper_log` VALUES (120, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', '研发部门', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:52:22');
INSERT INTO `sys_oper_log` VALUES (121, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/105', '127.0.0.1', '内网IP', '105', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:52:26');
INSERT INTO `sys_oper_log` VALUES (122, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"苍山管理局\"],\"orderNum\":[\"0\"],\"leader\":[\"admin\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:52:53');
INSERT INTO `sys_oper_log` VALUES (123, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/103', '127.0.0.1', '内网IP', '103', '{\r\n  \"msg\" : \"部门存在用户,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-05-09 15:52:57');
INSERT INTO `sys_oper_log` VALUES (124, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"100\"],\"parentName\":[\"苍山管理局\"],\"deptName\":[\"研发部门\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:53:06');
INSERT INTO `sys_oper_log` VALUES (125, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/101', '127.0.0.1', '内网IP', '101', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:53:08');
INSERT INTO `sys_oper_log` VALUES (126, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"100\"],\"parentName\":[\"苍山管理局\"],\"deptName\":[\"评论审核\"],\"orderNum\":[\"1\"],\"leader\":[\"admin\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:53:39');
INSERT INTO `sys_oper_log` VALUES (127, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"超级管理员\"],\"postCode\":[\"admin\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:54:03');
INSERT INTO `sys_oper_log` VALUES (128, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"超级管理员\"],\"postCode\":[\"s_admin\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:54:14');
INSERT INTO `sys_oper_log` VALUES (129, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"2\"],\"postName\":[\"评论审核\"],\"postCode\":[\"admin\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:54:35');
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"评论审核\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', NULL, 1, '不允许操作超级管理员用户', '2021-05-09 15:55:14');
INSERT INTO `sys_oper_log` VALUES (131, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"评论审核\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2021-05-09 15:55:24');
INSERT INTO `sys_oper_log` VALUES (132, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '评论审核', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"超级管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"超级管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,4\"]}', NULL, 1, '不允许操作超级管理员角色', '2021-05-09 15:57:11');
INSERT INTO `sys_oper_log` VALUES (133, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '评论审核', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"100\"],\"parentName\":[\"苍山管理局\"],\"deptName\":[\"超级管理员\"],\"orderNum\":[\"1\"],\"leader\":[\"admin\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:57:35');
INSERT INTO `sys_oper_log` VALUES (134, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '评论审核', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"评论审核\"],\"orderNum\":[\"2\"],\"leader\":[\"admin\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:57:49');
INSERT INTO `sys_oper_log` VALUES (135, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '评论审核', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"200\"],\"userName\":[\"评论审核\"],\"deptName\":[\"评论审核\"],\"phonenumber\":[\"\"],\"email\":[\"2638090909@qq.com\"],\"loginName\":[\"user\"],\"sex\":[\"0\"],\"remark\":[\"评论审核\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:58:40');
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '评论审核', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"评论审核\"],\"roleKey\":[\"comment\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"评论审核\"],\"menuIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:59:46');
INSERT INTO `sys_oper_log` VALUES (137, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '评论审核', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"200\"],\"userName\":[\"评论审核\"],\"dept.deptName\":[\"评论审核\"],\"phonenumber\":[\"\"],\"email\":[\"2638090909@qq.com\"],\"loginName\":[\"user\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"评论审核\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 15:59:57');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '超级管理员', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"comment\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 16:07:24');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"审核功能\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-comments-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 16:09:34');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '超级管理员', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"comment\"],\"tableComment\":[\"评论\"],\"className\":[\"Comment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"用户评论表\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"username\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"评论内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"comment\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"评论时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"time\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"comment\"],\"functionName\":[\"Comment_check\"],\"params[parentMenuId]\":[\"2000\"],\"params[parentMenuName]\":[\"审核功能\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 16:10:29');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '超级管理员', '/tool/gen/download/comment', '127.0.0.1', '内网IP', '\"comment\"', NULL, 0, NULL, '2021-05-09 16:10:42');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"评论审核\"],\"url\":[\"/system/comment\"],\"target\":[\"menuItem\"],\"perms\":[\"system:comment:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 16:13:27');
INSERT INTO `sys_oper_log` VALUES (143, 'Comment_check', 1, 'com.ruoyi.system.controller.CommentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/add', '127.0.0.1', '内网IP', '{\"username\":[\"匿名用户\"],\"comment\":[\"你好大理\"],\"time\":[\"2021-05-09\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\repository\\CS\\ruoyi-system\\target\\classes\\mapper\\system\\CommentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CommentMapper.insertComment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into comment          ( username,             comment,             time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2021-05-09 16:15:11');
INSERT INTO `sys_oper_log` VALUES (144, 'Comment_check', 1, 'com.ruoyi.system.controller.CommentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/add', '127.0.0.1', '内网IP', '{\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"time\":[\"2021-05-13\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 16:15:52');
INSERT INTO `sys_oper_log` VALUES (145, 'Comment_check', 1, 'com.ruoyi.system.controller.CommentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/add', '127.0.0.1', '内网IP', '{\"username\":[\"admin\"],\"comment\":[\"124\"],\"time\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 16:16:03');
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"评论审核\"],\"roleKey\":[\"comment\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"评论审核\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 16:22:12');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '超级管理员', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 18:30:53');
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '超级管理员', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"comment\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 18:30:56');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '超级管理员', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"comment\"],\"tableComment\":[\"评论表\"],\"className\":[\"Comment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"评论审核表\"],\"columns[0].columnId\":[\"5\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"6\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"username\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"7\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"评论内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"comment\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"8\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"评论的审核状态\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"state\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"9\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"评论时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"time\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"comment\"],\"functionName\":[\"Comment_check\"],\"params[parentMenuId]\":[\"\"],\"params[parentMenuName]\":', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 18:31:26');
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '超级管理员', '/tool/gen/download/comment', '127.0.0.1', '内网IP', '\"comment\"', NULL, 0, NULL, '2021-05-09 18:31:30');
INSERT INTO `sys_oper_log` VALUES (151, 'Comment_check', 1, 'com.ruoyi.system.controller.CommentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/add', '127.0.0.1', '内网IP', '{\"username\":[\"admin\"],\"comment\":[\"1\"],\"state\":[\"2\"],\"time\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 18:33:10');
INSERT INTO `sys_oper_log` VALUES (152, 'Comment_check', 3, 'com.ruoyi.system.controller.CommentController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/comment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 18:33:16');
INSERT INTO `sys_oper_log` VALUES (153, 'Comment_check', 1, 'com.ruoyi.system.controller.CommentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/add', '127.0.0.1', '内网IP', '{\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"\"],\"time\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 18:33:26');
INSERT INTO `sys_oper_log` VALUES (154, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"],\"validateCode\":[\"00oo\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:28:40');
INSERT INTO `sys_oper_log` VALUES (155, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"validateCode\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:28:45');
INSERT INTO `sys_oper_log` VALUES (156, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"validateCode\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:30:30');
INSERT INTO `sys_oper_log` VALUES (157, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"],\"validateCode\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:37:44');
INSERT INTO `sys_oper_log` VALUES (158, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"评论状态\"],\"dictType\":[\"comment_state\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:45:58');
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未审核\"],\"dictValue\":[\"0\"],\"dictType\":[\"comment_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:46:39');
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"审核通过\"],\"dictValue\":[\"1\"],\"dictType\":[\"comment_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:47:18');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '超级管理员', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"comment\"],\"tableComment\":[\"评论表\"],\"className\":[\"Comment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"5\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"6\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"username\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"7\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"评论内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"comment\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"8\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"评论的审核状态\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"state\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"comment_state\"],\"columns[4].columnId\":[\"9\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"评论时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"time\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"comment\"],\"functionName\":[\"Comment_check\"],\"params[parentMenuId]\":[\"\"],\"params[parentMe', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:47:40');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '超级管理员', '/tool/gen/download/comment', '127.0.0.1', '内网IP', '\"comment\"', NULL, 0, NULL, '2021-05-09 22:48:14');
INSERT INTO `sys_oper_log` VALUES (163, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:53:16');
INSERT INTO `sys_oper_log` VALUES (164, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-09 22:53:42');
INSERT INTO `sys_oper_log` VALUES (165, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"a1A6\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 14:14:19');
INSERT INTO `sys_oper_log` VALUES (166, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"123\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 14:14:31');
INSERT INTO `sys_oper_log` VALUES (167, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"username\":[\"admin\"],\"comment\":[\"124\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"2754\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 14:37:31');
INSERT INTO `sys_oper_log` VALUES (168, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"123123\"]}', NULL, 1, 'Cannot create PyString with non-byte value', '2021-05-10 14:43:16');
INSERT INTO `sys_oper_log` VALUES (169, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"],\"captcha\":[\"123\"]}', NULL, 1, 'Cannot create PyString with non-byte value', '2021-05-10 14:45:01');
INSERT INTO `sys_oper_log` VALUES (170, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"123\"]}', NULL, 1, 'Cannot create PyString with non-byte value', '2021-05-10 14:46:55');
INSERT INTO `sys_oper_log` VALUES (171, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"username\":[\"admin\"],\"comment\":[\"124\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"123\"]}', NULL, 1, '', '2021-05-10 15:01:21');
INSERT INTO `sys_oper_log` VALUES (172, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"123\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:02:58');
INSERT INTO `sys_oper_log` VALUES (173, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"123\"]}', NULL, 1, '', '2021-05-10 15:04:32');
INSERT INTO `sys_oper_log` VALUES (174, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"username\":[\"admin\"],\"comment\":[\"124\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"\"]}', NULL, 1, '', '2021-05-10 15:08:40');
INSERT INTO `sys_oper_log` VALUES (175, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"qweqw\"]}', NULL, 1, '', '2021-05-10 15:10:14');
INSERT INTO `sys_oper_log` VALUES (176, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"12312\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:16:16');
INSERT INTO `sys_oper_log` VALUES (177, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"],\"captcha\":[\"12312\"]}', NULL, 1, '', '2021-05-10 15:17:05');
INSERT INTO `sys_oper_log` VALUES (178, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"124\"]}', NULL, 1, '', '2021-05-10 15:23:42');
INSERT INTO `sys_oper_log` VALUES (179, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"123\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:37:20');
INSERT INTO `sys_oper_log` VALUES (180, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"12431\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:39:28');
INSERT INTO `sys_oper_log` VALUES (181, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"21\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:40:34');
INSERT INTO `sys_oper_log` VALUES (182, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"12\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:43:09');
INSERT INTO `sys_oper_log` VALUES (183, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"安抚\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:44:39');
INSERT INTO `sys_oper_log` VALUES (184, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"1501\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:46:40');
INSERT INTO `sys_oper_log` VALUES (185, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"123\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:48:21');
INSERT INTO `sys_oper_log` VALUES (186, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"admin\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"4918\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:49:30');
INSERT INTO `sys_oper_log` VALUES (187, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"],\"captcha\":[\"6986\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:50:37');
INSERT INTO `sys_oper_log` VALUES (188, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"],\"captcha\":[\"123\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:54:53');
INSERT INTO `sys_oper_log` VALUES (189, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"],\"captcha\":[\"123\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 15:55:32');
INSERT INTO `sys_oper_log` VALUES (190, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"username\":[\"admin\"],\"comment\":[\"测试留言\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"4240\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:00:08');
INSERT INTO `sys_oper_log` VALUES (191, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"1501\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:04:46');
INSERT INTO `sys_oper_log` VALUES (192, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"1501\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:12:55');
INSERT INTO `sys_oper_log` VALUES (193, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"c\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:21:00');
INSERT INTO `sys_oper_log` VALUES (194, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"ccb8\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:21:17');
INSERT INTO `sys_oper_log` VALUES (195, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"],\"captcha\":[\"6986\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:24:56');
INSERT INTO `sys_oper_log` VALUES (196, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"username\":[\"admin\"],\"comment\":[\"你好大理\"],\"state\":[\"1\"],\"time\":[\"2021-05-13\"],\"captcha\":[\"8944\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:25:10');
INSERT INTO `sys_oper_log` VALUES (197, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"审核不通过\"],\"dictValue\":[\"2\"],\"dictType\":[\"comment_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:30:22');
INSERT INTO `sys_oper_log` VALUES (198, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"审核通过\"],\"dictValue\":[\"1\"],\"dictType\":[\"comment_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:30:32');
INSERT INTO `sys_oper_log` VALUES (199, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"未审核\"],\"dictValue\":[\"0\"],\"dictType\":[\"comment_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:30:36');
INSERT INTO `sys_oper_log` VALUES (200, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"未审核\"],\"dictValue\":[\"0\"],\"dictType\":[\"comment_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:30:40');
INSERT INTO `sys_oper_log` VALUES (201, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"审核通过\"],\"dictValue\":[\"1\"],\"dictType\":[\"comment_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:30:52');
INSERT INTO `sys_oper_log` VALUES (202, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"未审核\"],\"dictValue\":[\"0\"],\"dictType\":[\"comment_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:30:56');
INSERT INTO `sys_oper_log` VALUES (203, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"未审核\"],\"dictValue\":[\"0\"],\"dictType\":[\"comment_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:31:01');
INSERT INTO `sys_oper_log` VALUES (204, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"username\":[\"admin\"],\"comment\":[\"测试留言\"],\"state\":[\"1\"],\"time\":[\"\"],\"captcha\":[\"qweqw\"]}', '{\r\n  \"msg\" : \"审核状态未更改\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:31:24');
INSERT INTO `sys_oper_log` VALUES (205, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"username\":[\"admin\"],\"comment\":[\"测试留言\"],\"state\":[\"0\"],\"time\":[\"\"],\"captcha\":[\"qweqw\"]}', '{\r\n  \"msg\" : \"已经审核\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:31:29');
INSERT INTO `sys_oper_log` VALUES (206, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"2\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"已经审核\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:31:36');
INSERT INTO `sys_oper_log` VALUES (207, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"2\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"已经审核\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:31:36');
INSERT INTO `sys_oper_log` VALUES (208, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"2\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"已经审核\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:31:39');
INSERT INTO `sys_oper_log` VALUES (209, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"2\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"已经审核,不可更改状态\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:33:09');
INSERT INTO `sys_oper_log` VALUES (210, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"审核状态未更改\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:33:12');
INSERT INTO `sys_oper_log` VALUES (211, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"0\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"已经审核,不可更改状态\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:33:15');
INSERT INTO `sys_oper_log` VALUES (212, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"username\":[\"新的测试\"],\"comment\":[\"32\"],\"state\":[\"1\"],\"time\":[\"2021-05-21\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"审核状态未更改\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:33:20');
INSERT INTO `sys_oper_log` VALUES (213, 'Comment_check', 1, 'com.ruoyi.system.controller.CommentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/add', '127.0.0.1', '内网IP', '{\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"0\"],\"time\":[\"2021-05-06\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:43:07');
INSERT INTO `sys_oper_log` VALUES (214, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"0\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"审核状态未更改\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:43:17');
INSERT INTO `sys_oper_log` VALUES (215, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"1\"],\"captcha\":[\"\"]}', NULL, 1, '', '2021-05-10 16:43:21');
INSERT INTO `sys_oper_log` VALUES (216, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:46:54');
INSERT INTO `sys_oper_log` VALUES (217, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:47:02');
INSERT INTO `sys_oper_log` VALUES (218, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:47:03');
INSERT INTO `sys_oper_log` VALUES (219, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:47:05');
INSERT INTO `sys_oper_log` VALUES (220, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"2\"],\"captcha\":[\"cm4\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:47:23');
INSERT INTO `sys_oper_log` VALUES (221, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"2\"],\"captcha\":[\"cm46\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:47:29');
INSERT INTO `sys_oper_log` VALUES (222, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"1\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:48:16');
INSERT INTO `sys_oper_log` VALUES (223, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"1\"],\"captcha\":[\"a486\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:48:22');
INSERT INTO `sys_oper_log` VALUES (224, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理一日游\"],\"state\":[\"1\"],\"captcha\":[\"a827\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:48:27');
INSERT INTO `sys_oper_log` VALUES (225, 'Comment_check', 1, 'com.ruoyi.system.controller.CommentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/add', '127.0.0.1', '内网IP', '{\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"0\"],\"time\":[\"2021-05-27\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:57:22');
INSERT INTO `sys_oper_log` VALUES (226, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"2\"],\"captcha\":[\"asdf\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 16:57:40');
INSERT INTO `sys_oper_log` VALUES (227, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"0\"],\"captcha\":[\"5b\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 16:58:10');
INSERT INTO `sys_oper_log` VALUES (228, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"0\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 17:03:23');
INSERT INTO `sys_oper_log` VALUES (229, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"0\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 17:05:07');
INSERT INTO `sys_oper_log` VALUES (230, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"0\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 17:05:47');
INSERT INTO `sys_oper_log` VALUES (231, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 17:05:57');
INSERT INTO `sys_oper_log` VALUES (232, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"1\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 17:27:06');
INSERT INTO `sys_oper_log` VALUES (233, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"0\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 17:27:22');
INSERT INTO `sys_oper_log` VALUES (234, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 17:27:27');
INSERT INTO `sys_oper_log` VALUES (235, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"1\"],\"captcha\":[\"8b\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 17:28:29');
INSERT INTO `sys_oper_log` VALUES (236, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"0\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 17:30:45');
INSERT INTO `sys_oper_log` VALUES (237, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"1\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-10 17:30:50');
INSERT INTO `sys_oper_log` VALUES (238, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"username\":[\"admin\"],\"comment\":[\"你知道吗\"],\"state\":[\"1\"],\"captcha\":[\"c6o1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 17:30:58');
INSERT INTO `sys_oper_log` VALUES (239, 'Comment_check', 1, 'com.ruoyi.system.controller.CommentController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/add', '127.0.0.1', '内网IP', '{\"username\":[\"admin\"],\"comment\":[\"文涛\"],\"state\":[\"0\"],\"time\":[\"2021-05-21\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 17:54:14');
INSERT INTO `sys_oper_log` VALUES (240, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"username\":[\"admin\"],\"comment\":[\"文涛\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-10 17:54:20');
INSERT INTO `sys_oper_log` VALUES (241, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"username\":[\"admin\"],\"comment\":[\"文涛\"],\"state\":[\"0\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-11 09:20:10');
INSERT INTO `sys_oper_log` VALUES (242, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"username\":[\"admin\"],\"comment\":[\"文涛\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-11 09:20:26');
INSERT INTO `sys_oper_log` VALUES (243, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"username\":[\"admin\"],\"comment\":[\"文涛\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"审核状态未更改\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-11 09:20:30');
INSERT INTO `sys_oper_log` VALUES (244, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"username\":[\"admin\"],\"comment\":[\"文涛\"],\"state\":[\"1\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"请输入验证码\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-11 09:20:34');
INSERT INTO `sys_oper_log` VALUES (245, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"username\":[\"admin\"],\"comment\":[\"文涛\"],\"state\":[\"1\"],\"captcha\":[\"0023\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-11 09:20:39');
INSERT INTO `sys_oper_log` VALUES (246, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"username\":[\"admin\"],\"comment\":[\"文涛\"],\"state\":[\"1\"],\"captcha\":[\"pp48\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-11 09:20:45');
INSERT INTO `sys_oper_log` VALUES (247, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"username\":[\"匿名用户\"],\"comment\":[\"qwe\"],\"state\":[\"1\"],\"captcha\":[\"a8sd\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-11 14:54:43');
INSERT INTO `sys_oper_log` VALUES (248, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"username\":[\"匿名用户\"],\"comment\":[\"qwe\"],\"state\":[\"1\"],\"captcha\":[\"a82p\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-11 14:54:52');
INSERT INTO `sys_oper_log` VALUES (249, 'Comment_check', 3, 'com.ruoyi.system.controller.CommentController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/comment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-11 14:58:54');
INSERT INTO `sys_oper_log` VALUES (250, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理有什么景点\"],\"state\":[\"2\"],\"captcha\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-11 14:58:58');
INSERT INTO `sys_oper_log` VALUES (251, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"username\":[\"匿名用户\"],\"comment\":[\"大理有什么景点\"],\"state\":[\"1\"],\"captcha\":[\"81o6\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-11 14:59:17');
INSERT INTO `sys_oper_log` VALUES (252, 'Comment_check', 3, 'com.ruoyi.system.controller.CommentController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/comment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-12 13:36:59');
INSERT INTO `sys_oper_log` VALUES (253, 'Comment_check', 3, 'com.ruoyi.system.controller.CommentController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/comment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-12 13:37:01');
INSERT INTO `sys_oper_log` VALUES (254, 'Comment_check', 3, 'com.ruoyi.system.controller.CommentController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/comment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-12 13:37:03');
INSERT INTO `sys_oper_log` VALUES (255, 'Comment_check', 3, 'com.ruoyi.system.controller.CommentController.remove()', 'POST', 1, 'admin', '超级管理员', '/system/comment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-12 13:37:04');
INSERT INTO `sys_oper_log` VALUES (256, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"13\"],\"username\":[\"匿名用户\"],\"comment\":[\"你好啊\"],\"state\":[\"1\"],\"captcha\":[\"o2mb\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-12 13:42:52');
INSERT INTO `sys_oper_log` VALUES (257, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"14\"],\"username\":[\"匿名用户\"],\"comment\":[\"你们好\"],\"state\":[\"1\"],\"captcha\":[\"1oaf\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-13 17:19:56');
INSERT INTO `sys_oper_log` VALUES (258, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"14\"],\"username\":[\"匿名用户\"],\"comment\":[\"你们好\"],\"state\":[\"1\"],\"captcha\":[\"1oa7\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-13 17:20:02');
INSERT INTO `sys_oper_log` VALUES (259, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"14\"],\"username\":[\"匿名用户\"],\"comment\":[\"你们好\"],\"state\":[\"1\"],\"captcha\":[\"ma42\"]}', '{\r\n  \"msg\" : \"验证码错误\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-13 17:20:12');
INSERT INTO `sys_oper_log` VALUES (260, 'Comment_check', 2, 'com.ruoyi.system.controller.CommentController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/comment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"14\"],\"username\":[\"匿名用户\"],\"comment\":[\"你们好\"],\"state\":[\"1\"],\"captcha\":[\"9b6a\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-13 17:20:37');
INSERT INTO `sys_oper_log` VALUES (261, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'user', '评论审核', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\r\n  \"msg\" : \"java.io.FileNotFoundException: C:\\\\Users\\\\apple\\\\AppData\\\\Local\\\\Temp\\\\tomcat.80.8827314504904894489\\\\work\\\\Tomcat\\\\localhost\\\\ROOT\\\\CS\\\\uploadPath\\\\avatar\\\\2021\\\\05\\\\21\\\\5db375b8-6103-4492-8aab-4d81b86d566c.png (系统找不到指定的路径。)\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-05-21 16:40:31');
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"审核\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-paper-plane-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-21 16:42:58');
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"审核\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:comment:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-paper-plane-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-21 16:44:09');
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"审核\"],\"url\":[\"/system/comment\"],\"target\":[\"menuItem\"],\"perms\":[\"system:comment:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-paper-plane-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-21 16:44:27');
INSERT INTO `sys_oper_log` VALUES (265, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"评论审核\"],\"roleKey\":[\"comment\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"评论审核\"],\"menuIds\":[\"2000,2001,2002,2003,2004,2005,2006,2007\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-21 16:45:49');
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"审核功能\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-comments-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-21 16:45:57');
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"评论管理\"],\"url\":[\"/system/comment\"],\"target\":[\"menuItem\"],\"perms\":[\"system:comment:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-paper-plane-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-21 16:46:38');
INSERT INTO `sys_oper_log` VALUES (268, 'Comment_check', 3, 'com.ruoyi.system.controller.CommentController.remove()', 'POST', 1, 'user', '评论审核', '/system/comment/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-05-21 16:46:50');
INSERT INTO `sys_oper_log` VALUES (269, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'user', '评论审核', '/system/user/profile/updateAvatar', '39.129.48.5', 'XX XX', '', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', 0, NULL, '2021-05-21 17:02:57');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 's_admin', '超级管理员', 1, '0', 'admin', '2021-05-09 15:41:09', 'admin', '2021-05-09 15:54:14', '');
INSERT INTO `sys_post` VALUES (2, 'admin', '评论审核', 2, '0', 'admin', '2021-05-09 15:41:09', 'admin', '2021-05-09 15:54:35', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-05-09 15:41:09', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '2', 'admin', '2021-05-09 15:41:09', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '评论审核', 'comment', 2, '1', '0', '0', 'admin', '2021-05-09 15:59:46', 'admin', '2021-05-21 16:45:49', '评论审核');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-05-21 16:46:27', '2021-05-09 15:41:09', 'admin', '2021-05-09 15:41:09', '', '2021-05-21 16:46:27', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '2', '127.0.0.1', '2021-05-09 15:41:09', '2021-05-09 15:41:09', 'admin', '2021-05-09 15:41:09', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 200, 'user', '评论审核', '00', '2638090909@qq.com', '', '0', '/profile/avatar/2021/05/21/2584c3d4-ca12-4420-a13d-9ffdb5cb4fde.png', '0b547a9c9bb03bc97bff5531c6560242', '109f4b', '0', '0', '39.129.48.5', '2021-05-21 17:03:09', NULL, 'admin', '2021-05-09 15:58:40', 'admin', '2021-05-21 17:03:08', '评论审核');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('d242e237-c44b-40b2-8c52-88ca39f6f811', 'user', '评论审核', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2021-05-21 16:46:45', '2021-05-21 16:46:45', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (100, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);

SET FOREIGN_KEY_CHECKS = 1;
