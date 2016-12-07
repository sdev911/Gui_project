-- phpMyAdmin SQL Dump
-- version 4.0.10.17
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 16, 2016 at 04:37 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

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
(28, 'add', 'itemdetailview', ' added the product ', 55, 'Test', 1, 'allisoncollier', '2016-11-16 04:15:29'),
(29, 'remove', 'itemdetailview', ' removed ', 56, '', 1, 'allisoncollier', '2016-11-16 04:15:37'),
(30, 'remove', 'itemdetailview', ' removed ', 55, 'Test', 1, 'allisoncollier', '2016-11-16 04:15:43');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `creator_id`, `title`, `image_url`, `price`) VALUES
(30, 1, 'Fishy Bow', 'cat9.jpg', '120.00'),
(31, 0, 'Pretty in Pink', 'cat1.jpg', '70.00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

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
(19, 12, 'USA USA', 1, 'allisoncollier', '2016-11-16 02:22:13');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `follower_id`, `following_id`, `date_created`) VALUES
(1, 3, 1, '2016-11-08 18:38:44'),
(4, 4, 1, '2016-11-11 21:41:33'),
(6, 5, 1, '2016-11-14 18:15:39'),
(7, 5, 3, '2016-11-14 18:54:47'),
(12, 8, 1, '2016-11-15 19:08:54'),
(14, 1, 5, '2016-11-15 19:46:27'),
(15, 3, 8, '2016-11-15 20:09:28'),
(16, 4, 5, '2016-11-15 21:41:56'),
(17, 9, 5, '2016-11-16 01:41:06'),
(18, 10, 9, '2016-11-16 01:53:25'),
(19, 4, 8, '2016-11-16 02:23:02'),
(20, 7, 4, '2016-11-16 04:01:59'),
(21, 0, 4, '2016-11-16 04:25:41');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `product_id`, `rating`, `creator_id`, `date_created`) VALUES
(10, 12, 4, 1, '2016-11-16 02:02:21'),
(11, 1, 2, 4, '2016-11-16 02:07:00'),
(12, 14, 5, 4, '2016-11-16 02:20:21'),
(13, 15, 5, 1, '2016-11-16 02:22:40'),
(14, 15, 5, 4, '2016-11-16 02:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT '0' COMMENT '0 is a default user, 1 is a seller, 2 is admin',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bio` text,
  `gender` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `user_type`, `creation_date`, `bio`, `gender`) VALUES
(1, 'Allison', 'Collier', 'allisoncollier', 'password', 'allison@gmail.com', 2, '2016-11-15 13:35:02', 'Hello', 'female'),
(3, 'first', 'last', 'user1', 'password', 'user1@gmail.com', 1, '2016-11-15 18:22:39', 'I''m a user who likes cats.  Go cats!!', 'male'),
(4, 'Julia', 'Evans', 'juliae13', 'password', 'juliae13@vt.edu', 0, '2016-11-15 18:22:44', 'I''m a long-time cat lover who has a cat and fosters cats.  Having a wide array of cute kitty clothing helps me get my foster cats adopted!', 'female'),
(5, 'Bobby', 'Deer', 'Seller1', '123', 'seller1@gmail.com', 1, '2016-11-15 18:22:49', 'Don''t really like cats...  just in this for the money.', 'male'),
(6, 'Sally', 'Sitwell', 'Seller2', '12345', 'seller2@gmail.com', 1, '2016-11-15 18:22:53', 'Cat''s are my life! I''ve been sewing cat clothing for 10 years and I hope my products brighten you and your cats'' days!', 'female'),
(7, 'Benny', 'Blythe', 'non_seller1', '12345', 'non_seller1@gmail.com', 0, '2016-11-15 18:22:57', 'Cats are so cute!!  I currently have 13 cats, and they love looking fancy!', 'male'),
(8, 'Bonnie', 'Bluth', 'non_seller2', '1234567', 'non_seller2@gmail.com', 0, '2016-11-15 18:23:00', 'I''m transcat, meaning I''m a cat born in a hooman''s body.  Meow!', 'female'),
(9, 'Kavin', 'Aravind', 'aravindk', 'password', 'aravindk@vt.edu', 0, '2016-11-16 01:36:15', 'Profile', 'male'),
(10, 'street', 'dreams', 'stilldreamin', 'kanyenas', 'dream@dream.com', 0, '2016-11-16 01:48:46', '', 'male');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
