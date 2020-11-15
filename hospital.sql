/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : hospital

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-03-06 16:32:10
*/

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE `hospital`;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `createdate` varchar(100) DEFAULT NULL,
  `effectdate` varchar(100) DEFAULT NULL,
  `expiredate` varchar(100) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `fk_ap` (`pid`),
  KEY `fk_ad` (`did`),
  CONSTRAINT `fk_ad` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`),
  CONSTRAINT `fk_ap` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES ('1', '1', '1', '发热，咳嗽，流清涕', '20180404', '20180404', '20180405', '3');
INSERT INTO `appointment` VALUES ('2', '1', '2', '肚子疼，阵痛，伴有腹泻', '20200909', '20200910', '20200911', '3');
INSERT INTO `appointment` VALUES ('3', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('4', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('5', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('6', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('7', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('8', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('9', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('10', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('11', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('12', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('13', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('14', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('15', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('16', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');
-- INSERT INTO `appointment` VALUES ('17', '2', '1', '牙疼', '20201012', '20201015', '20201016', '3');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `titel` varchar(500) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  `education` varchar(500) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `fk_pd` (`uid`),
  CONSTRAINT `fk_pd` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('1', '医生1', '男', '主任医师', '内科', '本科', '1');
INSERT INTO `doctor` VALUES ('2', '医生2', '女', '见习医师', '牙科', '博士', '2');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `birth` varchar(100) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_pu` (`uid`),
  CONSTRAINT `fk_pu` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('1', '患者1', '20001010', '男', '山东省青岛市崂山区', '17863945621', '4');
INSERT INTO `patient` VALUES ('2', '患者2', '19990909', '女', '北京市', '17863952648', '5');



-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `symptom` varchar(1000) DEFAULT NULL,
  `diagnosis` varchar(1000) DEFAULT NULL,
  `prescription` varchar(1000) DEFAULT NULL,
  `createdate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `fk_rp` (`pid`),
  KEY `fk_rd` (`did`),
  CONSTRAINT `fk_rd` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`),
  CONSTRAINT `fk_rp` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', '1', '1', '上呼吸道感染简称上感，又称普通感冒。是包括鼻腔、咽或喉部急性炎症的总称。广义的上感不是一个疾病诊断，而是一组疾病，包括普通感冒、病毒性咽炎、喉炎、疱疹性咽峡炎、咽结膜热、细菌性咽-扁桃体炎。狭义的上感又称普通感冒，是最常见的急性呼吸道感染性疾病，多呈自限性，但发生率较高。成人每年发生2～4次，儿童发生率更高，每年6～8次。全年皆可发病，冬春季较多。', '具有清热解毒和抗病毒作用的中药亦可选用，有助于改善症状，缩短病程。小柴胡冲剂、板蓝根冲剂应用较为广泛。', '奥司他韦（胶囊/颗粒）成人剂量每次75mg，每日2次。', '20180404');
INSERT INTO `record` VALUES ('2', '1', '2', '上呼吸道感染简称上感，又称普通感冒。是包括鼻腔、咽或喉部急性炎症的总称。广义的上感不是一个疾病诊断，而是一组疾病，包括普通感冒、病毒性咽炎、喉炎、疱疹性咽峡炎、咽结膜热、细菌性咽-扁桃体炎。狭义的上感又称普通感冒，是最常见的急性呼吸道感染性疾病，多呈自限性，但发生率较高。成人每年发生2～4次，儿童发生率更高，每年6～8次。全年皆可发病，冬春季较多。', '具有清热解毒和抗病毒作用的中药亦可选用，有助于改善症状，缩短病程。小柴胡冲剂、板蓝根冲剂应用较为广泛。', '除菌喷剂', '20200909');
INSERT INTO `record` VALUES ('3', '2', '1', '龋病俗称虫牙、蛀牙，是细菌性疾病，可以继发牙髓炎和根尖周炎，甚至能引起牙槽骨和颌骨炎症。如不及时治疗，病变继续发展，形成龋洞，终至牙冠完全破坏消失，其发展的最终结果是牙齿丧失。龋病特点是发病率高，分布广。是口腔主要的常见病，也是人类最普遍的疾病之一，世界卫生组织已将其与肿瘤和心血管疾病并列为人类三大重点防治疾病。', '龋病治疗的目的在于终止病变过程，恢复牙齿的固有形态和功能。', '西帕依固龈液', '20201015');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'doctor1', '123', '1');
INSERT INTO `user` VALUES ('2', 'doctor2', '123', '1');
INSERT INTO `user` VALUES ('3', 'admin', '123', '2');
INSERT INTO `user` VALUES ('4', 'patient1', '123', '3');
INSERT INTO `user` VALUES ('5', 'patient2', '123', '3');

