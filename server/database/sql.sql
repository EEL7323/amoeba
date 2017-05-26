-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: rusysdb
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acessLog`
--

DROP TABLE IF EXISTS `acessLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acessLog` (
  `idAcessLog` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `accessType` varchar(45) DEFAULT NULL,
  `observation` varchar(45) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAcessLog`),
  KEY `fk_acessLog_users1_idx` (`idUser`),
  CONSTRAINT `fk_acessLog_users1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acessLog`
--

LOCK TABLES `acessLog` WRITE;
/*!40000 ALTER TABLE `acessLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `acessLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credits` (
  `idCredit` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `processed` varchar(45) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCredit`),
  KEY `fk_credits_users_idx` (`idUser`),
  CONSTRAINT `fk_credits_users` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits`
--

LOCK TABLES `credits` WRITE;
/*!40000 ALTER TABLE `credits` DISABLE KEYS */;
/*!40000 ALTER TABLE `credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `collegeid` varchar(45) DEFAULT NULL,
  `usertype` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phoneId` varchar(45) DEFAULT NULL,
  `cardId` varchar(45) DEFAULT NULL,
  `term` varchar(10) DEFAULT NULL,
  `userImage` mediumblob,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'13106428','aluno','Giovanni Cimolin da Silva','giovanni@dr.com','f61362e333c487dce9bc6b6d43a88aa5b2d140cf',NULL,NULL,NULL,'�\��\�\0JFIF\0\0\0\0\0\0�\�\0�Photoshop 3.0\08BIM\0\0\0\0\0�g\09Mv7h1aYjba5rs1pZg1N(\0bFBMD01000ac0030000900500009c0700000a08000090080000700a00001f0d0000960d0000220e0000c40e000047130000�\�ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \�\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0\�\0\0\0@gTRC\0\0\�\0\0\0@bTRC\0\0\�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�curv\0\0\0\0\0\0\0\Z\0\0\0\�\�c�k�?Q4!�)�2;�FQw]\�kpz���|�i�}\�\�\�0���\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((�\�\0\0�\0�\0\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�}�\�\�HI�bI����&F\',�zŚl5�309�gyތ:`@fŚl�Vu��\"b�\�T�w�}E��b؃!)�gy\��\"0 3O;Ye\Z�\�\�\\}��U���3\�0�|\�b\�Pf�,��dD=A�l5�¶ҿ-\��������\�Z�b�xM�eA�\Z�Wy��G�>��\�\rbh�N�\�-�IW1��J\�G\�\�8����Ǌ�{pdE)81\��zۼ�ԭai�N���m�͙��Rs\�l 4��w��jU�m�w��O|�ژ��\�N\�?w\�j�\�V���\�7\�uR�5-L\nk\�YR\�\�D\�\"K�C�垟��\�}ϯ=�d����\�B�K\�i�\�֒ǵ-L\nk\r�\�\�\�>b%k\0`��\�5�T��R9zl��\�����\�<��R4���;\n=�ɑe\�Ŭ��9�\��\�\�I�@{��\0s�ofo!\Zƶ�g/�\�\0,\0\0\0\0\0\0\0\00 !\"1#$4@23B�\�\0\0\0����\�\r�/B�<��0ܺ�\�\�lGwQ���-K�`\�lg\�,fj�\\Sa\��\�>\�\�*��^\n�\�v��\�\\�PG*��Ta��\��l;l\�\�B\�)k`RK��\�\�a\�lj_�\�\ZWK\�\"���\�C�v9�\�\�۵HH�\�ʸ\�s\�\�puRXO\nZ3\����O&MC��,b\�\�\�\�a4U���5���S��B.ñ\Z4���\�I\���&�\�ʾ���e��7\�\�\�\�n=B����`E�\�W�-:�\�\�\�\�i�\�WW�W���2\�\�$mС鲄!\�\n�[�L\�ncxd��\��!\�\'\�֓���\"4oB��1\�\�K�~!�\�9yѹ\��7�[称\��->z\�|\�P\�\�2�j1\�1���(\�`x\"\�\�m-�Aq��.^����6�=\Z|xµ\�T_jx�I�\�\�휆��\0�d��\�2h\�\n*?���WW���7W^��\�\�d\���b�1q���N�\'ԇ�i+T\�:\�\�v�\�W�����D�\'ֳ{\�\�\�\�7���H\\�3Z�\�\�o�\�\0#\0\0\0\0\0\0\0\0\0\0\0 !102A\"#Q�\�\0?\�\\Q�:%�ر\r���\��١AH�V5<\�p#!\�0�\�\�1�\�\��9%\�\�\�L\�^\��.�qF\�`\�z�U\�\�*��\�\0\"\0\0\0\0\0\0\0\0\0\0 !012A#Q�\�\0?콩QC���\��$�F��\�ΧRM;!\�CG3��А�5?R��6J����%Ȓ^؏�T�%sy�k(��}��\�\02\0\0\0\0\0\0\0\0!\"1AQ 0aq��23Rb��#BPr�\�\0\0\0?�\0FP�wUq�T%f|\�: \�\�\rs��ܕ\ZW\�;X�\n,�7�\�\�I��WGa=9νQ��ZY�\�\��(H�;�\�\�^h��\�i\��!5��\�L��T�\�M���\"�\�R�W[�ϛ�\�J(\"\�]��sЩ<WuJ��κҤ9rcIS�\��N�����\�e\���g\�QH��P��\'Wϗ8��MT^�ߍ�wQo�F5,��q;@�\�u�\0\��\�V��\�$\�D87\�]x� b5\�i\�9�ȉ�N͆V5\�2sL\�lF\�=\n�\�\�h�gM\�k_�!`�,vc��\���ԧ�\�X��\�<\���G\'j=\�)�N	\�#g\�8��qOk��\0���{�f3O:�\�3NOe\�w^�\0t��\�G��\0N*=�<\r�T��?�?\\!�T�Ϋ`*�L�nocRSMn\�I�\�8lx\'�m6���pjw\�@x�/~	\��\Z\��#\�\�\��\��\��\�\0%\0\0\0\0\0\0\0\0!1AQaq��� ���\��\�\0\0\0?!Ԉ�����\�jDDDDF�Dh#�\"#F}�\�\�\�&J�8\�\�\�E�\���� ��H���m��\\\�2\�l-\�coXZ��p�\�Dh#R\"#FB\�x��t\��\�zD�|��jDDD\�\�����\\(Ǵ6+֠�\�h#B5\"$`|�_g3�ݼ�@\�q�\�b\�\0�\�\0a�q\Z�MH�l:�\'!���R\�4L���\�vK>(\�DjF�E��D��tM��\�\r��� ,�\�yr\�\"#�\"\",u\\�V\�\r�\�m��\0W�\�gsP��H��A�\�\�i;�wŖ5Ж��t�X��\�\�\�hcv�~�\Z�H�\��\�\�~�;��N�09�\�[\�C\�;�\��{0�,}ǁ�e�$F���Ͱ\\�B�a\��i4\0l�n�:=\�\�@]��yCpqʹ�\�\�?\�\�Gd\�F�\Z,\'�踁\��Dʃ\�rot��tbX\���Y���\��l�0F\�ܽ\�;}F\�k\Zv\�l^o6\�f\�\�Ď�\\\� 7~�\Z\�p6��>x�\�\�O�\�\�\�y�.\�#�\�a7��k\Zc\�\�bOٷ�bsN\\ �\�j���\�\�\��[\�{8�FV�`\n�vo$���$E�ypC	�=��[\�f\���r\�p��x\���!\�\��\�\�D��b\�}�7ѸE\���o��\�\�_\�\�?^�F\�>�\�>�\�l\�\��}\�\"\�<�\�\�\��\�[�\����YO\���\�\�\�v\�lvs�\�\�a^��$[\�\�s\�`WBz\��\Z�\�h�Q�ool\�\�i\"�\�\0\0\0\0\0�٭s�\�,�\'\��\�t\�d\�z��Xgn����\�\�tC�aNY�\�f�i\��nǏCTez䊯�eG?ص\���F9�\��k�\�\0\0\0\0\0\0\0\0\0\0\0\0! 1AQ�\�\0?\����<\\BhCub<2\�\r�$(��v0Ր؏b}�\�\�)k\�\�$������uŗF�\�G� �\�ϼ\�{��4��H�\��\�L���\�!�{�u�\�\��\�\0\0\0\0\0\0\0\0\0\0!1Q Aq�\�\0?\�8|�\�\��55�Žs�\�<`�nN$\��\'\�B�\�!Y���/�h\�vH\\\�$���0زGi\�=\�c	�\�\'ΤO�\�!�����\�6x�\�ɇɆ�uS\�d\�\�u\�\���.��,��\�\0(\0\0\0\0\0\0\0!1AQaq���� �\��0\���\�\0\0\0?\�t��\�zq�Y5�fi�Gˣ�~�@�>\���9�S¿0����\��K��L��\����W,��\��\���˰#\�R\��\�E]\�{�\r*Xr,,\�k\�3/�v\�i0�t/ʺ>at�P��h\�{֢\�.Cw\0ʆ�\ZB�9gӣN�.\\&P\\qz��3\�w\�+�a��\�)/Gi�OxAaH\'\��\0(_xL�b�\�	n�\�\��\�6�\�n\�����l�\0�S\��\0/� U\rE��,Ƌ\ZQ9|Wx��@��8l�Zj����.�?$IB�6;U�7�Uʳ�\���d�\0L�\���V`0\�E�|\�{b$�j\�hOr� \�f0[\�\�\�\�S=��\�.\"��M\��\��p\��nDE\�p�lXE�(\�ܭ��)�E��g\�S��\�W�QE�_�a\�)�\�j\�\�\�\�\�\�\�\�xN瘎�m\��T0j.��Ze}\�t~�\0y�1�\0p�m-6�#�A+)r�v��j!\�2lN\�՟\'�q\�\�\�p�\�bӤ\'Xp9!\�\�U��{\�C��\�{�⮎[\�J\�\n��\�FR�\�4o7\Z\Z�B\�\�x����\r����3=\�Y!\��׸��U_k�t�\�ָ�\"*�lQmf�~X\�TcJD[J�&Ik�ʸ_o��1�bF-�g\�l�g�-\�\�X�l�i\�e��7�4[�+$��-����Ɓդ\�{ͺ%x\���.\�Ez7=\�\0�\"\�\�\�de\Z{��8��$�*�i�)��\��1�A�U�7�|�1r\�V���\�ѷ�Y�1KE\�\���ږ��槥\�d���ur\�\�\\͡YA���\0.e8O\�-�$�X�̪\�Q7mJ\�C\�:\\\�#-c����4@ �\�exa��\�\rߡ\�TM����(�Z�\�\�\ZM:\�BX\��p���\�\�!\�3\�\�\�����\�\��\\�\�\�`dIj��z,]b\�\�H]\�܏~�5\�aѲ\�?�2���\�j\�3^��CV����2\�9�w��O\�P0\�;�X\��eZ\��AFZ�/w,���\�Dp��r\�wh?\�\\\��\0`X\�\�����Sˊ\�P��\�J1_F\�<�-\��2�\�5�7�y�0�i�f\��Z��;O�,���Ȩ���Ǣ.�\Z\��p id�*2|@�\�\�,W����pb�H��B�\�,z��\rW�e����	A�5���8\�OS�!��,\�\�`]\�[&T��A)k:M�\�qt=\�\�	(�\�t��H��\��֊�E�\��\�');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-26 16:43:17
