-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2017 at 05:18 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wine_is_terroir`
--

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menuID` int(10) NOT NULL,
  `menuType` text NOT NULL,
  `foodOneName` text NOT NULL,
  `foodOneImage` varchar(50) DEFAULT NULL,
  `foodOneText` text,
  `foodTwoName` text NOT NULL,
  `foodTwoImage` varchar(50) DEFAULT NULL,
  `foodTwoText` text,
  `foodThreeName` text NOT NULL,
  `foodThreeImage` varchar(50) DEFAULT NULL,
  `foodThreeText` text,
  `foodFourName` text,
  `foodFourImage` text,
  `foodFourText` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menuID`, `menuType`, `foodOneName`, `foodOneImage`, `foodOneText`, `foodTwoName`, `foodTwoImage`, `foodTwoText`, `foodThreeName`, `foodThreeImage`, `foodThreeText`, `foodFourName`, `foodFourImage`, `foodFourText`) VALUES
(1, 'specials', 'Beet Gazpacho', 'food11.jpg', 'Yuzu Crab and Curried Egg @ $12.00', 'Fennel and Rhubarb Salad', 'food12.jpg', 'Celery, Cashew Brittle, Candied Vinegar Vinaigrette @ $8.00', 'Beets and Burrata', 'food13.jpg', 'Banyuls Vinaigrette @ $9.00', 'Charred Greens ', 'food14.jpg', 'Tofu emulsion, Radish @ $8.00'),
(2, 'snacks', 'BBQ Chips', 'food21.jpg', 'For only $4.00', 'Pickles', 'food22.jpg', 'For only $6.00', 'Smokey Almonds', 'food23.jpg', 'For only $6.00', 'Deviled eggs', 'food24.jpg', 'For only $4.00'),
(3, 'oysters', 'Fin De La Bai', 'food31.jpg', 'For only $2.75', 'Barnstable', 'food32.jpg', 'For only $2.75', 'Snow Island', 'food33.jpg', 'For only $2.75', 'Barcat', 'food34.jpg', 'For only $2.75'),
(4, 'cheese', 'Chevrot', 'food41.jpg', 'Pasteurized Goat-France @ $7.00', 'Rollright', 'food42.jpg', 'Pasteurized Cow-England @ $10.00', 'Toma Piemontese', 'food43.jpg', 'Pasteurized Cow-Italy @ $5.00', 'Point Reyes "Original Blue"', 'food44.jpg', 'Raw Cow-California @ $5.00'),
(5, 'Charcuterie', 'Cacciatore', 'food51.jpg', 'Olympic Provisions-Portland @ $7.00', 'Saucisson', 'food52.jpg', 'Olympic Provisions-Portland @ $7.00', 'Bresaola', 'food53.jpg', 'Salumeria Biellese @ $7.00', 'Rosette de Lyon', 'food54.jpg', 'Salumeria Biellese @ $5.00'),
(6, 'sweets', 'Chocolate custard', 'food61.jpg', 'For only $4.00', 'Vanilla Creme Brulee', 'food62.jpg', 'For only $4.00', 'Caramel Apple Bread Pudding', 'food63.jpg', 'For only $4.00', 'Chocolate Bread Pudding', 'food64.jpg', 'For Only $4.00'),
(7, 'drinks', 'Wine', 'food71.jpg', 'These aromatized wines cure all evils', 'Vermouth', 'food72.jpg', 'Because apple cider is as American as apple pie', 'Beer', 'food73.jpg', 'It''s beer, just drink it', 'Montilla', 'food74.jpg', 'Spain has given us Gaudi / Don Quixote / Xavi and….');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menuID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menuID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
