/*
 Navicat Premium Data Transfer

 Source Server         : kyrs
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 17/04/2025 23:05:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for material_type
-- ----------------------------
DROP TABLE IF EXISTS `material_type`;
CREATE TABLE `material_type`  (
  `idmaterial_type` int NOT NULL AUTO_INCREMENT,
  `material_type` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `procent_braka` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idmaterial_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material_type
-- ----------------------------
INSERT INTO `material_type` VALUES (1, 'Тип материала 1', '0,10%');
INSERT INTO `material_type` VALUES (2, 'Тип материала 2', '0,95%');
INSERT INTO `material_type` VALUES (3, 'Тип материала 3', '0,28%');
INSERT INTO `material_type` VALUES (4, 'Тип материала 4', '0,55%');
INSERT INTO `material_type` VALUES (5, 'Тип материала 5', '0,34%');

-- ----------------------------
-- Table structure for material_type_has_products
-- ----------------------------
DROP TABLE IF EXISTS `material_type_has_products`;
CREATE TABLE `material_type_has_products`  (
  `material_type_idmaterial_type` int NOT NULL,
  `products_idproducts` int NOT NULL,
  `kol_vo_na_sklade` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`material_type_idmaterial_type`, `products_idproducts`) USING BTREE,
  INDEX `fk_material_type_has_products_products1_idx`(`products_idproducts` ASC) USING BTREE,
  INDEX `fk_material_type_has_products_material_type1_idx`(`material_type_idmaterial_type` ASC) USING BTREE,
  CONSTRAINT `fk_material_type_has_products_material_type1` FOREIGN KEY (`material_type_idmaterial_type`) REFERENCES `material_type` (`idmaterial_type`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_material_type_has_products_products1` FOREIGN KEY (`products_idproducts`) REFERENCES `products` (`idproducts`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material_type_has_products
-- ----------------------------

-- ----------------------------
-- Table structure for partners
-- ----------------------------
DROP TABLE IF EXISTS `partners`;
CREATE TABLE `partners`  (
  `idpartners` int NOT NULL AUTO_INCREMENT,
  `partners_title` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `full_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(450) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `inn` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `raiting` int NULL DEFAULT NULL,
  `partners_type_idpartners_type` int NOT NULL,
  PRIMARY KEY (`idpartners`) USING BTREE,
  INDEX `fk_partners_partners_type_idx`(`partners_type_idpartners_type` ASC) USING BTREE,
  CONSTRAINT `fk_partners_partners_type` FOREIGN KEY (`partners_type_idpartners_type`) REFERENCES `partners_type` (`idpartners_type`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of partners
-- ----------------------------
INSERT INTO `partners` VALUES (1, 'База Строитель', 'Иванова Александра Ивановна', 'aleksandraivanova@ml.ru', '493 123 45 67', '652050, Кемеровская область, город Юрга, ул. Лесная, 15', '2222455179', 7, 1);
INSERT INTO `partners` VALUES (2, 'Паркет 29', 'Петров Василий Петрович', 'vppetrov@vl.ru', '987 123 56 78', '164500, Архангельская область, город Северодвинск, ул. Строителей, 18', '3333888520', 7, 2);
INSERT INTO `partners` VALUES (3, 'Стройсервис', 'Соловьев Андрей Николаевич', 'ansolovev@st.ru', '812 223 32 00', '188910, Ленинградская область, город Приморск, ул. Парковая, 21', '4440391035', 7, 3);
INSERT INTO `partners` VALUES (4, 'Ремонт и отделка', 'Воробьева Екатерина Валерьевна', 'ekaterina.vorobeva@ml.ru', '444 222 33 11', '143960, Московская область, город Реутов, ул. Свободы, 51', '1111520857', 5, 4);
INSERT INTO `partners` VALUES (5, 'МонтажПро', 'Степанов Степан Сергеевич', 'stepanov@stepan.ru', '912 888 33 33', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', '5552431140', 10, 1);
INSERT INTO `partners` VALUES (16, '123', '123', 'dsf@sdf.', '123', '123', '123', 2, 2);
INSERT INTO `partners` VALUES (17, 'ВАДИМ', 'ВАКИН', 'выа@df.', '234', 'МОСКА ЮРОУ', '324', 10, 2);

-- ----------------------------
-- Table structure for partners_has_products
-- ----------------------------
DROP TABLE IF EXISTS `partners_has_products`;
CREATE TABLE `partners_has_products`  (
  `partners_idpartners` int NOT NULL,
  `products_idproducts` int NOT NULL,
  `sale_date` date NULL DEFAULT NULL,
  `product_count` int NULL DEFAULT NULL,
  PRIMARY KEY (`partners_idpartners`, `products_idproducts`) USING BTREE,
  INDEX `fk_partners_has_products_products1_idx`(`products_idproducts` ASC) USING BTREE,
  INDEX `fk_partners_has_products_partners1_idx`(`partners_idpartners` ASC) USING BTREE,
  CONSTRAINT `fk_partners_has_products_partners1` FOREIGN KEY (`partners_idpartners`) REFERENCES `partners` (`idpartners`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_partners_has_products_products1` FOREIGN KEY (`products_idproducts`) REFERENCES `products` (`idproducts`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of partners_has_products
-- ----------------------------
INSERT INTO `partners_has_products` VALUES (1, 1, '2023-03-23', 15500);
INSERT INTO `partners_has_products` VALUES (1, 3, '2023-12-18', 12350);
INSERT INTO `partners_has_products` VALUES (1, 4, '2024-06-07', 37400);
INSERT INTO `partners_has_products` VALUES (2, 1, '2024-07-01', 7550);
INSERT INTO `partners_has_products` VALUES (2, 2, '2022-12-02', 35000);
INSERT INTO `partners_has_products` VALUES (2, 3, '2024-06-07', 1000);
INSERT INTO `partners_has_products` VALUES (2, 5, '2023-05-17', 1250);
INSERT INTO `partners_has_products` VALUES (3, 1, '2023-01-22', 7250);
INSERT INTO `partners_has_products` VALUES (3, 2, '2024-07-05', 2500);
INSERT INTO `partners_has_products` VALUES (4, 3, '2024-03-12', 37200);
INSERT INTO `partners_has_products` VALUES (4, 4, '2023-03-20', 59050);
INSERT INTO `partners_has_products` VALUES (4, 5, '2024-05-14', 4500);
INSERT INTO `partners_has_products` VALUES (5, 1, '2024-04-15', 35000);
INSERT INTO `partners_has_products` VALUES (5, 2, '2024-06-12', 25000);
INSERT INTO `partners_has_products` VALUES (5, 3, '2023-09-19', 50000);
INSERT INTO `partners_has_products` VALUES (5, 4, '2023-11-10', 670000);

-- ----------------------------
-- Table structure for partners_type
-- ----------------------------
DROP TABLE IF EXISTS `partners_type`;
CREATE TABLE `partners_type`  (
  `idpartners_type` int NOT NULL AUTO_INCREMENT,
  `partners_type` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idpartners_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of partners_type
-- ----------------------------
INSERT INTO `partners_type` VALUES (1, 'ЗАО');
INSERT INTO `partners_type` VALUES (2, 'ООО');
INSERT INTO `partners_type` VALUES (3, 'ПАО');
INSERT INTO `partners_type` VALUES (4, 'ОАО');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `idproducts` int NOT NULL AUTO_INCREMENT,
  `products_title` varchar(450) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `articul` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `minPrice` float NULL DEFAULT NULL,
  `products_type_idproducts_type` int NOT NULL,
  PRIMARY KEY (`idproducts`) USING BTREE,
  INDEX `fk_products_products_type1_idx`(`products_type_idproducts_type` ASC) USING BTREE,
  CONSTRAINT `fk_products_products_type1` FOREIGN KEY (`products_type_idproducts_type`) REFERENCES `products_type` (`idproducts_type`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Паркетная доска Ясень темный однополосная 14 мм', '8758385', 4456.9, 3);
INSERT INTO `products` VALUES (2, 'Инженерная доска Дуб Французская елка однополосная 12 мм', '8858958', 7330.99, 3);
INSERT INTO `products` VALUES (3, 'Ламинат Дуб дымчато-белый 33 класс 12 мм', '7750282', 1799.33, 1);
INSERT INTO `products` VALUES (4, 'Ламинат Дуб серый 32 класс 8 мм с фаской', '7028748', 3890.41, 1);
INSERT INTO `products` VALUES (5, 'Пробковое напольное клеевое покрытие 32 класс 4 мм', '5012543', 5450.59, 4);

-- ----------------------------
-- Table structure for products_type
-- ----------------------------
DROP TABLE IF EXISTS `products_type`;
CREATE TABLE `products_type`  (
  `idproducts_type` int NOT NULL AUTO_INCREMENT,
  `products_type` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `koef_tip_prod` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idproducts_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products_type
-- ----------------------------
INSERT INTO `products_type` VALUES (1, 'product_type', 'koef');
INSERT INTO `products_type` VALUES (2, '1', '2,35');
INSERT INTO `products_type` VALUES (3, '2', '5,15');
INSERT INTO `products_type` VALUES (4, '3', '4,34');
INSERT INTO `products_type` VALUES (5, '4', '1,5');

SET FOREIGN_KEY_CHECKS = 1;
