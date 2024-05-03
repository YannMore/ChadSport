-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 01 mai 2024 à 19:11
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chadsport`
--

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--



--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`id_sport`, `nom`) VALUES
('0', 'Football'),
('1', 'Basketball'),
('10', 'Hockey sur glace'),
('100', 'Iaïdo'),
('101', 'Joute nautique'),
('102', 'Pelote basque'),
('103', 'Tchoukball'),
('104', 'Boomerang'),
('105', 'Saut à l\'élastique'),
('106', 'Aviron'),
('107', 'Hockey sur gazon'),
('108', 'Hockey sur glace'),
('109', 'Hockey subaquatique'),
('11', 'Volleyball'),
('110', 'Hockey en salle'),
('111', 'Hockey en ligne'),
('112', 'Crosse'),
('113', 'Crosse canadienne'),
('114', 'Crosse irlandaise'),
('115', 'Crosse au pied'),
('116', 'Crosse sur gazon'),
('117', 'Crossfit'),
('118', 'Randonnée pédestre'),
('119', 'Marche nordique'),
('12', 'Handball'),
('120', 'Course à pied'),
('121', 'Course en montagne'),
('122', 'Course en sentier'),
('123', 'Course sur route'),
('124', 'Course sur piste'),
('125', 'Course d\'obstacles'),
('126', 'Course à obstacles'),
('127', 'Course de fond'),
('128', 'Course de demi-fond'),
('129', 'Course de sprint'),
('13', 'Badminton'),
('130', 'Course de haies'),
('131', 'Course de relais'),
('132', 'Course de demi-fond'),
('133', 'Course de fond'),
('134', 'Course de marathon'),
('135', 'Course de demi-fond'),
('136', 'Course de fond'),
('137', 'Course de relais'),
('138', 'Course de steeple'),
('139', 'Course de demi-fond'),
('14', 'Escalade'),
('140', 'Course de fond'),
('141', 'Course de relais'),
('142', 'Course de steeple'),
('143', 'Course de demi-fond'),
('144', 'Course de fond'),
('145', 'Course de relais'),
('146', 'Course de steeple'),
('147', 'Course de demi-fond'),
('148', 'Course de fond'),
('149', 'Course de relais'),
('15', 'Escrime'),
('150', 'Course de steeple'),
('151', 'Slackline'),
('152', 'Trampoline'),
('153', 'Course de sacs'),
('154', 'Lancer de bottes en caoutchouc'),
('155', 'Course de garçons de café'),
('156', 'Marche en talons hauts'),
('157', 'Course de pancake'),
('158', 'Course de chariots de supermarché'),
('159', 'Course de pneus'),
('16', 'Gymnastique'),
('160', 'Toboggan géant'),
('161', 'Combat de sumos'),
('162', 'Lancer de troncs'),
('163', 'Lancer de disquettes'),
('164', 'Lancer de boîtes de conserve'),
('165', 'Lancer de charentaises'),
('166', 'Course de chameaux'),
('167', 'Course de trottinettes'),
('168', 'Course de drones'),
('169', 'Course de luges'),
('17', 'Judo'),
('170', 'Course de tondeuses à gazon'),
('171', 'Course de segways'),
('172', 'Course de poussettes'),
('173', 'Course de tracteurs tondeuses'),
('174', 'Course de voitures à pédales'),
('175', 'Course de balais'),
('176', 'Course de sacs de sable'),
('177', 'Course de bulles géantes'),
('178', 'Course de tartes à la crème'),
('179', 'Course de transats'),
('18', 'Karaté'),
('180', 'Course de paddleboards'),
('181', 'Course de kayaks'),
('182', 'Course de radeaux'),
('183', 'Course de bouées'),
('184', 'Course de baignoires'),
('185', 'Course de radeaux de fortune'),
('186', 'Course de barques'),
('187', 'Course de paddleboards à voile'),
('188', 'Course de kitesurfs'),
('189', 'Course de windsurfs'),
('19', 'Lutte'),
('190', 'Course de planches à voile'),
('191', 'Course de catamarans'),
('192', 'Course de yachts'),
('193', 'Course de voiliers'),
('194', 'Course de dériveurs'),
('195', 'Course de Optimists'),
('196', 'Course de Laser'),
('197', 'Course de Snipes'),
('198', 'Course de J/70'),
('199', 'Course de Star'),
('2', 'Tennis'),
('20', 'Ski'),
('200', 'Course de Finn'),
('201', 'Escalade en salle'),
('202', 'Bouldering'),
('203', 'Escalade de glace'),
('204', 'Alpinisme'),
('205', 'Via ferrata'),
('206', 'Parkour'),
('207', 'Free running'),
('208', 'Gymnastique artistique'),
('209', 'Gymnastique rythmique'),
('21', 'Snowboard'),
('210', 'Trampoline'),
('211', 'Aérobic'),
('212', 'Danse sportive'),
('213', 'Salsa'),
('214', 'Tango'),
('215', 'Swing'),
('216', 'Bachata'),
('217', 'Merengue'),
('218', 'Kizomba'),
('219', 'Hip-hop'),
('22', 'Surf'),
('220', 'Breakdance'),
('221', 'Street dance'),
('222', 'Danse contemporaine'),
('223', 'Ballet'),
('224', 'Pole dance'),
('225', 'Acrosport'),
('226', 'Cheerleading'),
('227', 'Escrime'),
('228', 'Judo'),
('229', 'Taekwondo'),
('23', 'Voile'),
('230', 'Karate'),
('231', 'Kendo'),
('232', 'Aikido'),
('233', 'Boxe'),
('234', 'Kickboxing'),
('235', 'Muay Thai'),
('236', 'Capoeira'),
('237', 'Lutte'),
('238', 'Catch'),
('239', 'Sumo'),
('24', 'Planche à voile'),
('240', 'Yoga'),
('241', 'Pilates'),
('242', 'Tai chi'),
('243', 'Qi gong'),
('244', 'Méditation'),
('245', 'Stretching'),
('246', 'Zumba'),
('247', 'Aqua Zumba'),
('248', 'Salsa fitness'),
('249', 'Cycling'),
('25', 'Patinage artistique'),
('250', 'Spinning'),
('251', 'Natation synchronisée'),
('252', 'Plongeon'),
('253', 'Water-polo'),
('254', 'Surf'),
('255', 'Bodyboard'),
('256', 'Stand up paddle'),
('257', 'Kitesurf'),
('258', 'Windsurf'),
('259', 'Voile'),
('26', 'Patinage de vitesse'),
('260', 'Canoe-kayak'),
('261', 'Rafting'),
('262', 'Canyoning'),
('263', 'Nage en eau vive'),
('264', 'Pêche sportive'),
('265', 'Chasse sous-marine'),
('266', 'Apnée'),
('267', 'Ski nautique'),
('268', 'Wakeboard'),
('269', 'Kneeboard'),
('27', 'Patinage de vitesse sur piste courte'),
('270', 'Barefoot'),
('271', 'Parapente'),
('272', 'Parachutisme'),
('273', 'Base jump'),
('274', 'Saut à l\'élastique'),
('275', 'Escalade'),
('276', 'Randonnée'),
('277', 'Alpinisme'),
('278', 'Spéléologie'),
('279', 'Canyoning'),
('28', 'Biathlon'),
('280', 'VTT'),
('281', 'BMX'),
('282', 'Trial'),
('283', 'Cyclo-cross'),
('284', 'Route'),
('285', 'Piste'),
('286', 'Marathon VTT'),
('287', 'Enduro VTT'),
('288', 'Downhill'),
('289', 'Dirt jump'),
('29', 'Saut à ski'),
('290', 'Slackline'),
('291', 'Acrosport'),
('292', 'Gymnastique acrobatique'),
('293', 'Tricking'),
('294', 'Parkour'),
('295', 'Freerunning'),
('296', 'Yoga aérien'),
('297', 'Pilates aérien'),
('298', 'Danse aérienne'),
('299', 'Cirque aérien'),
('3', 'Golf'),
('30', 'Saut à la perche'),
('300', 'Aerobie'),
('31', 'Saut en hauteur'),
('32', 'Saut en longueur'),
('33', 'Triple saut'),
('34', 'Lancer du poids'),
('35', 'Lancer du javelot'),
('36', 'Lancer du disque'),
('37', 'Lancer du marteau'),
('38', 'Pentathlon'),
('39', 'Décathlon'),
('4', 'Baseball'),
('40', 'Marche athlétique'),
('41', 'Course d\'orientation'),
('42', 'Canoë-kayak'),
('43', 'Rafting'),
('44', 'Stand up paddle'),
('45', 'Plongée sous-marine'),
('46', 'Pêche sportive'),
('47', 'Billard'),
('48', 'Bowling'),
('49', 'Escalade de bloc'),
('5', 'Athlétisme'),
('50', 'Tir à l\'arc'),
('51', 'Course automobile'),
('52', 'MotoGP'),
('53', 'Rallye'),
('54', 'Formule 1'),
('55', 'Rugby à sept'),
('56', 'Rugby à XIII'),
('57', 'Rugby à XV'),
('58', 'Softball'),
('59', 'Water-polo'),
('6', 'Natation'),
('60', 'Polo'),
('61', 'Cricket'),
('62', 'Squash'),
('63', 'Padel'),
('64', 'Baseball sur gazon'),
('65', 'Pétanque'),
('66', 'Tir sportif'),
('67', 'Tir à la carabine'),
('68', 'Tir au pistolet'),
('69', 'Tir à la cible'),
('7', 'Cyclisme'),
('70', 'Tir à l\'arc'),
('71', 'Tir à l\'arbalète'),
('72', 'Tir à la sarbacane'),
('73', 'Ski alpin'),
('74', 'Ski de fond'),
('75', 'Ski acrobatique'),
('76', 'Ski de randonnée'),
('77', 'Ski nautique'),
('78', 'Ski de vitesse'),
('79', 'Ski freestyle'),
('8', 'Boxe'),
('80', 'Ski de bosses'),
('81', 'Ski de saut'),
('82', 'Ski de fond'),
('83', 'Ski alpinisme'),
('84', 'Haltérophilie'),
('85', 'Crossfit'),
('86', 'Powerlifting'),
('87', 'Muscle beach'),
('88', 'Yoga'),
('89', 'Tai chi'),
('9', 'Rugby'),
('90', 'Qi Gong'),
('91', 'Aïkido'),
('92', 'Capoeira'),
('93', 'Krav maga'),
('94', 'Self-défense'),
('95', 'Jiu-jitsu'),
('96', 'Sambo'),
('97', 'Wushu'),
('98', 'Kung-fu'),
('99', 'Kenjutsu');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id_sport`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
