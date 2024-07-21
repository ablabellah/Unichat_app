-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 22 mai 2023 à 17:38
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `unichat`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `password_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `email`, `password`, `password_text`) VALUES
(1, 'Admin', 'admin@unichat.com', 'c68710d3fe56fc88f7905cb15f06cf5c', '14271427');

-- --------------------------------------------------------

--
-- Structure de la table `block_list`
--

CREATE TABLE `block_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_not` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`, `id_not`) VALUES
(3, 5, 8, 'this is awesome guys', '2021-12-02 17:44:26', NULL),
(4, 5, 8, 'dfg', '2021-12-02 17:46:43', NULL),
(5, 5, 8, 'ok just testing', '2021-12-02 17:51:50', NULL),
(6, 5, 8, 'nice', '2021-12-02 17:52:00', NULL),
(7, 5, 8, 'sdfdsf', '2021-12-02 17:52:26', NULL),
(8, 5, 8, 'sdfsdf', '2021-12-02 17:52:27', NULL),
(9, 5, 8, 'sdfsdf', '2021-12-02 17:52:28', NULL),
(10, 5, 8, 'sdfsdf', '2021-12-02 17:52:29', NULL),
(11, 5, 8, 'sdfsdf', '2021-12-02 17:52:31', NULL),
(12, 5, 8, 'sdfsdf', '2021-12-02 17:52:32', NULL),
(13, 7, 8, 'this is awesome game', '2021-12-02 18:04:36', NULL),
(14, 3, 8, 'this is aweosme project', '2021-12-02 18:05:49', NULL),
(15, 7, 10, 'wowo, just super cool', '2021-12-02 18:07:31', NULL),
(16, 8, 10, 'nice and funny', '2021-12-02 18:09:17', NULL),
(17, 6, 10, 'awesome', '2021-12-02 18:12:01', NULL),
(18, 5, 10, 'nice pic', '2021-12-02 18:15:12', NULL),
(19, 4, 10, 'super cool man congrats', '2021-12-02 18:15:34', NULL),
(20, 5, 10, 'aweosme and cool', '2021-12-02 18:22:03', NULL),
(21, 1, 10, 'super cool', '2021-12-02 18:22:24', NULL),
(22, 5, 10, 'super nice', '2021-12-02 18:23:18', NULL),
(23, 9, 10, 'super cool', '2021-12-02 18:24:44', NULL),
(24, 4, 10, 'thanks bro', '2021-12-02 18:26:02', NULL),
(25, 2, 8, 'looking awesome bro', '2021-12-04 10:55:57', NULL),
(27, 8, 10, 'this is my fav image', '2021-12-04 11:18:13', NULL),
(28, 4, 10, 'congrats guys', '2021-12-04 11:37:42', NULL),
(29, 9, 8, 'nice pic brother ', '2021-12-04 12:09:12', NULL),
(30, 9, 10, 'thanks brother', '2021-12-04 12:09:36', NULL),
(32, 10, 8, 'super cool', '2021-12-04 12:24:06', NULL),
(34, 5, 8, 'aweomse', '2021-12-04 12:45:09', NULL),
(38, 10, 8, 'ok bye then', '2021-12-04 16:40:00', NULL),
(39, 10, 8, 'cool', '2021-12-04 16:44:10', NULL),
(40, 9, 8, 'ok nice', '2021-12-04 16:50:21', NULL),
(41, 10, 8, 'good', '2021-12-04 16:51:22', NULL),
(42, 1, 8, 'Nice pic', '2021-12-05 05:44:25', NULL),
(43, 9, 11, 'Hii bro', '2021-12-05 06:52:16', NULL),
(44, 12, 10, 'awesome pic bro', '2021-12-06 08:17:41', NULL),
(45, 5, 10, 'nice girls', '2021-12-06 08:19:08', NULL),
(46, 5, 8, 'Thanks', '2021-12-06 08:25:30', NULL),
(47, 6, 11, 'Awesosm', '2021-12-07 10:24:33', NULL),
(48, 16, 17, 'i can help you', '2023-05-20 14:58:24', NULL),
(49, 16, 15, 'that could be so helpful', '2023-05-20 14:59:32', NULL),
(50, 16, 20, 'i can help u too', '2023-05-20 15:28:03', NULL),
(51, 20, 15, 'moi aussi, viens on se capte je suis aussi dans la bib', '2023-05-21 11:17:55', NULL),
(52, 22, 20, 'je oeux t\'aider dm moi.', '2023-05-21 11:23:55', NULL),
(53, 21, 20, 't\'étais géniale !!!!!!!', '2023-05-21 11:25:19', NULL),
(54, 24, 29, 'je vais t\'envoyer un msg', '2023-05-21 11:31:25', NULL),
(55, 27, 15, 'oh c\'étais génial', '2023-05-21 17:38:04', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `follow_list`
--

CREATE TABLE `follow_list` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `follow_list`
--

INSERT INTO `follow_list` (`id`, `follower_id`, `user_id`) VALUES
(13, 9, 3),
(15, 9, 6),
(38, 10, 3),
(42, 10, 7),
(43, 10, 9),
(57, 8, 4),
(58, 8, 5),
(66, 10, 11),
(68, 11, 10),
(69, 11, 7),
(70, 11, 9),
(71, 11, 3),
(79, 20, 15),
(80, 20, 17),
(82, 15, 20),
(83, 17, 20),
(84, 24, 15),
(85, 24, 17),
(86, 24, 20),
(87, 24, 21),
(88, 24, 23),
(89, 23, 15),
(90, 23, 17),
(91, 23, 20),
(92, 23, 21),
(93, 17, 24),
(94, 21, 24),
(95, 21, 23),
(96, 21, 17),
(97, 27, 15),
(98, 27, 17),
(99, 27, 20),
(100, 27, 21),
(101, 27, 23),
(102, 15, 24),
(103, 15, 23),
(104, 15, 27),
(105, 28, 15),
(106, 28, 17),
(107, 28, 20),
(108, 28, 21),
(109, 28, 23),
(110, 29, 15),
(111, 29, 17),
(112, 29, 20),
(113, 29, 21),
(114, 29, 23),
(115, 15, 28),
(116, 15, 29),
(117, 31, 15),
(118, 31, 17),
(119, 31, 20),
(120, 31, 23),
(121, 31, 21),
(122, 15, 31),
(124, 15, 17),
(125, 17, 15),
(126, 17, 23),
(127, 17, 21),
(128, 29, 28),
(129, 29, 27),
(130, 17, 27),
(131, 17, 28),
(132, 17, 29),
(133, 17, 31),
(134, 28, 29),
(135, 15, 21),
(136, 28, 24),
(137, 29, 26),
(138, 29, 31),
(139, 29, 24),
(140, 31, 29),
(141, 28, 25),
(142, 28, 26),
(143, 27, 25),
(144, 27, 29),
(145, 37, 15),
(146, 37, 17),
(147, 23, 24),
(148, 23, 27),
(149, 23, 28),
(150, 23, 29),
(151, 23, 31),
(152, 40, 15),
(153, 40, 17),
(154, 40, 20),
(155, 40, 21),
(156, 40, 23),
(157, 15, 40);

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`) VALUES
(67, 1, 8),
(90, 2, 8),
(17, 3, 8),
(49, 3, 10),
(89, 5, 8),
(31, 5, 9),
(57, 5, 10),
(69, 6, 10),
(45, 7, 8),
(30, 7, 9),
(56, 9, 10),
(79, 9, 11),
(74, 10, 8),
(88, 12, 10),
(92, 16, 15),
(91, 16, 17),
(93, 16, 20),
(94, 16, 24),
(96, 18, 15),
(108, 19, 15),
(97, 20, 15),
(107, 21, 15),
(106, 22, 15),
(99, 22, 20),
(105, 23, 15),
(104, 24, 15),
(100, 24, 29),
(102, 27, 15),
(103, 27, 27);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) DEFAULT NULL,
  `id_user1` int(11) DEFAULT NULL,
  `id_notif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `msg`, `read_status`, `created_at`, `id_user`, `id_user1`, `id_notif`) VALUES
(30, 8, 11, 'ok get it', 1, '2021-12-07 10:48:15', NULL, NULL, NULL),
(31, 11, 8, 'Thanks for unblocking me', 1, '2021-12-07 11:05:27', NULL, NULL, NULL),
(32, 11, 8, 'No I am going to block you', 1, '2021-12-07 11:05:52', NULL, NULL, NULL),
(33, 10, 8, 'Hii bro', 1, '2021-12-07 11:10:12', NULL, NULL, NULL),
(34, 8, 10, 'hii man', 1, '2021-12-07 11:10:26', NULL, NULL, NULL),
(35, 10, 8, 'So what are you doing', 1, '2021-12-07 11:10:39', NULL, NULL, NULL),
(36, 8, 10, 'nothing big you tell', 1, '2021-12-07 11:11:00', NULL, NULL, NULL),
(37, 10, 8, 'Ohh same here', 1, '2021-12-07 11:11:08', NULL, NULL, NULL),
(38, 8, 10, 'lets go for party then', 1, '2021-12-07 11:11:30', NULL, NULL, NULL),
(39, 10, 8, 'Ya sure', 1, '2021-12-07 11:11:37', NULL, NULL, NULL),
(40, 8, 10, 'ok bye', 1, '2021-12-07 11:11:53', NULL, NULL, NULL),
(41, 15, 17, 'HELLO', 1, '2023-05-20 13:57:43', NULL, NULL, NULL),
(42, 17, 15, 'HEY', 1, '2023-05-20 13:58:05', NULL, NULL, NULL),
(43, 15, 17, 'how r u', 1, '2023-05-20 14:56:07', NULL, NULL, NULL),
(44, 20, 15, 'hello i can help u with the post u sent', 1, '2023-05-20 15:27:00', NULL, NULL, NULL),
(45, 20, 15, 'u posted*', 1, '2023-05-20 15:27:09', NULL, NULL, NULL),
(46, 17, 24, 'hello', 1, '2023-05-20 15:56:42', NULL, NULL, NULL),
(47, 21, 24, 'hey', 1, '2023-05-20 15:58:04', NULL, NULL, NULL),
(48, 21, 17, 'hi', 0, '2023-05-20 15:58:19', NULL, NULL, NULL),
(49, 15, 17, 'hello', 1, '2023-05-20 16:49:40', NULL, NULL, NULL),
(50, 15, 20, 'ohh thank u', 0, '2023-05-20 17:31:49', NULL, NULL, NULL),
(51, 24, 21, 'hello', 0, '2023-05-20 18:24:20', NULL, NULL, NULL),
(52, 24, 17, 'hi', 0, '2023-05-20 18:34:57', NULL, NULL, NULL),
(53, 15, 23, 'hello', 0, '2023-05-21 11:22:13', NULL, NULL, NULL),
(54, 29, 24, 'hello how r u', 0, '2023-05-21 11:32:10', NULL, NULL, NULL),
(55, 29, 15, 'hey', 1, '2023-05-21 11:34:37', NULL, NULL, NULL),
(56, 29, 24, 'g', 0, '2023-05-21 11:35:51', NULL, NULL, NULL),
(57, 29, 24, 'je veux des info concernant le post que t as publie', 0, '2023-05-21 11:36:27', NULL, NULL, NULL),
(58, 31, 15, 'hey', 1, '2023-05-21 12:53:15', NULL, NULL, NULL),
(59, 15, 31, 'HELLO', 1, '2023-05-21 16:56:32', NULL, NULL, NULL),
(60, 31, 15, 'HOW R U', 1, '2023-05-21 16:57:02', NULL, NULL, NULL),
(61, 15, 31, 'M FINE AND U', 1, '2023-05-21 16:57:09', NULL, NULL, NULL),
(62, 31, 15, 'i need ur help', 1, '2023-05-21 16:57:54', NULL, NULL, NULL),
(63, 15, 29, 'hello', 1, '2023-05-21 17:02:10', NULL, NULL, NULL),
(64, 29, 15, 'how r u', 1, '2023-05-21 17:02:18', NULL, NULL, NULL),
(65, 15, 29, 'm good and u ', 1, '2023-05-21 17:02:24', NULL, NULL, NULL),
(66, 29, 15, 'm fine', 1, '2023-05-21 17:02:28', NULL, NULL, NULL),
(67, 27, 15, 'HEY', 1, '2023-05-21 18:17:54', NULL, NULL, NULL),
(68, 15, 27, 'hello', 1, '2023-05-21 18:18:09', NULL, NULL, NULL),
(69, 27, 15, 'how r u ?', 1, '2023-05-21 18:22:31', NULL, NULL, NULL),
(70, 15, 27, 'm okay', 1, '2023-05-21 18:22:46', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_user_id` int(11) NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `post_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `to_user_id`, `message`, `created_at`, `from_user_id`, `read_status`, `post_id`) VALUES
(82, 10, 'Unblocked you !', '2021-12-06 08:16:11', 8, 1, '0'),
(83, 8, 'started following you !', '2021-12-06 08:16:59', 10, 1, '0'),
(84, 8, 'liked your post !', '2021-12-06 08:17:33', 10, 1, '12'),
(85, 8, 'commented on your post', '2021-12-06 08:17:41', 10, 1, '12'),
(86, 8, 'commented on your post', '2021-12-06 08:19:07', 10, 1, '5'),
(87, 10, 'blocked you', '2021-12-06 08:20:42', 8, 1, '0'),
(88, 10, 'Unblocked you !', '2021-12-06 08:21:09', 8, 1, '0'),
(89, 8, 'started following you !', '2021-12-06 08:21:34', 10, 1, '0'),
(90, 10, 'started following you !', '2021-12-06 08:22:17', 8, 1, '0'),
(91, 3, 'Unfollowed you !', '2021-12-06 08:26:01', 8, 0, '0'),
(92, 8, 'commented on your post', '2021-12-07 10:24:33', 11, 2, '6'),
(93, 11, 'blocked you', '2021-12-07 10:48:28', 8, 1, '0'),
(94, 11, 'Unblocked you !', '2021-12-07 11:04:05', 8, 1, '0'),
(95, 8, 'blocked you', '2021-12-07 11:08:54', 11, 1, '0'),
(96, 8, 'Unblocked you !', '2021-12-07 11:09:03', 11, 1, '0'),
(97, 8, 'blocked you', '2021-12-07 11:12:50', 10, 1, '0'),
(98, 8, 'Unblocked you !', '2021-12-07 11:13:04', 10, 1, '0'),
(99, 3, 'started following you !', '2023-05-20 13:44:43', 15, 0, '0'),
(100, 3, 'Unfollowed you !', '2023-05-20 13:45:05', 15, 0, '0'),
(101, 15, 'started following you !', '2023-05-20 13:56:46', 17, 1, '0'),
(102, 17, 'started following you !', '2023-05-20 13:57:21', 15, 1, '0'),
(103, 15, 'liked your post !', '2023-05-20 14:58:15', 17, 1, '16'),
(104, 15, 'commented on your post', '2023-05-20 14:58:24', 17, 1, '16'),
(105, 15, 'started following you !', '2023-05-20 15:24:38', 20, 1, '0'),
(106, 17, 'started following you !', '2023-05-20 15:24:38', 20, 1, '0'),
(107, 20, 'started following you !', '2023-05-20 15:25:16', 15, 1, '0'),
(108, 20, 'Unfollowed you !', '2023-05-20 15:25:27', 15, 1, '0'),
(109, 20, 'started following you !', '2023-05-20 15:25:39', 15, 1, '0'),
(110, 15, 'liked your post !', '2023-05-20 15:27:53', 20, 1, '16'),
(111, 15, 'commented on your post', '2023-05-20 15:28:03', 20, 1, '16'),
(112, 20, 'started following you !', '2023-05-20 15:29:15', 17, 1, '0'),
(113, 15, 'started following you !', '2023-05-20 15:48:53', 24, 1, '0'),
(114, 17, 'started following you !', '2023-05-20 15:48:54', 24, 1, '0'),
(115, 20, 'started following you !', '2023-05-20 15:48:55', 24, 1, '0'),
(116, 21, 'started following you !', '2023-05-20 15:48:56', 24, 1, '0'),
(117, 23, 'started following you !', '2023-05-20 15:48:58', 24, 1, '0'),
(118, 15, 'started following you !', '2023-05-20 15:55:22', 23, 1, '0'),
(119, 17, 'started following you !', '2023-05-20 15:55:23', 23, 1, '0'),
(120, 20, 'started following you !', '2023-05-20 15:55:23', 23, 1, '0'),
(121, 21, 'started following you !', '2023-05-20 15:55:24', 23, 1, '0'),
(122, 15, 'liked your post !', '2023-05-20 15:55:40', 24, 1, '16'),
(123, 24, 'started following you !', '2023-05-20 15:56:34', 17, 1, '0'),
(124, 24, 'started following you !', '2023-05-20 15:57:36', 21, 1, '0'),
(125, 23, 'started following you !', '2023-05-20 15:57:37', 21, 1, '0'),
(126, 17, 'started following you !', '2023-05-20 15:58:08', 21, 1, '0'),
(127, 15, 'started following you !', '2023-05-20 16:07:19', 27, 1, '0'),
(128, 17, 'started following you !', '2023-05-20 16:07:20', 27, 1, '0'),
(129, 20, 'started following you !', '2023-05-20 16:07:21', 27, 0, '0'),
(130, 21, 'started following you !', '2023-05-20 16:07:22', 27, 1, '0'),
(131, 23, 'started following you !', '2023-05-20 16:07:22', 27, 1, '0'),
(132, 24, 'started following you !', '2023-05-20 16:08:18', 15, 1, '0'),
(133, 23, 'started following you !', '2023-05-20 16:08:18', 15, 1, '0'),
(134, 27, 'started following you !', '2023-05-20 16:08:19', 15, 1, '0'),
(135, 15, 'started following you !', '2023-05-20 16:12:14', 28, 1, '0'),
(136, 17, 'started following you !', '2023-05-20 16:12:15', 28, 1, '0'),
(137, 20, 'started following you !', '2023-05-20 16:12:15', 28, 0, '0'),
(138, 21, 'started following you !', '2023-05-20 16:12:15', 28, 1, '0'),
(139, 23, 'started following you !', '2023-05-20 16:12:16', 28, 1, '0'),
(140, 15, 'started following you !', '2023-05-20 16:16:17', 29, 1, '0'),
(141, 17, 'started following you !', '2023-05-20 16:16:18', 29, 1, '0'),
(142, 20, 'started following you !', '2023-05-20 16:16:19', 29, 0, '0'),
(143, 21, 'started following you !', '2023-05-20 16:16:20', 29, 1, '0'),
(144, 23, 'started following you !', '2023-05-20 16:16:20', 29, 1, '0'),
(145, 28, 'started following you !', '2023-05-20 16:16:58', 15, 1, '0'),
(146, 29, 'started following you !', '2023-05-20 16:16:59', 15, 1, '0'),
(147, 15, 'started following you !', '2023-05-20 16:24:52', 31, 1, '0'),
(148, 17, 'started following you !', '2023-05-20 16:24:52', 31, 1, '0'),
(149, 20, 'started following you !', '2023-05-20 16:24:52', 31, 0, '0'),
(150, 23, 'started following you !', '2023-05-20 16:24:53', 31, 1, '0'),
(151, 21, 'started following you !', '2023-05-20 16:24:54', 31, 1, '0'),
(152, 31, 'started following you !', '2023-05-20 16:43:14', 15, 1, '0'),
(153, 17, 'blocked you', '2023-05-20 16:43:39', 15, 1, '0'),
(154, 17, 'Unblocked you !', '2023-05-20 16:43:42', 15, 1, '0'),
(155, 17, 'started following you !', '2023-05-20 16:43:45', 15, 1, '0'),
(156, 17, 'blocked you', '2023-05-20 16:43:53', 15, 1, '0'),
(157, 17, 'Unblocked you !', '2023-05-20 16:43:57', 15, 1, '0'),
(158, 17, 'started following you !', '2023-05-20 16:44:00', 15, 1, '0'),
(159, 15, 'started following you !', '2023-05-20 16:44:34', 17, 1, '0'),
(160, 23, 'started following you !', '2023-05-20 16:46:27', 17, 1, '0'),
(161, 21, 'started following you !', '2023-05-20 16:46:28', 17, 1, '0'),
(162, 28, 'started following you !', '2023-05-20 16:58:35', 29, 1, '0'),
(163, 27, 'started following you !', '2023-05-20 16:58:36', 29, 1, '0'),
(164, 27, 'started following you !', '2023-05-20 17:00:43', 17, 1, '0'),
(165, 28, 'started following you !', '2023-05-20 17:00:44', 17, 1, '0'),
(166, 29, 'started following you !', '2023-05-20 17:00:45', 17, 1, '0'),
(167, 31, 'started following you !', '2023-05-20 17:00:46', 17, 1, '0'),
(168, 29, 'started following you !', '2023-05-20 17:30:21', 28, 1, '0'),
(169, 29, 'liked your post !', '2023-05-20 17:31:12', 15, 1, '18'),
(170, 21, 'started following you !', '2023-05-20 17:42:49', 15, 1, '0'),
(171, 24, 'started following you !', '2023-05-20 18:17:15', 28, 1, '0'),
(172, 26, 'started following you !', '2023-05-21 11:02:50', 29, 0, '0'),
(173, 31, 'started following you !', '2023-05-21 11:02:51', 29, 1, '0'),
(174, 24, 'started following you !', '2023-05-21 11:02:52', 29, 1, '0'),
(175, 29, 'liked your post !', '2023-05-21 11:17:27', 15, 1, '20'),
(176, 29, 'commented on your post', '2023-05-21 11:17:54', 15, 1, '20'),
(177, 15, 'liked your post !', '2023-05-21 11:23:30', 20, 1, '22'),
(178, 15, 'unliked your post !', '2023-05-21 11:23:32', 20, 1, '22'),
(179, 15, 'liked your post !', '2023-05-21 11:23:32', 20, 1, '22'),
(180, 15, 'commented on your post', '2023-05-21 11:23:55', 20, 1, '22'),
(181, 15, 'commented on your post', '2023-05-21 11:25:19', 20, 1, '21'),
(182, 24, 'liked your post !', '2023-05-21 11:31:03', 29, 1, '24'),
(183, 24, 'commented on your post', '2023-05-21 11:31:25', 29, 1, '24'),
(184, 29, 'started following you !', '2023-05-21 12:53:06', 31, 1, '0'),
(185, 25, 'started following you !', '2023-05-21 17:24:37', 28, 0, '0'),
(186, 26, 'started following you !', '2023-05-21 17:24:38', 28, 0, '0'),
(187, 15, 'liked your post !', '2023-05-21 17:28:29', 27, 1, '27'),
(188, 25, 'started following you !', '2023-05-21 17:28:37', 27, 0, '0'),
(189, 29, 'started following you !', '2023-05-21 17:28:40', 27, 1, '0'),
(190, 15, 'started following you !', '2023-05-21 18:21:06', 37, 1, '0'),
(191, 17, 'started following you !', '2023-05-21 18:21:07', 37, 0, '0'),
(192, 24, 'liked your post !', '2023-05-21 21:13:53', 15, 0, '24'),
(193, 27, 'liked your post !', '2023-05-21 21:13:56', 15, 0, '23'),
(194, 29, 'liked your post !', '2023-05-21 21:14:10', 15, 1, '19'),
(195, 24, 'started following you !', '2023-05-22 10:09:56', 23, 0, '0'),
(196, 27, 'started following you !', '2023-05-22 10:09:57', 23, 0, '0'),
(197, 28, 'started following you !', '2023-05-22 10:09:58', 23, 0, '0'),
(198, 29, 'started following you !', '2023-05-22 10:09:59', 23, 1, '0'),
(199, 31, 'started following you !', '2023-05-22 10:10:00', 23, 0, '0'),
(200, 15, 'started following you !', '2023-05-22 10:24:49', 40, 1, '0'),
(201, 17, 'started following you !', '2023-05-22 10:24:50', 40, 0, '0'),
(202, 20, 'started following you !', '2023-05-22 10:24:50', 40, 0, '0'),
(203, 21, 'started following you !', '2023-05-22 10:24:52', 40, 0, '0'),
(204, 23, 'started following you !', '2023-05-22 10:24:52', 40, 0, '0'),
(205, 40, 'started following you !', '2023-05-22 10:46:22', 15, 0, '0');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_img` text NOT NULL,
  `post_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_img`, `post_text`, `created_at`, `id_user`) VALUES
(16, 15, '1684594669Capture2.PNG', '', '2023-05-20 14:57:49', NULL),
(19, 29, '1684667187p1.jpg', 'It was a great meeting at the library today :)', '2023-05-21 11:06:27', NULL),
(20, 29, '1684667804yu.jpg', 'je cherche un groupe avec qui je peux preparer mes exams, je suis smi s6.', '2023-05-21 11:16:44', NULL),
(21, 15, '1684667944p3.jpg', 'c\'étais ma première présentation merci d\'avoir venu.', '2023-05-21 11:19:04', NULL),
(22, 15, '1684668049m.jpg', 'qui peut m\'aider en php je suis un peu perdu??', '2023-05-21 11:20:49', NULL),
(23, 27, '1684668394t.jpg', '8 Mars', '2023-05-21 11:26:34', NULL),
(24, 24, '1684668468a.jpg', 'Si quelqu\'un est intéressé dm moi', '2023-05-21 11:27:48', NULL),
(27, 15, '1684687252p6.jpg', 'we had a good time pratcing java', '2023-05-21 16:40:52', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `profile_pic` text NOT NULL DEFAULT 'default_profile.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ac_status` int(11) NOT NULL COMMENT '0=not verified,1=active,2=blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `username`, `password`, `profile_pic`, `created_at`, `updated_at`, `ac_status`) VALUES
(15, 'Hajar', 'Douma', 2, 'hajardouma9@gmail.com', 'hajar', '9ccc598773c3b627675dcf47d1b16c5b', '1684761751v.jpg', '2023-05-20 13:34:55', '2023-05-22 13:22:31', 1),
(17, 'Stasse', 'Kelly', 2, 'Stassekelly@gmail.com', 'Stasse', '1528bb85bc50793f5bcc87359ed8f4cd', '16847616891684666603t.jpg', '2023-05-20 13:54:15', '2023-05-22 13:21:29', 1),
(20, 'Amine', 'Amellah', 1, 'thingsure87@gmail.com', 'amine_a', '30d2310007b75bf0180f5ed831f20fdb', '16847616271684666201st2.jpg', '2023-05-20 15:21:33', '2023-05-22 13:20:27', 1),
(21, 'Saadia', 'Smiri', 2, 'souadcharaf00@gmail.com', 'saadia', '2c8082fd9f0a6f82c4a3afae379c85fa', '16847615461684596884stu13.jpeg', '2023-05-20 15:33:07', '2023-05-22 13:19:06', 1),
(23, 'Hajar', 'Rizki', 2, 'mynaameisnot21@gmail.com', 'hajar_rizki', '9ccc598773c3b627675dcf47d1b16c5b', '16847614561684597522stu20.jpeg', '2023-05-20 15:44:21', '2023-05-22 13:17:36', 1),
(24, 'Karim', 'Chraibi', 1, 'Ikram.geremi2001@gmail.com', 'karim_ch', '2167a6ac80340b69f3b05b800417d6c7', '16847613951684597766stu14.jpeg', '2023-05-20 15:47:30', '2023-05-22 13:16:35', 1),
(25, 'Taha', 'Abid', 1, 'hdhajar996@gmail.com', 'taha_ab', 'ac812175fbea1db0550899be0d571eec', '16847612901684597998stu15.jpeg', '2023-05-20 15:51:35', '2023-05-22 13:14:50', 1),
(26, 'Samia', 'Berouch', 2, 'Samiaberouch@gmail.com', 'samia_b', '628f3fc1c1d8df8e5a0211abe4fcc2a4', '16847612151684595617stu2.jpeg', '2023-05-20 15:59:55', '2023-05-22 13:13:35', 1),
(27, 'Inass', 'Hanin', 2, 'inasshanin2@gmail.com', 'inas_s', '5306f77c87f3532152f9dbfffa1bd2fc', '1684598831ST1.jpeg', '2023-05-20 16:03:48', '2023-05-20 16:07:11', 1),
(28, 'Yassine', 'Iraqi', 1, 'yassineiraqi8@gmail.com', 'yas_sine', '5bfe0c405c67de32b1de9ea40d093666', '1684760620A.jpg', '2023-05-20 16:09:29', '2023-05-22 13:03:40', 1),
(29, 'Abla', 'Bellah', 2, 'ablabellah74@gmail.com', 'abla_bellah', '5dc3bd8045fa22b4ba39068a9ac3af9c', '16846691181684666914ab.jpg', '2023-05-20 16:13:51', '2023-05-21 11:38:38', 1),
(31, 'Ibrahim', 'Zaim', 1, 'ibrahimzaim03@gmail.com', 'ibrahim_zaim', 'f1c083e61b32d3a9be76bc21266b0648', '1684761030ST6.jpeg', '2023-05-20 16:20:17', '2023-05-22 13:10:30', 1),
(37, 'Sara', 'Alami', 1, 'tdreamer371@gmail.com', 'sara', '5bd537fc3789b5482e4936968f0fde95', '1684760959u.jpg', '2023-05-21 18:20:16', '2023-05-22 13:09:19', 1),
(40, 'Oumaima', 'Bourza', 1, 'bourza.oumaima@gmail.com', 'oumaima', 'c2b2dc5b0ffeb96aedae6f93b01ff353', '1684760803y.jpg', '2023-05-22 10:23:49', '2023-05-22 13:06:43', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `block_list`
--
ALTER TABLE `block_list`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`,`user_id`);

--
-- Index pour la table `follow_list`
--
ALTER TABLE `follow_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id` (`post_id`,`user_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_notif` (`id_notif`),
  ADD KEY `id_user1` (`id_user1`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `block_list`
--
ALTER TABLE `block_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `follow_list`
--
ALTER TABLE `follow_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
