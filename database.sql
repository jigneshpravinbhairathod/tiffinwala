CREATE DATABASE tiffin_app;
USE tiffin_app;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  phone VARCHAR(15) UNIQUE,
  role ENUM('USER','OWNER'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE restaurants (
  id INT AUTO_INCREMENT PRIMARY KEY,
  owner_id VARCHAR(15),
  name VARCHAR(100),
  address TEXT
);

CREATE TABLE subscriptions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(15),
  restaurant_id INT,
  duration ENUM('15_DAYS','1_MONTH'),
  meal_type ENUM('LUNCH','DINNER'),
  price DECIMAL(10,2),
  start_date DATE,
  end_date DATE,
  status ENUM('ACTIVE','EXPIRED')
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  subscription_id INT,
  order_date DATE DEFAULT CURDATE(),
  status ENUM('ACTIVE','SKIPPED','DELIVERED')
);
