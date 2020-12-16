/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 100410
 Source Host           : localhost:3306
 Source Schema         : ciclos_propedeuticos_2

 Target Server Type    : MySQL
 Target Server Version : 100410
 File Encoding         : 65001

 Date: 16/12/2020 13:08:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chats
-- ----------------------------
DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'nombre',
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'ultimima actualizzacion',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chats
-- ----------------------------
INSERT INTO `chats` VALUES (1, 'Chat 1', '2020-11-11 21:18:03');
INSERT INTO `chats` VALUES (2, 'Chat 2', '2020-11-11 21:18:06');
INSERT INTO `chats` VALUES (3, 'fc1f5adb36c38cfd63d7512e25735802641a6560hola', NULL);
INSERT INTO `chats` VALUES (4, '02a53bdd431d75dd6f424d0476d5653c760ad7efhola', NULL);
INSERT INTO `chats` VALUES (5, '16b25592b8ae9d649a73f4052baab091e01d6f48hola', NULL);
INSERT INTO `chats` VALUES (6, '6f7fe4b4cada43d64e21640f118e83b0702d5c40hola', NULL);
INSERT INTO `chats` VALUES (7, '87ad99eba3b0bccfd00da80de62095acba48f121hola', NULL);
INSERT INTO `chats` VALUES (8, '32e251ea68c9313f935e779abdd7c84fbefb961bhola', NULL);
INSERT INTO `chats` VALUES (9, '6cc91fcb919f0f8bd6cdf3237f9fd48cc51e426bhola', NULL);
INSERT INTO `chats` VALUES (10, '4f0b706282c6f8bff2ab03877079b8787f4ebd1dhola', NULL);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_chat`(`post_id`) USING BTREE,
  CONSTRAINT `comments_post_id_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for cycle
-- ----------------------------
DROP TABLE IF EXISTS `cycle`;
CREATE TABLE `cycle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NULL DEFAULT current_timestamp(0),
  `update_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cycle
-- ----------------------------
INSERT INTO `cycle` VALUES (1, 'Técnico', '2020-12-09 10:13:55', '2020-12-09 10:13:55');
INSERT INTO `cycle` VALUES (2, 'Tecnólogo', '2020-12-10 10:53:47', '2020-12-09 10:13:55');
INSERT INTO `cycle` VALUES (3, 'Profesional', '2020-12-10 10:53:48', '2020-12-09 10:13:55');
INSERT INTO `cycle` VALUES (4, 'Adicional', '2020-12-10 10:53:49', '2020-12-09 10:13:55');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) NOT NULL,
  `user_send_id` int(11) NOT NULL,
  `user_recive_id` int(11) NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_chat`(`chat_id`) USING BTREE,
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (1, 1, 1, 2, 'hla hola', NULL, NULL);
INSERT INTO `messages` VALUES (2, 1, 2, 1, 'kiubo, como está?', NULL, NULL);
INSERT INTO `messages` VALUES (3, 1, 1, 2, 'Bien gracias', NULL, NULL);
INSERT INTO `messages` VALUES (4, 1, 1, 2, 'Usted qué tal?', NULL, NULL);
INSERT INTO `messages` VALUES (5, 1, 2, 1, 'me alegra', NULL, NULL);
INSERT INTO `messages` VALUES (6, 2, 1, 3, 'Hola Profe, cuanto me saqué?', NULL, NULL);
INSERT INTO `messages` VALUES (7, 2, 3, 1, 'Sebas todo bien', NULL, NULL);
INSERT INTO `messages` VALUES (8, 2, 3, 1, 'Pasaste', NULL, NULL);
INSERT INTO `messages` VALUES (9, 1, 1, 2, NULL, NULL, NULL);
INSERT INTO `messages` VALUES (10, 1, 1, 2, NULL, NULL, NULL);
INSERT INTO `messages` VALUES (11, 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `messages` VALUES (12, 1, 1, 1, 'Uff Gracias a Dios.', NULL, NULL);
INSERT INTO `messages` VALUES (13, 1, 1, 2, 'aaa', NULL, NULL);
INSERT INTO `messages` VALUES (14, 1, 1, 1, 'a', NULL, NULL);
INSERT INTO `messages` VALUES (15, 7, 1, 4, 'aaaaa', NULL, NULL);
INSERT INTO `messages` VALUES (16, 8, 1, 7, 'aaaaa', NULL, NULL);
INSERT INTO `messages` VALUES (17, 9, 1, 8, 'asdf', NULL, NULL);
INSERT INTO `messages` VALUES (18, 7, 1, 4, 'a', NULL, NULL);
INSERT INTO `messages` VALUES (19, 10, 1, 5, 'aaaaa', NULL, NULL);

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'nombre',
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'ultimima actualizzacion',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------

-- ----------------------------
-- Table structure for request_degree
-- ----------------------------
DROP TABLE IF EXISTS `request_degree`;
CREATE TABLE `request_degree`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `degree_project_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `observation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Sin Observaciones',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT 'estado de la solicitud de grado',
  `degree_date` date NULL DEFAULT NULL COMMENT 'fecha de graduacion proporcionada por el coordinador',
  `create_time` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of request_degree
-- ----------------------------
INSERT INTO `request_degree` VALUES (1, 'Sebastian Romero Laguna', 'Proyecto de Conservación Natural', 'Sin Observaciones', 1, '2020-12-14', '2020-12-09 10:17:01');
INSERT INTO `request_degree` VALUES (2, 'Julio', 'Proytecto número 2 para ciclo tecnico', 'Aprobado', 2, '2021-12-10', '2020-12-10 10:44:27');
INSERT INTO `request_degree` VALUES (3, 'Sebastian Romero Laguna', 'Proyecto para tecnólogo', 'Sin Observaciones', 1, '2021-12-10', '2020-12-10 10:58:37');
INSERT INTO `request_degree` VALUES (4, 'sebastian', 'asdasd', 'Sin Observaciones', 1, '2020-12-31', '2020-12-15 01:06:10');
INSERT INTO `request_degree` VALUES (5, NULL, 'qqqqa', 'Sin Observaciones', 1, NULL, '2020-12-15 01:10:10');
INSERT INTO `request_degree` VALUES (16, NULL, 'aaaqwasfas', 'Sin Observaciones', 1, NULL, '2020-12-15 01:48:39');
INSERT INTO `request_degree` VALUES (17, NULL, 'a', 'Sin Observaciones', 1, NULL, '2020-12-15 01:49:17');
INSERT INTO `request_degree` VALUES (18, NULL, 'a', 'Sin Observaciones', 1, NULL, '2020-12-15 01:52:56');
INSERT INTO `request_degree` VALUES (19, NULL, 'sadsdfasgda', 'Sin Observaciones', 1, NULL, '2020-12-15 01:55:20');
INSERT INTO `request_degree` VALUES (20, NULL, 'asñ', 'Sin Observaciones', 1, NULL, '2020-12-15 01:56:30');
INSERT INTO `request_degree` VALUES (21, NULL, 'sadsdfasgda', 'Sin Observaciones', 1, NULL, '2020-12-15 02:02:55');
INSERT INTO `request_degree` VALUES (22, NULL, 'sadsdfasgda', 'Sin Observaciones', 1, NULL, '2020-12-15 02:04:48');
INSERT INTO `request_degree` VALUES (23, NULL, 'sadsdasdfasdfadffasgda', 'Sin Observaciones', 1, NULL, '2020-12-15 02:06:19');
INSERT INTO `request_degree` VALUES (24, NULL, 'sadsdasdfqasdfadffasgda', 'Sin Observaciones', 1, NULL, '2020-12-15 02:12:46');
INSERT INTO `request_degree` VALUES (25, NULL, 'ññk', 'Sin Observaciones', 1, NULL, '2020-12-15 02:13:29');
INSERT INTO `request_degree` VALUES (26, NULL, 'ññk', 'Sin Observaciones', 1, NULL, '2020-12-15 02:17:10');
INSERT INTO `request_degree` VALUES (27, NULL, 'ññk', 'Sin Observaciones', 1, NULL, '2020-12-15 02:17:20');
INSERT INTO `request_degree` VALUES (28, NULL, 'añqk', 'Sin Observaciones', 1, NULL, '2020-12-15 02:17:27');
INSERT INTO `request_degree` VALUES (29, NULL, 'ñqk', 'Sin Observaciones', 1, NULL, '2020-12-15 02:19:20');
INSERT INTO `request_degree` VALUES (30, 'asdfasdf', 'qqqqa', 'Sin Observaciones', 2, '2020-12-31', '2020-12-15 02:21:03');
INSERT INTO `request_degree` VALUES (31, NULL, 'adasfas', 'Sin Observaciones', 1, NULL, '2020-12-15 02:22:07');
INSERT INTO `request_degree` VALUES (32, NULL, 'adasfas', 'Sin Observaciones', 1, NULL, '2020-12-15 02:24:43');
INSERT INTO `request_degree` VALUES (33, NULL, 'asdfasd', 'Sin Observaciones', 1, NULL, '2020-12-15 02:33:19');
INSERT INTO `request_degree` VALUES (34, NULL, 'asdfasdf', 'Sin Observaciones', 1, NULL, '2020-12-15 02:34:15');
INSERT INTO `request_degree` VALUES (35, NULL, 'asdfasdf', 'Sin Observaciones', 1, NULL, '2020-12-15 02:34:25');
INSERT INTO `request_degree` VALUES (36, 'aaa', 'asdasdf', 'Sin Observaciones Pooop', 2, '2020-12-31', '2020-12-15 02:34:29');
INSERT INTO `request_degree` VALUES (37, NULL, 'sdfasdf', 'Sin Observaciones', 1, NULL, '2020-12-15 02:35:57');
INSERT INTO `request_degree` VALUES (38, NULL, 'asdfasdf', 'Sin Observaciones', 1, NULL, '2020-12-15 02:37:33');
INSERT INTO `request_degree` VALUES (39, NULL, 'asd', 'Sin Observaciones', 1, NULL, '2020-12-15 02:37:40');
INSERT INTO `request_degree` VALUES (40, NULL, 'asdf', 'Sin Observaciones', 1, NULL, '2020-12-15 02:37:59');
INSERT INTO `request_degree` VALUES (41, NULL, 'asdf', 'Sin Observaciones', 1, NULL, '2020-12-15 02:48:27');
INSERT INTO `request_degree` VALUES (42, NULL, 'asdf', 'Sin Observaciones', 1, NULL, '2020-12-15 02:57:36');
INSERT INTO `request_degree` VALUES (43, NULL, 'asdfasdf', 'Sin Observaciones', 1, NULL, '2020-12-15 02:57:42');
INSERT INTO `request_degree` VALUES (44, NULL, 'asdfasdf', 'Sin Observaciones', 1, NULL, '2020-12-15 02:57:47');
INSERT INTO `request_degree` VALUES (45, NULL, 'asdfasd', 'Sin Observaciones', 1, NULL, '2020-12-15 03:00:10');
INSERT INTO `request_degree` VALUES (46, NULL, 'asdfasdf', 'Sin Observaciones', 1, NULL, '2020-12-15 03:08:32');
INSERT INTO `request_degree` VALUES (47, NULL, 'asdfasdf', 'Sin Observaciones', 1, NULL, '2020-12-15 03:08:44');
INSERT INTO `request_degree` VALUES (48, NULL, 'aaaa', 'Sin Observaciones', 1, NULL, '2020-12-15 03:09:32');
INSERT INTO `request_degree` VALUES (49, NULL, 'aaaaq', 'Sin Observaciones', 1, NULL, '2020-12-15 03:09:38');
INSERT INTO `request_degree` VALUES (50, NULL, 'asdf', 'Sin Observaciones', 1, NULL, '2020-12-15 03:09:52');
INSERT INTO `request_degree` VALUES (51, 'Tecnasdflogo', 'sadsdfasgda', 'Sin Observaciones', 1, NULL, '2020-12-15 03:30:22');
INSERT INTO `request_degree` VALUES (52, 'Sebastian Romero Laguna asfa', 'Aplicación Handlebars para', 'Sin Observaciones', 1, NULL, '2020-12-15 07:43:14');
INSERT INTO `request_degree` VALUES (53, 'asdfasdf', 'q', 'Sin Observaciones', 1, NULL, '2020-12-15 07:44:19');
INSERT INTO `request_degree` VALUES (54, 'asdfasdf', 'asdfasdf', 'Sin Observaciones', 1, NULL, '2020-12-15 22:50:22');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NULL DEFAULT current_timestamp(0),
  `update_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '																																																	' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, 'Admin', '2020-12-09 10:11:24', '2020-12-09 10:13:55');
INSERT INTO `rol` VALUES (2, 'Coordinador', '2020-12-09 10:11:24', '2020-12-09 10:13:55');
INSERT INTO `rol` VALUES (3, 'Estudiante', '2020-12-09 10:11:24', '2020-12-09 10:13:55');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`session_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('AV1JUDCwZhx_q1-q5QdzZ98vQGn0qWhS', 1608112539, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');
INSERT INTO `sessions` VALUES ('U0eVOC8jZYDwYmDiJQtd2XbQGc7IMJa2', 1608183759, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');
INSERT INTO `sessions` VALUES ('qzEMbn0oyMWrMiOeyJv_UfByZJC1tC1Z', 1608217872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');
INSERT INTO `sessions` VALUES ('r4JIfLo4BsyjcLoj7bQ87W0w4WyjnWQ6', 1608124865, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');
INSERT INTO `sessions` VALUES ('sTheSY0w5_gKNVO9ma4he0KHL5bQKFxW', 1608120667, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');
INSERT INTO `sessions` VALUES ('y8Zl0T8amiLUxSKQWTCsuObWpTFkv7XM', 1608228420, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `middle_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `second_last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_id` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth_date` date NOT NULL,
  `email_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rol_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` timestamp(0) NULL DEFAULT current_timestamp(0),
  `update_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_rol_rol_id`(`rol_id`) USING BTREE,
  CONSTRAINT `fk_rol_rol_id` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '																																																	' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Sebastian', '', 'Romero', 'Laguna', '123', '2020-12-01', 'aaaa@gmail.com', '123', '58holaAlumno', 'asdf', 3, 1, '2020-12-09 10:13:26', '2020-12-09 10:13:55');
INSERT INTO `user` VALUES (2, 'coor V', 'a', 'c', 'a', '4568910', '2020-12-01', 'asdf@asdf.com', '456856', 'CoordinatorFetCiclos', '123', 2, 1, '2020-12-09 10:13:26', '2020-12-09 10:13:55');
INSERT INTO `user` VALUES (3, 'JULIO', 'a', 'c', 'a', '345', '2020-12-01', '3@asdf.com', '5456', 'ALUMNO2', '123', 3, 1, '2020-12-09 10:13:26', '2020-12-09 10:13:55');
INSERT INTO `user` VALUES (4, 'Juan', 'C', 'B', 'Q', '1023659874', '2020-12-01', 'aaaa@gmail.com', '312645978', '58holaAlumno', 'holahola', 3, 1, '2020-12-07 02:08:06', '2020-12-09 10:13:55');
INSERT INTO `user` VALUES (5, 'Brayan', 'C', 'B', 'Q', '23145469870', '2020-12-01', 'bbb@gmail.com', '312645978', '4holaAlumno', 'holahola', 3, 1, '2020-12-07 02:08:33', '2020-12-09 10:13:55');

-- ----------------------------
-- Table structure for user_cycle_request
-- ----------------------------
DROP TABLE IF EXISTS `user_cycle_request`;
CREATE TABLE `user_cycle_request`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cycle_id` int(11) NOT NULL,
  `request_degree_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_cycle_request_user1_idx`(`user_id`) USING BTREE,
  INDEX `fk_user_cycle_request_cycle1_idx`(`cycle_id`) USING BTREE,
  INDEX `fk_user_cycle_request_degree_request1_idx`(`request_degree_id`) USING BTREE,
  CONSTRAINT `fk_user_cycle_request_cycle1` FOREIGN KEY (`cycle_id`) REFERENCES `cycle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_cycle_request_degree_request1` FOREIGN KEY (`request_degree_id`) REFERENCES `request_degree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_cycle_request_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_cycle_request
-- ----------------------------
INSERT INTO `user_cycle_request` VALUES (1, 1, 1, 1);
INSERT INTO `user_cycle_request` VALUES (2, 3, 1, 2);
INSERT INTO `user_cycle_request` VALUES (3, 1, 2, 3);
INSERT INTO `user_cycle_request` VALUES (4, 1, 3, 4);
INSERT INTO `user_cycle_request` VALUES (5, 5, 1, 5);
INSERT INTO `user_cycle_request` VALUES (6, 1, 2, 23);
INSERT INTO `user_cycle_request` VALUES (7, 1, 2, 22);
INSERT INTO `user_cycle_request` VALUES (8, 1, 2, 22);
INSERT INTO `user_cycle_request` VALUES (9, 1, 2, 24);
INSERT INTO `user_cycle_request` VALUES (10, 1, 1, 25);
INSERT INTO `user_cycle_request` VALUES (11, 1, 1, 26);
INSERT INTO `user_cycle_request` VALUES (12, 1, 1, 27);
INSERT INTO `user_cycle_request` VALUES (13, 1, 2, 28);
INSERT INTO `user_cycle_request` VALUES (14, 1, 2, 29);
INSERT INTO `user_cycle_request` VALUES (15, 1, 4, 30);
INSERT INTO `user_cycle_request` VALUES (16, 1, 2, 31);
INSERT INTO `user_cycle_request` VALUES (17, 1, 2, 32);
INSERT INTO `user_cycle_request` VALUES (18, 1, 2, 33);
INSERT INTO `user_cycle_request` VALUES (19, 1, 2, 34);
INSERT INTO `user_cycle_request` VALUES (20, 1, 2, 35);
INSERT INTO `user_cycle_request` VALUES (21, 1, 1, 36);
INSERT INTO `user_cycle_request` VALUES (22, 1, 2, 37);
INSERT INTO `user_cycle_request` VALUES (23, 1, 2, 38);
INSERT INTO `user_cycle_request` VALUES (24, 1, 2, 39);
INSERT INTO `user_cycle_request` VALUES (25, 1, 3, 40);
INSERT INTO `user_cycle_request` VALUES (26, 1, 2, 41);
INSERT INTO `user_cycle_request` VALUES (27, 1, 2, 42);
INSERT INTO `user_cycle_request` VALUES (28, 1, 2, 43);
INSERT INTO `user_cycle_request` VALUES (29, 1, 3, 44);
INSERT INTO `user_cycle_request` VALUES (30, 1, 2, 45);
INSERT INTO `user_cycle_request` VALUES (31, 1, 2, 46);
INSERT INTO `user_cycle_request` VALUES (32, 1, 2, 47);
INSERT INTO `user_cycle_request` VALUES (33, 1, 1, 48);
INSERT INTO `user_cycle_request` VALUES (34, 1, 3, 49);
INSERT INTO `user_cycle_request` VALUES (35, 1, 2, 50);
INSERT INTO `user_cycle_request` VALUES (36, 1, 2, 51);
INSERT INTO `user_cycle_request` VALUES (37, 1, 1, 52);
INSERT INTO `user_cycle_request` VALUES (38, 1, 3, 53);
INSERT INTO `user_cycle_request` VALUES (39, 1, 1, 54);

SET FOREIGN_KEY_CHECKS = 1;
