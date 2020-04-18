/*
Navicat MySQL Data Transfer

Source Server         : 555
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : signinsystem

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2020-04-18 15:47:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `amajor_key` int(11) NOT NULL AUTO_INCREMENT,
  `anum` varchar(255) NOT NULL,
  `apwd` varchar(255) NOT NULL,
  PRIMARY KEY (`amajor_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `cmajor_key` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL,
  `csmajor_key` int(11) NOT NULL,
  `smajor_key` int(11) NOT NULL,
  `cexist` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cmajor_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `csmajor_key` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) NOT NULL,
  `tmajor_key` int(11) NOT NULL,
  `cszhou` varchar(255) NOT NULL,
  `csweek` int(11) NOT NULL,
  `csno` int(11) NOT NULL,
  `csallowablet` int(11) NOT NULL DEFAULT '1',
  `csexist` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`csmajor_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for signin
-- ----------------------------
DROP TABLE IF EXISTS `signin`;
CREATE TABLE `signin` (
  `simajor_key` int(11) NOT NULL AUTO_INCREMENT,
  `csmajor_key` int(11) NOT NULL,
  `smajor_key` int(11) NOT NULL,
  `sidate` varchar(255) DEFAULT NULL,
  `siaddr` varchar(255) DEFAULT NULL,
  `sistate` int(11) NOT NULL DEFAULT '0',
  `siexist` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`simajor_key`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `smajor_key` int(11) NOT NULL AUTO_INCREMENT,
  `snum` varchar(255) NOT NULL,
  `spwd` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `ssex` varchar(255) NOT NULL,
  `stel` varchar(255) NOT NULL,
  `sexist` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`smajor_key`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tmajor_key` int(11) NOT NULL AUTO_INCREMENT,
  `tnum` varchar(255) NOT NULL,
  `tpwd` varchar(255) NOT NULL,
  `tname` varchar(255) NOT NULL,
  `tsex` varchar(255) NOT NULL,
  `ttel` varchar(255) NOT NULL,
  `texist` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tmajor_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xixihele_course
-- ----------------------------
DROP TABLE IF EXISTS `xixihele_course`;
CREATE TABLE `xixihele_course` (
  `course_id` int(10) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xixihele_sign
-- ----------------------------
DROP TABLE IF EXISTS `xixihele_sign`;
CREATE TABLE `xixihele_sign` (
  `course_id` int(10) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) NOT NULL,
  `teacher_id` int(10) NOT NULL,
  `teacher_name` varchar(50) DEFAULT NULL,
  `endtime` int(10) NOT NULL DEFAULT '0',
  `stuend_num` int(10) NOT NULL DEFAULT '0',
  `sign_num` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xixihele_sign_log
-- ----------------------------
DROP TABLE IF EXISTS `xixihele_sign_log`;
CREATE TABLE `xixihele_sign_log` (
  `sign_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL DEFAULT '0',
  `stuend_id` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xixihele_stuend
-- ----------------------------
DROP TABLE IF EXISTS `xixihele_stuend`;
CREATE TABLE `xixihele_stuend` (
  `stuend_id` int(10) NOT NULL AUTO_INCREMENT,
  `stuend_name` varchar(50) NOT NULL,
  `stuend_no` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `addtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stuend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xixihele_teacher
-- ----------------------------
DROP TABLE IF EXISTS `xixihele_teacher`;
CREATE TABLE `xixihele_teacher` (
  `teacher_id` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_no` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
