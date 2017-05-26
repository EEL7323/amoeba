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
INSERT INTO `users` VALUES (1,'13106428','aluno','Giovanni Cimolin da Silva','giovanni@dr.com','f61362e333c487dce9bc6b6d43a88aa5b2d140cf',NULL,NULL,NULL,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\í\0œPhotoshop 3.0\08BIM\0\0\0\0\0€g\09Mv7h1aYjba5rs1pZg1N(\0bFBMD01000ac0030000900500009c0700000a08000090080000700a00001f0d0000960d0000220e0000c40e000047130000ÿ\âICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0\Ì\0\0\0@gTRC\0\0\Ì\0\0\0@bTRC\0\0\Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïcurv\0\0\0\0\0\0\0\Z\0\0\0\Ë\Éc’kö?Q4!ñ)2;’FQw]\íkpz‰±š|¬i¿}\Ó\Ã\é0ÿÿÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0\0 \0 \0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0\Ï}÷\Ø\ßHI„bI™ƒ¶&F\',ˆzÅšl5±309¬gyÞŒ:`@fÅšl©Vu©ƒ\"b´\ÝT†w°}E»“bØƒ!)¬gy\Ýñ\"0 3O;Ye\Z‹\ë\ê¹\\}š™U“ø»3\ì0ô|\Ób\ÙPfž,‡»dD=Aôl5˜Â¶Ò¿-\ì”ûŒö£³…¦\ËZ³búxM«eA\Z¬Wyö¹G¨>‰Œ\Ì\rbh N±\ì¨-£IW1û‡J\ÍG\Ù\ç8À¥°€ÇŠø{pdE)81\é¤zÛ¼óÔ­ai½N£Ÿ£m¨Í™‘Rs\Ùl 4ñ´w­ºjU­mžwóO|ðÚ˜ž\çN\×?w\Âj¼\éV·ªó\é7\áuRŽ5-L\nk\äYR\Ó\ÍD\Í\"KCŸåžŸƒŠ\Â}Ï¯=d¯‡¼ò\ÏBÁK\Øiü\×Ö’Çµ-L\nk\rª\Ë\î\é>b%k\0`¦¦\á5¾Tœ‡R9zl¬Š\é¦û¿„û\Û<ýÀR4À¦ó;\n=’É‘e\ÜÅ¬­Á9½\Ìó\é\ÖI‘@{ñ„ÿ\0sñofo!\ZÆ¶g/ÿ\Ä\0,\0\0\0\0\0\0\0\00 !\"1#$4@23Bÿ\Ú\0\0\0þþ˜\í\r®/Bƒ<„‰0Üº˜\ï”\ÔlGwQ“…¨-Kƒ`\Ôlg\á,fj°\\Sa\Ú©\Ì>\í\Æ*Š¸^\n¸\Øvõù\à\\¥PG*©†Ta—´\Ãól;l\Æ\çB\Ã)k`RK”•\î°\Ãa\Ülj_„\Ñ\ZWK\ç\"°©¿\ÙC¹v9†\ã\ØÛµHH¨\ãÊ¸\às\Í\ìpuRXO\nZ3\Êó±½O&MC¶ò,b\È\Ì\Ö\àa4U¹µù5¤”¶S¨B.Ã±\Z4…ôû\ÆI\Õø­&÷\ÊÊ¾ôöýeòý7\Ô\ã\è\Øn=B­¬²¨`E¡\ÂW‰-:\í\á«\Ü\êi’\ÝWW’W–÷õ2\Ò\ç$mÐ¡é²„!\É\n‡[˜L\ÔncxdŽú\Âú!\íœ\'\ÈÖ“þ•\"4oB†ñŒž1\ìµ\ÇKþ~!\í¼9yÑ¹\ÔÁ7š[ç§°\Åü->z\Ê|\èP\Þ\Å2™j1\Ë1¨«Ÿ(\ç`x\"\á\æm-ŠAqü.^Ž¡ª§6ô=\Z|xÂµ\ÛT_jx¯Ió\Þ\Åíœ†Ÿù\0ðdü¶Â†\è2h\Ç\n*?§¢øWW„¿¹7W^Ž§\ì\Ëd\Ñ¤Œb¬1q¾ž™N»\'Ô‡Ši+T\Ô:\Ã\Òv°\ÞW£±¾šœD»\'Ö³{\å\Ä\Ó\Ë7¯þ«H\\µ3Z˜\â\èoÿ\Ä\0#\0\0\0\0\0\0\0\0\0\0\0 !102A\"#Qÿ\Ú\0?\ï\\Q“:%ùØ±\r…¹­\æóÙ¡AH„V5<\Þp#!\Ê0…\Ë\ß1²\ì\Óû9%\Î\Ø\ÜL\Ô^\èþ.«qF\É`\ëz±U\Ó\Þ*¿ÿ\Ä\0\"\0\0\0\0\0\0\0\0\0\0 !012A#Qÿ\Ú\0?ì½©QC”½‹\àŸ$“FŸ¢\ÞÎ§RM;!\ë¾CG3•¶Ð’5?R½½6J›ùˆ¥%È’^Ø‚Tñ%syŽk(¬À}Ÿÿ\Ä\02\0\0\0\0\0\0\0\0!\"1AQ 0aq‘23Rb¡Á#BPrÿ\Ú\0\0\0?ÿ\0FPªwUqõT%f|\Ö: \á‘\ç\rs·Ü•\ZW\ãœ;X´\n,µ7¹\Ó\ÒI ªWGa=9Î½Q²¦ZYˆ\á\Ø‰(HŸ;”\è„\ì™^hˆó¼\Âi\ÒÁ!5‰‡\ÕL‹·Tù\ÇM‘†ñ\"¤\åR´W[Ï›Œ\ÉJ(\"\è]”•sÐ©<WuJ¦¹ÎºÒ¤9rcIS…\ìûN¨ˆ€‡Œ\çe\×ü—g\ÑQH«®P‹©\'WÏ—8žŠMT^òß”wQoºF5,þ•q;@œ\áuÿ\0\Ôð¯\í”V¶ð\ë$\ÖD87\Ù]x¯ b5\íi\Ý9ŽÈ‰øNÍ†V5\ì2sL\ÂlF\ê=\n¤\ê£\Çh«gM\ìk_ó!`š,vc‰¢\Öú¡Ô§«\ßX™·\Ø<\à‹—G\'j=\í)øN	\Ê#g\æ8›‰qOkÿ\0¥º‚{‹f3O:¸\Ê3NOe\à¢w^ÿ\0t“\ÐG÷¯\0N*=<\r­Tþö?«?\\!£T†Î«`*ŸL‡nocRSMn\æI­\Ñ8lx\'£m6—²‚pjw\ä@x²/~	\ïÀ\Z\É¹#\É\é\Éð\ãîÀ\àÿ\Ä\0%\0\0\0\0\0\0\0\0!1AQaq‘¡ ±ðÁ\Ñÿ\Ú\0\0\0?!Ôˆˆˆˆˆ\ÐjDDDDF„Dh#ð\"#F}‚\Û\ß\Æ&Jó8\ï\Æ\ßE´\Ö«¦« ˆHˆˆŸmóô\\\Ù2\àl-\ÙcoXZ¸pð\äDh#R\"#FB\íx­¡t\Ø\âzD§|ˆjDDD\Î\×ññ¦Á±\\(Ç´6+Ö ý\Äh#B5\"$`|‰_g3£Ý¼@\Èq¾\èb\Ø\0÷\æ\0a¸q\ZMH‰l:ó\'!œ÷¸R\é4L–öò\ÝvK>(\ÐDjF„EÀ™DûtM‚\Ï\r—Ÿ„ ,ð\Êyr\è\"#ð\"\",u\\¶V\Þ\r\Ým‹Š\0W–\ÐgsPˆHˆ²Að\ê\Ùi;wÅ–5Ð–°ðt˜X‡\Ö\Ì\áhcvŸ~±\ZH³\Ôø\ã\æ~™;žüNþ09š\Õ[\êC\Ü;‰\Öƒ{0Ÿ,}Ç¯e$F…¹ÁÍ°\\ÁBÀa\Çùi4\0l§n±:=\Ä\Æ@]¼yCpqÍ´û\å\Û?\î\ÓGd\îF¡\Z,\'¹è¸\ÅúDîˆµÊƒ\Ãrotµ€tbX\ÏÀòY¦À\ï˜lú0F\ÅÜ½\Ý;}F\îk\Zv\Õl^o6\Ëf\ë\ÊÄŽˆ\\\Ì 7~û\Z\äp6²ö>x\á\ËO„\á\Ó\Òy….\Ø#ø\ía7¾¤k\Zc\×\ãbOÙ··bsN\\ ¿\Ðj€˜‰\Ò\ç\îŽ[\È{8¾FVö`\nôvo$ûû$E¼ypC	ñ=¥[\Éf\ë‘÷ür\ãpö›x\È“–!\ì\æþ\è¶\ÒD¼ñb\Ã}®7Ñ¸E\ÜðÁo—‚\Ì\Õ_\Â\â?^‡F\È>»\Þ>þ\Ñl\Û\Úó¨}\é\"\Þ<Ž\Ù\ê\Åõ\ã[ô\Þ§«°YO\éøô\Ð\Ð\Óv\Ñlvsû\ä\Éa^¿$[\ì\ç›s\Ï`WBz\îþ\Z\êhñQøool\Ë\ßi\"ÿ\Ú\0\0\0\0\0œÙ­s©\Æ,¬\'\Çù\Êt\Ìd\Òz‘ˆXgnˆþ§¨\È\ÕtC‰aNY‡\Ìf’i\ÝÁnÇCTezäŠ¯³eG?Øµ\Ñþ¦F9§\ïðkÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0! 1AQÿ\Ú\0?\à‡À†<\\BhCub<2\ä²\rœ$(ùv0ÕØb}ƒ\Ò\È)k\Ï\á$“¥òö‘¡uÅ—Fý\àG¹ ™\êÏ¼\Ø{–Ž4ø‡H‰\á¸\ÏL·‡¸\Ê!œ{uÁ\â\Ûÿ\Ä\0\0\0\0\0\0\0\0\0\0!1Q Aqÿ\Ú\0?\á8|’\Â\Éü55Å½s¯\ä“<`ƒnN$\Õ“\'\çB“\à!Y¶•™/ó‡h\ÎvH\\\Ý$“†ú0Ø²Gi\Ø=\á›c	¦\Í\'Î¤O¢\Ü!®¤“†\É6x¯\ØÉ‡É†¶uS\Ûd\ã\æu\Ü\Ù¯.þ©,¿ÿ\Ä\0(\0\0\0\0\0\0\0!1AQaq¡‘Á ±\Ñð0\áñÿ\Ú\0\0\0?\ã tøš\Ìzq‡Y5˜fi•GË£‡~‡@œ>\à‡§9¡SÂ¿0º‡­´\Ê•KŸ¨L¦›\Îþ€´W,Ž¢\ÏÁ\ßúœË°#\ëR\Úò´¦\æE]\Ñ{Ÿ\r*Xr,,\êk\Ð3/™v\ï£i0™t/Êº>at¯P‘üh\ë{Ö¢\Ä.Cw\0Ê† \ZB¹9gÓ£N.\\&P\\qz‰‹3\Âw\Û+aò¬\ï)/GiˆOxAaH\'\Øÿ\0(_xLºb­\Å	n¼\â\áš\Ò6«\æn\Ú˜ð¬™l›\0‡S\Ùÿ\0/ø U\rEøŠ,Æ‹\ZQ9|Wx‡€@ú™8l†Zjž²ž¡.µ?$IBˆ6;Uº7œUÊ³º\Õ‹Šdÿ\0L \æ¸úV`0\ç›E|\Ê{b$ªj\êhOr” \êf0[\Ö\á\Ô\àS=Á\á.\"©—M\ãü\Ì©p\à„nDE\íp‰lXE“(\ÇÜ­´»)—Eõƒg\ÄS¶·\ÇWŒQE‚_÷a\æ)Œ\ãj\á\Ñ\á\ï\ë‰\Â\Ã\îxNç˜Ž‚m\à”T0j.»ƒZe}\ã…t~ÿ\0y‹1ÿ\0pŠm-6ž#ŸA+)róv“új!\ã2lN\íÕŸ\'ˆq\Ú\ã\Ìp·\ébÓ¤\'Xp9!\ï\ÊU«•{\ÅC®…\Ð{†â®Ž[\ÛJ\Ö\nœ‡\âFR‡\Þ4o7\Z\Z‡B\æ\Üx»¥©\r°¤ñ3=\âY!\Ðø×¸°¿U_k¡t¬\ÇÖ¸¿\"*šlQmf~X\ÓTcJD[J˜&Ik¤Ê¸_o¥•1™bF-”g\Úlñgž-\Þ\ËXl£i\Çe½°7®4[±+$¶Š-—¸ú•ÆÕ¤\ä{Íº%x\èŒˆ.\ÝEz7=\à\0­\"\Ú\å\Ôde\Z{°ˆ8…ˆ$Á*¸iù)•ž\Ðø1ªA²U¤7¸|ý1r\ÑV¯¸…\ÆÑ·²Yó1KE\ë\Ä–¡Ú–üŠæ§¥\Þdðô¬ur\Ì\Ó\\Í¡YAÁÁñ\0.e8O\Ë-·$÷X–Ìª\íQ7mJ\äC\è:\\\Ï#-c‘ðþ4@ ›\áexaˆ¼\Ï\rß¡\ÄTMý‡ñ(¶Zž\Ã\é\ZM:\ÄBX\îùpû‚\Ê\ß!\ï3\á\Ç\Õþ¥ˆ³\ç\Û’\\¸\ê\Ú`dIj”Áz,]b\î\âH]\ÛÜ~¦5\éaÑ²\ß?ô2®¶”\ìj\ë3^²”CVž¸˜­2\Ï9ªw†®O\ÖP0\ì;½X\é— eZ\àóAFZž/w,¥²ô\ÇDpŒ´r\Ýwh?\â\\\åÿ\0`X\É\î€Á„‘SËŠ\æP €\äJ1_F\Ö<ð-\ã÷2ü\Å5¨7¨y€0‚i•f\ËñZ²;Oý,ûƒÈ¨ž•»Ç¢.¶\Z\Úûp id°*2|@…\È\Ö,Wõ¸ñ‡õpb†H©ŒBº\ï,z–Ž\rW¼e¡»®	A”5úû‹8\éOSø!§±,\Ë\Þ`]\Æ[&TªóA)k:Mƒ\Äqt=\Ù\Ø	(¹\ætü¿H—¯\ê—ÖŠýE˜\âŸÿ\Ù');
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
