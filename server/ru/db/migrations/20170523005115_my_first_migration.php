<?php

use Phinx\Migration\AbstractMigration;

class MyFirstMigration extends AbstractMigration
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-abstractmigration-class
     *
     * The following commands can be used in this method and Phinx will
     * automatically reverse them when rolling back:
     *
     *    createTable
     *    renameTable
     *    addColumn
     *    renameColumn
     *    addIndex
     *    addForeignKey
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function change()
    {
        $this->execute("
                        -- MySQL Workbench Forward Engineering

                        SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
                        SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
                        SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

                        -- -----------------------------------------------------
                        -- Schema rusysdb
                        -- -----------------------------------------------------

                        -- -----------------------------------------------------
                        -- Schema rusysdb
                        -- -----------------------------------------------------
                        CREATE SCHEMA IF NOT EXISTS `rusysdb` DEFAULT CHARACTER SET utf8 ;
                        USE `rusysdb` ;

                        -- -----------------------------------------------------
                        -- Table `rusysdb`.`users`
                        -- -----------------------------------------------------
                        CREATE TABLE IF NOT EXISTS `rusysdb`.`users` (
                          `idUser` INT NOT NULL AUTO_INCREMENT,
                          `collegeid` VARCHAR(45) NULL,
                          `usertype` INT NULL,
                          `name` VARCHAR(45) NULL,
                          `surname` VARCHAR(45) NULL,
                          `email` VARCHAR(45) NULL,
                          `senha` VARCHAR(45) NULL,
                          `phoneId` VARCHAR(45) NULL,
                          `cardId` VARCHAR(45) NULL,
                          `term` VARCHAR(10) NULL,
                          `userImage` MEDIUMBLOB NULL,
                          PRIMARY KEY (`idUser`))
                        ENGINE = InnoDB;


                        -- -----------------------------------------------------
                        -- Table `rusysdb`.`acessLog`
                        -- -----------------------------------------------------
                        CREATE TABLE IF NOT EXISTS `rusysdb`.`acessLog` (
                          `idAcessLog` INT NOT NULL AUTO_INCREMENT,
                          `timestamp` DATETIME NULL,
                          `accessType` VARCHAR(45) NULL,
                          `observation` VARCHAR(45) NULL,
                          `idUser` INT NULL,
                          PRIMARY KEY (`idAcessLog`),
                          INDEX `fk_acessLog_users1_idx` (`idUser` ASC),
                          CONSTRAINT `fk_acessLog_users1`
                            FOREIGN KEY (`idUser`)
                            REFERENCES `rusysdb`.`users` (`idUser`)
                            ON DELETE NO ACTION
                            ON UPDATE NO ACTION)
                        ENGINE = InnoDB;


                        -- -----------------------------------------------------
                        -- Table `rusysdb`.`credits`
                        -- -----------------------------------------------------
                        CREATE TABLE IF NOT EXISTS `rusysdb`.`credits` (
                          `idCredit` INT NOT NULL,
                          `timestamp` DATETIME NULL,
                          `type` VARCHAR(45) NULL,
                          `value` VARCHAR(45) NULL,
                          `processed` VARCHAR(45) NULL,
                          `idUser` INT NULL,
                          PRIMARY KEY (`idCredit`),
                          INDEX `fk_credits_users_idx` (`idUser` ASC),
                          CONSTRAINT `fk_credits_users`
                            FOREIGN KEY (`idUser`)
                            REFERENCES `rusysdb`.`users` (`idUser`)
                            ON DELETE NO ACTION
                            ON UPDATE NO ACTION)
                        ENGINE = InnoDB;


                        SET SQL_MODE=@OLD_SQL_MODE;
                        SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
                        SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

            ");

    }
}
