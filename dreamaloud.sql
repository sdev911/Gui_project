-- phpMyAdmin SQL Dump
-- version 4.0.10.17
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 10, 2016 at 12:44 AM
-- Server version: 5.5.52
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dreamaloud`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(7) NOT NULL,
  `url_mod` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `target_id` int(20) NOT NULL,
  `target_name` varchar(30) NOT NULL,
  `creator_id` int(20) NOT NULL,
  `creator_username` varchar(30) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `action`, `url_mod`, `description`, `target_id`, `target_name`, `creator_id`, `creator_username`, `date_created`) VALUES
(10, 'edit', 'itemdetailview', ' edited the item ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-11-15 01:43:57'),
(11, 'edit', 'itemdetailview', ' edited the item ', 12, 'Yankee Doodle Kitty', 5, 'Seller1', '2016-11-15 01:49:43'),
(12, 'comment', 'itemdetailview', ' added the comment "What a great product!" to item ', 16, 'Spanish Senorita', 5, 'Seller1', '2016-11-15 01:49:59'),
(14, 'follow', 'profile', ' followed ', 5, 'Seller1', 1, 'allisoncollier', '2016-11-15 19:46:27'),
(15, 'follow', 'profile', ' followed ', 8, 'non_seller2', 3, 'user1', '2016-11-15 20:09:28'),
(16, 'follow', 'profile', ' followed ', 5, 'Seller1', 4, 'juliae13', '2016-11-15 21:41:56'),
(17, 'follow', 'profile', ' followed ', 5, 'Seller1', 9, 'aravindk', '2016-11-16 01:41:06'),
(18, 'comment', 'itemdetailview', ' added the comment "WOW!" to item ', 1, 'Pretty in Pink', 9, 'aravindk', '2016-11-16 01:46:59'),
(19, 'follow', 'profile', ' followed ', 9, 'aravindk', 10, 'stilldreamin', '2016-11-16 01:53:25'),
(20, 'comment', 'itemdetailview', ' added the comment "cool" to item ', 1, 'Pretty in Pink', 10, 'stilldreamin', '2016-11-16 02:01:39'),
(21, 'comment', 'itemdetailview', ' added the comment "Pretty hot for a cat" to item ', 1, 'Pretty in Pink', 4, 'juliae13', '2016-11-16 02:21:15'),
(22, 'comment', 'itemdetailview', ' added the comment "USA USA" to item ', 12, 'Yankee Doodle Kitty', 1, 'allisoncollier', '2016-11-16 02:22:13'),
(23, 'rating', 'itemdetailview', ' gave a 5 star rating to ', 15, 'Fishy Bow', 1, 'allisoncollier', '2016-11-16 02:22:40'),
(24, 'follow', 'profile', ' followed ', 8, 'non_seller2', 4, 'juliae13', '2016-11-16 02:23:02'),
(25, 'rating', 'itemdetailview', ' gave a 5 star rating to ', 15, 'Fishy Bow', 4, 'juliae13', '2016-11-16 02:26:51'),
(26, 'add', 'itemdetailview', ' added the product ', 53, 'Dinosaur Hat', 4, 'juliae13', '2016-11-16 03:15:31'),
(27, 'follow', 'profile', ' followed ', 4, 'juliae13', 7, 'non_seller1', '2016-11-16 04:01:59'),
(40, 'follow', 'profile', ' followed ', 4, 'juliae13', 12, 'raarathi', '2016-11-17 01:32:31'),
(41, 'rating', 'itemdetailview', ' gave a 4 star rating to ', 1, 'Pretty in Pink', 12, 'raarathi', '2016-11-17 01:37:29'),
(42, 'comment', 'itemdetailview', ' added the comment "LOVE IT" to item ', 1, 'Pretty in Pink', 12, 'raarathi', '2016-11-17 01:38:42'),
(43, 'follow', 'profile', ' followed ', 1, 'allisoncollier', 13, 'catlover67', '2016-11-19 16:30:17'),
(44, 'rating', 'itemdetailview', ' gave a 3 star rating to ', 15, 'Fishy Bow', 13, 'catlover67', '2016-11-19 16:33:03'),
(45, 'comment', 'itemdetailview', ' added the comment "Lol, I love this." to item ', 15, 'Fishy Bow', 13, 'catlover67', '2016-11-19 16:34:23'),
(46, 'rating', 'itemdetailview', ' gave a 3 star rating to ', 1, 'Pretty in Pink', 14, 'foo', '2016-11-20 06:27:46'),
(47, 'comment', 'itemdetailview', ' added the comment "cool" to item ', 1, 'Pretty in Pink', 14, 'foo', '2016-11-20 06:27:59'),
(48, 'comment', 'itemdetailview', ' added the comment "asdfdsaf" to item ', 1, 'Pretty in Pink', 15, 'f', '2016-11-20 21:51:36'),
(49, 'follow', 'profile', ' followed ', 14, 'foo', 15, 'f', '2016-11-20 21:51:52'),
(50, 'follow', 'profile', ' followed ', 13, 'catlover67', 16, 'patrick', '2016-11-20 23:32:38'),
(51, 'follow', 'profile', ' followed ', 13, 'catlover67', 16, 'patrick', '2016-11-20 23:32:57'),
(52, 'comment', 'itemdetailview', ' added the comment "dfg" to item ', 1, 'Pretty in Pink', 16, 'patrick', '2016-11-20 23:34:14'),
(53, 'rating', 'itemdetailview', ' gave a 3 star rating to ', 1, 'Pretty in Pink', 16, 'patrick', '2016-11-20 23:34:27'),
(54, 'follow', 'profile', ' followed ', 14, 'foo', 17, 'OMGCats', '2016-11-21 03:56:01'),
(55, 'rating', 'itemdetailview', ' gave a 5 star rating to ', 1, 'Pretty in Pink', 17, 'OMGCats', '2016-11-21 03:57:08'),
(56, 'rating', 'itemdetailview', ' gave a 4 star rating to ', 1, 'Pretty in Pink', 17, 'OMGCats', '2016-11-21 03:57:12'),
(57, 'rating', 'itemdetailview', ' gave a 5 star rating to ', 1, 'Pretty in Pink', 17, 'OMGCats', '2016-11-21 03:57:14'),
(58, 'comment', 'itemdetailview', ' added the comment "5/7 perfect score =D" to item ', 1, 'Pretty in Pink', 17, 'OMGCats', '2016-11-21 03:57:53'),
(59, 'follow', 'profile', ' followed ', 1, 'allisoncollier', 18, 'test user', '2016-11-21 18:39:00'),
(60, 'comment', 'itemdetailview', ' added the comment "Test" to item ', 1, 'Pretty in Pink', 18, 'test user', '2016-11-21 18:41:49'),
(61, 'follow', 'profile', ' followed ', 17, 'OMGCats', 19, 'ComputerNerd310', '2016-11-21 22:36:22'),
(62, 'rating', 'itemdetailview', ' gave a 3 star rating to ', 1, 'Pretty in Pink', 19, 'ComputerNerd310', '2016-11-21 22:37:03'),
(63, 'comment', 'itemdetailview', ' added the comment "I think OMGCats browses Imgur" to item ', 1, 'Pretty in Pink', 19, 'ComputerNerd310', '2016-11-21 22:37:41'),
(64, 'rating', 'itemdetailview', ' gave a 4 star rating to ', 15, 'Fishy Bow', 20, 'pejman', '2016-11-22 01:34:03'),
(65, 'follow', 'profile', ' followed ', 5, 'Seller1', 20, 'pejman', '2016-11-22 01:34:28'),
(66, 'follow', 'profile', ' followed ', 5, 'Seller1', 20, 'pejman', '2016-11-22 01:34:29'),
(67, 'comment', 'itemdetailview', ' added the comment "I love those glasses" to item ', 1, 'Pretty in Pink', 20, 'pejman', '2016-11-22 01:37:30'),
(68, 'comment', 'itemdetailview', ' added the comment "This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers!This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers!This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers!This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers!" to item ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-03 19:31:05'),
(69, 'rating', 'itemdetailview', ' gave a 3 star rating to ', 16, 'Spanish Senorita', 1, 'allisoncollier', '2016-12-07 20:44:06'),
(70, 'rating', 'itemdetailview', ' gave a 5 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-08 20:14:31'),
(71, 'rating', 'itemdetailview', ' gave a 2 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-08 20:14:36'),
(72, 'rating', 'itemdetailview', ' gave a 5 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-08 20:14:38'),
(73, 'rating', 'itemdetailview', ' gave a 1 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-08 20:14:40'),
(74, 'rating', 'itemdetailview', ' gave a 4 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-08 21:46:42'),
(75, 'rating', 'itemdetailview', ' gave a 4 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-08 21:48:05'),
(76, 'rating', 'itemdetailview', ' gave a 1 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-08 21:48:12'),
(77, 'rating', 'itemdetailview', ' gave a 5 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-08 21:48:15'),
(78, 'rating', 'itemdetailview', ' gave a 1 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-08 21:48:19'),
(79, 'comment', 'itemdetailview', ' added the comment "Peeeeeee nis" to item ', 15, 'Fishy Bow', 27, 'FishDix', '2016-12-08 23:50:37'),
(80, 'follow', 'profile', ' followed ', 13, 'catlover67', 27, 'FishDix', '2016-12-08 23:50:52'),
(81, 'rating', 'itemdetailview', ' gave a 3 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-09 02:26:41'),
(82, 'rating', 'itemdetailview', ' gave a 4 star rating to ', 1, 'Pretty in Pink', 1, 'allisoncollier', '2016-12-09 02:26:50'),
(83, 'follow', 'profile', ' followed ', 8, 'non_seller2', 1, 'allisoncollier', '2016-12-09 16:52:37'),
(84, 'follow', 'profile', ' followed ', 18, 'test user', 3, 'user1', '2016-12-09 20:20:33'),
(85, 'follow', 'profile', ' followed ', 12, 'raarathi', 3, 'user1', '2016-12-09 20:20:44'),
(86, 'follow', 'profile', ' followed ', 13, 'catlover67', 5, 'Seller1', '2016-12-09 20:26:42'),
(87, 'follow', 'profile', ' followed ', 7, 'non_seller1', 15, 'f', '2016-12-09 20:27:44'),
(88, 'add', 'itemdetailview', ' added the product ', 65, 'PH', 1, 'allisoncollier', '2016-12-09 20:27:50'),
(89, 'add', 'itemdetailview', ' added the product ', 66, 'PH', 1, 'allisoncollier', '2016-12-09 20:28:22'),
(90, 'follow', 'profile', ' followed ', 12, 'raarathi', 19, 'ComputerNerd310', '2016-12-09 20:28:46'),
(91, 'follow', 'profile', ' followed ', 4, 'juliae13', 19, 'ComputerNerd310', '2016-12-09 20:29:02'),
(92, 'follow', 'profile', ' followed ', 19, 'ComputerNerd310', 21, 'theognick', '2016-12-09 20:30:20'),
(93, 'follow', 'profile', ' followed ', 18, 'test user', 6, 'Seller2', '2016-12-09 20:44:26'),
(94, 'follow', 'profile', ' followed ', 3, 'user1', 14, 'foo', '2016-12-09 20:45:33'),
(95, 'follow', 'profile', ' followed ', 3, 'user1', 1, 'allisoncollier', '2016-12-09 23:00:03'),
(96, 'rating', 'itemdetailview', ' gave a 2 star rating to ', 16, 'Spanish Senorita', 1, 'allisoncollier', '2016-12-10 00:03:41'),
(97, 'rating', 'itemdetailview', ' gave a 4 star rating to ', 16, 'Spanish Senorita', 1, 'allisoncollier', '2016-12-10 00:03:45'),
(98, 'follow', 'profile', ' followed ', 19, 'ComputerNerd310', 1, 'allisoncollier', '2016-12-10 00:03:52'),
(99, 'add', 'itemdetailview', ' added the product ', 67, 'PH', 1, 'allisoncollier', '2016-12-10 00:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `creator_id`, `title`, `image_url`, `price`) VALUES
(30, 1, 'Fishy Bow', 'cat9.jpg', '120.00'),
(31, 0, 'Pretty in Pink', 'cat1.jpg', '70.00'),
(32, 15, 'Pretty in Pink', 'cat1.jpg', '70.00'),
(33, 21, 'Fishy Bow', 'cat9.jpg', '120.00');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) NOT NULL,
  `comment` text NOT NULL,
  `creator_id` int(20) NOT NULL,
  `creator_username` varchar(30) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `comment`, `creator_id`, `creator_username`, `date_created`) VALUES
(3, 13, 'here is a comment', 1, 'allisoncollier', '2016-11-08 15:36:31'),
(4, 13, 'way too cute!!!', 1, 'allisoncollier', '2016-11-08 16:18:41'),
(5, 15, 'awww', 1, 'allisoncollier', '2016-11-08 16:41:18'),
(6, 16, 'I like the look of this outfit a lot!', 3, 'user1', '2016-11-08 18:06:47'),
(8, 14, 'So cute!', 1, 'allisoncollier', '2016-11-09 17:23:13'),
(9, 16, 'Pretty cool!', 1, 'allisoncollier', '2016-11-09 17:25:08'),
(10, 14, 'Kitty cat', 1, 'allisoncollier', '2016-11-11 17:26:17'),
(11, 5, 'I love commenting!!', 3, 'user1', '2016-11-13 00:49:11'),
(12, 14, '', 4, 'juliae13', '2016-11-14 15:00:13'),
(13, 15, 'Its so fishy!!', 5, 'Seller1', '2016-11-14 18:15:20'),
(14, 16, 'What a great product!', 5, 'Seller1', '2016-11-15 01:49:59'),
(15, 14, 'Adorbs', 1, 'allisoncollier', '2016-11-15 02:21:19'),
(16, 1, 'WOW!', 9, 'aravindk', '2016-11-16 01:46:59'),
(17, 1, 'cool', 10, 'stilldreamin', '2016-11-16 02:01:39'),
(18, 1, 'Pretty hot for a cat', 4, 'juliae13', '2016-11-16 02:21:15'),
(19, 12, 'USA USA', 1, 'allisoncollier', '2016-11-16 02:22:13'),
(20, 1, 'LOVE IT', 12, 'raarathi', '2016-11-17 01:38:42'),
(21, 15, 'Lol, I love this.', 13, 'catlover67', '2016-11-19 16:34:23'),
(22, 1, 'cool', 14, 'foo', '2016-11-20 06:27:59'),
(23, 1, 'asdfdsaf', 15, 'f', '2016-11-20 21:51:36'),
(24, 1, 'dfg', 16, 'patrick', '2016-11-20 23:34:14'),
(25, 1, '5/7 perfect score =D', 17, 'OMGCats', '2016-11-21 03:57:53'),
(26, 1, 'Test', 18, 'test user', '2016-11-21 18:41:49'),
(27, 1, 'I think OMGCats browses Imgur', 19, 'ComputerNerd310', '2016-11-21 22:37:41'),
(28, 1, 'I love those glasses', 20, 'pejman', '2016-11-22 01:37:30'),
(29, 1, 'This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers!This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers!This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers!This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers! This is literally the cutest hat I have ever laid eyes on. A must have for all dinosaur lovers!', 1, 'allisoncollier', '2016-12-03 19:31:05'),
(30, 15, 'Peeeeeee nis', 27, 'FishDix', '2016-12-08 23:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE IF NOT EXISTS `followers` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `follower_id` int(20) NOT NULL,
  `following_id` int(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `follower_id`, `following_id`, `date_created`) VALUES
(1, 3, 1, '2016-11-08 18:38:44'),
(4, 4, 1, '2016-11-11 21:41:33'),
(7, 5, 3, '2016-11-14 18:54:47'),
(12, 8, 1, '2016-11-15 19:08:54'),
(14, 1, 5, '2016-11-15 19:46:27'),
(17, 9, 5, '2016-11-16 01:41:06'),
(18, 10, 9, '2016-11-16 01:53:25'),
(19, 4, 8, '2016-11-16 02:23:02'),
(20, 7, 4, '2016-11-16 04:01:59'),
(22, 12, 4, '2016-11-17 01:32:31'),
(23, 13, 1, '2016-11-19 16:30:17'),
(26, 16, 13, '2016-11-20 23:32:57'),
(27, 17, 14, '2016-11-21 03:56:01'),
(28, 18, 1, '2016-11-21 18:39:00'),
(29, 19, 17, '2016-11-21 22:36:22'),
(30, 20, 5, '2016-11-22 01:34:28'),
(31, 20, 5, '2016-11-22 01:34:29'),
(32, 27, 13, '2016-12-08 23:50:52'),
(33, 1, 8, '2016-12-09 16:52:37'),
(34, 3, 18, '2016-12-09 20:20:33'),
(35, 3, 12, '2016-12-09 20:20:44'),
(36, 5, 13, '2016-12-09 20:26:42'),
(37, 15, 7, '2016-12-09 20:27:44'),
(38, 19, 12, '2016-12-09 20:28:46'),
(39, 19, 4, '2016-12-09 20:29:02'),
(40, 21, 19, '2016-12-09 20:30:20'),
(41, 6, 18, '2016-12-09 20:44:26'),
(42, 14, 3, '2016-12-09 20:45:33');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text,
  `sizes` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `sizes`, `price`, `image_url`, `creation_date`, `creator_id`) VALUES
(1, 'Pretty in Pink', 'This pink number is sure to impress!  This was made specially for any cat who loves Pink!!', 'small, large', '70.00', 'cat1.jpg', '2016-11-14 15:14:30', 6),
(3, 'Rainbow Hippie', 'This outfit is perfect for cats who love pink and rainbow!', 'small, medium, large, extra-large', '65.00', 'cat2.jpg', '2016-10-28 16:08:11', 1),
(5, 'Beach Bummin''', 'This is a classic look for a kitty who loves the sun and looking good in it!', 'small, medium, large, extra-large', '35.00', 'cat3.jpg', '2016-11-14 15:01:53', 5),
(6, 'Nature Goddess', 'Does your cat love nature? Then this is the outfit for them!  The brown can complement any fur color.', 'small, medium, large, extra-large', '70.00', 'cat4.jpg', '2016-11-14 15:01:58', 5),
(7, 'Rhapsody in Blue', 'Looks lovely on any cat.  Can be used as formalwear or just when out on the town.', 'small, medium, large', '70.00', 'cat5.jpg', '2016-11-14 15:02:08', 6),
(12, 'Yankee Doodle Kitty', 'This patriotic number is festive and perfect for the fourth of July or any day that your kitty wants to look absolutely fabulous and celebrate the good ole'' U S of A!', 'small, large', '50.00', 'cat6.jpg', '2016-11-14 15:02:01', 5),
(13, 'Cutie Patootie', 'This baby blue and purple bow and outfit are perfect for your cutie.  It even says so on the butt!!', 'small, medium', '40.00', 'cat7.jpg', '2016-10-28 16:10:59', 1),
(14, 'Cupid''s Valentine', 'This outfit is perfect for valentine''s day, or for date night when you want to spice it up a bit.  Treat your kitty to this festive outfit today!', 'small, large', '55.00', 'cat8.jpg', '2016-11-14 15:02:04', 6),
(15, 'Fishy Bow', 'This headpiece will make your pussy think they''re a fish!', 'small', '120.00', 'cat9.jpg', '2016-11-14 15:14:24', 5),
(16, 'Spanish Senorita', 'Perfect for the cat who loves to dance!', 'large', '120.00', 'cat10.jpg', '2016-11-14 15:03:16', 6),
(17, 'Tough with Fluff', 'If your cat is a bit of a tomboy, get them this cute outfit!  Just make sure they promise to play nice', 'small', '15.00', 'cat11.jpg', '2016-10-28 16:13:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) NOT NULL,
  `rating` int(1) NOT NULL,
  `creator_id` int(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `product_id`, `rating`, `creator_id`, `date_created`) VALUES
(10, 12, 4, 1, '2016-11-16 02:02:21'),
(11, 1, 2, 4, '2016-11-16 02:07:00'),
(12, 14, 5, 4, '2016-11-16 02:20:21'),
(13, 15, 5, 1, '2016-11-16 02:22:40'),
(14, 15, 5, 4, '2016-11-16 02:26:51'),
(15, 1, 4, 12, '2016-11-17 01:37:29'),
(16, 15, 3, 13, '2016-11-19 16:33:03'),
(17, 1, 3, 14, '2016-11-20 06:27:46'),
(18, 1, 3, 16, '2016-11-20 23:34:27'),
(19, 1, 5, 17, '2016-11-21 03:57:14'),
(20, 1, 3, 19, '2016-11-21 22:37:03'),
(21, 15, 4, 20, '2016-11-22 01:34:03'),
(22, 16, 4, 1, '2016-12-10 00:03:45'),
(23, 1, 4, 1, '2016-12-09 02:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT '0' COMMENT '0 is a default user, 1 is a seller, 2 is admin',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bio` text,
  `gender` varchar(8) NOT NULL,
  `color` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password_hash`, `email`, `user_type`, `creation_date`, `bio`, `gender`, `color`) VALUES
(1, 'Allison', 'Collier', 'allisoncollier', '$2y$10$xINgsKj03iY9lVELFPsmEOcnTnL6PMjWoY0ISbNmdhmX1197md.eC', 'Allison@gmail.com', 2, '2016-12-08 22:23:00', 'Just a small town girl- living in a lonely world. -Journey', 'other', '#4923ff'),
(3, 'first', 'last', 'user1', '$2y$10$sz/NmFgOtzTif06EH4R1Q.hIPvyzJC.2FigWwdoW5TvND75ypl8uG', 'user1@gmail.com', 1, '2016-12-08 22:23:21', 'I''m a user who likes cats.  Go cats!!', 'male', '#2fdb65'),
(4, 'Julia', 'Evans', 'juliae13', '$2y$10$.EYusBhr6xxWnmDQhiYlc.lUEIE42UUEfKeHcHtw2bBO76YCFYjaO', 'juliae13@vt.edu', 0, '2016-12-08 22:23:42', 'I''m a long-time cat lover who has a cat and fosters cats.  Having a wide array of cute kitty clothing helps me get my foster cats adopted!', 'female', '#22e2b8'),
(5, 'Bobby', 'Deer', 'Seller1', '$2y$10$YzJU9JoWtHsEGZcYXEE2w.88Nt6zcsNR2QBdy2JPcHeI9mP1NkSya', 'seller1@gmail.com', 1, '2016-12-08 22:23:49', 'Don''t really like cats...  just in this for the money.', 'male', '#16ac01'),
(6, 'Sally', 'Sitwell', 'Seller2', '$2y$10$7rl.BjBlLVttDTes7kerK.BPyJGu.tjGN1SBQMxF5adHno4L77YGG', 'seller2@gmail.com', 1, '2016-12-08 22:24:05', 'Cat''s are my life! I''ve been sewing cat clothing for 10 years and I hope my products brighten you and your cats'' days!', 'female', '#2555ca'),
(7, 'Benny', 'Blythe', 'non_seller1', '$2y$10$HReWKzlEI02TqGB8YrQhB.0fxhcr2cxvNRvtb8NVugffQOt283az6', 'non_seller1@gmail.com', 0, '2016-12-08 22:24:12', 'Cats are so cute!!  I currently have 13 cats, and they love looking fancy!', 'male', '#FF0000'),
(8, 'Bonnie', 'Bluth', 'non_seller2', '$2y$10$pcIYkPp3HzN65.PfkKtD5OzZqOrVmCWad5bgsrMhK45NKRmitt9ze', 'non_seller2@gmail.com', 0, '2016-12-08 22:24:21', 'I''m transcat, meaning I''m a cat born in a hooman''s body.  Meow!', 'female', '#04e946'),
(9, 'Kavin', 'Aravind', 'aravindk', '$2y$10$yvgTHD/.LS1lSND1Xs/No.LyagbKb4swW8td8CXK1DBtVkZ2qjyR.', 'aravindk@vt.edu', 0, '2016-12-08 22:24:28', 'Profile', 'male', '#1a8773'),
(10, 'street', 'dreams', 'stilldreamin', '$2y$10$5mDnBtldboTbPiVBTSvw4um4B7GLZgGw7z0NM7Htr.M5i07sU//ya', 'dream@dream.com', 0, '2016-12-08 22:24:35', '', 'male', '#1a8773'),
(12, 'Aarathi', 'Raghuraman', 'raarathi', '$2y$10$OOGVZjq//Dd6bGZhAbULceWsFZdWyd0lhSBxAaBwFHoP7cfcinbMS', 'aarathiraghuraman2@gmail.com', 0, '2016-12-08 22:25:02', 'BLa BLA', 'female', '#edd433'),
(13, 'Melanie', 'Trammell', 'catlover67', '$2y$10$dQ2pOVuOh138p2a13Cj/2.Mwiu.rnl4r1ju3I.CmDmxCLNVaVxCAO', 'blah@gmail.com', 0, '2016-12-08 22:25:09', 'Cats yay!', 'female', '#ff2e31'),
(14, 'Foo', 'bar', 'foo', '$2y$10$s340Viy4IJJXwfoLF1/xIOyp/R2kpuMx9btQ2IwPBzdI2zUBsez8q', 'blah@gmail.com', 0, '2016-12-08 22:25:16', '', 'male', '#bf9311'),
(15, 'fdasdf', 'fdadsf', 'f', '$2y$10$AqyV8lb6NXZakEkbtMBO2Owhju2zQVGY9a5bjtVMXKiLsJsUcWBdK', 'asdffd@vt', 0, '2016-12-08 22:25:32', 'adsfdsaf', 'other', '#fdd63e'),
(16, 'patrick', 'patrick', 'patrick', '$2y$10$jm40U.uyM5/fwrqpUeOxTudw5HrG3MKb54szrvQJ6kyPYjixIvqpC', 'patrick@gmail.com', 0, '2016-12-08 22:25:43', '', 'male', '#10fe93'),
(17, 'person', 'mcpersonface', 'OMGCats', '$2y$10$lEzE.7pMdgWnSnvALJpo8en5G7rbbAcDMmraOwGpmSLd2QEhZKQ8S', 'something@nope.com', 0, '2016-12-08 22:25:53', 'I am a person i swear', 'other', '#812099'),
(18, 'Bob', 'Allen', 'test user', '$2y$10$Jam4hXagq1XwIyKOxpVsAe0Ug6gt8hKwmyj8l.4VJ/n8SQKzp91WK', 'none@vt.edu', 0, '2016-12-08 22:26:03', 'None', 'male', '#ce86d6'),
(19, 'Testy', 'McTestFace', 'ComputerNerd310', '$2y$10$kb1fOIb6ZiKycu6.Y9dCCu3gjYTJaSJo4KUg.sVidJd3F6RzjeJNu', 'anonymous@vt.edu', 0, '2016-12-08 22:26:11', 'This is a bio', 'male', '#fe10d5'),
(20, 'pejman', 'maybe', 'pejman', '$2y$10$EVhXWDrT5EfINM9CC/.pK.rsWSpnWBgtc0jd2cF3jw4N93jRSZCBG', 'peji@vt.edu', 0, '2016-12-08 22:26:21', 'Hello', 'male', '#bbca33'),
(21, 'Nick', 'Tester', 'theognick', '$2y$10$WFyYODIjAC/9ctKFYfochOY/Ll1KID1I39xHkcSkDNpPjG4dy36gO', 'test@nothing.com', 0, '2016-12-08 22:26:28', 'I like cats', 'male', '#54ddeb'),
(27, 'Matteo', 'Feeshmon', 'FishDix', '$2y$10$zy4oDvLnsVEut10BB5h.4eEVp6b3SIezLBOISTStO0YQ6jRmJ/fKO', 'matthewHfishman@gmail.com', 0, '2016-12-08 23:50:17', NULL, '', '#ffe302');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
