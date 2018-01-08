-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 27, 2017 at 01:17 pm
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

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
-- Table structure for table `comments_and_mailing_list`
--

CREATE TABLE `comments_and_mailing_list` (
  `commentID` int(2) NOT NULL,
  `Name` text NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Comment` text NOT NULL,
  `Mailing_List` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments_and_mailing_list`
--

INSERT INTO `comments_and_mailing_list` (`commentID`, `Name`, `Email`, `PhoneNumber`, `Comment`, `Mailing_List`) VALUES
(1, '', '', '', '', 0),
(2, '', '', '', '', 0),
(3, '', '', '', '', 0),
(4, '', '', '', '', 0),
(5, 'abcd', 'someoneexample.com', '212555555', 'i am tired', 0),
(6, 'abcd', 'someoneexample.com', '212555555', 'i am tired', 0),
(7, 'abcd', 'someone@example.com', '212555555', 'i am tired', 0),
(8, 'abcd', 'someone@example.com', '212555555', 'i am tired', 0),
(9, 'abcdefgh', 'somebody@example.com', '212555555', 'i am tired 1234', 0),
(10, 'Alejandro Muriithi', 'superhotfaiya@gmail.com', '12345679', 'This is really cool. ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `Code` varchar(10) NOT NULL,
  `meal_type` text NOT NULL,
  `Name` text NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  `Image_Url` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`Code`, `meal_type`, `Name`, `Cost`, `Image_Url`) VALUES
('CHAR0001', 'Charcuterie', 'Cacciatore', '7.00', 'img/food51.jpg'),
('CHAR0002', 'Charcuterie', 'Saucisson', '7.00', 'img/food52.jpg'),
('CHAR0003', 'Charcuterie', 'Bresaola', '7.00', 'img/food53.jpg'),
('CHAR0004', 'Charcuterie', 'Rosette de Lyon', '5.00', 'img/food54.jpg'),
('CHE0001', 'Cheese', 'Chevrot', '7.00', 'img/food41.jpg'),
('CHE0002', 'Cheese', 'Rollright', '10.00', 'img/food42.jpg'),
('CHE0003', 'Cheese', 'Toma Piemontese', '5.00', 'img/food43.jpg'),
('CHE0004', 'Cheese', 'Point Reyes', '5.00', 'img/food44.jpg'),
('DRI0001', 'Drinks', 'Wine', '10.00', 'img/food71.jpg'),
('DRI0002', 'Drinks', 'Vermouth', '8.50', 'img/food72.jpg'),
('DRI0003', 'Drinks', 'Beer', '7.00', 'img/food73.jpg'),
('DRI0004', 'Drinks', 'Montilla', '8.00', 'img/food74.jpg'),
('OYS0001', 'Oysters', 'Fin De La Bai', '2.75', 'img/food31.jpg'),
('OYS0002', 'Oysters', 'Barnstable', '2.75', 'img/food32.jpg'),
('OYS0003', 'Oysters', 'Snow Island', '2.75', 'img/food33.jpg'),
('OYS0004', 'Oysters', 'Barcat', '2.75', 'img/food34.jpg'),
('SNA0001', 'Snacks', 'Pickles', '6.00', 'img/food22.jpg'),
('SNA0002', 'Snacks', 'BBQ Chips', '4.00', 'img/food21.jpg'),
('SNA0003', 'Snacks', 'Smokey Almonds', '6.00', 'img/food23.jpg'),
('SNA0004', 'Snacks', 'Deviled Eggs', '4.00', 'img/food24.jpg'),
('SPEC0001', 'Specials', 'Beet Gazpacho', '12.00', 'img/food11.jpg'),
('SPEC0002', 'Specials', 'Funnel and Rhubarb Salad', '8.00', 'img/food12.jpg'),
('SPEC0003', 'Specials', 'Beets and Burrata', '9.00', 'img/food13.jpg'),
('SPEC0004', 'Specials', 'Charred Greens', '8.00', 'img/food14.jpg'),
('SWE0001', 'Sweets', 'Chocolate Custard', '4.00', 'img/food61.jpg'),
('SWE0002', 'Sweets', 'Vanilla Creme Brulee', '4.00', 'img/food62.jpg'),
('SWE0003', 'Sweets', 'Caramel Apple Bread Pudding', '4.00', 'img/food63.jpg'),
('SWE0004', 'Sweets', 'Chocolate Bread Pudding', '4.00', 'img/food64.jpg');

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
(1, 'specials', 'Beet Gazpacho', 'img/food11.jpg', 'Yuzu Crab and Curried Egg @ $12.00', 'Fennel and Rhubarb Salad', 'img/food12.jpg', 'Celery, Cashew Brittle, Candied Vinegar Vinaigrette @ $8.00', 'Beets and Burrata', 'img/food13.jpg', 'Banyuls Vinaigrette @ $9.00', 'Charred Greens ', 'img/food14.jpg', 'Tofu emulsion, Radish @ $8.00'),
(2, 'snacks', 'BBQ Chips', 'img/food21.jpg', 'For only $4.00', 'Pickles', 'img/food22.jpg', 'For only $6.00', 'Smokey Almonds', 'img/food23.jpg', 'For only $6.00', 'Deviled eggs', 'img/food24.jpg', 'For only $4.00'),
(3, 'oysters', 'Fin De La Bai', 'img/food31.jpg', 'For only $2.75', 'Barnstable', 'img/food32.jpg', 'For only $2.75', 'Snow Island', 'img/food33.jpg', 'For only $2.75', 'Barcat', 'img/food34.jpg', 'For only $2.75'),
(4, 'cheese', 'Chevrot', 'img/food41.jpg', 'Pasteurized Goat-France @ $7.00', 'Rollright', 'img/food42.jpg', 'Pasteurized Cow-England @ $10.00', 'Toma Piemontese', 'img/food43.jpg', 'Pasteurized Cow-Italy @ $5.00', 'Point Reyes \"Original Blue\"', 'img/food44.jpg', 'Raw Cow-California @ $5.00'),
(5, 'Charcuterie', 'Cacciatore', 'img/food51.jpg', 'Olympic Provisions-Portland @ $7.00', 'Saucisson', 'img/food52.jpg', 'Olympic Provisions-Portland @ $7.00', 'Bresaola', 'img/food53.jpg', 'Salumeria Biellese @ $7.00', 'Rosette de Lyon', 'img/food54.jpg', 'Salumeria Biellese @ $5.00'),
(6, 'sweets', 'Chocolate custard', 'img/food61.jpg', 'For only $4.00', 'Vanilla Creme Brulee', 'img/food62.jpg', 'For only $4.00', 'Caramel Apple Bread Pudding', 'img/food63.jpg', 'For only $4.00', 'Chocolate Bread Pudding', 'img/food64.jpg', 'For Only $4.00'),
(7, 'drinks', 'Wine', 'img/food71.jpg', 'These aromatized wines cure all evils', 'Vermouth', 'img/food72.jpg', 'Because apple cider is as American as apple pie', 'Beer', 'img/food73.jpg', 'It\'s beer, just drink it', 'Montilla', 'img/food74.jpg', 'Spain has given us Gaudi / Don Quixote / Xavi and….');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(2) NOT NULL,
  `customerName` text NOT NULL,
  `custEmail` varchar(50) NOT NULL,
  `custPhoneNumber` varchar(15) NOT NULL,
  `dateOfPurchase` varchar(15) NOT NULL,
  `orderItemName` text NOT NULL,
  `orderItemQuantity` int(1) NOT NULL,
  `orderItemCost` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `customerName`, `custEmail`, `custPhoneNumber`, `dateOfPurchase`, `orderItemName`, `orderItemQuantity`, `orderItemCost`) VALUES
(1, 'Alexander Muriithi', 'someone@example.com', '072634877', '26-06-17 12:45:', ' Montilla ', 1, 8),
(2, 'Alexander Muriithi', 'someone@example.com', '072634877', '26-06-17 12:45:', ' Wine ', 1, 10),
(3, 'Alexander Muriithi', 'someone@example.com', '072634877', '26-06-17 12:45:', ' Deviled Eggs ', 1, 4),
(4, 'Alexander Muriithi', 'someone@example.com', '072634877', '26-06-17 12:45:', ' Funnel and Rhubarb Salad ', 1, 8),
(5, 'Alexander Muriithi', 'someone@example.com', '072634877', '26-06-17 12:45:', ' Chocolate Custard ', 1, 4),
(6, 'Alexander Muriithi', 'someone@example.com', '072634877', '26-06-17 12:45:', ' Chocolate Bread Pudding ', 1, 4),
(7, 'Alexander Muriithi', 'someone@example.com', '072634877', '26-06-17 12:47:', ' Bresaola ', 1, 7),
(8, 'Elinor Wamosh', 'her@him.com', '0710917341', '26-06-17 12:52:', ' Bresaola ', 1, 7),
(9, 'Elinor Wamosh', 'her@him.com', '0710917341', '26-06-17 12:52:', ' Cacciatore ', 1, 7),
(10, 'Elinor Wamosh', 'her@him.com', '0718378728', '26-06-17 12:54:', ' Saucisson ', 1, 7),
(11, 'Jack Bundi', 'him@her.com', '0717808815', '26-06-17 12:54:', ' Rosette de Lyon ', 1, 5),
(12, 'John Doe', 'someone@example.com', '12345789', '27-06-17 01:42:', ' Bresaola ', 1, 7),
(13, 'Eli Nor', 'hhdef@nknd.com', '0710791470', '27-06-17 01:46:', ' Cacciatore ', 1, 7),
(14, 'Kennefy Moomo', 'ken@ken.com', '565697969', '27-06-17 02:03:', ' Bresaola ', 1, 7),
(15, 'Kennefy Moomo', 'ken@ken.com', '565697969', '27-06-17 02:03:', ' Rollright ', 1, 10),
(16, 'Kennefy Moomo', 'ken@ken.com', '565697969', '27-06-17 02:03:', ' Rollright ', 1, 10),
(17, 'Kennefy Moomo', 'ken@ken.com', '565697969', '27-06-17 02:03:', ' Vanilla Creme Brulee ', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `resID` int(2) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `reservation_date` varchar(10) NOT NULL,
  `reservation_time` varchar(5) NOT NULL,
  `guest_count` int(2) NOT NULL,
  `event_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`resID`, `name`, `email`, `phoneNumber`, `reservation_date`, `reservation_time`, `guest_count`, `event_type`) VALUES
(1, 'Ian Joseph', 'joe@gmail.com', '098 098 7890', '09/12/2012', '7.00 ', 20, 'Birthday'),
(2, 'Ian Joseph', 'joe@gmail.com', '098 098 7890', '09/12/2012', '7.00 ', 20, 'Birthday'),
(3, 'Ian Joseph', 'joe@gmail.com', '098 098 7890', '09/12/2012', '7.00 ', 20, 'Birthday'),
(4, 'Ian Joseph', 'joe@gmail.com', '098 098 7890', '09/12/2012', '7:00', 20, 'Birthday'),
(5, 'Ian Joseph', 'joe@gmail.com', '098 098 7890', '09/12/2012', '7:00', 20, 'Birthday'),
(6, 'Joe Paul', 'paul@gmail.com', '0980980987', '30/3/2017', '7:00p', 20, 'Dinner party'),
(7, 'Esther Khakata', 'ekhakata@strathmore.edu', '123456789', '30/06/2017', '4:00 ', 20, 'Food: Dinner Package && Wine: Wine Impress');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments_and_mailing_list`
--
ALTER TABLE `comments_and_mailing_list`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menuID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`resID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments_and_mailing_list`
--
ALTER TABLE `comments_and_mailing_list`
  MODIFY `commentID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menuID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `resID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
