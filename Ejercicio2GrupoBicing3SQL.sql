-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `codigo_usuario` INT NOT NULL AUTO_INCREMENT,
  `dni_nie` VARCHAR(9) NOT NULL,
  `nombre_apellidos` VARCHAR(45) NULL,
  `direccion` VARCHAR(80) NULL,
  `telefono` VARCHAR(12) NULL,
  `metodo_pago` CHAR(15) NULL,
  PRIMARY KEY (`codigo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bicicletas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bicicletas` (
  `id_bicicleta` INT NOT NULL AUTO_INCREMENT,
  `tipo` TINYINT(1) NULL,
  `disponible` TINYINT(1) NULL,
  `buen_estado` TINYINT(1) NULL,
  PRIMARY KEY (`id_bicicleta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`facturación`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`facturación` (
  `id_factura` INT NOT NULL AUTO_INCREMENT,
  `Suscripcion_activa` CHAR(15) NOT NULL,
  `fecha_alta` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_vencimiento` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarios_codigo_usuario` INT NOT NULL,
  PRIMARY KEY (`id_factura`),
  CONSTRAINT `fk_facturación_usuarios1`
    FOREIGN KEY (`usuarios_codigo_usuario`)
    REFERENCES `mydb`.`usuarios` (`codigo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alquiler` (
  `idalquiler` INT NOT NULL AUTO_INCREMENT,
  `inicio_alquiler` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `fin_alquiler` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bicicletas_id_bicicleta` INT NOT NULL,
  `facturación_id_factura` INT NOT NULL,
  PRIMARY KEY (`idalquiler`),
  CONSTRAINT `fk_alquiler_bicicletas1`
    FOREIGN KEY (`bicicletas_id_bicicleta`)
    REFERENCES `mydb`.`bicicletas` (`id_bicicleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alquiler_facturación1`
    FOREIGN KEY (`facturación_id_factura`)
    REFERENCES `mydb`.`facturación` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `mydb`.`estaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estaciones` (
  `codigo_estaciones` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(80) NULL,
  `cantidad_bicis_caben` INT NULL,
  `tipo_bicis` TINYINT(1) NULL,
  `bicicletas_id_bicicleta` INT NOT NULL,
  PRIMARY KEY (`codigo_estaciones`, `bicicletas_id_bicicleta`),
  CONSTRAINT `fk_estaciones_bicicletas1`
    FOREIGN KEY (`bicicletas_id_bicicleta`)
    REFERENCES `mydb`.`bicicletas` (`id_bicicleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `mydb`.`usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`usuarios` (`codigo_usuario`, `dni_nie`, `nombre_apellidos`, `direccion`, `telefono`, `metodo_pago`) VALUES (DEFAULT, '22222222R', 'Antonio García Martínez', 'Calle Manuel Girona 23, 2º 1ª', '655555555', 'Visa');
INSERT INTO `mydb`.`usuarios` (`codigo_usuario`, `dni_nie`, `nombre_apellidos`, `direccion`, `telefono`, `metodo_pago`) VALUES (DEFAULT, '33333333T', 'Carmen Pérez González', 'Plaza Catalunya 3 3º izquierda', '666666666', 'Paypal');
INSERT INTO `mydb`.`usuarios` (`codigo_usuario`, `dni_nie`, `nombre_apellidos`, `direccion`, `telefono`, `metodo_pago`) VALUES (DEFAULT, '44444444M', 'Pedro Torres Castillo', 'Calle de la Ciruela, 6 4ª', '666666667', 'MasterCard');
INSERT INTO `mydb`.`usuarios` (`codigo_usuario`, `dni_nie`, `nombre_apellidos`, `direccion`, `telefono`, `metodo_pago`) VALUES (DEFAULT, '55555555P', 'Claudia Juan Mayans', 'Ronda Piruleta, bajo 3º', '666666668', 'Bizum');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`bicicletas`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`bicicletas` (`id_bicicleta`, `tipo`, `disponible`, `buen_estado`) VALUES (DEFAULT, 1, 1, 1);
INSERT INTO `mydb`.`bicicletas` (`id_bicicleta`, `tipo`, `disponible`, `buen_estado`) VALUES (DEFAULT, 1, 0, 1);
INSERT INTO `mydb`.`bicicletas` (`id_bicicleta`, `tipo`, `disponible`, `buen_estado`) VALUES (DEFAULT, 0, 1, 1);
INSERT INTO `mydb`.`bicicletas` (`id_bicicleta`, `tipo`, `disponible`, `buen_estado`) VALUES (DEFAULT, 0, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`facturación`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`facturación` (`id_factura`, `Suscripcion_activa`, `fecha_alta`, `fecha_vencimiento`, `usuarios_codigo_usuario`) VALUES (DEFAULT, 'activa', 'DEFAULT', 'DEFAULT', 1);
INSERT INTO `mydb`.`facturación` (`id_factura`, `Suscripcion_activa`, `fecha_alta`, `fecha_vencimiento`, `usuarios_codigo_usuario`) VALUES (DEFAULT, 'activa', 'DEFAULT', 'DEFAULT', 2);
INSERT INTO `mydb`.`facturación` (`id_factura`, `Suscripcion_activa`, `fecha_alta`, `fecha_vencimiento`, `usuarios_codigo_usuario`) VALUES (DEFAULT, 'no activa', 'DEFAULT', 'DEFAULT', 4);
INSERT INTO `mydb`.`facturación` (`id_factura`, `Suscripcion_activa`, `fecha_alta`, `fecha_vencimiento`, `usuarios_codigo_usuario`) VALUES (DEFAULT, 'activa', 'DEFAULT', 'DEFAULT', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`alquiler`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`alquiler` (`idalquiler`, `inicio_alquiler`, `fin_alquiler`, `bicicletas_id_bicicleta`, `facturación_id_factura`) VALUES (DEFAULT, 'DEFAULT', 'DEFAULT', 1, 2);
INSERT INTO `mydb`.`alquiler` (`idalquiler`, `inicio_alquiler`, `fin_alquiler`, `bicicletas_id_bicicleta`, `facturación_id_factura`) VALUES (DEFAULT, 'DEFAULT', 'DEFAULT', 2, 3);
INSERT INTO `mydb`.`alquiler` (`idalquiler`, `inicio_alquiler`, `fin_alquiler`, `bicicletas_id_bicicleta`, `facturación_id_factura`) VALUES (DEFAULT, 'DEFAULT', 'DEFAULT', 3, 4);
INSERT INTO `mydb`.`alquiler` (`idalquiler`, `inicio_alquiler`, `fin_alquiler`, `bicicletas_id_bicicleta`, `facturación_id_factura`) VALUES (DEFAULT, 'DEFAULT', 'DEFAULT', 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`estaciones`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`estaciones` (`codigo_estaciones`, `direccion`, `cantidad_bicis_caben`, `tipo_bicis`, `bicicletas_id_bicicleta`) VALUES ('catalunya1', 'plaza catalunya 1', 12, 1, 4);
INSERT INTO `mydb`.`estaciones` (`codigo_estaciones`, `direccion`, `cantidad_bicis_caben`, `tipo_bicis`, `bicicletas_id_bicicleta`) VALUES ('horta1', 'carrer industria 5', 10, 1, 2);
INSERT INTO `mydb`.`estaciones` (`codigo_estaciones`, `direccion`, `cantidad_bicis_caben`, `tipo_bicis`, `bicicletas_id_bicicleta`) VALUES ('clot2', 'avenida meridiano 7', 21, 0, 3);
INSERT INTO `mydb`.`estaciones` (`codigo_estaciones`, `direccion`, `cantidad_bicis_caben`, `tipo_bicis`, `bicicletas_id_bicicleta`) VALUES ('drassanes1', 'rambla catalunya 3', 17, 0, 1);
COMMIT;


SELECT * FROM USUARIOS;
SELECT * FROM bicicletas;
SELECT * FROM alquiler;
SELECT * FROM facturación;



