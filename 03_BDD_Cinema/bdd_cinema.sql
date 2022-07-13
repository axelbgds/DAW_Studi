-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 13 juil. 2022 à 16:49
-- Version du serveur :  8.0.29-0ubuntu0.20.04.3
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd_cinema`
--
CREATE DATABASE IF NOT EXISTS `bdd_cinema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bdd_cinema`;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `pseudo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `admin`:
--

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `pseudo`, `email`, `pass`) VALUES
(1, 'abeaugrand', 'abeaugrand@hqcinema.com', 'bddcinema2022'),
(2, 'lucky', 'luck@gmail.com', 'tatatoto'),
(3, 'pika', 'chu@gmail.com', 'pikapika');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `category`:
--

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Documentary'),
(2, 'Drama'),
(3, 'Drama|War'),
(4, 'Action|Drama|War'),
(5, 'Comedy'),
(6, 'Action|Comedy|Crime'),
(7, 'Western'),
(8, 'Comedy'),
(9, 'Comedy|Musical|Romance'),
(10, 'Comedy|Drama|Romance');

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

CREATE TABLE `cinema` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `adress` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `Zonecinema` varchar(10) NOT NULL,
  `cidadmin` int NOT NULL,
  `cidhq` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `cinema`:
--   `cidadmin`
--       `admin` -> `id`
--   `cidhq`
--       `hq` -> `id`
--

--
-- Déchargement des données de la table `cinema`
--

INSERT INTO `cinema` (`id`, `name`, `adress`, `city`, `Zonecinema`, `cidadmin`, `cidhq`) VALUES
(1, 'Gaumont Perpignan', '4 rue des lilas', 'Perpignan', 'sud', 1, 1),
(2, 'Gaumont Lille', '66 rue de victor hugo', 'Lille', 'nord', 2, 1),
(3, 'Gaumont Bretagne', '69 rue de la pluie', 'Bretagne', 'nord-est', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `cpass` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `customer`:
--

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id`, `name`, `firstname`, `email`, `birthday`, `cpass`) VALUES
(1, 'Toto', 'Fufu', 'fufu@gmail.com', '1991-11-02', '$Toto2022'),
(2, 'Clara', 'Lolo', 'clara@gmail.com', '2000-03-14', 'Qweasdzxc6'),
(3, 'Emilie', 'Tarin', 'emilie@gmai.com', '1998-07-07', 'tarintintin'),
(4, 'Vincent', 'Casto', 'vincent@gmail.com', '1997-07-20', 'vinvincasto'),
(5, 'Mathieu', 'Girou', 'matieu.gir@gmail.com', '1996-04-14', 'mathieugiroudtoto');

-- --------------------------------------------------------

--
-- Structure de la table `hq`
--

CREATE TABLE `hq` (
  `id` int NOT NULL,
  `pseudo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `hqpass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `hq`:
--

--
-- Déchargement des données de la table `hq`
--

INSERT INTO `hq` (`id`, `pseudo`, `email`, `hqpass`) VALUES
(1, 'tbeaugrand', 'tbeaugrand@hqcinema.com', 'bddcinema2021');

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

CREATE TABLE `movie` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `releasedate` date NOT NULL,
  `timemovie` time NOT NULL,
  `midcategory` int NOT NULL,
  `idsession` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `movie`:
--   `midcategory`
--       `category` -> `id`
--

--
-- Déchargement des données de la table `movie`
--

INSERT INTO `movie` (`id`, `name`, `releasedate`, `timemovie`, `midcategory`, `idsession`) VALUES
(1, 'Great Muppet Caper, The', '0000-00-00', '06:12:00', 1, 1),
(2, 'Dreams (Kvinnodröm)', '0000-00-00', '08:56:00', 2, 2),
(3, 'How the Myth Was Made: A Study', '0000-00-00', '07:24:00', 3, 3),
(4, 'Killing Zoe', '0000-00-00', '09:03:00', 4, 4),
(5, 'DarkWolf', '0000-00-00', '07:16:00', 5, 5),
(6, 'The D Train', '0000-00-00', '01:07:00', 6, 6),
(7, 'Dr. Dolittle 2', '0000-00-00', '04:48:00', 7, 7),
(8, 'Beer League', '0000-00-00', '01:39:00', 8, 8),
(9, 'Sex Positive', '0000-00-00', '06:44:00', 9, 9),
(10, 'After You (Après vous...)', '0000-00-00', '05:08:00', 10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `namepayment` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `payment`:
--

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `namepayment`) VALUES
(1, 'Sur place'),
(2, 'En ligne');

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE `room` (
  `seat` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `idcinema` int NOT NULL,
  `idmovie` int NOT NULL,
  `idticket` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `room`:
--   `idmovie`
--       `movie` -> `id`
--   `idcinema`
--       `cinema` -> `id`
--   `idticket`
--       `ticket` -> `id`
--

--
-- Déchargement des données de la table `room`
--

INSERT INTO `room` (`seat`, `name`, `idcinema`, `idmovie`, `idticket`) VALUES
(200, 'Blue', 1, 1, 15),
(350, 'Green', 2, 2, 16),
(150, 'Orange', 3, 3, 17),
(280, 'White', 1, 4, 18),
(350, 'Black', 2, 5, 19);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `idsession` int NOT NULL,
  `10h` tinyint DEFAULT NULL,
  `14h` tinyint DEFAULT NULL,
  `18h` tinyint DEFAULT NULL,
  `20h` tinyint DEFAULT NULL,
  `22h` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `session`:
--   `idsession`
--       `movie` -> `idsession`
--

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`idsession`, `10h`, `14h`, `18h`, `20h`, `22h`) VALUES
(1, 1, 1, 1, 1, NULL),
(2, NULL, 1, 1, 1, NULL),
(3, 1, NULL, NULL, 1, 1),
(4, NULL, NULL, 1, 1, 1),
(5, NULL, NULL, 1, 1, 1),
(6, 1, 1, 1, NULL, NULL),
(7, NULL, NULL, 1, 1, 1),
(8, NULL, NULL, NULL, 1, 1),
(9, NULL, NULL, 1, NULL, 1),
(10, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tarif`
--

CREATE TABLE `tarif` (
  `id` int NOT NULL,
  `price` float NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `tarif`:
--   `id`
--       `ticket` -> `tidtarif`
--

--
-- Déchargement des données de la table `tarif`
--

INSERT INTO `tarif` (`id`, `price`, `name`) VALUES
(1, 9.2, 'Plein tarif'),
(2, 7.6, 'Etudiant'),
(3, 5.9, 'Enfant -14 ans');

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `id` int NOT NULL,
  `Starttime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tidcustomer` int NOT NULL,
  `tidtarif` int NOT NULL,
  `idpayment` int NOT NULL,
  `booking` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELATIONS POUR LA TABLE `ticket`:
--   `tidcustomer`
--       `customer` -> `id`
--   `idpayment`
--       `payment` -> `id`
--

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`id`, `Starttime`, `tidcustomer`, `tidtarif`, `idpayment`, `booking`) VALUES
(15, '2022-07-11 14:50:12', 1, 1, 1, '2022-07-13 08:00:00'),
(16, '2022-07-11 14:50:12', 2, 2, 1, '2022-07-13 12:00:00'),
(17, '2022-07-11 14:50:12', 3, 3, 1, '2022-07-13 18:00:00'),
(18, '2022-07-11 14:50:12', 4, 1, 1, '2022-07-13 16:00:00'),
(19, '2022-07-11 14:50:12', 5, 1, 1, '2022-07-13 20:00:00');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `Vue 1 : Reservation realise`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `Vue 1 : Reservation realise` (
`Nom Cinema` varchar(30)
,`Nom de la salle` varchar(30)
,`Nom du film` varchar(30)
,`Numero de reservation` int
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `Vue 2 : Nbr de film / seance / cinema`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `Vue 2 : Nbr de film / seance / cinema` (
`Nbr de seance a 10h` decimal(25,0)
,`Nbr de seance a 14h` decimal(25,0)
,`Nbr de seance a 18h` decimal(25,0)
,`Nbr de seance a 20h` decimal(25,0)
,`Nom du cinema` varchar(30)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `Vue 3 : Tarif`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `Vue 3 : Tarif` (
`id` int
,`name` varchar(30)
,`price` float
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `Vue 4 : Nbr de place disponnible`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `Vue 4 : Nbr de place disponnible` (
`Nbr de place total` varchar(30)
,`Nbr reservation` bigint
,`Nom de la salle` varchar(30)
,`Place disponnible` bigint
,`Reservation` timestamp
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `Vue 5 : Type de paiement choisi`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `Vue 5 : Type de paiement choisi` (
`Nom et Prenom Client` varchar(60)
,`Type de paiement` varchar(30)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `Vue 6 : Affichage des droits admin`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `Vue 6 : Affichage des droits admin` (
`Droit acces Admin cine` int
,`Droit acces Admin super user` int
,`Identifiant admin pour tous les cinemas` varchar(30)
,`Identifiant admin pour un cinema` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure de la vue `Vue 1 : Reservation realise` exportée comme une table
--
DROP TABLE IF EXISTS `Vue 1 : Reservation realise`;
CREATE TABLE`Vue 1 : Reservation realise`(
    `Nom Cinema` varchar(30) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `Numero de reservation` int NOT NULL DEFAULT '0',
    `Nom de la salle` varchar(30) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `Nom du film` varchar(30) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Structure de la vue `Vue 2 : Nbr de film / seance / cinema` exportée comme une table
--
DROP TABLE IF EXISTS `Vue 2 : Nbr de film / seance / cinema`;
CREATE TABLE`Vue 2 : Nbr de film / seance / cinema`(
    `Nbr de seance a 10h` decimal(25,0) DEFAULT NULL,
    `Nbr de seance a 14h` decimal(25,0) DEFAULT NULL,
    `Nbr de seance a 18h` decimal(25,0) DEFAULT NULL,
    `Nbr de seance a 20h` decimal(25,0) DEFAULT NULL,
    `Nom du cinema` varchar(30) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Structure de la vue `Vue 3 : Tarif` exportée comme une table
--
DROP TABLE IF EXISTS `Vue 3 : Tarif`;
CREATE TABLE`Vue 3 : Tarif`(
    `id` int NOT NULL,
    `price` float NOT NULL,
    `name` varchar(30) COLLATE utf8mb4_0900_ai_ci NOT NULL
);

-- --------------------------------------------------------

--
-- Structure de la vue `Vue 4 : Nbr de place disponnible` exportée comme une table
--
DROP TABLE IF EXISTS `Vue 4 : Nbr de place disponnible`;
CREATE TABLE`Vue 4 : Nbr de place disponnible`(
    `Nom de la salle` varchar(30) COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `Nbr de place total` varchar(30) COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `Reservation` timestamp DEFAULT NULL,
    `Nbr reservation` bigint NOT NULL DEFAULT '0',
    `Place disponnible` bigint NOT NULL DEFAULT '0'
);

-- --------------------------------------------------------

--
-- Structure de la vue `Vue 5 : Type de paiement choisi` exportée comme une table
--
DROP TABLE IF EXISTS `Vue 5 : Type de paiement choisi`;
CREATE TABLE`Vue 5 : Type de paiement choisi`(
    `Nom et Prenom Client` varchar(60) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `Type de paiement` varchar(30) COLLATE utf8mb4_0900_ai_ci NOT NULL
);

-- --------------------------------------------------------

--
-- Structure de la vue `Vue 6 : Affichage des droits admin` exportée comme une table
--
DROP TABLE IF EXISTS `Vue 6 : Affichage des droits admin`;
CREATE TABLE`Vue 6 : Affichage des droits admin`(
    `Identifiant admin pour un cinema` varchar(30) COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `Droit acces Admin cine` int NOT NULL,
    `Identifiant admin pour tous les cinemas` varchar(30) COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `Droit acces Admin super user` int NOT NULL
);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `cidadmin` (`cidadmin`),
  ADD KEY `cidhq_2` (`cidhq`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hq`
--
ALTER TABLE `hq`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `midcategory` (`midcategory`),
  ADD UNIQUE KEY `idsession` (`idsession`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD KEY `id` (`id`);

--
-- Index pour la table `room`
--
ALTER TABLE `room`
  ADD UNIQUE KEY `idmovie` (`idmovie`),
  ADD UNIQUE KEY `idticket` (`idticket`),
  ADD KEY `idcinema_2` (`idcinema`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`idsession`);

--
-- Index pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tidcustomer` (`tidcustomer`),
  ADD KEY `tidtarif` (`tidtarif`),
  ADD KEY `idpayment` (`idpayment`),
  ADD KEY `session` (`booking`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `cinema`
--
ALTER TABLE `cinema`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `hq`
--
ALTER TABLE `hq`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `session`
--
ALTER TABLE `session`
  MODIFY `idsession` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cinema`
--
ALTER TABLE `cinema`
  ADD CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`cidadmin`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cinema_ibfk_2` FOREIGN KEY (`cidhq`) REFERENCES `hq` (`id`);

--
-- Contraintes pour la table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`midcategory`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`idmovie`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `room_ibfk_3` FOREIGN KEY (`idcinema`) REFERENCES `cinema` (`id`),
  ADD CONSTRAINT `room_ibfk_4` FOREIGN KEY (`idticket`) REFERENCES `ticket` (`id`);

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`idsession`) REFERENCES `movie` (`idsession`);

--
-- Contraintes pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD CONSTRAINT `tarif_ibfk_1` FOREIGN KEY (`id`) REFERENCES `ticket` (`tidtarif`);

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`tidcustomer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`idpayment`) REFERENCES `payment` (`id`);


--
-- Métadonnées
--
USE `phpmyadmin`;

--
-- Métadonnées pour la table admin
--

--
-- Métadonnées pour la table category
--

--
-- Métadonnées pour la table cinema
--

--
-- Métadonnées pour la table customer
--

--
-- Métadonnées pour la table hq
--

--
-- Métadonnées pour la table movie
--

--
-- Métadonnées pour la table payment
--

--
-- Métadonnées pour la table room
--

--
-- Métadonnées pour la table session
--

--
-- Métadonnées pour la table tarif
--

--
-- Métadonnées pour la table ticket
--

--
-- Métadonnées pour la table Vue 1 : Reservation realise
--

--
-- Métadonnées pour la table Vue 2 : Nbr de film / seance / cinema
--

--
-- Métadonnées pour la table Vue 3 : Tarif
--

--
-- Métadonnées pour la table Vue 4 : Nbr de place disponnible
--

--
-- Métadonnées pour la table Vue 5 : Type de paiement choisi
--

--
-- Métadonnées pour la table Vue 6 : Affichage des droits admin
--

--
-- Métadonnées pour la base de données bdd_cinema
--

--
-- Déchargement des données de la table `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_descr`) VALUES
('bdd_cinema', 'Modele1');

SET @LAST_PAGE = LAST_INSERT_ID();

--
-- Déchargement des données de la table `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('bdd_cinema', 'admin', @LAST_PAGE, 85, 32),
('bdd_cinema', 'category', @LAST_PAGE, 895, 115),
('bdd_cinema', 'cinema', @LAST_PAGE, 276, 48),
('bdd_cinema', 'customer', @LAST_PAGE, 283, 273),
('bdd_cinema', 'hq', @LAST_PAGE, 96, 143),
('bdd_cinema', 'movie', @LAST_PAGE, 695, 104),
('bdd_cinema', 'payment', @LAST_PAGE, 670, 354),
('bdd_cinema', 'room', @LAST_PAGE, 489, 110),
('bdd_cinema', 'session', @LAST_PAGE, 894, 191),
('bdd_cinema', 'tarif', @LAST_PAGE, 671, 266),
('bdd_cinema', 'ticket', @LAST_PAGE, 489, 268);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- Utilisation d'un utilitaire de sauvegarde de la base de données 
mysqldump -u root -p root -h localhost:3306 > bdd_cinema.sql

--Utilisation d'un utilitaire de restauration de la base de données (je ne recrée pas la base de données, car le serveur la comportait déjà)
mysql -h localhost:3306 -u root -p root bdd_cinema < bdd_cinema.sql
