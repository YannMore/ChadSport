-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 03 mai 2024 à 16:10
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
(37, '2024-05-03 15:44:21', 'stay sharp', 13, 2),
(38, '2024-05-03 15:48:28', 'lol lol lol', 14, 1),
(39, '2024-05-03 15:50:52', 'mdr ton humour me transcende ', 14, 3),
(40, '2024-05-03 15:53:08', 'attention aux voitures !!!!', 13, 4),
(41, '2024-05-03 15:55:03', 'haha, j&#039;adore rire !', 14, 5),
(42, '2024-05-03 15:56:45', 'trop mignons, des bises', 16, 6),
(43, '2024-05-03 15:58:11', 'motivation vibe', 13, 7),
(44, '2024-05-03 15:59:45', 'je n&#039;aime pas les gens', 17, 8),
(45, '2024-05-03 16:01:15', 'hihihi', 17, 9),
(46, '2024-05-03 16:02:14', 'slay queen', 21, 10),
(47, '2024-05-03 16:03:27', 'pas vraiment lol', 22, 11),
(48, '2024-05-03 16:05:15', 'first', 20, 12),
(49, '2024-05-03 16:07:44', 'très drôle', 17, 14),
(50, '2024-05-03 16:08:00', 'jolie photo', 25, 14);

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
(1, 2, '2024-05-03'),
(2, 1, '2024-05-03'),
(3, 2, '2024-05-03'),
(4, 1, '2024-05-03'),
(5, 2, '2024-05-03'),
(6, 4, '2024-05-03'),
(7, 1, '2024-05-03'),
(8, 5, '2024-05-03'),
(9, 5, '2024-05-03'),
(10, 9, '2024-05-03'),
(11, 10, '2024-05-03'),
(12, 8, '2024-05-03'),
(14, 5, '2024-05-03'),
(14, 13, '2024-05-03');

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
(1, 'arnold.arnoldo@gmail.com', 'Bonjour123', 'GrosBicepsGuy', 0, 'jpg', 'b_.jpg', 0),
(2, 'sprinter.suzie@gmail.com', 'Soleil456', 'SpeedySuzie', 0, 'jpeg', 'b_.jpg', 0),
(3, 'cardio.charles@gmail.com', 'Chaton789', 'CardioChuck', 0, '.jpg', 'b_.jpg', 0),
(4, 'fit.francois@gmail.com', 'Pomme1234', 'FitFranFran', 0, '.jpg', 'b_.jpg', 0),
(5, 'sweaty.sam@gmail.com', 'Sourire567', 'SweatySam', 0, '.jpg', 'b_.jpg', 0),
(6, 'gym.gaston@gmail.com', 'gymcbim', 'GymGaston', 0, '.jpg', 'b_.jpg', 0),
(7, 'soccer.simone@gmail.com', 'Amour12345', 'SoccerSimone', 0, 'jpg', 'b_.jpg', 0),
(8, 'lifting.leo@gmail.com', 'Bonheur6789', 'LiftingLeo', 0, '.jpg', 'b_.jpg', 0),
(9, 'runner.rachel@gmail.com', 'Arcenciel123', 'RunnerRachel', 0, '.jpg', 'b_.jpg', 0),
(10, 'mountain.man@gmail.com', 'Bisou45678', 'MountainMan', 0, '.jpg', 'b_.jpg', 0),
(11, 'helene.heavyweight@gmail.com', 'Chocolat901', 'HeavyweightHel', 0, '.jpg', 'b_.jpg', 0),
(12, 'speedy.seb@gmail.com', 'Câlin23456', 'SpeedySeb', 0, '.jpg', 'b_.jpg', 0),
(13, 'fab.flex@gmail.com', 'Danse78901', 'FlexFab', 0, '.jpg', 'b_.jpg', 0),
(14, 'dunker.dave@gmail.com', 'Douceur234', 'DunkerDave', 0, '.jpg', 'b_.jpg', 0),
(15, 'muscle.marcel@gmail.com', 'Étoile56789', 'MuscleMarcel', 0, '.jpg', 'b_.jpg', 0),
(16, 'power.laura@gmail.com', 'Été123456', 'PowerLaura', 0, '.jpg', 'b_.jpg', 0),
(17, 'theo.thrillseeker@gmail.com', 'Flamme7890', 'ThrillTheo', 0, '.jpg', 'b_.jpg', 0),
(18, 'runner.rosie@gmail.com', 'Glace12345', 'RunnerRosie', 0, '.jpg', 'b_.jpg', 0),
(19, 'gymnast.gilbert@gmail.com', 'Harmonie678', 'GymnastGilbert', 0, '.jpg', 'b_.jpg', 0),
(20, 'jumpin.jojo@gmail.com', 'Hiver90123', 'JumpinJojo', 0, '.jpg', 'b_.jpg', 0),
(21, 'bigboss69@gmail.com', 'Jardin45678', 'BigBoss420', 0, '.jpg', 'b_.jpg', 0),
(22, 'gamer_girl93@gmail.com', 'Joie901234', 'EpicGamerGirl', 0, '.jpg', 'b_.jpg', 0),
(23, 'meme_master97@gmail.com', 'Lune56789', 'DankMemeLord', 0, '.jpg', 'b_.jpg', 0),
(24, 'beardbro123@gmail.com', 'Mer123456', 'BeardMaster', 0, '.jpg', 'b_.jpg', 0),
(25, 'DJelise94@gmail.com', 'Musique7890', 'DubstepQueen', 0, '.jpg', 'b_.jpg', 0),
(26, 'cloud_chaser@gmail.com', 'Nuage12345', 'CloudChaser420', 0, '.jpg', 'b_.jpg', 0),
(27, 'lolz_lucette@gmail.com', 'Oiseau6789', 'LOLzLucette', 0, '.jpg', 'b_.jpg', 0),
(28, 'paradise_pete@gmail.com', 'Paradis0123', 'PartyPete', 0, '.jpg', 'b_.jpg', 0),
(29, 'storm_simone@gmail.com', 'Pluie45678', 'StormySimone', 0, '.jpg', 'b_.jpg', 0),
(30, 'poet_armand@gmail.com', 'Poésie90123', 'PoeticArmand', 0, '.jpg', 'b_.jpg', 0),
(31, 'prankster_blanche@gmail.com', 'Printemps456', 'PranksterBlanche', 0, '.jpg', 'b_.jpg', 0),
(32, 'dreamer_clem@gmail.com', 'Rêve789012', 'DreamerClem', 0, '.jpg', 'b_.jpg', 0),
(33, 'jokester_dimitri@gmail.com', 'Sourire3456', 'JokesterDimitri', 0, '.jpg', 'b_.jpg', 0),
(34, 'beach_babe@gmail.com', 'Vacances789', 'BeachBabeEmma', 0, '.jpg', 'b_.jpg', 0),
(35, 'windy_felix@gmail.com', 'Vent012345', 'WindyFelix', 0, '.jpg', 'b_.jpg', 0),
(36, 'car_george@gmail.com', 'Voiture6789', 'CarEnthusiast', 0, '.jpg', 'b_.jpg', 0),
(37, 'merry_hector@gmail.com', 'Noël12345', 'MerryHector', 0, '.jpg', 'b_.jpg', 0),
(38, 'flower_power@gmail.com', 'Fleur67890', 'FlowerPowerIris', 0, '.jpg', 'b_.jpg', 0),
(39, 'candy_crush@gmail.com', 'Bonbon1234', 'CandyCrushJustine', 0, '.jpg', 'b_.jpg', 0),
(40, 'party_animal@gmail.com', 'Ami567890', 'PartyAnimalLeo', 0, '.jpg', 'b_.jpg', 0),
(41, 'meme_queen@gmail.com', 'Souris1234', 'MemeQueenMarjorie', 0, '.jpg', 'b_.jpg', 0),
(42, 'gérard.gerontophile@laposte.net', 'motdepasse', 'Gérard', 0, '.jpg', 'b_.jpg', 0),
(43, 'gicelaine.grandmère@laposte.net', 'meconnecter', 'Gicelaine', 0, '.jpg', 'b_.jpg', 0),
(44, 'pierre.papy@laposte.net', '12345678', 'Pierre', 0, '.jpg', 'b_.jpg', 0),
(45, 'simone.sénile@laposte.net', 'sénile', 'Simone', 0, '.jpg', 'b_.jpg', 0),
(46, 'maurice.mamy@laposte.net', 'mamymaurice', 'Maurice', 0, '.jpg', 'b_.jpg', 0),
(47, 'marcel.mémé@laposte.net', '0', 'Marcel', 0, '.jpg', 'b_.jpg', 0),
(48, 'yolande.yoyo@laposte.net', 'coucou', 'Yolande', 0, '.jpg', 'b_.jpg', 0),
(49, 'géraldine.grandtante@laposte.net', 'géraldine', 'Géraldine', 0, '.jpg', 'b_.jpg', 0),
(50, 'édouard.eldorado@laposte.net', 'eldorado', 'Édouard', 0, '.jpg', 'b_.jpg', 0),
(51, 'berthe.babillage@laposte.net', 'bonjour', 'Berthe', 0, '.jpg', 'b_.jpg', 0),
(52, 'armand.ancêtre@laposte.net', 'armand', 'Armand', 0, '.jpg', 'b_.jpg', 0),
(53, 'élisabeth.étourdissante@laposte.net', 'élisabeth', 'Élisabeth', 0, '.jpg', 'b_.jpg', 0),
(54, 'robert.ronchon@laposte.net', '1111', 'Robert', 0, '.jpg', 'b_.jpg', 0),
(55, 'lucienne.lente@laposte.net', 'lucienne', 'Lucienne', 0, '.jpg', 'b_.jpg', 0),
(56, 'gertrude.grincheuse@laposte.net', 'gertrude', 'Gertrude', 0, '.jpg', 'b_.jpg', 0),
(57, 'simon.sénior@laposte.net', 'simon', 'Simon', 0, '.jpg', 'b_.jpg', 0),
(58, 'joséphine.joyeuse@laposte.net', 'joséphine', 'Joséphine', 0, '.jpg', 'b_.jpg', 0),
(59, 'albert.âgé@laposte.net', 'albert', 'Albert', 0, '.jpg', 'b_.jpg', 0),
(60, 'claudette.cochonne@laposte.net', 'claudette', 'Claudette', 0, '.jpg', 'b_.jpg', 0),
(61, 'yvette.yoyotte@laposte.net', 'yvette', 'Yvette', 0, '.jpg', 'b_.jpg', 0),
(62, 'adèle.agée@laposte.net', 'adèle', 'Adèle', 0, '.jpg', 'b_.jpg', 0),
(63, 'gabe_newell@protonmail.com', 'H@lfL!f3$*c!ou$', 'GabeNewell', 0, '.jpg', 'b_.jpg', 0),
(64, 'edward_snowden@protonmail.com', '@n0th3rSecr3t#', 'EdwardSnowden', 0, '.jpg', 'b_.jpg', 0),
(65, 'linus_torvalds@protonmail.com', 'L!nusR0ck$#', 'LinusTorvalds', 0, '.jpg', 'b_.jpg', 0),
(66, 'kevin_mitnick@protonmail.com', 'K3v!nK@rn@g3#', 'KevinMitnick', 0, '.jpg', 'b_.jpg', 0),
(67, 'ada_lovelace@protonmail.com', '@d@L0v3l@c3#', 'AdaLovelace', 0, '.jpg', 'b_.jpg', 0),
(68, 'richard_stallman@protonmail.com', 'Fr33$0ftw@r3#', 'RichardStallman', 0, '.jpg', 'b_.jpg', 0),
(69, 'steve_jobs@protonmail.com', '4ppL3!Ph0n3#', 'SteveJobs', 0, '.jpg', 'b_.jpg', 0),
(70, 'elon_musk@protonmail.com', 'Sp@c3X2024#', 'ElonMusk', 0, '.jpg', 'b_.jpg', 0),
(71, 'adafruit_lady@protonmail.com', '@d@fru!tL@d3#', 'AdafruitLady', 0, '.jpg', 'b_.jpg', 0),
(72, 'tim_berners_lee@protonmail.com', 'W3bW0rldW!d3#', 'TimBernersLee', 0, '.jpg', 'b_.jpg', 0),
(73, 'larry_page@protonmail.com', 'G00gl3B0$#', 'LarryPage', 0, '.jpg', 'b_.jpg', 0),
(74, 'sergey_brin@protonmail.com', 'Br!nBr!n#', 'SergeyBrin', 0, '.jpg', 'b_.jpg', 0),
(75, 'adafruit_lady@protonmail.com', '@d@fru!tL@d3#', 'AdafruitLady', 0, '.jpg', 'b_.jpg', 0),
(76, 'john_carmack@protonmail.com', 'Qu@k3!4#@3n$!n', 'JohnCarmack', 0, '.jpg', 'b_.jpg', 0),
(77, 'steve_wozniak@protonmail.com', 'W0zW0zW0z#', 'SteveWozniak', 0, '.jpg', 'b_.jpg', 0),
(78, 'vitalik_buterin@protonmail.com', '3th3r3umR0ck$#', 'VitalikButerin', 0, '.jpg', 'b_.jpg', 0),
(79, 'sheryl_sandberg@protonmail.com', 'F@c3b00k!t#', 'SherylSandberg', 0, '.jpg', 'b_.jpg', 0),
(80, 'grace_hopper@protonmail.com', 'Gr@c3H0pp3r#', 'GraceHopper', 0, '.jpg', 'b_.jpg', 0),
(81, 'baudelaire.charles@gmail.com', 'Ami567890', 'Baudelaire', 0, '.jpg', 'b_.jpg', 0),
(82, 'verlaine.paul@gmail.com', 'Sourire123', 'Verlaine', 0, '.jpg', 'b_.jpg', 0),
(83, 'victor.hugo@gmail.com', 'Plaisir456', 'VictorHugo', 0, '.jpg', 'b_.jpg', 0),
(84, 'colette.sidonie@gmail.com', 'Bonjour789', 'Colette', 0, '.jpg', 'b_.jpg', 0),
(85, 'dostoevsky.fyodor@gmail.com', 'Heureux1234', 'Dostoevsky', 0, '.jpg', 'b_.jpg', 0),
(86, 'neruda.pablo@gmail.com', 'Ami567890', 'Neruda', 0, '.jpg', 'b_.jpg', 0),
(87, 'shakespeare.william@gmail.com', 'Sourire123', 'Shakespeare', 0, '.jpg', 'b_.jpg', 0),
(88, 'balzac.honore@gmail.com', 'Plaisir456', 'Balzac', 0, '.jpg', 'b_.jpg', 0),
(89, 'emily.dickinson@gmail.com', 'Bonjour789', 'Dickinson', 0, '.jpg', 'b_.jpg', 0),
(90, 'rimbaud.arthur@gmail.com', 'Heureux1234', 'Rimbaud', 0, '.jpg', 'b_.jpg', 0),
(91, 'baudelaire.charles@gmail.com', 'Ami567890', 'Baudelaire', 0, '.jpg', 'b_.jpg', 0),
(92, 'woolf.virginia@gmail.com', 'Sourire123', 'Woolf', 0, '.jpg', 'b_.jpg', 0),
(93, 'dostoevsky.fyodor@gmail.com', 'Plaisir456', 'Dostoevsky', 0, '.jpg', 'b_.jpg', 0),
(94, 'dickinson.emily@gmail.com', 'Bonjour789', 'Dickinson', 0, '.jpg', 'b_.jpg', 0),
(95, 'poe.edgar@gmail.com', 'Heureux1234', 'Poe', 0, '.jpg', 'b_.jpg', 0),
(96, 'dickinson.emily@gmail.com', 'Ami567890', 'Dickinson', 0, '.jpg', 'b_.jpg', 0),
(97, 'shakespeare.william@gmail.com', 'Sourire123', 'Shakespeare', 0, '.jpg', 'b_.jpg', 0),
(98, 'dostoevsky.fyodor@gmail.com', 'Plaisir456', 'Dostoevsky', 0, '.jpg', 'b_.jpg', 0),
(99, 'colette.sidonie@gmail.com', 'Bonjour789', 'Colette', 0, '.jpg', 'b_.jpg', 0),
(100, 'austen.jane@gmail.com', 'Heureux1234', 'Austen', 0, '.jpg', 'b_.jpg', 0);

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
(13, 'Quand même les muscles ont besoin d&#39;un coup de pouce pour les lacets ! 💪👟 #ToutEstQuestionDePrécision', 'png', '2024-05-03 15:40:56', 1),
(14, 'Quand tu prends le sport très au sérieux... mais que le sport te prend encore plus au sérieux !', 'png', '2024-05-03 15:45:34', 2),
(15, 'Entraînement Paris 2024 #MarathonPourTous', 'png', '2024-05-03 15:50:22', 3),
(16, 'Le sport nous a permis de nous rencontrer', 'png', '2024-05-03 15:52:22', 4),
(17, 'Quand on me dit que le sport ça rend aimable', 'png', '2024-05-03 15:54:38', 5),
(18, 'J’ai fait plus de tour de France à vélo que de tour de cuisine à pied', 'png', '2024-05-03 15:56:27', 6),
(19, 'Je vais prouver à la terre entière que chaque rêve est atteignable', 'png', '2024-05-03 15:57:56', 7),
(20, 'Mes pensées lorsque je regarde des abrutis courir sans aucun intérêt', 'png', '2024-05-03 15:59:26', 8),
(21, 'Nouvelle coupe de cheveux vous en pensez quoi ?', 'png', '2024-05-03 16:00:54', 9),
(22, 'Le sport m’a rendu éternelle', 'png', '2024-05-03 16:02:03', 10),
(23, 'J’ai réalisé plus de choses dans ma vie grâce à mon handicap que sans ', 'png', '2024-05-03 16:03:14', 11),
(24, 'Prêt pour faire un groupe de musique', 'png', '2024-05-03 16:04:51', 12),
(25, 'Quelle grâce dans mes mouvements ', 'png', '2024-05-03 16:06:06', 13),
(26, 'Les gars, le bar est ouvert', 'png', '2024-05-03 16:07:25', 14),
(27, 'Seul on va plus vite, à deux on va plus loin', 'png', '2024-05-03 16:08:41', 15);

-- --------------------------------------------------------

--
-- Structure de la table `pratique`
--

CREATE TABLE `pratique` (
  `Id_Membre` int(11) NOT NULL,
  `id_sport` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pratique`
--

INSERT INTO `pratique` (`Id_Membre`, `id_sport`) VALUES
(1, '1'),
(1, '155'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '102'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, '11'),
(12, '12'),
(13, '13'),
(14, '14'),
(15, '15'),
(16, '16'),
(17, '17'),
(18, '18'),
(19, '19'),
(20, '20'),
(21, '21'),
(22, '22'),
(23, '23'),
(24, '24'),
(25, '25'),
(26, '26'),
(27, '27'),
(28, '28'),
(29, '29'),
(30, '30'),
(31, '31'),
(32, '32'),
(33, '33'),
(34, '34'),
(35, '35'),
(36, '36'),
(37, '37'),
(38, '38'),
(39, '39'),
(40, '40'),
(41, '41'),
(42, '42'),
(43, '43'),
(44, '44'),
(45, '45'),
(46, '46'),
(47, '47'),
(48, '48'),
(49, '49'),
(50, '50'),
(51, '51'),
(52, '52'),
(53, '53'),
(54, '54'),
(55, '55'),
(56, '56'),
(57, '57'),
(58, '58'),
(59, '59'),
(60, '60'),
(61, '61'),
(62, '62'),
(63, '63'),
(64, '64'),
(65, '65'),
(66, '66'),
(67, '67'),
(68, '68'),
(69, '69'),
(70, '70'),
(71, '71'),
(72, '72'),
(73, '73'),
(74, '74'),
(75, '75'),
(76, '76'),
(77, '77'),
(78, '78'),
(79, '79'),
(80, '80'),
(81, '81'),
(82, '82'),
(83, '83'),
(84, '84'),
(85, '85'),
(86, '86'),
(87, '87'),
(88, '88'),
(89, '89'),
(90, '90'),
(91, '91'),
(92, '92'),
(93, '93'),
(94, '94'),
(95, '95'),
(96, '96'),
(97, '97'),
(98, '98'),
(99, '99'),
(100, '100');

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

CREATE TABLE `sport` (
  `id_sport` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 1250, 75, '175', '2500', 1),
(2, 1350, 68, '170', '2700', 2),
(3, 1450, 70, '172', '2800', 3),
(4, 1550, 72, '176', '2900', 4),
(5, 1650, 78, '180', '3000', 5),
(6, 1750, 80, '182', '3100', 6),
(7, 1850, 85, '185', '3200', 7),
(8, 1950, 88, '188', '3300', 8),
(9, 2050, 90, '190', '3400', 9),
(10, 2150, 95, '192', '3500', 10),
(11, 2250, 98, '195', '3600', 11),
(12, 2350, 100, '198', '3700', 12),
(13, 2450, 105, '200', '3800', 13),
(14, 2550, 108, '202', '3900', 14),
(15, 2650, 110, '205', '4000', 15),
(16, 2750, 115, '208', '4100', 16),
(17, 2850, 118, '210', '4200', 17),
(18, 2950, 120, '212', '4300', 18),
(19, 3050, 125, '215', '4400', 19),
(20, 3150, 128, '218', '4500', 20),
(21, 3250, 130, '220', '4600', 21),
(22, 3350, 135, '222', '4700', 22),
(23, 3450, 138, '225', '4800', 23),
(24, 3550, 140, '228', '4900', 24),
(25, 3650, 145, '230', '5000', 25),
(26, 3750, 148, '232', '5100', 26),
(27, 3850, 150, '235', '5200', 27),
(28, 3950, 155, '238', '5300', 28),
(29, 4050, 158, '240', '5400', 29),
(30, 4150, 160, '242', '5500', 30),
(31, 4250, 165, '245', '5600', 31),
(32, 4350, 168, '248', '5700', 32),
(33, 4450, 170, '250', '5800', 33),
(34, 4550, 175, '252', '5900', 34),
(35, 4650, 178, '255', '6000', 35),
(36, 4750, 180, '258', '6100', 36),
(37, 4850, 185, '260', '6200', 37),
(38, 4950, 188, '262', '6300', 38),
(39, 5050, 190, '265', '6400', 39),
(40, 5150, 195, '268', '6500', 40),
(41, 5250, 198, '270', '6600', 41),
(42, 5350, 200, '272', '6700', 42),
(43, 5450, 205, '275', '6800', 43),
(44, 5550, 208, '278', '6900', 44),
(45, 5650, 210, '280', '7000', 45),
(46, 5750, 215, '282', '7100', 46),
(47, 5850, 218, '285', '7200', 47),
(48, 5950, 220, '288', '7300', 48),
(49, 6050, 225, '290', '7400', 49),
(50, 6150, 228, '292', '7500', 50),
(51, 6250, 230, '295', '7600', 51),
(52, 6350, 235, '298', '7700', 52),
(53, 6450, 238, '300', '7800', 53),
(54, 6550, 240, '302', '7900', 54),
(55, 6650, 245, '305', '8000', 55),
(56, 6750, 248, '308', '8100', 56),
(57, 6850, 250, '310', '8200', 57),
(58, 6950, 255, '312', '8300', 58),
(59, 7050, 258, '315', '8400', 59),
(60, 7150, 260, '318', '8500', 60),
(61, 7250, 265, '320', '8600', 61),
(62, 7350, 268, '322', '8700', 62),
(63, 7450, 270, '325', '8800', 63),
(64, 7550, 275, '328', '8900', 64),
(65, 7650, 278, '330', '9000', 65),
(66, 7750, 280, '332', '9100', 66),
(67, 7850, 285, '335', '9200', 67),
(68, 7950, 288, '338', '9300', 68),
(69, 8050, 290, '340', '9400', 69),
(70, 8150, 295, '342', '9500', 70),
(71, 8250, 298, '345', '9600', 71),
(72, 8350, 300, '348', '9700', 72),
(73, 8450, 305, '350', '9800', 73),
(74, 8550, 308, '352', '9900', 74),
(75, 8650, 310, '355', '10000', 75),
(76, 8750, 315, '358', '10100', 76),
(77, 8850, 318, '360', '10200', 77),
(78, 8950, 320, '362', '10300', 78),
(79, 9050, 325, '365', '10400', 79),
(80, 9150, 328, '368', '10500', 80),
(81, 9250, 330, '370', '10600', 81),
(82, 9350, 335, '372', '10700', 82),
(83, 9450, 338, '375', '10800', 83),
(84, 9550, 340, '378', '10900', 84),
(85, 9650, 345, '380', '11000', 85),
(86, 9750, 348, '382', '11100', 86),
(87, 9850, 350, '385', '11200', 87),
(88, 9950, 355, '388', '11300', 88),
(89, 10050, 358, '390', '11400', 89),
(90, 10150, 360, '392', '11500', 90),
(91, 10250, 365, '395', '11600', 91),
(92, 10350, 368, '398', '11700', 92),
(93, 10450, 370, '400', '11800', 93),
(94, 10550, 375, '402', '11900', 94),
(95, 10650, 378, '405', '12000', 95),
(96, 10750, 380, '408', '12100', 96),
(97, 10850, 385, '410', '12200', 97),
(98, 10950, 388, '412', '12300', 98),
(99, 11050, 390, '415', '12400', 99),
(100, 11150, 395, '418', '12500', 100);

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
  MODIFY `Id_Commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `Id_Membre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `Id_Post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `statistique`
--
ALTER TABLE `statistique`
  MODIFY `Id_statistique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
