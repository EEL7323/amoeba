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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'13106428','aluno','Giovanni Cimolin da Silva','giovanni@dr.com','f61362e333c487dce9bc6b6d43a88aa5b2d140cf',NULL,NULL,NULL,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\í\0œPhotoshop 3.0\08BIM\0\0\0\0\0€g\09Mv7h1aYjba5rs1pZg1N(\0bFBMD01000ac0030000900500009c0700000a08000090080000700a00001f0d0000960d0000220e0000c40e000047130000ÿ\âICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0\Ì\0\0\0@gTRC\0\0\Ì\0\0\0@bTRC\0\0\Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïcurv\0\0\0\0\0\0\0\Z\0\0\0\Ë\Éc’kö?Q4!ñ)2;’FQw]\íkpz‰±š|¬i¿}\Ó\Ã\é0ÿÿÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0\0 \0 \0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0\Ï}÷\Ø\ßHI„bI™ƒ¶&F\',ˆzÅšl5±309¬gyÞŒ:`@fÅšl©Vu©ƒ\"b´\ÝT†w°}E»“bØƒ!)¬gy\Ýñ\"0 3O;Ye\Z‹\ë\ê¹\\}š™U“ø»3\ì0ô|\Ób\ÙPfž,‡»dD=Aôl5˜Â¶Ò¿-\ì”ûŒö£³…¦\ËZ³búxM«eA\Z¬Wyö¹G¨>‰Œ\Ì\rbh N±\ì¨-£IW1û‡J\ÍG\Ù\ç8À¥°€ÇŠø{pdE)81\é¤zÛ¼óÔ­ai½N£Ÿ£m¨Í™‘Rs\Ùl 4ñ´w­ºjU­mžwóO|ðÚ˜ž\çN\×?w\Âj¼\éV·ªó\é7\áuRŽ5-L\nk\äYR\Ó\ÍD\Í\"KCŸåžŸƒŠ\Â}Ï¯=d¯‡¼ò\ÏBÁK\Øiü\×Ö’Çµ-L\nk\rª\Ë\î\é>b%k\0`¦¦\á5¾Tœ‡R9zl¬Š\é¦û¿„û\Û<ýÀR4À¦ó;\n=’É‘e\ÜÅ¬­Á9½\Ìó\é\ÖI‘@{ñ„ÿ\0sñofo!\ZÆ¶g/ÿ\Ä\0,\0\0\0\0\0\0\0\00 !\"1#$4@23Bÿ\Ú\0\0\0þþ˜\í\r®/Bƒ<„‰0Üº˜\ï”\ÔlGwQ“…¨-Kƒ`\Ôlg\á,fj°\\Sa\Ú©\Ì>\í\Æ*Š¸^\n¸\Øvõù\à\\¥PG*©†Ta—´\Ãól;l\Æ\çB\Ã)k`RK”•\î°\Ãa\Ülj_„\Ñ\ZWK\ç\"°©¿\ÙC¹v9†\ã\ØÛµHH¨\ãÊ¸\às\Í\ìpuRXO\nZ3\Êó±½O&MC¶ò,b\È\Ì\Ö\àa4U¹µù5¤”¶S¨B.Ã±\Z4…ôû\ÆI\Õø­&÷\ÊÊ¾ôöýeòý7\Ô\ã\è\Øn=B­¬²¨`E¡\ÂW‰-:\í\á«\Ü\êi’\ÝWW’W–÷õ2\Ò\ç$mÐ¡é²„!\É\n‡[˜L\ÔncxdŽú\Âú!\íœ\'\ÈÖ“þ•\"4oB†ñŒž1\ìµ\ÇKþ~!\í¼9yÑ¹\ÔÁ7š[ç§°\Åü->z\Ê|\èP\Þ\Å2™j1\Ë1¨«Ÿ(\ç`x\"\á\æm-ŠAqü.^Ž¡ª§6ô=\Z|xÂµ\ÛT_jx¯Ió\Þ\Åíœ†Ÿù\0ðdü¶Â†\è2h\Ç\n*?§¢øWW„¿¹7W^Ž§\ì\Ëd\Ñ¤Œb¬1q¾ž™N»\'Ô‡Ši+T\Ô:\Ã\Òv°\ÞW£±¾šœD»\'Ö³{\å\Ä\Ó\Ë7¯þ«H\\µ3Z˜\â\èoÿ\Ä\0#\0\0\0\0\0\0\0\0\0\0\0 !102A\"#Qÿ\Ú\0?\ï\\Q“:%ùØ±\r…¹­\æóÙ¡AH„V5<\Þp#!\Ê0…\Ë\ß1²\ì\Óû9%\Î\Ø\ÜL\Ô^\èþ.«qF\É`\ëz±U\Ó\Þ*¿ÿ\Ä\0\"\0\0\0\0\0\0\0\0\0\0 !012A#Qÿ\Ú\0?ì½©QC”½‹\àŸ$“FŸ¢\ÞÎ§RM;!\ë¾CG3•¶Ð’5?R½½6J›ùˆ¥%È’^Ø‚Tñ%syŽk(¬À}Ÿÿ\Ä\02\0\0\0\0\0\0\0\0!\"1AQ 0aq‘23Rb¡Á#BPrÿ\Ú\0\0\0?ÿ\0FPªwUqõT%f|\Ö: \á‘\ç\rs·Ü•\ZW\ãœ;X´\n,µ7¹\Ó\ÒI ªWGa=9Î½Q²¦ZYˆ\á\Ø‰(HŸ;”\è„\ì™^hˆó¼\Âi\ÒÁ!5‰‡\ÕL‹·Tù\ÇM‘†ñ\"¤\åR´W[Ï›Œ\ÉJ(\"\è]”•sÐ©<WuJ¦¹ÎºÒ¤9rcIS…\ìûN¨ˆ€‡Œ\çe\×ü—g\ÑQH«®P‹©\'WÏ—8žŠMT^òß”wQoºF5,þ•q;@œ\áuÿ\0\Ôð¯\í”V¶ð\ë$\ÖD87\Ù]x¯ b5\íi\Ý9ŽÈ‰øNÍ†V5\ì2sL\ÂlF\ê=\n¤\ê£\Çh«gM\ìk_ó!`š,vc‰¢\Öú¡Ô§«\ßX™·\Ø<\à‹—G\'j=\í)øN	\Ê#g\æ8›‰qOkÿ\0¥º‚{‹f3O:¸\Ê3NOe\à¢w^ÿ\0t“\ÐG÷¯\0N*=<\r­Tþö?«?\\!£T†Î«`*ŸL‡nocRSMn\æI­\Ñ8lx\'£m6—²‚pjw\ä@x²/~	\ïÀ\Z\É¹#\É\é\Éð\ãîÀ\àÿ\Ä\0%\0\0\0\0\0\0\0\0!1AQaq‘¡ ±ðÁ\Ñÿ\Ú\0\0\0?!Ôˆˆˆˆˆ\ÐjDDDDF„Dh#ð\"#F}‚\Û\ß\Æ&Jó8\ï\Æ\ßE´\Ö«¦« ˆHˆˆŸmóô\\\Ù2\àl-\ÙcoXZ¸pð\äDh#R\"#FB\íx­¡t\Ø\âzD§|ˆjDDD\Î\×ññ¦Á±\\(Ç´6+Ö ý\Äh#B5\"$`|‰_g3£Ý¼@\Èq¾\èb\Ø\0÷\æ\0a¸q\ZMH‰l:ó\'!œ÷¸R\é4L–öò\ÝvK>(\ÐDjF„EÀ™DûtM‚\Ï\r—Ÿ„ ,ð\Êyr\è\"#ð\"\",u\\¶V\Þ\r\Ým‹Š\0W–\ÐgsPˆHˆ²Að\ê\Ùi;wÅ–5Ð–°ðt˜X‡\Ö\Ì\áhcvŸ~±\ZH³\Ôø\ã\æ~™;žüNþ09š\Õ[\êC\Ü;‰\Öƒ{0Ÿ,}Ç¯e$F…¹ÁÍ°\\ÁBÀa\Çùi4\0l§n±:=\Ä\Æ@]¼yCpqÍ´û\å\Û?\î\ÓGd\îF¡\Z,\'¹è¸\ÅúDîˆµÊƒ\Ãrotµ€tbX\ÏÀòY¦À\ï˜lú0F\ÅÜ½\Ý;}F\îk\Zv\Õl^o6\Ëf\ë\ÊÄŽˆ\\\Ì 7~û\Z\äp6²ö>x\á\ËO„\á\Ó\Òy….\Ø#ø\ía7¾¤k\Zc\×\ãbOÙ··bsN\\ ¿\Ðj€˜‰\Ò\ç\îŽ[\È{8¾FVö`\nôvo$ûû$E¼ypC	ñ=¥[\Éf\ë‘÷ür\ãpö›x\È“–!\ì\æþ\è¶\ÒD¼ñb\Ã}®7Ñ¸E\ÜðÁo—‚\Ì\Õ_\Â\â?^‡F\È>»\Þ>þ\Ñl\Û\Úó¨}\é\"\Þ<Ž\Ù\ê\Åõ\ã[ô\Þ§«°YO\éøô\Ð\Ð\Óv\Ñlvsû\ä\Éa^¿$[\ì\ç›s\Ï`WBz\îþ\Z\êhñQøool\Ë\ßi\"ÿ\Ú\0\0\0\0\0œÙ­s©\Æ,¬\'\Çù\Êt\Ìd\Òz‘ˆXgnˆþ§¨\È\ÕtC‰aNY‡\Ìf’i\ÝÁnÇCTezäŠ¯³eG?Øµ\Ñþ¦F9§\ïðkÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0! 1AQÿ\Ú\0?\à‡À†<\\BhCub<2\ä²\rœ$(ùv0ÕØb}ƒ\Ò\È)k\Ï\á$“¥òö‘¡uÅ—Fý\àG¹ ™\êÏ¼\Ø{–Ž4ø‡H‰\á¸\ÏL·‡¸\Ê!œ{uÁ\â\Ûÿ\Ä\0\0\0\0\0\0\0\0\0\0!1Q Aqÿ\Ú\0?\á8|’\Â\Éü55Å½s¯\ä“<`ƒnN$\Õ“\'\çB“\à!Y¶•™/ó‡h\ÎvH\\\Ý$“†ú0Ø²Gi\Ø=\á›c	¦\Í\'Î¤O¢\Ü!®¤“†\É6x¯\ØÉ‡É†¶uS\Ûd\ã\æu\Ü\Ù¯.þ©,¿ÿ\Ä\0(\0\0\0\0\0\0\0!1AQaq¡‘Á ±\Ñð0\áñÿ\Ú\0\0\0?\ã tøš\Ìzq‡Y5˜fi•GË£‡~‡@œ>\à‡§9¡SÂ¿0º‡­´\Ê•KŸ¨L¦›\Îþ€´W,Ž¢\ÏÁ\ßúœË°#\ëR\Úò´¦\æE]\Ñ{Ÿ\r*Xr,,\êk\Ð3/™v\ï£i0™t/Êº>at¯P‘üh\ë{Ö¢\Ä.Cw\0Ê† \ZB¹9gÓ£N.\\&P\\qz‰‹3\Âw\Û+aò¬\ï)/GiˆOxAaH\'\Øÿ\0(_xLºb­\Å	n¼\â\áš\Ò6«\æn\Ú˜ð¬™l›\0‡S\Ùÿ\0/ø U\rEøŠ,Æ‹\ZQ9|Wx‡€@ú™8l†Zjž²ž¡.µ?$IBˆ6;Uº7œUÊ³º\Õ‹Šdÿ\0L \æ¸úV`0\ç›E|\Ê{b$ªj\êhOr” \êf0[\Ö\á\Ô\àS=Á\á.\"©—M\ãü\Ì©p\à„nDE\íp‰lXE“(\ÇÜ­´»)—Eõƒg\ÄS¶·\ÇWŒQE‚_÷a\æ)Œ\ãj\á\Ñ\á\ï\ë‰\Â\Ã\îxNç˜Ž‚m\à”T0j.»ƒZe}\ã…t~ÿ\0y‹1ÿ\0pŠm-6ž#ŸA+)róv“új!\ã2lN\íÕŸ\'ˆq\Ú\ã\Ìp·\ébÓ¤\'Xp9!\ï\ÊU«•{\ÅC®…\Ð{†â®Ž[\ÛJ\Ö\nœ‡\âFR‡\Þ4o7\Z\Z‡B\æ\Üx»¥©\r°¤ñ3=\âY!\Ðø×¸°¿U_k¡t¬\ÇÖ¸¿\"*šlQmf~X\ÓTcJD[J˜&Ik¤Ê¸_o¥•1™bF-”g\Úlñgž-\Þ\ËXl£i\Çe½°7®4[±+$¶Š-—¸ú•ÆÕ¤\ä{Íº%x\èŒˆ.\ÝEz7=\à\0­\"\Ú\å\Ôde\Z{°ˆ8…ˆ$Á*¸iù)•ž\Ðø1ªA²U¤7¸|ý1r\ÑV¯¸…\ÆÑ·²Yó1KE\ë\Ä–¡Ú–üŠæ§¥\Þdðô¬ur\Ì\Ó\\Í¡YAÁÁñ\0.e8O\Ë-·$÷X–Ìª\íQ7mJ\äC\è:\\\Ï#-c‘ðþ4@ ›\áexaˆ¼\Ï\rß¡\ÄTMý‡ñ(¶Zž\Ã\é\ZM:\ÄBX\îùpû‚\Ê\ß!\ï3\á\Ç\Õþ¥ˆ³\ç\Û’\\¸\ê\Ú`dIj”Áz,]b\î\âH]\ÛÜ~¦5\éaÑ²\ß?ô2®¶”\ìj\ë3^²”CVž¸˜­2\Ï9ªw†®O\ÖP0\ì;½X\é— eZ\àóAFZž/w,¥²ô\ÇDpŒ´r\Ýwh?\â\\\åÿ\0`X\É\î€Á„‘SËŠ\æP €\äJ1_F\Ö<ð-\ã÷2ü\Å5¨7¨y€0‚i•f\ËñZ²;Oý,ûƒÈ¨ž•»Ç¢.¶\Z\Úûp id°*2|@…\È\Ö,Wõ¸ñ‡õpb†H©ŒBº\ï,z–Ž\rW¼e¡»®	A”5úû‹8\éOSø!§±,\Ë\Þ`]\Æ[&TªóA)k:Mƒ\Äqt=\Ù\Ø	(¹\ætü¿H—¯\ê—ÖŠýE˜\âŸÿ\Ù'),(2,'12200957','aluno','Bruno de Brida','','7c4a8d09ca3762af61e59520943dc26494f8941b','','','','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\í\0œPhotoshop 3.0\08BIM\0\0\0\0\0€g\0vYwbGS9BNBdCm1I1x1Lo(\0bFBMD01000abe030000700500002008000086080000f0080000130b00008b0e0000050f0000820f00000c100000a9150000ÿ\âICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0\Ì\0\0\0@gTRC\0\0\Ì\0\0\0@bTRC\0\0\Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïcurv\0\0\0\0\0\0\0\Z\0\0\0\Ë\Éc’kö?Q4!ñ)2;’FQw]\íkpz‰±š|¬i¿}\Ó\Ã\é0ÿÿÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0\0 \0 \0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0\ê\Ä:\åDAª\ê\\\ß//q¡\æ$z\ëü›z»Å¡v\Åh8j\0\0‰\éü³šDQñ¡:E!©\é^MÔ\Øp\0\0 ª\Ìð\Ý\×\ÏZòM/ŸÓWu‹‚»\ÍLŠš˜º\åë®£w\\T\0H‘l\ãdy¿©y‡oM‡O-º“˜|º\Ðf\Ë\×;9Z\Ï@\Ó\Ê\Õ\Û\0\0T\Ï$Nª\Þs\Ò\ä\å¶}Nˆ\ã¼My5\'\\òkºX\âIK¾á»³tÀ\0©	f˜tU\ã;\Îc=i•ªe´ö3#\êjB\Æ.¥\Ìý.Z\rk>8¨^Æ¹c¬$´ú’,qyý_\'Ž\Ôw)5¦¾Z[\ç£kŸ\èzÏ¦\Û\Î\áD\×Ðœ}š-\Þ\"þ1žq£49å—£«“76\ÖöS¹ë¹»\ç}£Ï¦\" c¥„Xùþ“\Îb²\Ù\èk4}%»®lzy³ç¦žk2\Íý\\µ\Û/BŸ\×N A1\ëS™’½S­z(÷‘\Õ\ÑiU\é»1\í\ÕF\ÝÙŠ;Ìšµ¬\âªÿ\Ä\0(\0\0\0\0\0\0\0\0! \"0124A#ÿ\Ú\0\0\0÷\ä\ä%ü­2¬\ÊlPÀýòt3ú—’\æos–¥w²Jz¥«12&¯¶N‡V\Ì-B\ÓsA1¯z,Å¼dSö³Î±\\ùššö,\è\×ð\Èû]nÂµ \äëŽº8\ë\r0žši}!V—\â\êy/\Ù\ë£x˜\çVr‹\æœg	\ÇS#d~r\Äö˜O\Ï\é\Õ\Æú}~Y‡uD\în50,„À\ël½ugMþµü©ý\Ó0s\Ä\Çn%¹\Ù4U\ÙgrÇ‡B%\É(X[û,«\í\Ç\â/\íþ\ÝjU8ñÊ¸1=Ÿ¤ñ4Nøû‰\å)Ô¾¥\n9-ž\Óú/\Ì¹þu€KT5iQ¾+5²Å‡<Á,\Ó.:\Ó\ÛW\ëøC\à±\ØÌ¯½@ø¿(\ÖhWpY\ê\ÌõL\á\×\çù€¼›Û½Jõ\Ã`6´\ÄøÎ«ƒ´³ðº+\Åb2,k4¥\î\Z*\'´x¹œˆ¾b/½\Ë\ë[.¾Í¬9*¡æ†µ÷\Zµýzh\Ýþ\ê\Ó\áo\Î!U\ÌVù1M9c\î)\Ø.\â/&-ø\r\ã¦x³\Ü\Ú]\Õ#x®½qÈµi«#©\ÚÌ™v\Ùe¿Sˆ®“¼¢[v\å_&®\ÞÌ§\"»Gµl:D\Ö\"\î\Îjz¶B\ÙUkE«\éx›D;9œ·J\×S!µM-\ã\n\î\í~\Ä\0BtÕŸŽ~Oj1•\Ì\Ü2\Ê+*\ëÄ¨•ý3\ã_ŠjsY¢\Î\í_Wm©ó9ª¶m½\ì´Æ²Æ©i\Ç[Â˜‰g.J\Û\rð+`òDf.ÄŠ\×Ú¬kz”\èö\Ùc}„¼)[et\Ãmr-²,]GüþG\èu\È0*Ò¥óg“w\'˜\Ôi*n»¶ˆ9\×m–\Ùc¶CO@V6+ON\Â\nžv\Ú1\ë,©\ÌK\ëgA[]%ge¬°\Ô VŠ…K)Š\ç_ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0 1!0Aÿ\Ú\0?ý¢Š\ÝhöBH\Å\"kh™33&K­”<Y…Š&G?\Íx\ßÁHRe´6NY;\Ú.Ð’$º\Þ=\nTeex\Zô&J^\ïÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0 !01Aÿ\Ú\0?\Öú\Ö\Ìm™²fbŒQvr\ä\Èl\ÈLùù¬\×\éE\"Š\"©m$>Oû¼½1*‹ç¥¢0\îÿ\Ä\0.\0\0\0\0\0\0\0\0!1AQ \"2a0‘Bbq#r¡±ÿ\Ú\0\0\0?\ç—+p<¨g×“e“€iº\Ô\ã\Ò\â=\×\\=fg¸\ÛÔª<&žpö\ßO‰z9\rŸOM­\ß\nó@\ê;ú@\ì\ä=üyÀÇ‹…Uù,©BŠ\á~¹¨†<Vþ+rªaw*$@+uØ¬œ\Þ+úEœ¸|9\êŽv£8a¡\\F³¶d(Q\rÔ«)„\×~IœI\æª1\á\nöUVQ‡…| \Ùe\Òy¼¯úP…”(\ÔT#¾$ž\ãl/\Çvó>/d Q\ìQF…±®5WVC)À2n¢\ç~g86È˜D¶\îûŽ‹s¾ñ!ipŠQ²\ìT`´]ª\nvòE]XYD\ä\ÕP\05^¬Ú´óûsœ½–A£\áuh¢Vs¢9!¡\0÷¸‚§›>\ÈA¿1•ƒ\Âòº\rWI\\6´\Ö\åTe~\è9 ;üp§)R-÷5^H×—µ\äÞª\Äi{„Z\Ã\Öhp\éSoÒ¼*d1\ÛJ‡rB8\éA\âÇ’tPóE\Äp´\Ñv7*\Z\á:•›†\á*”*J‡YxWTªª\Ø)úƒAa¢\Éôÿ\0+‰ü¦qsH\éžTf\Öhˆ.3\áW»ºªs\ÑUT•,˜\Â\r´Yˆ7}”ñ.›:)\Õ´øUÀ\æ÷QÁc½—T5uZ«\Ú~Š\íQ\éesO\Â\Í3n»J¨$”(P~lb¥Š\Åÿ\Ä\0(\0\0\0\0\0\0!1AQaq ‘0±¡Á\Ñ\áðñÿ\Ú\0\0\0?!û‹\Î-6Xõ\æ^Fúñ ôÿ\09º\Ð\Ê\ÄQ¯‡œ~\ÞL±\ä¢U‰Î¢°¡ú`‡ð›_\È`Jr\î‘•ð)`\ÎXÀÇŸ>\æ	¯§ø\Ñ\È\ÑXF.(\ã\à¸_1&&`Å‡ž?ŒK\Û+‰”&¥mN$¤½\Ü~\Å%‡¹\ãpý–¾ŽŠ\å²f@ü\ÙXÙˆJÙ¹ttûqó=ùô*\Ì(\ÔÌª;gÀò”.k²Ç¥_Õ™ôwö[>\ÑÚ’\Ê\ç\à{¥lSD·¬h\êbþ`7tL;tå–„\Å\'z\ÂL“úc\ì\×Oµ\"\×*ä–³”ˆ§€®ã²‘J\â\ã|%\æ?Ä²ÿ\0\Â*¦·‰M™¸–\n\0‚5fü\Â‘¯³«\ìñ24P\Ã\æP\Ý7û\ç©J7T\Ù^	V£Qñ™¤${&\ÜIq\ÞJ\Ã÷ö®í…»†\0\Ö\î\Ô<­›äŒ¸\Ë‰’3m>!W;†¬ö˜|La£..%»þ’\Ö<\à\Ú\Ò\×ö|Í¥AJŠiœW)´½ôM…Q²\Ý<Ì‹ô‚Ã¢dÞ¦\"ð¨\á V9”}5¾¥\nÙ¾\ßfU¶¹`z\ÅK\Üz~n\Ð\è\Äy˜\Êpÿ\0VP¡\Ú\Üñ¸\ïÔº÷—ðd¡t¾õ{\"\ÞS&`\Ã9z–Y\ËQVù˜–x°.\Îwüu`C@±\æ[g(Ÿ\ÈUý\Ý\ÒžýDª\Öp\ÜyH?dt„ÁZøò\Ï\ÆDf\'°È¸–Q§p\Îu)jpBWÄ½®GÇ˜¤{\Ô\ï\í¿CŒ‚P\í3j]\Ý?1]¤iÇ©yb\à\âU\ë¶22\æ\í\\l\Øþ¡Š\rÜ¿i¼Á*Q1\Ö1]Y\ì<\ÌK\ÆrO>~¶\ÜÖ¼6aÔ«ÂŽc\à™@¬Nø)*ô\rc\Õ\ÂoœŠ¾‹\n‚˜w+UOr\Çd\ÞX\ì2ô\ç/\Î\ÏÊœ\î\rQ)\ëÄ±qyg&ô„«\ÐÁ) ömŒ\Ør;—\èƒ\É-o0öûÁË–ž\á9\ÉòY\ã¦ò\ÌDlôÿ\0˜´…V`õ4x\n~R†Ã´Ô·w”7xX³r\ÔAæ´¸Hñ\Äò,v\Ðð\ÍX\âd\'¼\íÔ§\é\é›S+\ã=ƒ˜¹°4Ä¤­w”-›%f/“˜¿R²Áµ\Æ¢yx±\ÊU\àš!‡‰ÿ\0IœØ¿ùS‚¿LÎ¿!W \ê0\Ù\n¯ˆiT¡b7‰o<pm*c\Ú —òM\"ž¸c2\n\âµ?ÿ\Ú\0\0\0\0\00\Ð)ž™(1€Ÿ›™­]ý°n\ä\\\Ã;<\\¯ó,<¯¯J\ê\áÿ\0\è&\î´õ\×	ÇŒë„Ÿ>l\è$\ÍGXr¶\â9\Ñ;…\Út¨RG\Ò8ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0 !10AaQÿ\Ú\0?ôþ¥\'\ç>.oÑ¬\Ñ)E<\0u—\êU\Â¶Eµ\ÔD\î$˜`\'e;\çK¬4®P\\ú\Øf»eŽ\"\ÇS¡*\ÚÁMÛ¬j[!Z£G0=D:¢\\Ok\à©ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0! 1A0aÿ\Ú\0?\â\â\Ë\ê®W‹\áol_g\ØIgÞ¿R\Ì^ \\‰b\çVÂ¾Eeª¢_kH\ÓSÀ…š%1\Ïó}”9‰«!­õº•pP´•\Ó4j\Ó\Öy—Œ6\Â{ÁnJÿ\Ä\0(\0\0\0\0\0\0\0!1AQaq ‘¡±Áð0\Ñ\áñÿ\Ú\0\0\0?ú\\¿­\Ë^º\ÖV\ã\ÆMe93 ±°eÁ—.,¹rñ/\î-„°\à!\Ì\'èœž6\Ï\ÌuG\äƒc s1%—¯ñIoÎ™NJr\åË—._\ØFLj\Åª_—\Ä6‡\æ*–ùnYÚ³LÂ´Š>4Üµ\0x=fH[ó\ã8\áeV\'2#xgE›2Nˆ‘Yú›NbƒK…Á\Ûøÿ\0\ËúZºI\Øq+²\í‚SDz…£h\×\n™7*¨’\ÖNw\îhO\à¯Ê—÷Pù©e\×?Q€\È9È¨.¡¯¶e†þˆ\ï¬Ì€€Á³‰‘™|ø‹“(/¬K—ö*‹üJ3²·\Æ\"\Ö%Â»j»*\Þ\åAÇ’¢:\Åó5¡ô\Ëû õV;\ëd\Æh|Ä¢¥DüM\n©žòý²\Ö\àb\à€º\ZC6Ô©¡Yxú(¼:ºB\Ï\Ú€w\å\â7QŒ:‹R_”O4»–45qÏ¨S7“qL\êÚG\åð\0¶“í²‘9\Þ\ã;Ž\Ãe¹¡\ç\ërþ„NõG‰P3\ß&oQ€ \\·‰Xb2„ \Ëi‰j¦\â\Åt\Ó6\r•¨Å´›\Ê\âa¡]Z RÅ‡Xƒ\0!vjù”\ÙN\î\á\\…B­KoôK8°.]\ç²þ\ÂXµPFX¿8;5ÁI¢±@¬£a3’ÀÉ€¦\Èh\ÉdÙ’\"]]\Ôoó¿( Œ\ÖIul²Õ„J\nõ}×–b\r$¤\Ü$þŸ´\Ù`.›N¹à¨¸ù˜(-i\à\Â|F¡Czù€®Zë“˜ü¸y9 `Å„\ÊqPºƒ3n*\ÂjR€+=\ÃlyÅšFc°\Æö®¸\ï\Ì\\«qüK<Ä¯/w/¥®X©n\Ý7w%`P |À\Ðh)Vf03v¥³)Eû\æ\n\ë\Æ0\×\Ïqm\r˜\áK®¢\ä	~\Õ,–\Å[\×\ÛqdŒ—k\ä1óÀ¿œ§sÙ¥(8_\Ò\ã¦bµ—nÿ\0\ä²\ZM\ÅAE¡¤ôñ,\àa{y\ë>5; 1 °(^\Ãj\r³O\ÃúM ¶\Ä\Ñ\êd0T’ôö\â\\¹r\åË‚\nÎœ,\ç\Ñ_ˆq¨Y_6|eøš\ä\ÙW½6\ç\Ã,».1†\n\Ô\àù€.¦D\Ó\é¨wN£Š2bma,º•<Jƒ\ï\ÑÃ¶öÄ¹K—.`¤¯#ý\à`Q“x\Æù\ÜTm\Ñ[¾*\Þ\á{þ\â4õF\Ý–\\‹\Z¹uk)*õmñh‚]r\\D\Ù\æ,j QJ\è•{¬<\Ê1\Ð\'b\ÓDY\Z· ÷\ã\í¹O­\ÆÆ…z+q|H]\Òÿ\0qT\Ð@îš•ÀE‚ùm¼Â‹[\ë…\æZy\è–õ);\Èôgu‡|\Ò)Ug$Â\êj™Â˜\"bù•> 5¶7+kZ_KÑ§\íx\à*§tõXò\è¤\Ñ\\¸#U²¤½†c\Ü\á¦Nž%»*\æÍ·XôAíƒ–«\äeÃ»ù‰–\í‚_\'µ\Ð\ä|$PÔ¤\á+‘¨%I¹`ˆfýe|\åóû\Ê5¥D\ÓM\\UwCõ\ÒB\ÑÚ©q\r\ÔC:-\é•\î\"•tU\àñ0_®\à{¶¡\Þw4>?/^\"Íª˜?\î!€\êžñtöMþ°ðö<E-öxÿ\0\Ôüò˜Œ¿\à#ò±`6ˆ¨\Ü\êoh\à`€t˜ð\çW\Î~©#h9/2\í vª\Öø¢\Û\Ý<bÀe¾¦^¾—ó\Ú\ÂÝªÀ\n‡Ì°õ\nMn\á\ÕØ•N~%\Ñß¯\èõT\ßø\ä„ZX\Þ%Å¾Á\ä™ÏƒÌ¢´i\Ò]Ò¹U¦\'—‘O\ß\ÄVqœ\ç\ãù”K<6#b«\É\æ7I’µ\ã\ÌucA«t\Ä#´~D%¢j\Ì4\Í\â[Å^`xYR¾#{Ÿ¤ýGŠ³Ü«e3&h«ú#¡Ñ›\á~?h±IA|\Ì\Z‚Á\×‚4¬ö¯^ ‘\á†*:‹\ÈL^OÄ¶:\áC“¹b{ú|\Ê\"*”­ùñ\æÿ\Ù'),(3,'12206326','aluno','Matheus Valente','','7c4a8d09ca3762af61e59520943dc26494f8941b',NULL,NULL,NULL,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\í\0œPhotoshop 3.0\08BIM\0\0\0\0\0€g\0twZTBiJe0DdyfY2e96CN(\0bFBMD01000ac0030000a8050000f5080000c50900006c0a0000bd0d00000c130000851300005d1400002e150000471e0000ÿ\âICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0\Ì\0\0\0@gTRC\0\0\Ì\0\0\0@bTRC\0\0\Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïcurv\0\0\0\0\0\0\0\Z\0\0\0\Ë\Éc’kö?Q4!ñ)2;’FQw]\íkpz‰±š|¬i¿}\Ó\Ã\é0ÿÿÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0\0 \0 \0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0\Ô6(D¡£\Ò)\Þ)\ËÌˆ¼¹¨\î\à\å\îÃ——^P\å\åÂžvJt\Ç;d3¤l\r\éj³\Z\Ú\èkFýz3ˆŸ\Ë\Í.XW\Z^XBu¬\Ú\×DAdV™\rRB\Â\æ\å\r\Ð\ä¬Q¶p\×\ÜMË±\Äk)7\Å+BAHi=Mž-?5¥\n\ÎÀo<ô/7´X„(Eh\Ë$´º*=<¶°].%“b\ÖKDQÍ„\È\ÊQsiÍ®&]Nœg¶Aƒ\Ú\â\Z(-i„X\Ó\î\Æñ/7c\ç›ÿ\08\Ø\ï\n¯´`f©h2aDP‘Oª\â!\Í+\r±É´µ\â” \Ó_\ä\íØ‚jšÿ\0&õŸ(y]O)s’Ó­U\é\Ý\çÝ‘Ec\Í\Øe%£§VV[ñ¦,…cPi/Š\äþ“ƒ¢\É$I	³\Ï]*µ$r/¡\æB²ð8e){(t‘½üùý\Ã2\'I!\Í\ÛVYŒˆ²ŠXH¬r…>¡-\ì\à“ˆH\èsHWOŠ2.o3×‡R«%m¹Ž`“\Ñj•ó YºV« z®ŽZu´˜W­¤¦Ó•z\Ô\Ò%¨ª1¯ 2ó¸]_\ælÔ¼ó_G¡S!8‘\ëÿ\0ÿ\Ä\0)\0\0\0\0\0\0\0\0!\"#12AB$04@ÿ\Ú\0\0\0s€s@hÁ*Œ\"œüp¤\íý\í\å@QL¹Î«Ç¡ S\ß\ç\×8…/\ê\Þ?\é9\Ç\ë@W\æi–\î\ï\ÒU\ï\Ña\ã\ÛZ··\Â\É\ë#k[Œ\Ô\Ù	˜X1\r€Ò¾´¸™ûquI\ÃÇš5o9Œ‚—	\Ó\ãt«ðBXÝ‰‘\ß\ÎÝ¨Üšø€3j¯\ç8Mv+•~» ºj\é{n=`l\ç‘Z$¤Ž\Ö÷1\ê\ädIŠ~\á2¥6\ÙI¯¸~9«€;w\r´¾Š*•UR:”`\ÃÓ¥\Ú\Íd\å~\ípa\Çq\å*r\Ì\ÊÙŸAmW\ËüB9	Ç‚\ÔepŸ	wf\Òxe^¡`±ñ¸Œ\à»\0Š•\Åk„Pi3ŒRŽ¤\äX©\ÈxTQ!Dl¯A2¬Qj6@\Ö,d·‰ñ~\Ü5\nHFƒ‘\å\"d×pþ7ùkx9{„Ú§‡5mÛ§(qfð\Ícj\îý:\Ú[g\í\â5ù1ùþ{¤°vJBY#!Tb®\n\å²ml¿\Ó\'¢Š\é„>š,1\äT‰Ž©vô÷-·\Õ5	›Uz\ÏJÀrdV\ä0P\Z¡].ä¦©&d«`\×RJÖ¶3•qQ\ïU-Ý¾‘H\'ƒ\Î#@Àø’\Þ\çpn\Ì\ÙN}:¤e™	Ä—´’»U³H\æð\"¤´\ÇHm7Š!L\ä¸ò\ÃTg\ÃöZ4$\"£¸\î\àY};+MkQvö†\Þ\Ý\â†\ÜE\'T},3\ÙC1\Ðüþ»`”xô4\ËBW«‹†\Ì-\í†®d\év\Ý\Ãn¦4R\rui3#\Ë@\â—%?m©˜1ù>š\Ñ>R/¸¼\Æ$e\"Rk§\\a§½m,\ÚF’v\ÞV~6e:\ä*s¶J\Ò7— ©\r8¢6X\Î*hD•\Ú`c…\ê\ÊÁÙ†–\Ñ5dš\ÖL>\Ê@mQD‰«§ƒóŠ\Å\æAâ´š°\ì\ËIk)«k}\Ì#Mû\ì\×¬o¢±IDý5%A%»¹&`˜a÷l\Zµ\ÍM\"cÓ´Z¤\à[Ú€b‰H–Uˆ\Ì\ël^­b\Í]\Ü\îöò–¨Ú§‰na–Š\êA™ñT\æ\rõžGky)-¤\ÔZ\ÊJ\Æ@wŽ%2O%w–1\ËH3Wóˆ\Ð\Ó§‚\ÙøGç­®d\îi[ÿ\Ä\0\"\0\0\0\0\0\0\0\0\0\0!1Q A02aÿ\Ú\0?‚IY8ª²Q¯Àú\ÐÞ¶KlŒ=˜\"\\u×ŒX–\èq£õ1\ÉhQ§\â/Ä¸\×hM#YÎ½I;1!I‘d–è‹¦:›¶w\Ù\Ú94\Ñõ¢\éY•š\ËG!•º´(}œ\Ñ\Údz$­20j$;½Š(¤\È\ÍÃ¢\êZ\'•2™¶9#^\Åè­‹Ê”º³,KLqû8\åªeü4TPÝl\\ž\Æ\íè¢Šò‹ð´eGÿ\Ä\0\"\0\0\0\0\0\0\0\0\0\01!Aa 02Qÿ\Ú\0?–èŒÐþ\ìB\Ç!Jñy\Ùt\'\Ö|\á1«$D³Ð‹$\ÇbÐ˜Ä©\Z4CBö<@‰¼3‘ñ\á\â8\ì²QR\Ù?†´E\Ö,dt5\ä±\æIl\ãcM\"‡\ZX\ß\Õô91&ûe¼%KtFVr,\â~¤W–Iyð£ÿ\Ä\03\0\0\0\0\0\0\0!1Aa\"2Qq ‘±#@BRb03r¡¢\áðÿ\Ú\0\0\0?¤*n…o¾GòM\ÕvVËƒù	ÿ\0Kj …kV#\Õ;TjØ¦Ã«\áý tk©œõ¾ÈŽ¦øUQôCÅ•\rV“\Òùˆ\Ì(\ÊFÉ’\î}sqú¦\é(\Z„\çx@;\Ó>I\Z¾è–¸r¦w‡J\ê\î@(»ü)¬Ø®\èUwJe[©m¥wM\Ü\"\Z?\í\Z¨·%\ZW\Ùu;\Ù~„	¾\ÉÀG²ðTRUEg)u•@\Õ(\ê\ÜÓ„’‹ChJ™¾\á8\Ìü”\Ê\rš¬H¡i7jŸ\n¢\èIU\Ø#©nTˆŸ+IZ©„÷&r\áy]ªT9 …\Ò\à§\Å\Ño•\âTn¶”¯´#5)\ÚHõ*4\ÑjªŽ\Ð$v‘—U€²£+ed\"Zœ\Òfˆz¢|UM¡Sb	º¬€\Ù°E\Âi°S¸·\ÙuX ™†J\ÉËº¾r\Äi±\n\rŠ \â;\à\ê³d\âry>i³“\ÃU¢,€l++™7Tªõÿ\0kð\Í{GsLõù\Ý\×\â\0G*X\Ð2\ÄoóL\Ã{¾\Ê\ÂZµ”N«•?T\æ‡@\nö²¯LQ\nû£¨#k¢\Ópi˜\rjv \Z£a¹Q‹‡¥\ä\Ê\Òr\Äw—’‰¸B=\Õ\åQp­2´ò­\Õ$€­drø\Ít.¥\Ò(«d\Ó	}| \á\Âq;6V&#{\Ý\Ò\î|¡T*·„søÎ‡\ÙGiPF¢wGÿ\0NEU\Â\á5t\Ùb\Å\È\ÒX\ÒCP>F\Èx•¥Pû)p¤ü”º\ÕõZ[D%S)*\n¢nö\×\ÝU]	G…XUA°GŸ˜K\ç]•7^—Nq4º<B™žU[Çª™V‘ò@C*©P¨º\æt\ìP\ã¢ðµ`‚\æð,ˆ-ú¨4¨i¯+š…P¸ùû´¿›FOø•ý³\îqo Rhµc8mA¡°\Ïl£¡Þ¨ü\é>ˆx‚\Ê\ê¡5Rj3¢u&\Ùô\Ý	\Ã0W[\ã„(J\ÐÖ‡bÒ‰\Å!\Ø\Îÿ\0Š”›(gh\Èp\ß\ì|/†þ\æ…Â¥r*wMp¨…\ØWmyW\r]x¿E\Ò5;’ºñ>ñE¸<¸\ÝUp¾/¾M­õöC,nAjˆžrÿ\Ä\0)\0\0\0\0\0\0\0!1AQaq‘¡±\Ñ\áð Á0@ñÿ\Ú\0\0\0?!usv\ÇLj–§[=“™—¡ôÊ™Pi\åfAšó/…^8a\ßU©_ó\ÒÁ7…6\í¾`v9ñ,\Ô\í‹|g@2© My2\Òú\rLÓ¦Ó¸@üÿ\0šk_SR­\Ä(\n\æmù\"\'+u†\r­F\Zˆ¡\Ã9ˆ—¼\Ï5?¢Yø£)£ƒ\Â\Î\\¿TÃ¥\Ë1û\ê\áÍ‡3…\nÀ6–\"µ\ÌrVM:™P\n§q\Ì\å\è©Bž‰ˆn—]\Ê\n\'‘M§b\äL‡#¯\å¡›!Œ\"Bb\à„\'I—¨†(o,\Ü\0\à\ÑZe8ù•¼\Ê\ÌÈª¬2ô§\Z•T­eœ\ÜÂ°\í\ÄÚ”\ç„Kˆ©¨#ˆ¾\ê^f¿D\Û…G\ß;‡d¦\â\Ù\É`(÷2\íQ\Ì\Çl2—rð‘\î-¢r#dRøy£\Äóz†\ëqÁzŒ†˜\Än\Õu¸ƒ(Ue\n¹ _d \Ðòš&le‡\Ä?1”\Ä`EÉ—¸·M@€U\ÜcGG¸j¼*\àM¨ú\ê\ÕTU,«†\ÆUúÌ¨h8&\Äí‹œð\Þ\åóiM\å\çP¼l\ÅV&€-\ë\Ôv=vž\ç3Öˆ\r(ž\â‘1À\Ë:•L¤yš£ü\Ê:\èÄ·—\Ów\Ô\Ä\éÏ‰“M\á¹j&\Ó’“G%Â»PG.¥.Tâ›©x\Ój	…\Ø-+pL%sŠy›]’‘\ë#ž›˜\êT­züEKÿ\0a”0ª—3%\âWôŒÀ¤\Õ7ùˆn!N\â¨#Áb³\Ä“]T\Æ\èW”½J±.„\ÌS³\ßW¨^ÕƒÆŸ¬uCD¥¢9mŸ\r{¨\ÅZ,\Zc÷\è\ÊEL\ä^#ý¥¸\Ð7\Ë‘;óî©·\ÄTyEp5qUü\Åhµq¹|\ç@\îY^´µEÿ\0–\Õ\å[@\Äë‰ X.i&ƒ\Òs”; hß‰\Îc\Û¢©GdÆ¥\Ú]\"£ôŽœ\Ô<…†<\Âõ\Ç<qe‘ªæ ¦Iq„Å³l¦\Ü;%r¹>À\Þ\ÖG03\â¦Â¬G	\Ë\ZŸ0\r\Ô^õ\Ð\Û8„\Ü@¦Ê–7Gt\ÎY?!0\0÷ÿ\0¨\rJ\ã\ÌYY©T	·È´„¬Tx{µƒ0«ŒA)‚\å\ÉE Z˜s†Tó\ÔD:\Ä\Âln.,|E¦\æT‹	ò\ã%ƒ¹_Ù»w;E~\"Wù]¿i\É\r§(šŸ\ÂxJø€]4Óœq-¡\Î³8¡9¬vÁß”\Æ\ÝpþÑ€€ ­·ò”b´,lX³Ž|\Ä\È3\í˜\î\ÕwY‚IûÝ§\ÎJ\Û|\Ç\Ðk\Äe„dM±“p¶œTB\ÈÝ±´OA©‚¢5-K\ÂoFfe›ö\Ä4\Îeˆ\ç\âi\rM°ƒŒñö¿hªS\Z{›­k\Z€¶c\ïv³Ïˆ˜©†\0@b‰wh–Ê\Ñ›\îQ²žfa›&ŸEL\Ü6\Ëk|¥føsVG´\Û\Þ\Çq\Ô=…Á\n’ûD‘œ¥„q\å‡ŠE\ÖSW-N\r³+‰\Ä:€£\íLs\ï\Þ¼\Ç\n\ÌH\æ=K¢n†Œ¿\Ô*i\È\Ý\Ð\Êw,ò/1 \Ýupä¶¦wzp|M†Ï¥ %¿hL6gœ\Ë\é\å¹m¢Op\í/ˆÕ òJ\Ð;u™òKÂŽ\å—q\×÷˜=w÷Y_7„X»òyG\â\ÇÄª\Ù_‘¹@–[½\Â\Ò\í\ë˜i$\É\Éñ^“¿¦Š¨¥øG\rò\Ì\Ëb³Ä­j\Ö\á}ADT\Å.-\Å\\Ng\0\èó5Y­\Â@I‡‹Ó·\Ü\Í\ÓbövL\Ð÷ðB(•ÇˆFw1L(´…h_D\Ê\ß-Fyò%!{N,«.cd|„\íl|Ò¿T¸ynpM–-[c©\êµÄ«)O‡ô™KœX·0°0xŸÿ\Ú\0\0\0\0\0\Ò\çÉŠA»ô>RVZ^®Ç—t¯(X¤YU)8\Ø\ïN\ZÊ¯‡,U\ìmªtt¼ô\Ò\Ç\á\'IQ­8[M-žR\0I\Û\ÜA`+¸;a\ÛuÁ¶ò3ÿ\Ä\0\0\0\0\0\0\0\0\0\0!1AQa Áÿ\Ú\0?‚2?ð>¹>’\ìv0\ä\É|>À´\Òo+¨xŽ\Ë\Úe\ÌdG[ü”Ng˜4þ\ÂoFrô-{±n\Ä[\Ìr\ÙøôC’Lý!Šy¡¬ö‹sŸwÓ—¤£u\Û!X¸õ50S{n‡KWK_‰\íVb\ãmA†w°3\ê<8Ëµ\çÏ¼d\äm§KaL\\$>ga\×Áe‘rñ«P/óy!†\Ï\Ôý\Ë\Û:g³Ô•¥ÿ\Ä\0\0\0\0\0\0\0\0\0!1Aa ÿ\Ú\0?Ò„\Íº\ßðþ\é`\î\Î\ÉN„|>þ#sõp§\Ûw:\"/ŽÇ¸\Ú4š5°ˆ2y91¿‰o¥\Ý,Ø‰Ø°.©5-WOQÇ—3vú¹\Û<Kc].\ÌeÄ›Ì›yYÓ’ü6Çx$;\Ñk\Ðv\Âp‘ò\âi\êr\ßÁ±pm\Ù\"Q\Ûp/\â\Ì\Åù=--,^JFfl¼‹K\ß$\rYŒ·„5±\Ãbó—ÿ\Ä\0\'\0\0\0\0\0\0!1AQaq‘¡Á±\Ñ\áð ñÿ\Ú\0\0\0?\èDS~\á°7$·gu@\\–ÿ\0><\Ëp®Qñ†ª·j½\Êÿ\0\'ø	R @ÿ\0$©PT&%ª\ïu\æ]\Ô\ìu^“@‚‹\0\ä\ï8€6¤\È:À?a¤Ë°!*%\à J•T¨ß—I\ãÿ\0‘\0™^%Š\r\Z\å®ù€A1A0Ô¾•8#*ý£$k\n7m²\ãñ\\VJ§5-tÒ¸_õõ-bôŽ\àbWø	R¥	\rZ\Ô„\å3(K°U¿‹›Å¢ð[ˆ\Î4#uý\ÇQT\æÚ«‹\"%ck¢`Àû\Äk\Ü4­\ÛH™^\Ç@X¢\áb\ß\æ$g\n3\Ôc\èk@8ø`@Š\êÈµGÙ±-‹ª\Ê92JÒŠ	š\\ˆ\â=\ån«&3\á\Ö9æ¥ƒœ*V‘/˜%y3¼g‰@ƒ]\Ë\ÏU6\Ú\àr¨¹M\Éz?»Ž<{–6ø€¯®\ÊO$»[½õ†÷ñ7)&y¾C™œ˜6#‹9J\Ù\ÅJf+iúó\Ó7\Èh™euaÁt?¹TJ¿?ö#Qt6¥KJ¨eõ¸ôv_1‚+Uy{.Z(¡fžp9T¥±Ó·\ÊT¥Àˆ½\Ùw\äe\Ñˆ2ñŽ{*\0@¡kk’¡7´-WdK\Ù9û¸UX>\æ’G`?¹¦ž^ø\Ü9[uv\å·\ÌI·FŠ7–w^û*´øþ\åQ‘e3¬nZÁ0\r\ß\Ì\ÆóZŽO~¦\êVAps2Š(L±^eò¼§7\æW•P2L\Ýñ\Ûs\ê\éû¸R\è\Â°Jº¬2Ál8\r¬`\Ä+NöŒ¾f«hÁø€>¹”X¤–\ïP6\Í\ãû|ÁK-°O\ïs#(µÞ¼“5\\ÅºkÝ±°kuªG©\àP·–ù‰\0Ð¼U8Z\Ö\'.Át[\Ä Á–^/ˆ\ZbD\r[DùF—E›` ;Œ@m+’ý1œ\àŠ^Ÿ„J¸˜©ûbS¼´\È0x\Þ>\å +\Å6®&\0•V<Te´{F\à¦}Yq˜\á¶8:¸€0¥#$pX\0\ÝÌ«,ŒÀµõqo†uZðýÇ·B–]_y¨¤¡\ÔwŽ~\à5H4o_Šƒ¦»p…p<s3“\×w\ã\Ïb#K2ýw2+}EMU]\Ëul9\çöõ÷«3\"mxj¨\Ç0\Õù,\\Í¿ó(\'´P>\Æ_# c™wl4/+*2(>k\Ú\ê«1Do1\Ãre\rŠ»u)\ÅafŸR\Ö¼R\ãþ÷™\0\àÀ~\å²	qý\Éß“Jx÷p\ï6½¥ªqùˆ;–¿x¶²•ÿ\0qT‚(Ž\ì÷üL\Õ\r\'.m\í\æ\n1%wx£\ÞcU\ZQò\r”‡\æd¨\\¸4\ßñ<	‰\n‹«¨ƒvKEø|Aµ\É*ò{¾<Å‹)3\ì¾üAK•G\ÇQD\á\Ë\ßXÜºUª\Û\á)£´l\rñû–a\Ï	°Pý\Ì\Õ\ÐJhvû#­RKF\ê¿+R¦¦\ÚV9\Ö&AB\é…ûñµE`\äÕ¼9Ï©HL\\½®U\â%–@”:0}Ö¢W(S}«¡Þ–]\×\Ì%>~—Ñ«\Å\Î ù©–z^\Z–P1¼„´6[û•¡›÷OU*+¥/?\Ï1VZ¦£	p\á\Íc˜\0\"1ªD\Ø#Ç¶\ÑJ©OŒL\Ù\Ðßž\ÉO_²˜­°ŠW|öÀ7pVù~Y\\´½4\Øi½\æ°GZ\Ù\ÉA~1 Sª\Ýr[øƒHkÄ£g\âR‹ú)%e£\ÚÄžmf¥¸0«\Ý\0»\Ï|BŠ¶Ž¡&™d\ìn(U\çD\íœDm¾\ZUŒã™†\Z»±»œ\Ñ\ÛW@PŽNEýFT­^:¨\n\Ñ\â.\Ä[šSlf°1\ÕKEÊ¦\ÐsûU+¶0}À\â\ÃR°\ï?\î\\aP%^\ß\ÜR¢S\Î¤V©bd1~â¨ª©ÛœŸ\Ùjœ\Í\Øs2bbºhYO\r¹l‚\É\ê“!ì·Š³p­*Á\è\ç\Èf£­¨»\Å\"Y²Ý“&ü\ëP\0­+S¾LAfþeF¾»\0-Nÿ\0\Ô\å§/,[_¸¹€R´|y›–/½®¥2\ëS8oõX– ”;‹”\åƒuñ)0`+U9N\Â|\Âl\Îl\Ä0ˆQ\àýA)¡n‡\n\"½\Öµtø¸¸h±¢>ø£\á†7º†/¸Ë•.\0\Û\ß\Z—‹bMƒ«\ë0AJ\çA2\Ð…pùÜ·‘\ìu\ï¹B¾Œû„þ“=–¸18\\üûŽ\0;ó\nU†_õP«Ur\ÉH\Å\ÜJ¥p±(·¨UW\æba¶\ÝL¢—2q‡\á\ét<¾!1NL\Û\à<³o½&bpŸ¸£`P¿\á\ê,sE¼Ž2\ÇT\ák÷™o\"°2ž\à\ËiŠú¨ŽÙ¨\áKu¢¹•‹v0\ÝÙ¯0ð§´k\nföErQ`]q,`¥+¦U¸S¼\n\Ê\ç\ïñJ‰–9\áx\Z\Ú¥_ù–v\Z/^u3“v¯\ìI¹\Æ\î\Èð2¥¸súˆ\îd9–±½\ÊR°\n\ïP³`8,-\êR\ÊJ—\Æ9™\Òü÷\Ð\Æ/–R\n\ÍY\Ì\Î\è\Ù\Ì¬fŒ`\ÑÇpS\ÞÁ÷–¦\Þ\ÈûaŒ²ýAA…E]óÌ®†Ý§/^`Bí ²\Äb­\ê\\\Ã6›¤|\Åj•x\Æ%\0\Ø>\×Ä¥¡)zxöµ\\\Ü\ÐK\0\åIpcµ\Ã\é	–Þ†_Ì®\ã‹c{q6\ë:€\àfŸP*¼¡7«”9Ksjox{ƒ¸y\ÃUŒŸr†\Ör/\êà´¥ôÂ ]\ÎC¢¹S:R\Í\ÏFŸÄ¡4jŽe©~-}Ž\åÀ\r\Ñõl~e¡0²gkH;\ê\â6p€¼»•Ap\0\Õ\ß\ê-.g.GŠ\ã3*bø½¬ƒ”\à™+^kRû°²Ó“&\×\r XOŒ\Î\è/Õ¼@ŠJ¦¦\Â\Ú8z%Io\Ën‡™e¡žÝ¬25x€¦“\í«Qj´\×qw\Õ\àû9\"kV\0a^_S\ÃL\×\×Ü®f\Ò\ÑÎ‡¨#ˆ0d€k¥«úƒ\r	;¢¬¦\×1U2\ÎS?SR¿s\Çü\Ä\ÛK‹Œ\ËI\Ð;úŠ\Ó)~el•µ\ä\îVR\ÙG\ãû€‡[«\Ó†¼6Z>Yxd\Ð-ó6†\Ë\ß$\æs\ÎJ´­ž¼1¯˜\ÕAf>\çÿ\Ù');
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

-- Dump completed on 2017-05-26 21:58:33
