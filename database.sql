-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 17 juin 2019 à 02:18
-- Version du serveur :  10.3.15-MariaDB
-- Version de PHP :  7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `etiq`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add user', 2, 'add_user'),
(6, 'Can change user', 2, 'change_user'),
(7, 'Can delete user', 2, 'delete_user'),
(8, 'Can view user', 2, 'view_user'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add message', 8, 'add_message'),
(26, 'Can change message', 8, 'change_message'),
(27, 'Can delete message', 8, 'delete_message'),
(28, 'Can view message', 8, 'view_message'),
(29, 'Can add user', 7, 'add_user'),
(30, 'Can change user', 7, 'change_user'),
(31, 'Can delete user', 7, 'delete_user'),
(32, 'Can view user', 7, 'view_user');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$tCGWCKwutQSK$fLDiNCyPh0M1PFib3uRG6j4FVcEoiTxNW+SDmHah5xA=', '2019-06-16 01:19:34.481833', 0, 'lidvine', '', '', 'lidvine@gmail.com', 0, 1, '2019-06-16 01:18:33.578379');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_message`
--

CREATE TABLE `dashboard_message` (
  `id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `etiquette` varchar(10) NOT NULL,
  `dateAdded` date NOT NULL,
  `idUser_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_user`
--

CREATE TABLE `dashboard_user` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(20) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(4, 'auth', 'permission'),
(2, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'dashboard', 'message'),
(7, 'dashboard', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-06-16 01:08:31.808623'),
(2, 'auth', '0001_initial', '2019-06-16 01:08:34.181995'),
(3, 'admin', '0001_initial', '2019-06-16 01:08:44.778160'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-06-16 01:08:47.021244'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-06-16 01:08:47.101911'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-06-16 01:08:48.875345'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-06-16 01:08:48.987580'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-06-16 01:08:49.101173'),
(9, 'auth', '0004_alter_user_username_opts', '2019-06-16 01:08:49.187742'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-06-16 01:08:50.170955'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-06-16 01:08:50.226561'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-06-16 01:08:50.323587'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-06-16 01:08:50.597320'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-06-16 01:08:50.721588'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-06-16 01:08:50.834067'),
(16, 'auth', '0011_update_proxy_permissions', '2019-06-16 01:08:50.910194'),
(17, 'dashboard', '0001_initial', '2019-06-16 01:08:52.817192'),
(18, 'dashboard', '0002_auto_20190524_1354', '2019-06-16 01:08:55.858325'),
(19, 'dashboard', '0003_auto_20190615_1318', '2019-06-16 01:08:59.400889'),
(20, 'sessions', '0001_initial', '2019-06-16 01:08:59.730167');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4akxngm8stoysxcww97fwppa95kgro99', 'ZGQyN2IxMmNlODFmZmVkNTZlOWYwNmNlODZmOTZhNWQ5MTdhMDA3Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNTBiYjA1ZTIxNTUxMTcyMzA5OTE2ZmY5MjZhMDNhNmZlNzlhMThmIn0=', '2019-06-30 01:19:34.526962');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message` longtext DEFAULT NULL,
  `idUser_id` int(11) DEFAULT NULL,
  `etiquette` varchar(255) DEFAULT NULL,
  `dateAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `message`, `idUser_id`, `etiquette`, `dateAdded`) VALUES
(16, 'West Ham et Valence ont conclu un accord de 32M avec le Celta Vigo pour l\'attaquant, Maxi Gomez. Le joueur doit dÃ©sormais choisir oÃ¹ il veut jouer. [Sky Sports]', 34, 'Bon', '2019-06-15 15:59:15'),
(17, ' Photo', 33, 'Bon', '2019-06-15 16:10:24'),
(18, 'Appel vocal en cours', 34, 'Bon', '2019-06-16 00:52:41'),
(19, 'â€Žâ€Ž612 messages de 27 discussions', 39, 'Bon', '2019-06-16 06:29:21'),
(20, 'Ok, j\'en prendrais au moins 04  Ã  mon retour', 33, 'Bon', '2019-06-16 08:28:18'),
(21, 'J suis intÃ©ressÃ©', 33, 'Bon', '2019-06-16 08:28:28'),
(22, 'Hello', 33, 'Bon', '2019-06-16 08:30:36'),
(23, 'Le bon test', 33, 'Bon', '2019-06-16 10:08:20'),
(24, '5ggyu', 33, 'Bon', '2019-06-16 10:08:20'),
(25, 'Tyy', 33, 'Bon', '2019-06-16 10:08:21'),
(26, 'Y\'a un way ?', 33, 'Bon', '2019-06-16 10:08:21'),
(27, 'Ggy\nA', 33, 'Bon', '2019-06-16 10:08:21'),
(28, 'Uuu', 33, 'Bon', '2019-06-16 10:09:03'),
(29, 'Uuu', 33, 'Bon', '2019-06-16 10:09:39'),
(57, 'Celui ci fait peur hein ', 33, 'Fake', '2019-06-16 11:02:55'),
(58, 'Tu vends Ã  combien ??', 33, 'Bon', '2019-06-16 11:04:01'),
(59, 'Ein', 33, 'Bon', '2019-06-16 11:06:20'),
(60, 'Je n\'ai pas encore nettoyÃ©', 33, 'Bon', '2019-06-16 11:15:46'),
(61, 'â€Žâ€Ž641 messages de 28 discussions', 34, 'Bon', '2019-06-16 12:03:53'),
(62, 'â€Žâ€Ž639 messages de 28 discussions', 34, 'Bon-Fake', '2019-06-16 12:06:01'),
(63, 'â€Žâ€Ž640 messages de 26 discussions', 34, 'Bon-Fake', '2019-06-16 12:35:46'),
(64, 'Rodrigu', 34, 'Fake-Antisemique', '2019-06-16 12:37:25'),
(65, 'â€Žâ€Ž641 messages de 27 discussions', 34, 'Bon-Fake', '2019-06-16 12:39:16'),
(66, 'Ce message a Ã©tÃ© supprimÃ©.', 34, 'Fake', '2019-06-16 12:58:40'),
(67, 'Yo Man', 33, 'Bon', '2019-06-16 13:21:50'),
(68, 'â€Ž3 nouveaux messages', 33, 'Haine', '2019-06-16 13:22:03'),
(69, 'â€Ž5 nouveaux messages', 33, 'Bon', '2019-06-16 13:22:11'),
(70, 'C\'est ao man', 33, 'Fake', '2019-06-16 13:22:23'),
(71, ' Sticker', 33, 'Bon', '2019-06-16 13:25:09'),
(72, 'D\'accord', 33, 'Bon', '2019-06-16 13:25:15'),
(73, 'Je me repose man', 33, 'Bon', '2019-06-16 13:25:29'),
(74, 'Ton whatsapp fait souvent Ã§a??? Ã‡a n\'affiche plus les vues le ..', 33, 'Bon', '2019-06-16 13:25:32'),
(75, 'C\'est assez gros massah', 33, 'Bon', '2019-06-16 13:25:35'),
(76, 'Je vais faire quoi avec tout Ã§a ?', 33, 'Bon', '2019-06-16 13:25:39'),
(77, 'Hahaha le code t\'as fini mon lion', 33, 'Bon', '2019-06-16 13:25:43'),
(78, 'Apporte moi un bon poulet Ã  6000', 33, 'Bon', '2019-06-16 13:25:52'),
(79, 'mdr', 33, 'Fake', '2019-06-16 13:25:58'),
(80, 'yessoo', 33, 'Fake', '2019-06-16 13:26:03'),
(81, 'test insertion base de donnée xxx', 34, 'fake', '2019-06-16 19:51:35');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` longtext NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `pseudo`, `email`, `password`, `isAdmin`) VALUES
(33, 'arnold', 'nanaarnold23@gmail.com', '$2y$10$inIy86xeIuxz3A.2l1Aot.A.tDhGrW53kLQEf7e3lzYmLO0G5PIgG', 0),
(34, 'fred', 'fredjordan288@gmail.com', '$2y$10$C6SVCHk2F8HurQfWOyimXu2Km4cuIrhavbbrX0Sd7kYDb1kjR.VxC', 0),
(35, 'Lidvine', 'liditieng@gmail.com', '$2y$10$fdWusnUZJJLFUTNiIl9le.bsj.ECZUUTAK/ocB7gFludD.QswePIK', 0),
(36, 'toto', 'toto@gmail.com', '$2y$10$IP24vHUbhq7yUU1TL3d4Ye3N1yjMXtcX1f.wWBh0PJ1wxiRDdCfDK', 0),
(37, 'titi', 'titi@gmail.com', '$2y$10$0cMEgW/sJJDXJAh7ITDMOuKJAcDH/K2S4GaLwkM44Csn3qUkQ.2iC', 0),
(38, 'tete', 'tete@gmail.com', '$2y$10$/9zCnxccENUeiqFnyMRijOmFyE4SisTcbJmE20aUOfZ0h2T57lB8a', 0),
(39, 'tutu', 'tutu@gmail.com', '$2y$10$4AZF8Eyj8/HmctBdLX8s1eKo6TUszLDxUUo9CKPtagaZ63aYLxQVC', 0),
(40, 'tyty', 'tyty@gmail.com', '$2y$10$slq2BOUTAANym/wpZ4Qjx./jscz4UnnE92mbtpQiTFjHBz7BDbc0a', 0),
(41, 'baba', 'baba@gmail.com', '$2y$10$ZxAqqp83Iy8A0gRDdZqBDuA7p6bJzrOmDmqBcNdO2cxUr37JRGk.O', 0),
(42, 'bobo', 'bobo@gmail.com', '$2y$10$p7E6VczkHyib/sHCmjZuYu6p8drTWUL5hs5cj27zTvqZfGjvDpLbm', 0),
(43, 'bebe', 'bebe@gmail.com', '$2y$10$JzmIUbCD0gMT9vNC8nyD/.OwCIcqRuTnb/Hwh.xW.YurrUeuiPlJO', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `dashboard_message`
--
ALTER TABLE `dashboard_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_message_idUser_id_759a7472_fk_dashboard_user_id` (`idUser_id`);

--
-- Index pour la table `dashboard_user`
--
ALTER TABLE `dashboard_user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser_id` (`idUser_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dashboard_message`
--
ALTER TABLE `dashboard_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dashboard_user`
--
ALTER TABLE `dashboard_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `dashboard_message`
--
ALTER TABLE `dashboard_message`
  ADD CONSTRAINT `dashboard_message_idUser_id_759a7472_fk_dashboard_user_id` FOREIGN KEY (`idUser_id`) REFERENCES `dashboard_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`idUser_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;