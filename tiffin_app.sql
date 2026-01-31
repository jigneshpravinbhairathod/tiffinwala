SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `defaultdb` (Aiven માં defaultdb નામ હોય છે)
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT (CURRENT_DATE), -- અહી સુધારો કર્યો છે
  `status` enum('ACTIVE','SKIPPED','DELIVERED') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `subscription_id`, `order_date`, `status`) VALUES
(1, 1, '2025-12-25', 'ACTIVE'),
(2, 2, '2025-12-25', 'DELIVERED'),
(3, 3, '2025-12-25', 'ACTIVE'),
(4, 4, '2025-12-25', 'SKIPPED'),
(5, 5, '2025-12-25', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(15) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `restaurants` (`id`, `owner_id`, `name`, `address`) VALUES
(1, '8888880001', 'Shree Tiffin Service', 'Ahmedabad'),
(2, '8888880001', 'Rajwadi Tiffin Center', 'Ahmedabad'),
(3, '8888880002', 'Annapurna Tiffin', 'Surat'),
(4, '8888880002', 'Maa Tiffin Service', 'Vadodara'),
(5, '8888880002', 'Home Taste Tiffin', 'Rajkot');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `duration` enum('15_DAYS','1_MONTH') DEFAULT NULL,
  `meal_type` enum('LUNCH','DINNER') DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('ACTIVE','EXPIRED') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `subscriptions` (`id`, `user_id`, `restaurant_id`, `duration`, `meal_type`, `price`, `start_date`, `end_date`, `status`) VALUES
(1, '9999990001', 1, '1_MONTH', 'LUNCH', 2500.00, '2025-12-25', '2026-01-25', 'ACTIVE'),
(2, '9999990002', 2, '15_DAYS', 'DINNER', 1400.00, '2025-12-25', '2026-01-09', 'ACTIVE'),
(3, '9999990003', 3, '1_MONTH', 'LUNCH', 2600.00, '2025-12-25', '2026-01-25', 'ACTIVE'),
(4, '9999990001', 4, '15_DAYS', 'DINNER', 1500.00, '2025-12-25', '2026-01-09', 'ACTIVE'),
(5, '9999990002', 5, '1_MONTH', 'LUNCH', 2400.00, '2025-12-25', '2026-01-25', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) DEFAULT NULL,
  `role` enum('USER','OWNER') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`id`, `phone`, `role`, `created_at`) VALUES
(1, '9999990001', 'USER', '2025-12-24 19:44:55'),
(2, '9999990002', 'USER', '2025-12-24 19:44:55'),
(3, '9999990003', 'USER', '2025-12-24 19:44:55'),
(4, '9999990004', 'USER', '2025-12-24 19:44:55'),
(5, '9999990005', 'USER', '2025-12-24 19:44:55'),
(6, '8888880001', 'OWNER', '2025-12-24 19:45:05'),
(7, '8888880002', 'OWNER', '2025-12-24 19:45:05'),
(8, '8888880003', 'OWNER', '2025-12-24 19:45:05'),
(9, '8888880004', 'OWNER', '2025-12-24 19:49:37');

COMMIT;
