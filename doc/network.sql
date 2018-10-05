/*
 Navicat Premium Data Transfer

 Source Server         : car
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : 140.143.66.115:3306
 Source Schema         : network

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 05/10/2018 18:26:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(11) NOT NULL COMMENT '主键，记录唯一标识',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户id，外键指向`user.id`',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `type` int(11) NULL DEFAULT NULL COMMENT '文件类型（0：目录，1：文件）',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cos服务器上文件链接',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小，单位Byte',
  `upload_time` datetime(0) NULL DEFAULT NULL COMMENT '文件上传时间',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '所属目录id，外键指向`file.id`',
  `public_status` int(11) NULL DEFAULT NULL COMMENT '公开状态（0：未公开，1：公开）',
  `public_time` datetime(0) NULL DEFAULT NULL COMMENT '公开时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_public_status`(`public_status`) USING BTREE,
  INDEX `idx_public_time`(`public_time`) USING BTREE,
  INDEX `fk_file_user`(`user_id`) USING BTREE,
  INDEX `fk_file_file`(`parent_id`) USING BTREE,
  CONSTRAINT `fk_file_file` FOREIGN KEY (`parent_id`) REFERENCES `file` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_file_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`  (
  `id` int(11) NOT NULL COMMENT '主键，记录唯一标识',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id，外键指向`user.id`',
  `share_link` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享链接，唯一',
  `share_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享码',
  `file_id` int(11) NULL DEFAULT NULL COMMENT '文件id，外键指向`file.id`',
  `share_time` datetime(0) NULL DEFAULT NULL COMMENT '分享时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_share_link_share_code`(`share_link`, `share_code`) USING BTREE,
  INDEX `idx_share_time`(`share_time`) USING BTREE,
  INDEX `fk_share_user`(`user_id`) USING BTREE,
  INDEX `fk_share_file`(`file_id`) USING BTREE,
  CONSTRAINT `fk_share_file` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_share_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，记录唯一标识',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名，唯一',
  `phone_num` bigint(20) NOT NULL DEFAULT 0 COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `gmt_created` datetime(0) NOT NULL COMMENT '记录创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE,
  INDEX `idx_phone_num`(`phone_num`) USING BTREE,
  INDEX `idx_email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for verif
-- ----------------------------
DROP TABLE IF EXISTS `verif`;
CREATE TABLE `verif`  (
  `id` int(11) NOT NULL COMMENT '主键，记录唯一标识',
  `verif_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱或手机号',
  `verif_code` int(11) NULL DEFAULT NULL COMMENT '验证码',
  `record_time` datetime(0) NULL DEFAULT NULL COMMENT '验证时间',
  `gmt_created` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_verif_number`(`verif_number`) USING BTREE,
  INDEX `idx_record_time`(`record_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
