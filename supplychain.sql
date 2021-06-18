-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2020 at 01:19 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supplychain`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(50) NOT NULL,
  `area_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `area_name`, `area_code`) VALUES
(1, 'Kisumu', 'KSMU'),
(2, 'Nairobi', 'NRBI'),
(3, 'Mombasa', 'MMBS'),
(4, 'Eldoret', 'ELDT'),
(5, 'Nakuru', 'NKRU');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(25) NOT NULL,
  `cat_details` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_details`) VALUES
(1, 'Fast Food', ''),
(2, 'Bread Buns', ''),
(3, 'Counter Cakes', ''),
(4, 'Deserts', ''),
(5, 'Pastry Rs - 55', ''),
(6, 'Pastry Rs - 60', ''),
(7, 'Pastry Rs - 65', ''),
(8, 'Pastry Rs - 70', ''),
(9, 'Add On Items', ''),
(10, 'Cakes', ''),
(11, 'Cheese Cake', '');

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `dist_id` int(11) NOT NULL,
  `dist_name` varchar(25) NOT NULL,
  `dist_email` varchar(50) DEFAULT NULL,
  `dist_phone` varchar(10) NOT NULL,
  `dist_address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`dist_id`, `dist_name`, `dist_email`, `dist_phone`, `dist_address`) VALUES
(1, 'Brian Wekesa', 'brianwekesa@gmail.com', '0700000000', 'Brian Wekesa, Nairobi, Kenya'),
(2, 'Eunice Njoroge', 'eunicenjoroge@gmail.com', '0700000000', 'Eunice Njoroge, Nairobi, Kenya'),
(3, 'Ian Otieno', 'ianotieno@gmail.com', '0700000000', 'Ian Otieno, Eldoret'),
(4, 'Mercy Juma', 'mercyjuma@gmail.com', '0700000000', 'Mercy Juma, Nairobi'),
(5, 'David Mouhamed', 'davidmouhamed@gmail.com', '0700000000', 'Marsabit, Kenya');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total_amount` decimal(10,3) NOT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `order_id`, `retailer_id`, `dist_id`, `date`, `total_amount`, `comments`) VALUES
(1, 2, 4, 3, '2015-04-28', '5119.500', ''),
(2, 1, 2, 5, '2015-04-28', '4780.150', ''),
(3, 3, 1, 1, '2015-04-28', '8891.680', ''),
(4, 4, 5, 4, '2015-04-28', '7888.960', ''),
(5, 5, 5, 1, '2020-12-07', '8919.880', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `invoice_items_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`invoice_items_id`, `invoice_id`, `product_id`, `quantity`) VALUES
(1, 1, 4, 20),
(2, 1, 5, 5),
(3, 1, 7, 10),
(4, 1, 9, 10),
(5, 1, 12, 6),
(6, 1, 14, 5),
(7, 2, 1, 20),
(8, 2, 2, 15),
(9, 2, 5, 10),
(10, 2, 8, 5),
(11, 2, 10, 8),
(12, 2, 11, 10),
(13, 2, 13, 2),
(14, 2, 15, 3),
(15, 3, 1, 2),
(16, 3, 2, 4),
(17, 3, 3, 3),
(18, 3, 4, 8),
(19, 3, 5, 10),
(20, 3, 6, 12),
(21, 3, 8, 4),
(22, 3, 11, 10),
(23, 3, 13, 3),
(24, 3, 14, 5),
(25, 3, 15, 6),
(26, 4, 2, 12),
(27, 4, 4, 30),
(28, 4, 8, 4),
(29, 4, 11, 20),
(30, 4, 14, 8);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `man_id` int(11) NOT NULL,
  `man_name` varchar(25) NOT NULL,
  `man_email` varchar(50) DEFAULT NULL,
  `man_phone` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`man_id`, `man_name`, `man_email`, `man_phone`, `username`, `password`) VALUES
(1, 'Meshack Obwocha', 'meshackobwocha@gmail.com', '0700000000', 'meshack', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty'),
(2, 'Mary Atieno', 'maryatieno@gmail.com', '0700000000', 'mary', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty'),
(3, 'Fiona Murema', 'fionamurema@gmail.com', '0700000000', 'fiona', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty'),
(4, 'Phoebe Njoroge', 'phoebenjoroge@gmail.com', '0700000000', 'phoebe', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty'),
(5, 'Purity Mswahili', 'puritymswahili@gmail.com', '0700000000', 'purity', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty'),
(6, 'Mark Muga', 'markmuga@gmail.com', '0700000000', 'mark', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `approved` tinyint(1) ,
  `status` tinyint(1) ,
  `total_amount` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `retailer_id`, `approved`, `status`, `total_amount`) VALUES
(1, '2021-04-28', 2, 1, 1, '4780.150'),
(2, '2021-04-28', 4, 1, 1, '5119.500'),
(3, '2021-04-28', 1, 1, 1, '8891.680'),
(4, '2021-04-28', 5, 1, 1, '7888.960'),
(5, '2021-04-28', 5, 1, 0, '8919.880'),
(6, '2021-12-07', 1, 0, 0, '50.010');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `quantity` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `order_id`, `pro_id`, `quantity`) VALUES
(1, 1, 1, 20),
(2, 1, 2, 15),
(3, 1, 5, 10),
(4, 1, 8, 5),
(5, 1, 10, 8),
(6, 1, 11, 10),
(7, 1, 13, 2),
(8, 1, 15, 3),
(9, 2, 4, 20),
(10, 2, 5, 5),
(11, 2, 7, 10),
(12, 2, 9, 10),
(13, 2, 12, 6),
(14, 2, 14, 5),
(15, 3, 1, 2),
(16, 3, 2, 4),
(17, 3, 3, 3),
(18, 3, 4, 8),
(19, 3, 5, 10),
(20, 3, 6, 12),
(21, 3, 8, 4),
(22, 3, 11, 10),
(23, 3, 13, 3),
(24, 3, 14, 5),
(25, 3, 15, 6),
(26, 4, 2, 12),
(27, 4, 4, 30),
(28, 4, 8, 4),
(29, 4, 11, 20),
(30, 4, 14, 8),
(31, 5, 1, 1),
(32, 5, 2, 3),
(33, 5, 3, 5),
(34, 5, 4, 15),
(35, 5, 6, 30),
(36, 5, 8, 45),
(37, 5, 12, 20),
(38, 5, 14, 5),
(39, 6, 1, 1),
(40, 6, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(25) NOT NULL,
  `pro_desc` text,
  `pro_price` decimal(10,3) NOT NULL,
  `unit` int(11) NOT NULL,
  `pro_cat` int(11) NOT NULL,
  `quantity` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_desc`, `pro_price`, `unit`, `pro_cat`, `quantity`) VALUES
(1, 'Butter Puff', '', '16.670', 2, 1, NULL),
(2, 'Corn Puff', '', '16.670', 2, 1, NULL),
(3, 'Garlic Cheese Roll', '', '39.570', 2, 1, NULL),
(4, 'Butter Stuffed Bun', '', '42.000', 2, 1, NULL),
(5, 'Paneer Tikka S. Bun', '', '52.500', 2, 1, NULL),
(6, 'Burger Bun 4 PCS', '', '42.000', 2, 2, NULL),
(7, 'Hot Dog Bun 4 PCS', '', '46.000', 2, 2, NULL),
(8, 'Garlic Lauf', '', '47.230', 2, 2, NULL),
(9, 'Dabeli Bun 12 PCS', '', '48.500', 2, 2, NULL),
(10, 'Pizza Base 4 PCS', '', '35.650', 2, 2, NULL),
(11, 'Pizza Sauce', '', '120.000', 1, 9, 60),
(12, 'Sweet Onion Sauce', '', '112.000', 1, 9, 74),
(13, 'Strawberry Cake 1 KG', '', '381.670', 1, 3, NULL),
(14, 'Choco Chips Cake 1 KG', '', '480.000', 1, 3, NULL),
(15, 'Belgium Cake 1 KG', '', '395.670', 1, 3, NULL),
(16, 'soup 34', 'asd', '23.000', 2, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `retailer`
--

CREATE TABLE `retailer` (
  `retailer_id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(200) NOT NULL,
  `area_id` int(11) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retailer`
--

INSERT INTO `retailer` (`retailer_id`, `username`, `password`, `address`, `area_id`, `phone`, `email`) VALUES
(1, 'Samuel', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty', 'A4 Ali Abad Appt, Kajal Park Soci, Magadi Road, Rongai', 1, '0700000000', 'samuelwafula@gmail.com'),
(2, 'Frank', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty', 'Opp. Shivalik Complex, Vastrapur, Nairobi', 2, '0700000000', 'frank@gmail.com'),
(3, 'Alvin', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty', 'B/H Kakariya Lake, Maninagar, Kisumu', 3, '0700000000', 'alvin@gmail.com'),
(4, 'Wilberforce', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty', 'Near Vejalpur Police Station, Vejalpur, Eldoret', 5, '0700000000', 'wilberforce@gmail.com'),
(5, 'Ayub', '$2y$10$v.fyNwrJEPrR4sn6TSgvzuc3f4tLYWXbZS.8N6SSqRPTis5H3c6ty', 'C4-Pushpak Complex, New Ranip, Kiambu', 4, '0700000000', 'ayub@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(20) NOT NULL,
  `unit_details` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `unit_name`, `unit_details`) VALUES
(1, 'KG', 'Kilo Gram'),
(2, 'PCS', 'Pieces'),
(3, 'LTR', 'Litre');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`dist_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `retailer_id` (`retailer_id`),
  ADD KEY `dist_id` (`dist_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`invoice_items_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`man_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `retailer_id` (`retailer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `pro_cat` (`pro_cat`);

--
-- Indexes for table `retailer`
--
ALTER TABLE `retailer`
  ADD PRIMARY KEY (`retailer_id`),
  ADD KEY `area_code` (`area_id`),
  ADD KEY `area_id` (`area_id`),
  ADD KEY `area_id_2` (`area_id`),
  ADD KEY `area_id_3` (`area_id`),
  ADD KEY `area_id_4` (`area_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `dist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `invoice_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `man_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `retailer`
--
ALTER TABLE `retailer`
  MODIFY `retailer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`retailer_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`dist_id`) REFERENCES `distributor` (`dist_id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`pro_id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`retailer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`pro_cat`) REFERENCES `categories` (`cat_id`) ON UPDATE CASCADE;

--
-- Constraints for table `retailer`
--
ALTER TABLE `retailer`
  ADD CONSTRAINT `retailer_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
