create database Desafio;
use Desafio;

CREATE TABLE `trade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Valor` int(10) NOT NULL,
  `ClientSector` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `result` (
  `Result` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `desafio`.`trade`
(`id`,
`Valor`,
`ClientSector`)
VALUES
(null,
2000000,
"Private");

INSERT INTO `desafio`.`trade`
(`id`,
`Valor`,
`ClientSector`)
VALUES
(null,
400000,
"Public");

INSERT INTO `desafio`.`trade`
(`id`,
`Valor`,
`ClientSector`)
VALUES
(null
500000,
"Public");

INSERT INTO `desafio`.`trade`
(`id`,
`Valor`,
`ClientSector`)
VALUES
(null,
3000000,
"Public");


DELIMITER $$
CREATE PROCEDURE processarTrades()
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE Valor int default 0; 
declare Client text;
DECLARE Trades CURSOR FOR SELECT Id, ClientSector FROM Trade;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
 
OPEN Trades;
read_loop: LOOP
 IF done THEN
      LEAVE read_loop;
    END IF;
 FETCH Trades INTO Valor, Client;
   IF Client = "Private" THEN
      IF (SELECT Trade.Valor FROM Trade where Id = Valor) > 1000000 THEN
         insert into Result values("HIGHRISK");
      END If;
    ELSE IF Client = "Public" THEN
      IF (SELECT Trade.Valor FROM Trade where Id = Valor) < 1000000 THEN
      insert into Result values("LOWRISK");
      ELSE
      insert into Result values("MEDIUMRISK");
      END If;
    END IF;
    END IF;
 END LOOP;

  CLOSE Trades;

END$$