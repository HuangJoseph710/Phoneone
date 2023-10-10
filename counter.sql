DROP DATABASE IF EXISTS `counter`;
CREATE DATABASE `counter`;
USE `counter`;
-- ----------------------------
-- Table structure for `counter`
-- ----------------------------
DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `count` int(10) NOT NULL,
  PRIMARY KEY(`count`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of counter
-- ----------------------------
INSERT INTO `counter` VALUES ('0');
