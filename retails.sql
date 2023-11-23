-- Database: `retails`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `Brand_id` int(11) NOT NULL,
  `Brand_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`Brand_id`, `Brand_name`) VALUES
(1, 'Toyota'),
(2, 'Ford'),
(3, 'Honda'),
(4, 'BMW'),
(5, 'Chevrolet');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `color_name`) VALUES
(1, 'Red'),
(2, 'Blue'),
(3, 'Green'),
(4, 'Black'),
(5, 'White');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `phone` int(12) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `income` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `dealer_id` int(11) NOT NULL,
  `dealer_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`dealer_id`, `dealer_name`) VALUES
(1, 'John'),
(2, 'Emily'),
(3, 'Michael'),
(4, 'Sarah'),
(5, 'David');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `model_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`brand_id`, `model_id`, `model_name`) VALUES
(1, 101, 'Toyota Camry'),
(1, 102, 'Toyota Corolla'),
(1, 103, 'Toyota RAV4'),
(2, 201, 'Ford Mustang'),
(2, 202, 'Ford Explorer'),
(3, 301, 'Honda Civic'),
(3, 302, 'Honda Accord'),
(4, 401, 'BMW 3 Series'),
(4, 402, 'BMW X5'),
(5, 501, 'Chevrolet Silverado');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `vin` varchar(17) DEFAULT NULL,
  `dispatch_date` date DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `dealer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `vin`, `dispatch_date`, `arrival_date`, `dealer_id`) VALUES
(1, 'VIN1', '2022-05-15', '2022-05-20', 1),
(2, 'VIN3', '2022-07-18', '2022-07-23', 4),
(3, 'VIN5', '2022-09-05', '2022-09-10', 4),
(4, 'VIN7', '2023-02-19', '2023-02-24', 2),
(5, 'VIN9', '2023-04-14', '2023-04-19', 4),
(6, 'VIN10', '2023-05-22', '2023-05-27', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vin` varchar(17) NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `dealer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vin`, `model_id`, `brand_id`, `color_id`, `price`, `dealer_id`) VALUES
('VIN1', 101, 1, 1, '25000.00', 1),
('VIN10', 501, 5, 3, '33000.00', 2),
('VIN2', 102, 1, 2, '28000.00', 3),
('VIN3', 103, 1, 3, '30000.00', 4),
('VIN4', 201, 2, 4, '27000.00', 5),
('VIN5', 202, 2, 5, '32000.00', 4),
('VIN6', 301, 3, 4, '26000.00', 3),
('VIN7', 302, 3, 3, '31000.00', 2),
('VIN8', 401, 4, 2, '29000.00', 1),
('VIN9', 402, 4, 1, '27000.00', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`Brand_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`dealer_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `vin` (`vin`),
  ADD KEY `dealer_id` (`dealer_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vin`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `dealer_id` (`dealer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `Brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`Brand_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`dealer_id`) REFERENCES `dealer` (`dealer_id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`),
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`Brand_id`),
  ADD CONSTRAINT `vehicle_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  ADD CONSTRAINT `vehicle_ibfk_4` FOREIGN KEY (`dealer_id`) REFERENCES `dealer` (`dealer_id`);
COMMIT;
-- Query 1
SELECT 
    YEAR(s.dispatch_date) AS sales_year,
    MONTH(s.dispatch_date) AS sales_month,
    WEEK(s.dispatch_date) AS sales_week,
    b.brandname,
    c.gender,
    CASE 
        WHEN c.annual_income BETWEEN 0 AND 50000 THEN '0-50k'
        WHEN c.annual_income BETWEEN 50001 AND 100000 THEN '50k-100k'
        ELSE '100k+'
    END AS income_range,
    COUNT(*) AS total_sales
FROM 
    sales s
JOIN 
    vehicle v ON s.VIN = v.VIN
JOIN 
    brands b ON v.brandid = b.brandid
JOIN 
    customer c ON s.customerid = c.customerid
WHERE 
    s.dispatch_date BETWEEN '2022-01-01' AND '2023-12-30'
GROUP BY 
    sales_year, sales_month, sales_week, b.brandname, c.gender, income_range
ORDER BY 
    sales_year, sales_month, sales_week, b.brandname, c.gender, income_range;


-- QUERY 2
SELECT 
    b.brandname,
    SUM(v.Price) AS total_sales_amount
FROM 
    sales s
JOIN 
    vehicle v ON s.VIN = v.VIN
JOIN 
    brands b ON v.brandid = b.brandid
WHERE 
    YEAR(s.dispatch_date) = YEAR(CURRENT_DATE()) - 1
GROUP BY 
    b.brandname
ORDER BY 
    total_sales_amount DESC
LIMIT 2;


-- QUERY 3
SELECT 
    b.brandname,
    COUNT(*) AS total_unit_sales
FROM 
    sales s
JOIN 
    vehicle v ON s.VIN = v.VIN
JOIN 
    brands b ON v.brandid = b.brandid
WHERE 
    YEAR(s.dispatch_date) = YEAR(CURRENT_DATE()) - 1
GROUP BY 
    b.brandname
ORDER BY 
    total_unit_sales DESC
LIMIT 2;

-- QUERY 4
SELECT 
    EXTRACT(MONTH FROM s.dispatch_date) AS sales_month,
    COUNT(*) AS total_convertible_sales
FROM 
    sales s
JOIN 
    vehicle v ON s.VIN = v.VIN
JOIN 
    models m ON v.modelID = m.modelid
JOIN 
    options o ON v.optionid = o.optionid
WHERE 
    m.modelname = 'Model3'
GROUP BY 
    sales_month
ORDER BY 
    total_convertible_sales DESC
LIMIT 1;
 -- QUERY 5
 SELECT 
    d.dealername,
    AVG(DATEDIFF(s.arrival_date, s.dispatch_date)) AS average_inventory_time
FROM 
    sales s
JOIN 
    dealers d ON s.dealerid = d.dealid
GROUP BY 
    d.dealername
ORDER BY 
    average_inventory_time DESC
LIMIT 1;

