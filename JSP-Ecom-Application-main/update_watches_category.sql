USE `jsp-servlet-ecommerce-website`;

-- 1. Create Watches category if it doesn't exist
INSERT INTO category (category_id, category_name, category_number_product)
VALUES (7, 'Watches', 12)
ON DUPLICATE KEY UPDATE category_name = 'Watches';

-- 2. Move watches to category 7 (Watches)
UPDATE product SET fk_category_id = 7 WHERE product_id IN (1010, 1011, 1012, 1013, 1014, 1015, 1036, 1037, 1038, 1039, 1040, 1089);
