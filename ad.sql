DROP DATABASE IF EXISTS `ad`;
CREATE DATABASE `ad`;
USE `ad`;
-- ----------------------------
-- Table structure for `randad`
-- ----------------------------
CREATE TABLE `randad` (
  `ADID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(20) NOT NULL,
  `contents` varchar(50) NOT NULL,
  PRIMARY KEY (`ADID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of randad
-- ----------------------------
INSERT INTO randad VALUES ('1', '6/5～6/16', '買三個商品打九折，買四個商品打八五折，再送黃恆嘉');
INSERT INTO randad VALUES ('2', '6/5～6/16', '️滿500贈精美小禮物');
INSERT INTO randad VALUES ('3', '6/5～6/16', '滿899免運費，再送黃恆嘉');
