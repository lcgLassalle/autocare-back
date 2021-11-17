-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mer. 17 nov. 2021 à 07:18
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `autocare`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_commande` varchar(50) NOT NULL,
  `numero_commande` varchar(50) NOT NULL,
  `date_creation_commande` date NOT NULL,
  `date_cloture_commande` date NOT NULL,
  `etat_commande` enum('en cours','a livrer','livrée') NOT NULL,
  `id_devis_vente` int(11) NOT NULL,
  `id_facture` int(11) NOT NULL,
  PRIMARY KEY (`id_commande`),
  UNIQUE KEY `commande_devis_vente0_AK` (`id_devis_vente`),
  UNIQUE KEY `commande_facture1_AK` (`id_facture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `devis_vente`
--

DROP TABLE IF EXISTS `devis_vente`;
CREATE TABLE IF NOT EXISTS `devis_vente` (
  `id_devis_vente` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_devis_vente` varchar(50) NOT NULL,
  `date_devis_vente` date NOT NULL,
  `etat_devis` enum('en cours','validé','clôturé','refusé') NOT NULL,
  `id_commande` int(11) NOT NULL,
  `id_employe` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_devis_vente`),
  UNIQUE KEY `devis_vente_commande0_AK` (`id_commande`),
  KEY `devis_vente_Employe1_FK` (`id_employe`),
  KEY `devis_vente_fiche_client2_FK` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `devis_vente_stock_vehicule`
--

DROP TABLE IF EXISTS `devis_vente_stock_vehicule`;
CREATE TABLE IF NOT EXISTS `devis_vente_stock_vehicule` (
  `id_stock_vehicule_vente` int(11) NOT NULL,
  `id_devis_vente` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `date_operation` datetime NOT NULL,
  PRIMARY KEY (`id_stock_vehicule_vente`,`id_devis_vente`),
  KEY `devis_vente_stock_vehicule_devis_vente1_FK` (`id_devis_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id_employe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_employe` varchar(50) NOT NULL,
  `prenom_employe` varchar(50) NOT NULL,
  `nom_utilisateur_employe` varchar(10) NOT NULL,
  `mot_de_passe_employe` varchar(10) NOT NULL,
  `mail_employe` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desactivation_spa` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id_employe`, `nom_employe`, `prenom_employe`, `nom_utilisateur_employe`, `mot_de_passe_employe`, `mail_employe`, `desactivation_spa`) VALUES
(1, 'Hamilton', 'Idola', 'test', '123', 'test@gmail.com', 0),
(2, 'Mcdonald', 'Gloria', 'Magee', '123', 'sed@outlook.com', 0),
(3, 'Richmond', 'Vielka', 'Harlan', '123', 'harlan@gmail.com', 0),
(4, 'Puckett', 'Brett', 'Paul', '123', 'paul@gmail.com', 0),
(5, 'Bishop', 'Joan', 'Hakeem', '123', 'hakeem@gmail.com', 0),
(6, 'White', 'Alice', 'alice', '123', 'alice@gmail.com', 0),
(7, 'Debouzze', 'Jamel', 'jamel', '123', 'jamel@gmail.com', 0),
(8, 'Jones', 'Esteban', 'esteban', '123', 'esteban@gmail.com', 0),
(9, 'Hitchcock', 'Alfred', 'alfred', '123', 'alfred@gmail.com', 0),
(10, 'Eiffel', 'Gustave', 'gustave', '123', 'gustave@gmail.com', 0),
(11, 'Tesla', 'Nikolas', 'nikolas', '123', 'nikolas@gmail.com', 0);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id_facture` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_facture` varchar(50) NOT NULL,
  `date_facture` date NOT NULL,
  `est_payee` tinyint(1) NOT NULL,
  `id_commande` int(11) NOT NULL,
  PRIMARY KEY (`id_facture`),
  UNIQUE KEY `facture_commande0_AK` (`id_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fiche_client`
--

DROP TABLE IF EXISTS `fiche_client`;
CREATE TABLE IF NOT EXISTS `fiche_client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(50) NOT NULL,
  `prenom_client` varchar(50) NOT NULL,
  `telephone_fixe_client` varchar(10) DEFAULT NULL,
  `telephone_mobile_client` varchar(50) NOT NULL,
  `adresse_client` varchar(50) NOT NULL,
  `code_postal_client` varchar(10) NOT NULL,
  `ville_client` varchar(10) NOT NULL,
  `date_creation_client` date DEFAULT NULL,
  `id_employe` int(11) NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `fiche_client_Employe0_FK` (`id_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fiche_client`
--

INSERT INTO `fiche_client` (`id_client`, `nom_client`, `prenom_client`, `telephone_fixe_client`, `telephone_mobile_client`, `adresse_client`, `code_postal_client`, `ville_client`, `date_creation_client`, `id_employe`) VALUES
(1, 'Herrod', 'Kelly', '0467545232', '0667545232', '13 rue du ciel', '34000', 'Montpellie', '2021-11-16', 2),
(18, 'Evan', 'Margaret', '0467545232', '0767545232', '14 rue de chez Jacques', '34070', 'Nîmes', '2021-11-15', 9),
(19, 'Griffith', 'Shad', '0467545232', '0667545232', '03 rue des fleurs', '56100', 'Marseille', '2021-11-14', 6),
(20, 'Matthew', 'Murphy', '0467545232', '0667545232', '18 boulevard Charles De Gaulles', '67000', 'Toulouse', '2021-11-15', 8),
(21, 'Petra', 'Clarke Vente', '0467545232', '0746754523', 'Place du poulpe argentin', '30000', 'Perpignan', '2021-11-16', 2),
(22, 'Maye', 'Jessie Entretien', '0466542155', '0754238475', 'Avenue du sharingan', '30000', 'Perpignan', '2021-10-29', 4),
(23, 'Germain', 'Christophe', '0467325685', '0621452032', '13 rue des bois', '34000', 'Montpellie', '2021-11-17', 10),
(24, 'Alves', 'Cedric', '0466545232', '0765231478', '14 rue carnot', '30000', 'Nîmes', '2021-11-15', 7);

-- --------------------------------------------------------

--
-- Structure de la table `fiche_entretien`
--

DROP TABLE IF EXISTS `fiche_entretien`;
CREATE TABLE IF NOT EXISTS `fiche_entretien` (
  `id_fiche_entretien` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_fiche_entretien` varchar(10) NOT NULL,
  `date_prevu_entretien` date NOT NULL,
  `date_entretien` date NOT NULL,
  `fin_entretien` tinyint(1) NOT NULL,
  `etat_fiche_entretien` enum('en attente','validée','refusée') NOT NULL,
  `prix_entretien` double NOT NULL,
  `id_client` int(11) NOT NULL,
  `num_serie_vehicule_client` varchar(10) NOT NULL,
  `id_facture` int(11) DEFAULT NULL,
  `id_employe` int(11) NOT NULL,
  PRIMARY KEY (`id_fiche_entretien`),
  KEY `fiche_entretien_fiche_client0_FK` (`id_client`),
  KEY `fiche_entretien_vehicule_client1_FK` (`num_serie_vehicule_client`),
  KEY `fiche_entretien__facture2_FK` (`id_facture`),
  KEY `fiche_entretien_Employe3_FK` (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fiche_entretien_tache`
--

DROP TABLE IF EXISTS `fiche_entretien_tache`;
CREATE TABLE IF NOT EXISTS `fiche_entretien_tache` (
  `id_tache` int(11) NOT NULL,
  `id_fiche_entretien` int(11) NOT NULL,
  PRIMARY KEY (`id_tache`,`id_fiche_entretien`),
  KEY `fiche_entretien_tache_fiche_entretien1_FK` (`id_fiche_entretien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fiche_entretien_type_entretien`
--

DROP TABLE IF EXISTS `fiche_entretien_type_entretien`;
CREATE TABLE IF NOT EXISTS `fiche_entretien_type_entretien` (
  `id_type_entretien` int(11) NOT NULL,
  `id_fiche_entretien` int(11) NOT NULL,
  PRIMARY KEY (`id_type_entretien`,`id_fiche_entretien`),
  KEY `fiche_entretien_type_entretien_fiche_entretien1_FK` (`id_fiche_entretien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `piece_tache`
--

DROP TABLE IF EXISTS `piece_tache`;
CREATE TABLE IF NOT EXISTS `piece_tache` (
  `id_tache` int(11) NOT NULL,
  `id_stock_piece_produit` int(11) NOT NULL,
  `quantite_piece` int(11) NOT NULL,
  `date_operation` datetime NOT NULL,
  PRIMARY KEY (`id_tache`,`id_stock_piece_produit`),
  KEY `piece_tache_stock_piece_produit1_FK` (`id_stock_piece_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_role` varchar(10) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `libelle_role`) VALUES
(1, 'VENDEUR'),
(2, 'MAGASINIER'),
(3, 'CHEF ATELI'),
(4, 'ADMIN'),
(5, 'MECANICIEN');

-- --------------------------------------------------------

--
-- Structure de la table `role_employe`
--

DROP TABLE IF EXISTS `role_employe`;
CREATE TABLE IF NOT EXISTS `role_employe` (
  `id_role` int(11) NOT NULL,
  `id_employe` int(11) NOT NULL,
  PRIMARY KEY (`id_role`,`id_employe`),
  KEY `role_employe_Employe1_FK` (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role_employe`
--

INSERT INTO `role_employe` (`id_role`, `id_employe`) VALUES
(4, 1),
(1, 2),
(3, 2),
(2, 3),
(1, 4),
(4, 4),
(5, 5),
(1, 6),
(2, 6),
(2, 7),
(3, 7),
(1, 8),
(5, 8),
(3, 9),
(5, 9),
(3, 10),
(4, 10),
(2, 11),
(4, 11);

-- --------------------------------------------------------

--
-- Structure de la table `statut_tache`
--

DROP TABLE IF EXISTS `statut_tache`;
CREATE TABLE IF NOT EXISTS `statut_tache` (
  `id_statut` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_statut` varchar(50) NOT NULL,
  PRIMARY KEY (`id_statut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `stock_piece_produit`
--

DROP TABLE IF EXISTS `stock_piece_produit`;
CREATE TABLE IF NOT EXISTS `stock_piece_produit` (
  `id_stock_piece_produit` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_stock_piece_produit` varchar(50) NOT NULL,
  `quantite_stock_piece_produit` int(11) NOT NULL,
  `date_update` date NOT NULL,
  PRIMARY KEY (`id_stock_piece_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `stock_vehicule_vente`
--

DROP TABLE IF EXISTS `stock_vehicule_vente`;
CREATE TABLE IF NOT EXISTS `stock_vehicule_vente` (
  `id_stock_vehicule_vente` int(11) NOT NULL AUTO_INCREMENT,
  `quantite_stock_vehicule_vente` int(11) NOT NULL,
  `date_update_stock_vente` date NOT NULL,
  `marque_vehicule` varchar(10) NOT NULL,
  `modele_vehicule` varchar(10) NOT NULL,
  `kilometrage_vehicule` double NOT NULL,
  `annee_vehicule` varchar(4) NOT NULL,
  `prix_vehicule_vente_hors_taxe` double NOT NULL,
  `prix_vehicule_vente_avec_taxe` double NOT NULL,
  `date_creation_stock` date NOT NULL,
  PRIMARY KEY (`id_stock_vehicule_vente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock_vehicule_vente`
--

INSERT INTO `stock_vehicule_vente` (`id_stock_vehicule_vente`, `quantite_stock_vehicule_vente`, `date_update_stock_vente`, `marque_vehicule`, `modele_vehicule`, `kilometrage_vehicule`, `annee_vehicule`, `prix_vehicule_vente_hors_taxe`, `prix_vehicule_vente_avec_taxe`, `date_creation_stock`) VALUES
(1, 5, '2021-11-16', 'fiat', '500', 10000, '2020', 15000, 18000, '2021-11-15'),
(2, 2, '2021-11-16', 'audi', 'r8', 150000, '2021', 50000, 10000, '2021-11-15'),
(3, 4, '2021-11-16', 'renault', 'twingo', 200000, '2001', 1200, 1440, '2021-11-16'),
(4, 1, '2021-11-16', 'renault', 'clio 3', 30000, '2018', 4500, 5400, '2021-11-16');

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

DROP TABLE IF EXISTS `tache`;
CREATE TABLE IF NOT EXISTS `tache` (
  `id_tache` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_tache` varchar(50) NOT NULL,
  `date_update_tache` date NOT NULL,
  `id_employe` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  PRIMARY KEY (`id_tache`),
  KEY `tache_Employe0_FK` (`id_employe`),
  KEY `tache_statut_tache1_FK` (`id_statut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id_type_client` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_type_client` varchar(50) NOT NULL,
  PRIMARY KEY (`id_type_client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id_type_client`, `libelle_type_client`) VALUES
(1, 'ENTRETIEN'),
(2, 'VENTE');

-- --------------------------------------------------------

--
-- Structure de la table `type_client`
--

DROP TABLE IF EXISTS `type_client`;
CREATE TABLE IF NOT EXISTS `type_client` (
  `id_client` int(11) NOT NULL,
  `id_type_client` int(11) NOT NULL,
  PRIMARY KEY (`id_client`,`id_type_client`),
  KEY `type_client_type1_FK` (`id_type_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_client`
--

INSERT INTO `type_client` (`id_client`, `id_type_client`) VALUES
(18, 1),
(21, 1),
(23, 1),
(24, 1),
(1, 2),
(19, 2),
(20, 2),
(22, 2);

-- --------------------------------------------------------

--
-- Structure de la table `type_entretient`
--

DROP TABLE IF EXISTS `type_entretient`;
CREATE TABLE IF NOT EXISTS `type_entretient` (
  `id_type_entretien` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_type_entretien` varchar(10) NOT NULL,
  `prix_type_entretien` float NOT NULL,
  PRIMARY KEY (`id_type_entretien`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_entretient`
--

INSERT INTO `type_entretient` (`id_type_entretien`, `libelle_type_entretien`, `prix_type_entretien`) VALUES
(1, 'vidange', 100),
(2, 'nettoyage ', 50),
(3, 'petites pa', 150),
(4, 'peintures', 400);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_client`
--

DROP TABLE IF EXISTS `vehicule_client`;
CREATE TABLE IF NOT EXISTS `vehicule_client` (
  `num_serie_vehicule_client` varchar(10) NOT NULL,
  `marque_vehicule_client` varchar(50) NOT NULL,
  `modele_vehicule_client` varchar(50) NOT NULL,
  `immat_vehicule_client` varchar(50) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`num_serie_vehicule_client`),
  KEY `vehicule_client_fiche_client0_FK` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicule_client`
--

INSERT INTO `vehicule_client` (`num_serie_vehicule_client`, `marque_vehicule_client`, `modele_vehicule_client`, `immat_vehicule_client`, `id_client`) VALUES
('D5D15Q8ZFR', 'peugeot', '308', 'QS 541 FD', 21),
('EFH7Z5C6KJ', 'tesla', 'model s', 'HT 512 ND', 23),
('FEA5D2QD14', 'ferrari', '458', 'FS 542 AS', 24),
('JUG52S15S4', 'renault', 'clio', 'ED 214 SA', 18);

-- --------------------------------------------------------

--
-- Structure de la table `_facture`
--

DROP TABLE IF EXISTS `_facture`;
CREATE TABLE IF NOT EXISTS `_facture` (
  `id_facture` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_facture` varchar(50) NOT NULL,
  `date_facture` date NOT NULL,
  `est_payee` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_facture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_devis_vente0_FK` FOREIGN KEY (`id_devis_vente`) REFERENCES `devis_vente` (`id_devis_vente`),
  ADD CONSTRAINT `commande_facture1_FK` FOREIGN KEY (`id_facture`) REFERENCES `facture` (`id_facture`);

--
-- Contraintes pour la table `devis_vente`
--
ALTER TABLE `devis_vente`
  ADD CONSTRAINT `devis_vente_Employe1_FK` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  ADD CONSTRAINT `devis_vente_commande0_FK` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `devis_vente_fiche_client2_FK` FOREIGN KEY (`id_client`) REFERENCES `fiche_client` (`id_client`);

--
-- Contraintes pour la table `devis_vente_stock_vehicule`
--
ALTER TABLE `devis_vente_stock_vehicule`
  ADD CONSTRAINT `devis_vente_stock_vehicule_devis_vente1_FK` FOREIGN KEY (`id_devis_vente`) REFERENCES `devis_vente` (`id_devis_vente`),
  ADD CONSTRAINT `devis_vente_stock_vehicule_stock_vehicule_vente0_FK` FOREIGN KEY (`id_stock_vehicule_vente`) REFERENCES `stock_vehicule_vente` (`id_stock_vehicule_vente`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_commande0_FK` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `fiche_client`
--
ALTER TABLE `fiche_client`
  ADD CONSTRAINT `fiche_client_Employe0_FK` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`);

--
-- Contraintes pour la table `fiche_entretien`
--
ALTER TABLE `fiche_entretien`
  ADD CONSTRAINT `fiche_entretien_Employe3_FK` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  ADD CONSTRAINT `fiche_entretien__facture2_FK` FOREIGN KEY (`id_facture`) REFERENCES `_facture` (`id_facture`),
  ADD CONSTRAINT `fiche_entretien_fiche_client0_FK` FOREIGN KEY (`id_client`) REFERENCES `fiche_client` (`id_client`),
  ADD CONSTRAINT `fiche_entretien_vehicule_client1_FK` FOREIGN KEY (`num_serie_vehicule_client`) REFERENCES `vehicule_client` (`num_serie_vehicule_client`);

--
-- Contraintes pour la table `fiche_entretien_tache`
--
ALTER TABLE `fiche_entretien_tache`
  ADD CONSTRAINT `fiche_entretien_tache_fiche_entretien1_FK` FOREIGN KEY (`id_fiche_entretien`) REFERENCES `fiche_entretien` (`id_fiche_entretien`),
  ADD CONSTRAINT `fiche_entretien_tache_tache0_FK` FOREIGN KEY (`id_tache`) REFERENCES `tache` (`id_tache`);

--
-- Contraintes pour la table `fiche_entretien_type_entretien`
--
ALTER TABLE `fiche_entretien_type_entretien`
  ADD CONSTRAINT `fiche_entretien_type_entretien_fiche_entretien1_FK` FOREIGN KEY (`id_fiche_entretien`) REFERENCES `fiche_entretien` (`id_fiche_entretien`),
  ADD CONSTRAINT `fiche_entretien_type_entretien_type_entretient0_FK` FOREIGN KEY (`id_type_entretien`) REFERENCES `type_entretient` (`id_type_entretien`);

--
-- Contraintes pour la table `piece_tache`
--
ALTER TABLE `piece_tache`
  ADD CONSTRAINT `piece_tache_stock_piece_produit1_FK` FOREIGN KEY (`id_stock_piece_produit`) REFERENCES `stock_piece_produit` (`id_stock_piece_produit`),
  ADD CONSTRAINT `piece_tache_tache0_FK` FOREIGN KEY (`id_tache`) REFERENCES `tache` (`id_tache`);

--
-- Contraintes pour la table `role_employe`
--
ALTER TABLE `role_employe`
  ADD CONSTRAINT `role_employe_Employe1_FK` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  ADD CONSTRAINT `role_employe_role0_FK` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `tache_Employe0_FK` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  ADD CONSTRAINT `tache_statut_tache1_FK` FOREIGN KEY (`id_statut`) REFERENCES `statut_tache` (`id_statut`);

--
-- Contraintes pour la table `type_client`
--
ALTER TABLE `type_client`
  ADD CONSTRAINT `type_client_fiche_client0_FK` FOREIGN KEY (`id_client`) REFERENCES `fiche_client` (`id_client`),
  ADD CONSTRAINT `type_client_type1_FK` FOREIGN KEY (`id_type_client`) REFERENCES `type` (`id_type_client`);

--
-- Contraintes pour la table `vehicule_client`
--
ALTER TABLE `vehicule_client`
  ADD CONSTRAINT `vehicule_client_fiche_client0_FK` FOREIGN KEY (`id_client`) REFERENCES `fiche_client` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
