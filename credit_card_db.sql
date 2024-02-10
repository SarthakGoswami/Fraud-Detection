CREATE TABLE `card_holder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `credit_card` (
  `card` varchar(20) NOT NULL,
  `id_card_holder` int NOT NULL,
  PRIMARY KEY (`card`),
  KEY `fk_credit_card` (`id_card_holder`),
  CONSTRAINT `fk_credit_card` FOREIGN KEY (`id_card_holder`) REFERENCES `card_holder` (`id`),
  CONSTRAINT `check_credit_card_length` CHECK ((char_length(`card`) <= 20))
);

CREATE TABLE `merchant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_merchant_category` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_merchant` (`id_merchant_category`),
  CONSTRAINT `fk_merchant` FOREIGN KEY (`id_merchant_category`) REFERENCES `merchant_category` (`id`)
);

CREATE TABLE `merchant_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `transaction_table` (
  `id` int NOT NULL,
  `date` timestamp NOT NULL,
  `amount` float NOT NULL,
  `card` varchar(20) NOT NULL,
  `id_merchant` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transaction_card` (`card`),
  KEY `fk_transaction_id_merchant` (`id_merchant`),
  CONSTRAINT `fk_transaction_card` FOREIGN KEY (`card`) REFERENCES `credit_card` (`card`),
  CONSTRAINT `fk_transaction_id_merchant` FOREIGN KEY (`id_merchant`) REFERENCES `merchant` (`id`)
);