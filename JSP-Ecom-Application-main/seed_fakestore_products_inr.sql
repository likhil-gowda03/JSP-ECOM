USE `jsp-servlet-ecommerce-website`;

SET @schema_name = DATABASE();
SET @product_image_url_column_exists = (
  SELECT COUNT(*)
  FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = @schema_name
    AND TABLE_NAME = 'product'
    AND COLUMN_NAME = 'product_image_url'
);
SET @add_product_image_url = IF(
  @product_image_url_column_exists = 0,
  'ALTER TABLE product ADD COLUMN product_image_url varchar(1000) DEFAULT NULL',
  'SELECT 1'
);
PREPARE add_product_image_url_stmt FROM @add_product_image_url;
EXECUTE add_product_image_url_stmt;
DEALLOCATE PREPARE add_product_image_url_stmt;

INSERT INTO `category` (`category_id`, `category_name`, `category_number_product`) VALUES
(4, 'Electronics', 6),
(5, 'Jewelery', 4)
ON DUPLICATE KEY UPDATE
  `category_name` = VALUES(`category_name`),
  `category_number_product` = VALUES(`category_number_product`);

INSERT INTO `product` (
  `product_id`,
  `product_name`,
  `product_image`,
  `product_price`,
  `product_description`,
  `fk_category_id`,
  `fk_account_id`,
  `product_is_deleted`,
  `product_amount`,
  `product_image_url`
) VALUES
(1, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', NULL, 10225.35, 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 1, 1, 0, 100, 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png'),
(2, 'Mens Casual Premium Slim Fit T-Shirts', NULL, 2073.90, 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight and soft fabric for breathable and comfortable wearing. And solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.', 1, 1, 0, 100, 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png'),
(3, 'Mens Cotton Jacket', NULL, 5207.07, 'Great outerwear jackets for Spring, Autumn, and Winter. Suitable for working, hiking, camping, mountain climbing, cycling, traveling, or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband, or son in this Thanksgiving or Christmas Day.', 1, 1, 0, 100, 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png'),
(4, 'Mens Casual Slim Fit', NULL, 1487.07, 'The color could be slightly different between on the screen and in practice. Please note that body builds vary by person, therefore detailed size information should be reviewed below on the product description.', 1, 1, 0, 100, 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png'),
(5, 'John Hardy Women''s Legends Naga Gold & Silver Dragon Station Chain Bracelet', NULL, 64635.00, 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean''s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.', 5, 1, 0, 100, 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png'),
(6, 'Solid Gold Petite Micropave', NULL, 15624.00, 'Satisfaction guaranteed. Return or exchange any order within 30 days. Designed and sold by Hafeez Center in the United States. Satisfaction guaranteed. Return or exchange any order within 30 days.', 5, 1, 0, 100, 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png'),
(7, 'White Gold Plated Princess Ring', NULL, 929.07, 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine''s Day.', 5, 1, 0, 100, 'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png'),
(8, 'Pierced Owl Rose Gold Plated Stainless Steel Double', NULL, 1022.07, 'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel.', 5, 1, 0, 100, 'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png'),
(9, 'WD 2TB Elements Portable External Hard Drive - USB 3.0', NULL, 5952.00, 'USB 3.0 and USB 2.0 compatibility. Fast data transfers. Improve PC performance. High capacity. Formatted NTFS for Windows 10, Windows 8.1, and Windows 7. Reformatting may be required for other operating systems. Compatibility may vary depending on user hardware configuration and operating system.', 4, 1, 0, 100, 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png'),
(10, 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s', NULL, 10137.00, 'Easy upgrade for faster boot up, shutdown, application load, and response compared to a 5400 RPM SATA 2.5 inch hard drive. Boosts burst write performance, making it ideal for typical PC workloads. The perfect balance of performance and reliability. Read/write speeds of up to 535MB/s and 450MB/s based on internal testing.', 4, 1, 0, 100, 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png'),
(11, 'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5', NULL, 10137.00, '3D NAND flash is applied to deliver high transfer speeds. Remarkable transfer speeds enable faster bootup and improved overall system performance. Advanced SLC Cache Technology allows performance boost and longer lifespan. 7mm slim design suitable for Ultrabooks and ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC.', 4, 1, 0, 100, 'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png'),
(12, 'WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive', NULL, 10602.00, 'Expand your PS4 gaming experience. Play anywhere with fast and easy setup, sleek design with high capacity, and 3-year manufacturer limited warranty.', 4, 1, 0, 100, 'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png'),
(13, 'Acer SB220Q bi 21.5 inches Full HD IPS Ultra-Thin Monitor', NULL, 55707.00, '21.5 inches Full HD 1920 x 1080 widescreen IPS display and Radeon FreeSync technology. No compatibility for VESA mount. Refresh rate 75Hz using HDMI port. Zero-frame design, ultra-thin, 4ms response time, IPS panel, 16:9 aspect ratio, 16.7 million colors, 250 nit brightness, tilt angle -5 degree to 15 degree, 178 degree viewing angles.', 4, 1, 0, 100, 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png'),
(14, 'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor', NULL, 92999.07, '49 inch super ultrawide 32:9 curved gaming monitor with dual 27 inch screen side by side. Quantum Dot QLED technology, HDR support, and factory calibration provide realistic and accurate color and contrast. 144Hz high refresh rate and 1ms ultra fast response time help eliminate motion blur, ghosting, and reduce input lag.', 4, 1, 0, 100, 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png'),
(15, 'BIYLACLESEN Women''s 3-in-1 Snowboard Jacket Winter Coats', NULL, 5300.07, 'US standard size. Material: 100% Polyester. Detachable liner fabric: warm fleece. Detachable functional liner is skin friendly, lightweight, and warm. Stand collar liner jacket keeps you warm in cold weather. Zippered hand pockets, chest pockets, and hidden inside pocket keep things secure. Adjustable detachable hood and adjustable cuffs help prevent wind and water.', 2, 1, 0, 100, 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png'),
(16, 'Lock and Love Women''s Removable Hooded Faux Leather Moto Biker Jacket', NULL, 2785.35, '100% Polyurethane shell, 100% Polyester lining, 75% Polyester and 25% Cotton sweater. Faux leather material for style and comfort. Two front pockets, two-for-one hooded denim style faux leather jacket, button detail on waist, detail stitching at sides. Hand wash only. Do not bleach. Line dry. Do not iron.', 2, 1, 0, 100, 'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png'),
(17, 'Rain Jacket Women Windbreaker Striped Climbing Raincoats', NULL, 3719.07, 'Lightweight, perfect for trips or casual wear. Long sleeve with hood, adjustable drawstring waist design, button and zipper front closure, fully striped lining, and two side pockets. It covers the hips, and the attached cotton-lined hood with adjustable drawstrings gives it a styled look.', 2, 1, 0, 100, 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png'),
(18, 'MBJ Women''s Solid Short Sleeve Boat Neck Top', NULL, 916.05, '95% Rayon, 5% Spandex. Made in USA or imported. Do not bleach. Lightweight fabric with great stretch for comfort. Ribbed on sleeves and neckline with double stitching on bottom hem.', 2, 1, 0, 100, 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png'),
(19, 'Opna Women''s Short Sleeve Moisture Shirt', NULL, 739.35, '100% Polyester, machine wash. 100% cationic polyester interlock. Machine wash and pre-shrunk for a great fit. Lightweight, roomy, and breathable with moisture-wicking fabric. Soft lightweight fabric with comfortable V-neck collar and a slimmer fit for a feminine silhouette and added comfort.', 2, 1, 0, 100, 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png'),
(20, 'DANVOUY Womens T Shirt Casual Cotton Short', NULL, 1208.07, '95% Cotton, 5% Spandex. Features: casual, short sleeve, letter print, V-neck, fashion tees. The fabric is soft and has some stretch. Occasion: casual, office, beach, school, home, and street. Season: Spring, Summer, Autumn, and Winter.', 2, 1, 0, 100, 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png')
ON DUPLICATE KEY UPDATE
  `product_name` = VALUES(`product_name`),
  `product_image` = VALUES(`product_image`),
  `product_price` = VALUES(`product_price`),
  `product_description` = VALUES(`product_description`),
  `fk_category_id` = VALUES(`fk_category_id`),
  `fk_account_id` = VALUES(`fk_account_id`),
  `product_is_deleted` = VALUES(`product_is_deleted`),
  `product_amount` = VALUES(`product_amount`),
  `product_image_url` = VALUES(`product_image_url`);
