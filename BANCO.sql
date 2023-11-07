-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema BANCO
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BANCO` ;

-- -----------------------------------------------------
-- Schema BANCO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BANCO` DEFAULT CHARACTER SET utf8 ;
USE `BANCO` ;

-- -----------------------------------------------------
-- Table `BANCO`.`BANCO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BANCO`.`BANCO` (
  `Id_Banco` VARCHAR(30) NOT NULL,
  `Nombre_Banco` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Banco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BANCO`.`CUENTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BANCO`.`CUENTAS` (
  `Id_cuentas` INT NOT NULL,
  `Tipo_cuenta` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_cuentas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BANCO`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BANCO`.`CLIENTES` (
  `CUENTAS_Id_cuentas` INT NOT NULL,
  `BANCO_Id_Banco` VARCHAR(30) NOT NULL,
  `Id_DNI` VARCHAR(45) NOT NULL,
  `Nombres` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`CUENTAS_Id_cuentas`, `BANCO_Id_Banco`, `Id_DNI`),
  CONSTRAINT `fk_CUENTAS_has_BANCO_CUENTAS1`
    FOREIGN KEY (`CUENTAS_Id_cuentas`)
    REFERENCES `BANCO`.`CUENTAS` (`Id_cuentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUENTAS_has_BANCO_BANCO1`
    FOREIGN KEY (`BANCO_Id_Banco`)
    REFERENCES `BANCO`.`BANCO` (`Id_Banco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `BANCO`.`MOVIMIENTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BANCO`.`MOVIMIENTOS` (
  `Id_movimiento` INT NOT NULL,
  `Tipo_moviemiento` VARCHAR(45) NULL,
  `Cantidad` VARCHAR(45) NULL,
  `Fecha_Movimiento` DATE NULL,
  `Descripcion` VARCHAR(45) NULL,
  `CLIENTES_CUENTAS_Id_cuentas` INT NOT NULL,
  `CLIENTES_BANCO_Id_Banco` VARCHAR(30) NOT NULL,
  `CLIENTES_Id_DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_movimiento`),
  CONSTRAINT `fk_MOVIMIENTOS_CLIENTES1`
    FOREIGN KEY (`CLIENTES_CUENTAS_Id_cuentas` , `CLIENTES_BANCO_Id_Banco` , `CLIENTES_Id_DNI`)
    REFERENCES `BANCO`.`CLIENTES` (`CUENTAS_Id_cuentas` , `BANCO_Id_Banco` , `Id_DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `BANCO`.`BANCO`
-- -----------------------------------------------------
START TRANSACTION;
USE `BANCO`;
INSERT INTO `BANCO`.`BANCO` (`Id_Banco`, `Nombre_Banco`) VALUES ('BcoIng', 'Ing Direct');
INSERT INTO `BANCO`.`BANCO` (`Id_Banco`, `Nombre_Banco`) VALUES ('BcoCai', 'La Caixa');
INSERT INTO `BANCO`.`BANCO` (`Id_Banco`, `Nombre_Banco`) VALUES ('BcoBB', 'BBVA');
INSERT INTO `BANCO`.`BANCO` (`Id_Banco`, `Nombre_Banco`) VALUES ('BcoSa', 'Santander');
INSERT INTO `BANCO`.`BANCO` (`Id_Banco`, `Nombre_Banco`) VALUES ('BcoSB', 'Sabadell');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BANCO`.`CUENTAS`
-- -----------------------------------------------------
START TRANSACTION;
USE `BANCO`;
INSERT INTO `BANCO`.`CUENTAS` (`Id_cuentas`, `Tipo_cuenta`) VALUES (1, 'AHORROS');
INSERT INTO `BANCO`.`CUENTAS` (`Id_cuentas`, `Tipo_cuenta`) VALUES (2, 'NOMINA');
INSERT INTO `BANCO`.`CUENTAS` (`Id_cuentas`, `Tipo_cuenta`) VALUES (3, 'CORRIENTE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BANCO`.`CLIENTES`
-- -----------------------------------------------------
START TRANSACTION;
USE `BANCO`;
INSERT INTO `BANCO`.`CLIENTES` (`CUENTAS_Id_cuentas`, `BANCO_Id_Banco`, `Id_DNI`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `Email`) VALUES (1, 'BcoIng', '25368522J', 'LAIA', 'MARTINEZ', 'aV. ROMA2365', '632548978', 'MLAI@GMAIL.COM');
INSERT INTO `BANCO`.`CLIENTES` (`CUENTAS_Id_cuentas`, `BANCO_Id_Banco`, `Id_DNI`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `Email`) VALUES (2, 'BcoBB', '42368522C', 'CARLOS', 'FERNANDEZ', 'PASAJE DOS DE MAYO', '612548978', NULL);
INSERT INTO `BANCO`.`CLIENTES` (`CUENTAS_Id_cuentas`, `BANCO_Id_Banco`, `Id_DNI`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `Email`) VALUES (3, 'BcoSA', '42368522F', 'MARIA', 'OBREGON', 'CALLE INDUSTRIA', '632548546', NULL);
INSERT INTO `BANCO`.`CLIENTES` (`CUENTAS_Id_cuentas`, `BANCO_Id_Banco`, `Id_DNI`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `Email`) VALUES (2, 'BcoSB', '42368522J', 'SANDRA', 'DEL RIO', 'PASEO SANJUAN', '632548123', NULL);
INSERT INTO `BANCO`.`CLIENTES` (`CUENTAS_Id_cuentas`, `BANCO_Id_Banco`, `Id_DNI`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `Email`) VALUES (1, 'BCoIng', '42368522M', 'FANNY', 'CABRERA', 'SAN ANTONIO', '632548000', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BANCO`.`MOVIMIENTOS`
-- -----------------------------------------------------
START TRANSACTION;
USE `BANCO`;
INSERT INTO `BANCO`.`MOVIMIENTOS` (`Id_movimiento`, `Tipo_moviemiento`, `Cantidad`, `Fecha_Movimiento`, `Descripcion`, `CLIENTES_CUENTAS_Id_cuentas`, `CLIENTES_BANCO_Id_Banco`, `CLIENTES_Id_DNI`) VALUES (201, 'Retiro', '50', '2023-27-10', 'Retiro cajero calle padilla', 1, 'BcoIng', '25368522J');
INSERT INTO `BANCO`.`MOVIMIENTOS` (`Id_movimiento`, `Tipo_moviemiento`, `Cantidad`, `Fecha_Movimiento`, `Descripcion`, `CLIENTES_CUENTAS_Id_cuentas`, `CLIENTES_BANCO_Id_Banco`, `CLIENTES_Id_DNI`) VALUES (202, 'Pago', '120', '2023-27-10', 'Pago en Mercadona C. Industria', 1, 'BcoIng', '25368522J');
INSERT INTO `BANCO`.`MOVIMIENTOS` (`Id_movimiento`, `Tipo_moviemiento`, `Cantidad`, `Fecha_Movimiento`, `Descripcion`, `CLIENTES_CUENTAS_Id_cuentas`, `CLIENTES_BANCO_Id_Banco`, `CLIENTES_Id_DNI`) VALUES (203, 'Deposito', '100', '2023-27-10', 'Ingreso en efectivo por cajero 123', 1, 'BcoIng', '25368522J');
INSERT INTO `BANCO`.`MOVIMIENTOS` (`Id_movimiento`, `Tipo_moviemiento`, `Cantidad`, `Fecha_Movimiento`, `Descripcion`, `CLIENTES_CUENTAS_Id_cuentas`, `CLIENTES_BANCO_Id_Banco`, `CLIENTES_Id_DNI`) VALUES (204, 'Transferencia', '15', '2023-27-10', 'Tranferencia enviada via bizum', 1, 'BcoIng', '25368522J');
INSERT INTO `BANCO`.`MOVIMIENTOS` (`Id_movimiento`, `Tipo_moviemiento`, `Cantidad`, `Fecha_Movimiento`, `Descripcion`, `CLIENTES_CUENTAS_Id_cuentas`, `CLIENTES_BANCO_Id_Banco`, `CLIENTES_Id_DNI`) VALUES (205, 'Pago', '10', '2023-27-10', 'Pago en Farmacia c. Amapolas', 1, 'BcoIng', '25368522J');
INSERT INTO `BANCO`.`MOVIMIENTOS` (`Id_movimiento`, `Tipo_moviemiento`, `Cantidad`, `Fecha_Movimiento`, `Descripcion`, `CLIENTES_CUENTAS_Id_cuentas`, `CLIENTES_BANCO_Id_Banco`, `CLIENTES_Id_DNI`) VALUES (DEFAULT, NULL, NULL, '', NULL, DEFAULT, DEFAULT, DEFAULT);

COMMIT;

