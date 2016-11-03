-- phpMyAdmin SQL Dump
-- version 4.0.10.17
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 01, 2016 at 02:12 AM
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
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `title`, `image_url`, `price`) VALUES
(20, 'Tough with Fluff', 'cat11.jpg', '15.00'),
(21, 'Rainbow Hippie', 'cat2.jpg', '65.00'),
(22, 'Pretty in Pink', 'cat1.jpg', '70.00'),
(23, 'Rhapsody in Blue', 'cat5.jpg', '70.00'),
(24, 'Pretty in Pink', 'cat1.jpg', '70.00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `sizes`, `price`, `image_url`, `creation_date`, `creator_id`) VALUES
(1, 'Pretty in Pink', 'This pink number is sure to impress!  This was made specially for any cat who loves Pink!!', 'small, large', '70.00', 'cat1.jpg', '2016-10-28 16:07:42', 1),
(3, 'Rainbow Hippie', 'This outfit is perfect for cats who love pink and rainbow!', 'small, medium, large, extra-large', '65.00', 'cat2.jpg', '2016-10-28 16:08:11', 1),
(5, 'Beach Bummin''', 'This is a classic look for a kitty who loves the sun and looking good in it!', 'small, medium, large, extra-large', '35.00', 'cat3.jpg', '2016-10-28 16:08:35', 1),
(6, 'Nature Goddess', 'Does your cat love nature? Then this is the outfit for them!  The brown can complement any fur color.', 'small, medium, large, extra-large', '70.00', 'cat4.jpg', '2016-10-28 16:10:16', 1),
(7, 'Rhapsody in Blue', 'Looks lovely on any cat.  Can be used as formalwear or just when out on the town.', 'small, medium, large', '70.00', 'cat5.jpg', '2016-10-28 16:10:24', 1),
(12, 'Yankee Doodle Kitty', 'This patriotic number is festive and perfect for the fourth of July or any day that your kitty wants to look absolutely fabulous and celebrate the good ole'' U S of A!', 'small, large', '50.00', 'cat6.jpg', '2016-10-28 16:10:44', 1),
(13, 'Cutie Patootie', 'This baby blue and purple bow and outfit are perfect for your cutie.  It even says so on the butt!!', 'small, medium', '40.00', 'cat7.jpg', '2016-10-28 16:10:59', 1),
(14, 'Cupid''s Valentine', 'This outfit is perfect for valentine''s day, or for date night when you want to spice it up a bit.  Treat your kitty to this festive outfit today!', 'small, large', '55.00', 'cat8.jpg', '2016-10-28 16:13:41', 1),
(15, 'Fishy Bow', 'This headpiece will make your pussy think they''re a fish!', 'small', '120.00', 'cat9.jpg', '2016-10-28 16:13:27', 1),
(16, 'Spanish Senorita', 'Perfect for the cat who loves to dance!', 'large', '120.00', 'cat10.jpg', '2016-10-28 16:13:24', 1),
(17, 'Tough with Fluff', 'If your cat is a bit of a tomboy, get them this cute outfit!  Just make sure they promise to play nice', 'small', '15.00', 'cat11.jpg', '2016-10-28 16:13:03', 1);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`) VALUES
(1, 'Allison', 'Collier', 'allisoncollier', 'password', 'allison@gmail.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
