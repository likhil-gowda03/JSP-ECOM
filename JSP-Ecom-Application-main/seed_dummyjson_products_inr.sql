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
(6, 'Beauty', 5),
(7, 'Fragrances', 5),
(8, 'Furniture', 5),
(9, 'Groceries', 15)
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
(51, 'Essence Mascara Lash Princess', NULL, 929.07, 'The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.', 6, 1, 0, 99, 'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp'),
(52, 'Eyeshadow Palette with Mirror', NULL, 1859.07, 'The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it is convenient for on-the-go makeup application.', 6, 1, 0, 34, 'https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/1.webp'),
(53, 'Powder Canister', NULL, 1394.07, 'The Powder Canister is a finely milled setting powder designed to set makeup and control shine. With a lightweight and translucent formula, it provides a smooth and matte finish.', 6, 1, 0, 89, 'https://cdn.dummyjson.com/product-images/beauty/powder-canister/1.webp'),
(54, 'Red Lipstick', NULL, 1208.07, 'The Red Lipstick is a classic and bold choice for adding a pop of color to your lips. With a creamy and pigmented formula, it provides a vibrant and long-lasting finish.', 6, 1, 0, 91, 'https://cdn.dummyjson.com/product-images/beauty/red-lipstick/1.webp'),
(55, 'Red Nail Polish', NULL, 836.07, 'The Red Nail Polish offers a rich and glossy red hue for vibrant and polished nails. With a quick-drying formula, it provides a salon-quality finish at home.', 6, 1, 0, 79, 'https://cdn.dummyjson.com/product-images/beauty/red-nail-polish/1.webp'),
(56, 'Calvin Klein CK One', NULL, 4649.07, 'CK One by Calvin Klein is a classic unisex fragrance, known for its fresh and clean scent. It is a versatile fragrance suitable for everyday wear.', 7, 1, 0, 29, 'https://cdn.dummyjson.com/product-images/fragrances/calvin-klein-ck-one/1.webp'),
(57, 'Chanel Coco Noir Eau De', NULL, 12089.07, 'Coco Noir by Chanel is an elegant and mysterious fragrance, featuring notes of grapefruit, rose, and sandalwood. Perfect for evening occasions.', 7, 1, 0, 58, 'https://cdn.dummyjson.com/product-images/fragrances/chanel-coco-noir-eau-de/1.webp'),
(58, 'Dior J''adore', NULL, 8369.07, 'J''adore by Dior is a luxurious and floral fragrance, known for its blend of ylang-ylang, rose, and jasmine. It embodies femininity and sophistication.', 7, 1, 0, 98, 'https://cdn.dummyjson.com/product-images/fragrances/dior-j''adore/1.webp'),
(59, 'Dolce Shine Eau de', NULL, 6509.07, 'Dolce Shine by Dolce and Gabbana is a vibrant and fruity fragrance, featuring notes of mango, jasmine, and blonde woods. It is a joyful and youthful scent.', 7, 1, 0, 4, 'https://cdn.dummyjson.com/product-images/fragrances/dolce-shine-eau-de/1.webp'),
(60, 'Gucci Bloom Eau de', NULL, 7439.07, 'Gucci Bloom by Gucci is a floral and captivating fragrance, with notes of tuberose, jasmine, and Rangoon creeper. It is a modern and romantic scent.', 7, 1, 0, 91, 'https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/1.webp'),
(61, 'Annibale Colombo Bed', NULL, 176699.07, 'The Annibale Colombo Bed is a luxurious and elegant bed frame, crafted with high-quality materials for a comfortable and stylish bedroom.', 8, 1, 0, 88, 'https://cdn.dummyjson.com/product-images/furniture/annibale-colombo-bed/1.webp'),
(62, 'Annibale Colombo Sofa', NULL, 232499.07, 'The Annibale Colombo Sofa is a sophisticated and comfortable seating option, featuring exquisite design and premium upholstery for your living room.', 8, 1, 0, 60, 'https://cdn.dummyjson.com/product-images/furniture/annibale-colombo-sofa/1.webp'),
(63, 'Bedside Table African Cherry', NULL, 27899.07, 'The Bedside Table in African Cherry is a stylish and functional addition to your bedroom, providing convenient storage space and a touch of elegance.', 8, 1, 0, 64, 'https://cdn.dummyjson.com/product-images/furniture/bedside-table-african-cherry/1.webp'),
(64, 'Knoll Saarinen Executive Conference Chair', NULL, 46499.07, 'The Knoll Saarinen Executive Conference Chair is a modern and ergonomic chair, perfect for your office or conference room with its timeless design.', 8, 1, 0, 26, 'https://cdn.dummyjson.com/product-images/furniture/knoll-saarinen-executive-conference-chair/1.webp'),
(65, 'Wooden Bathroom Sink With Mirror', NULL, 74399.07, 'The Wooden Bathroom Sink with Mirror is a unique and stylish addition to your bathroom, featuring a wooden sink countertop and a matching mirror.', 8, 1, 0, 7, 'https://cdn.dummyjson.com/product-images/furniture/wooden-bathroom-sink-with-mirror/1.webp'),
(66, 'Apple', NULL, 185.07, 'Fresh and crisp apples, perfect for snacking or incorporating into various recipes.', 9, 1, 0, 8, 'https://cdn.dummyjson.com/product-images/groceries/apple/1.webp'),
(67, 'Beef Steak', NULL, 1208.07, 'High-quality beef steak, great for grilling or cooking to your preferred level of doneness.', 9, 1, 0, 86, 'https://cdn.dummyjson.com/product-images/groceries/beef-steak/1.webp'),
(68, 'Cat Food', NULL, 836.07, 'Nutritious cat food formulated to meet the dietary needs of your feline friend.', 9, 1, 0, 46, 'https://cdn.dummyjson.com/product-images/groceries/cat-food/1.webp'),
(69, 'Chicken Meat', NULL, 929.07, 'Fresh and tender chicken meat, suitable for various culinary preparations.', 9, 1, 0, 97, 'https://cdn.dummyjson.com/product-images/groceries/chicken-meat/1.webp'),
(70, 'Cooking Oil', NULL, 464.07, 'Versatile cooking oil suitable for frying, sauteing, and various culinary applications.', 9, 1, 0, 10, 'https://cdn.dummyjson.com/product-images/groceries/cooking-oil/1.webp'),
(71, 'Cucumber', NULL, 138.57, 'Crisp and hydrating cucumbers, ideal for salads, snacks, or as a refreshing side.', 9, 1, 0, 84, 'https://cdn.dummyjson.com/product-images/groceries/cucumber/1.webp'),
(72, 'Dog Food', NULL, 1022.07, 'Specially formulated dog food designed to provide essential nutrients for your canine companion.', 9, 1, 0, 71, 'https://cdn.dummyjson.com/product-images/groceries/dog-food/1.webp'),
(73, 'Eggs', NULL, 278.07, 'Fresh eggs, a versatile ingredient for baking, cooking, or breakfast.', 9, 1, 0, 9, 'https://cdn.dummyjson.com/product-images/groceries/eggs/1.webp'),
(74, 'Fish Steak', NULL, 1394.07, 'Quality fish steak, suitable for grilling, baking, or pan-searing.', 9, 1, 0, 74, 'https://cdn.dummyjson.com/product-images/groceries/fish-steak/1.webp'),
(75, 'Green Bell Pepper', NULL, 119.97, 'Fresh and vibrant green bell pepper, perfect for adding color and flavor to your dishes.', 9, 1, 0, 33, 'https://cdn.dummyjson.com/product-images/groceries/green-bell-pepper/1.webp'),
(76, 'Green Chili Pepper', NULL, 92.07, 'Spicy green chili pepper, ideal for adding heat to your favorite recipes.', 9, 1, 0, 3, 'https://cdn.dummyjson.com/product-images/groceries/green-chili-pepper/1.webp'),
(77, 'Honey Jar', NULL, 650.07, 'Pure and natural honey in a convenient jar, perfect for sweetening beverages or drizzling over food.', 9, 1, 0, 34, 'https://cdn.dummyjson.com/product-images/groceries/honey-jar/1.webp'),
(78, 'Ice Cream', NULL, 510.57, 'Creamy and delicious ice cream, available in various flavors for a delightful treat.', 9, 1, 0, 27, 'https://cdn.dummyjson.com/product-images/groceries/ice-cream/1.webp'),
(79, 'Juice', NULL, 371.07, 'Refreshing fruit juice, packed with vitamins and great for staying hydrated.', 9, 1, 0, 50, 'https://cdn.dummyjson.com/product-images/groceries/juice/1.webp'),
(80, 'Kiwi', NULL, 231.57, 'Nutrient-rich kiwi, perfect for snacking or adding a tropical twist to your dishes.', 9, 1, 0, 99, 'https://cdn.dummyjson.com/product-images/groceries/kiwi/1.webp')
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
