-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 21 avr. 2024 à 19:47
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

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
-- Structure de la table `annonce`
--

CREATE TABLE `annonce` (
  `Id_annonce` int(11) NOT NULL,
  `contenu` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`Id_annonce`, `contenu`) VALUES
(11, 'Salut les sportifs ! Prêt à partager vos exploits sur Chadsport ?'),
(12, 'Besoin de motivation pour atteindre vos objectifs ? Rejoignez-nous sur Chadsport !'),
(13, 'Coucou les athlètes ! Prêt à défier la communauté sur Chadsport ?'),
(14, 'Hey, cherchez-vous un coup de pouce pour votre prochaine séance ? Chadsport est là pour vous !'),
(15, 'Bonjour les champions ! Prêts à inspirer et être inspirés sur Chadsport ?'),
(16, 'Salut les guerriers du fitness ! Rejoignez-nous sur Chadsport pour des défis motivants !'),
(17, 'Hey, envie de comparer vos performances avec d\'autres passionnés ? Chadsport est fait pour vous !'),
(18, 'Salut les sportifs ! Venez partager vos conseils et encouragements sur Chadsport !'),
(19, 'Coucou ! Prêt à repousser vos limites avec l\'aide de la communauté Chadsport ?'),
(20, 'Bonjour les athlètes ! Ensemble, dépassons nos objectifs sur Chadsport !'),
(21, 'Chaque pas que vous faites en avant sur le terrain de basket compte, peu importe sa taille.'),
(22, 'La seule façon d\'atteindre vos sommets est de vous lancer dans l\'escalade, même si cela peut sembler difficile.'),
(23, 'Le secret du succès en course à pied réside dans la persévérance et la régularité, pas seulement dans la vitesse.'),
(24, 'Dans chaque coup de raquette, il y a une opportunité de grandir et de s\'améliorer sur le court de tennis.'),
(25, 'Votre force intérieure est souvent la seule chose qui vous sépare de votre prochain record personnel.'),
(26, 'Peu importe à quel point les vagues sont hautes, vous avez le pouvoir de les dompter sur votre planche de surf.'),
(27, 'La vraie victoire réside dans le dépassement de soi-même, pas seulement dans le dépassement des autres sur la piste.'),
(28, 'Dans le yoga, chaque posture est une chance de se connecter profondément avec son corps et son esprit.'),
(29, 'La salle de musculation est le laboratoire où vous pouvez sculpter la meilleure version de vous-même.'),
(30, 'Chaque swing de club de golf est une opportunité de perfectionner votre art et de trouver votre zen sur le green.'),
(31, 'Dans la piscine, chaque coup de bras et chaque coup de jambe vous rapprochent un peu plus de vos rêves de nageur.'),
(32, 'Dans le monde du football, la vraie magie réside dans la camaraderie et la passion partagée sur le terrain.'),
(33, 'La randonnée est bien plus qu\'un simple exercice physique - c\'est une aventure qui nourrit l\'âme.'),
(34, 'L\'adrénaline que vous ressentez en descendant une piste enneigée est le carburant qui alimente votre passion pour le ski.'),
(35, 'La danse est une célébration du mouvement et de l\'expression de soi, sans limites ni jugement.'),
(36, 'Peu importe la météo, chaque jour sur le court de tennis est une chance de briller sous le soleil ou sous la pluie.'),
(37, 'Le basketball n\'est pas seulement un sport, c\'est une leçon de travail d\'équipe et de dépassement de soi.'),
(38, 'L\'escalade vous apprend à trouver des solutions créatives aux obstacles, que ce soit sur le mur ou dans la vie.'),
(39, 'Dans la course à pied, chaque kilomètre parcouru est une victoire sur vos doutes et vos limites.'),
(40, 'La méditation sur le yoga mat vous ramène toujours à l\'essentiel : la connexion entre le corps, l\'esprit et l\'âme.'),
(41, 'La musculation vous montre que la véritable force réside dans la résilience et la détermination.'),
(42, 'Sur le court de tennis, chaque échange est une danse rythmée entre la stratégie et l\'instinct.'),
(43, 'Dans les vagues, vous trouvez la liberté et la pureté de l\'instant présent sur votre planche de surf.'),
(44, 'Peu importe le résultat final, chaque compétition vous enseigne des leçons précieuses sur vous-même et sur la vie.'),
(45, 'Dans la piscine, chaque longueur est une occasion de trouver la paix et la clarté dans les eaux profondes.'),
(46, 'Dans le football, la véritable grandeur réside dans la façon dont vous vous relevez après chaque chute sur le terrain.'),
(47, 'La randonnée vous montre que l\'essence de la vie se trouve dans les chemins que vous empruntez, pas seulement dans les destinations.'),
(48, 'Dans la neige fraîche, vous trouvez la pure joie de glisser librement sur vos skis.'),
(49, 'La danse est une symphonie de mouvements fluides et de passion débridée qui transcende les frontières.'),
(50, 'Chaque coup de raquette sur le court de tennis vous rapproche un peu plus de la perfection de votre art.'),
(51, 'Le basketball est bien plus qu\'un simple jeu - c\'est une expression de votre créativité et de votre esprit compétitif.'),
(52, 'L\'escalade vous apprend que la véritable force réside dans la confiance que vous avez en vous-même et dans vos capacités.'),
(53, 'Dans la course à pied, chaque foulée est une affirmation de votre détermination à atteindre vos objectifs.'),
(54, 'Sur le tapis de yoga, vous découvrez une force intérieure et une sérénité qui transcendent les défis du quotidien.'),
(55, 'La salle de musculation est votre sanctuaire personnel où vous vous forgez physiquement et mentalement.'),
(56, 'Chaque swing de club de golf est un instant de grâce et de précision sur le parcours.'),
(57, 'Dans la piscine, chaque brassée vous emmène un peu plus loin vers vos rêves de nageur.'),
(58, 'Dans le monde du football, chaque match est une occasion de créer des souvenirs inoubliables avec votre équipe.'),
(59, 'La randonnée vous enseigne que la véritable aventure commence là où la route prend fin.'),
(60, 'Le ski vous permet de goûter à la magie de l\'hiver tout en repoussant vos limites sur la neige.'),
(61, 'La danse est une expression libre de votre âme qui vous emmène là où les mots ne peuvent pas.'),
(62, 'Sur le court de tennis, chaque échange est une bataille d\'adresse, de stratégie et de détermination.'),
(63, 'Le basketball vous enseigne que la vraie grandeur réside dans la façon dont vous rebondissez après chaque chute.'),
(64, 'L\'escalade est un voyage de découverte de soi qui vous montre que vous êtes capable de plus que vous ne le pensez.'),
(65, 'Dans la course à pied, chaque pas est une victoire sur votre propre résistance et vos doutes intérieurs.'),
(66, 'Le yoga vous rappelle que la force réside dans la douceur et l\'équilibre, à la fois sur le tapis et dans la vie.'),
(67, 'La salle de musculation est le terrain de jeu où vous sculptez votre corps et votre esprit, un répétition après l\'autre.'),
(68, 'Sur le parcours de golf, chaque trou est une chance de défier vos limites et de célébrer vos succès.'),
(69, 'Dans la piscine, chaque coup de pied et chaque coup de bras vous rapprochent de votre meilleure version aquatique.'),
(70, 'Dans le football, chaque but marqué est une explosion de joie et de camaraderie avec votre équipe.'),
(71, 'La randonnée est votre billet pour une aventure au cœur de la nature, où chaque pas est une découverte.');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `Id_Commentaire` int(11) NOT NULL,
  `date_commentaire` datetime DEFAULT NULL,
  `contenu_commentaire` varchar(200) DEFAULT NULL,
  `Id_Post` int(11) NOT NULL,
  `Id_Membre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`Id_Commentaire`, `date_commentaire`, `contenu_commentaire`, `Id_Post`, `Id_Membre`) VALUES
(3, '2024-04-15 17:33:24', 'Idiot', 3, 1),
(4, '2024-04-15 17:33:27', 'Idiot', 3, 1),
(5, '2024-04-15 17:33:52', 'Idiot', 3, 1),
(6, '2024-04-15 17:36:06', 'Idiot', 3, 1),
(7, '2024-04-15 19:08:38', 'Bonjour Johan ????', 2, 1),
(8, '2024-04-15 19:13:08', '🤭🤭🤭🤭🤭🤭🤭🤭🤭🤭🤭', 2, 1),
(9, '2024-04-15 19:13:17', 'ah c bon y a les emojis\r\n', 2, 1),
(10, '2024-04-15 19:15:55', 'hahaha', 3, 1),
(15, '2024-04-17 18:55:47', 'ok', 3, 1),
(16, '2024-04-17 19:10:30', 'coool', 8, 1),
(17, '2024-04-17 19:10:39', 'elle est magnifique', 8, 1),
(18, '2024-04-17 19:10:47', 'z', 8, 1),
(19, '2024-04-17 19:35:11', 'Wow chad, tu est très occupé', 9, 1),
(20, '2024-04-18 15:21:26', 'very busy chado\r\n', 9, 1),
(21, '2024-04-20 16:10:03', '', 8, 1),
(22, '2024-04-21 15:57:03', 'n', 2, 1),
(23, '2024-04-21 15:57:17', 'aa', 2, 1),
(24, '2024-04-21 15:57:28', 'aaa', 10, 1),
(25, '2024-04-21 19:30:52', '', 10, 1),
(26, '2024-04-21 19:30:54', '', 10, 1),
(27, '2024-04-21 19:31:23', '', 10, 1),
(28, '2024-04-21 19:34:28', '', 10, 1),
(29, '2024-04-21 19:34:31', '', 10, 1),
(30, '2024-04-21 19:34:33', '', 9, 1),
(31, '2024-04-21 19:39:23', 'az', 11, 1);

-- --------------------------------------------------------

--
-- Structure de la table `est_abonne`
--

CREATE TABLE `est_abonne` (
  `Id_Membre` int(11) NOT NULL,
  `Id_Membre_1` int(11) NOT NULL,
  `date_ajout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `est_abonne`
--

INSERT INTO `est_abonne` (`Id_Membre`, `Id_Membre_1`, `date_ajout`) VALUES
(1, 1, '2024-04-20'),
(1, 4, '2024-04-21'),
(1, 5, '2024-04-20'),
(5, 4, '2024-04-20');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `Id_Membre` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  `pseudo` varchar(50) DEFAULT NULL,
  `administrateur` tinyint(1) DEFAULT NULL,
  `image_profil` varchar(10) DEFAULT NULL,
  `banniere_profil` varchar(50) DEFAULT NULL,
  `banni` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`Id_Membre`, `email`, `mot_de_passe`, `pseudo`, `administrateur`, `image_profil`, `banniere_profil`, `banni`) VALUES
(1, 'test1@gmail.com', 'motdepasse', 'Johana', NULL, 'jpg', 'b_.jpg', NULL),
(4, 'chado@gmail.com', 'cool', 'Chado', NULL, 'jpeg', NULL, NULL),
(5, 'jojo@gmail.com', 'password', 'Jojo', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `Id_Post` int(11) NOT NULL,
  `contenu` varchar(4000) DEFAULT NULL,
  `image_post` varchar(50) DEFAULT NULL,
  `date_post` datetime DEFAULT NULL,
  `Id_Membre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`Id_Post`, `contenu`, `image_post`, `date_post`, `Id_Membre`) VALUES
(2, 'Salutations, je suis Johan.', 'jpg', '2024-04-15 16:57:10', 1),
(3, 'J&#39;adore poster des posts car la flemme de refaire un compte', 'png', '2024-04-15 17:28:57', 1),
(8, 'WeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWeshWesh la car', 'jpg', '2024-04-17 19:10:22', 1),
(9, 'J&#39;en suis à ma 3141ième répétition et à la moitié.\r\nJ&#39;espère terminer avant l&#39;heure de la réception de ma nouvelle Ferrari.\r\n#busy', 'jpeg', '2024-04-17 19:34:49', 4),
(10, 'bateau', 'jpg', '2024-04-20 16:12:13', 5),
(11, 'azezaeza', 'png', '2024-04-21 19:37:17', 1);

-- --------------------------------------------------------

--
-- Structure de la table `pratique`
--

CREATE TABLE `pratique` (
  `Id_Membre` int(11) NOT NULL,
  `id_sport` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

CREATE TABLE `sport` (
  `id_sport` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `statistique`
--

CREATE TABLE `statistique` (
  `Id_statistique` int(11) NOT NULL,
  `nombre_pas` int(11) DEFAULT NULL,
  `poid` smallint(6) DEFAULT NULL,
  `taille` varchar(50) DEFAULT NULL,
  `distance_parcourue` varchar(50) DEFAULT NULL,
  `Id_Membre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `statistique`
--

INSERT INTO `statistique` (`Id_statistique`, `nombre_pas`, `poid`, `taille`, `distance_parcourue`, `Id_Membre`) VALUES
(1, 2, 500, '3333', NULL, 1),
(2, 100000, 90, '220', NULL, 4),
(3, NULL, NULL, NULL, NULL, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`Id_annonce`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`Id_Commentaire`),
  ADD KEY `Id_Post` (`Id_Post`),
  ADD KEY `Id_Membre` (`Id_Membre`);

--
-- Index pour la table `est_abonne`
--
ALTER TABLE `est_abonne`
  ADD PRIMARY KEY (`Id_Membre`,`Id_Membre_1`),
  ADD KEY `Id_Membre_1` (`Id_Membre_1`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`Id_Membre`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`Id_Post`),
  ADD KEY `Id_Membre` (`Id_Membre`);

--
-- Index pour la table `pratique`
--
ALTER TABLE `pratique`
  ADD PRIMARY KEY (`Id_Membre`,`id_sport`),
  ADD KEY `id_sport` (`id_sport`);

--
-- Index pour la table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id_sport`);

--
-- Index pour la table `statistique`
--
ALTER TABLE `statistique`
  ADD PRIMARY KEY (`Id_statistique`),
  ADD UNIQUE KEY `Id_Membre` (`Id_Membre`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonce`
--
ALTER TABLE `annonce`
  MODIFY `Id_annonce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `Id_Commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `Id_Membre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `Id_Post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `statistique`
--
ALTER TABLE `statistique`
  MODIFY `Id_statistique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`Id_Post`) REFERENCES `post` (`Id_Post`),
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`Id_Membre`) REFERENCES `membre` (`Id_Membre`);

--
-- Contraintes pour la table `est_abonne`
--
ALTER TABLE `est_abonne`
  ADD CONSTRAINT `est_abonne_ibfk_1` FOREIGN KEY (`Id_Membre`) REFERENCES `membre` (`Id_Membre`),
  ADD CONSTRAINT `est_abonne_ibfk_2` FOREIGN KEY (`Id_Membre_1`) REFERENCES `membre` (`Id_Membre`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`Id_Membre`) REFERENCES `membre` (`Id_Membre`);

--
-- Contraintes pour la table `pratique`
--
ALTER TABLE `pratique`
  ADD CONSTRAINT `pratique_ibfk_1` FOREIGN KEY (`Id_Membre`) REFERENCES `membre` (`Id_Membre`),
  ADD CONSTRAINT `pratique_ibfk_2` FOREIGN KEY (`id_sport`) REFERENCES `sport` (`id_sport`);

--
-- Contraintes pour la table `statistique`
--
ALTER TABLE `statistique`
  ADD CONSTRAINT `statistique_ibfk_1` FOREIGN KEY (`Id_Membre`) REFERENCES `membre` (`Id_Membre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
