USE `jsp-servlet-ecommerce-website`;

-- 1. Create Shoes category if it doesn't exist
INSERT INTO category (category_id, category_name, category_number_product)
VALUES (8, 'Shoes', 22)
ON DUPLICATE KEY UPDATE category_name = 'Shoes';

-- 2. Move existing shoes to category 8 (Shoes)
UPDATE product SET fk_category_id = 8 WHERE product_id IN (1006, 1007, 1008, 1009, 1021, 1022, 1023, 1024, 1025);

-- 3. Delete existing seeded shoes to prevent duplication
DELETE FROM product WHERE product_id >= 3000 AND product_id <= 3020;

-- 4. Insert new branded shoes for Men and Women into category 8 (Shoes)
INSERT INTO product (product_id, product_name, product_price, product_description, fk_category_id, fk_account_id, product_is_deleted, product_amount, product_image_url) VALUES
(3000, 'Puma Nitro Men Running Shoes', 5999.00, 'High-performance men running shoes from Puma featuring Nitro foam cushioning for ultimate responsiveness.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=500'),
(3001, 'Nike Air Max 270 Sneakers', 11999.00, 'Nike Air Max 270 features Nike first lifestyle Air unit. Delivers visible cushioning under every step.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500'),
(3002, 'Adidas Ultraboost Men Shoes', 14999.00, 'Adidas Ultraboost offers responsive Boost midsole cushioning and a foot-hugging Primeknit upper.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=500'),
(3003, 'Roadster Men Casual Canvas Shoes', 1499.00, 'Stylish and lightweight Roadster casual canvas shoes. Perfect choice for everyday styling.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1539185441755-769473a23570?w=500'),
(3004, 'Agilitas Men Performance Runners', 3499.00, 'Comfortable and durable Agilitas performance runners with breathable mesh upper and slip-resistant sole.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?w=500'),
(3005, 'Asics Gel-Kayano 30 Running Shoes', 12999.00, 'Asics Gel-Kayano 30 offers premium support and comfort for long-distance runners with PureGEL technology.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=500'),
(3006, 'New Balance 574 Classic Sneakers', 7999.00, 'The most New Balance shoe ever. The 574 is a clean, classic, and comfortable lifestyle sneaker.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=500'),
(3007, 'Puma Carina Women Sneakers', 4499.00, 'Retro-inspired Puma Carina women sneakers featuring a synthetic leather upper and a platform cupsole.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500'),
(3008, 'Nike Court Vision Women Shoes', 5499.00, 'Classic 80s basketball style meets modern day speed in the Nike Court Vision Low.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=500'),
(3009, 'Adidas Grand Court Women Sneaker', 4999.00, 'Vintage tennis style updated with soft Cloudfoam cushioning. Classic Adidas 3-Stripes finish.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1512374382149-4338530059cd?w=500'),
(3010, 'Roadster Women Slip-On Sneakers', 1299.00, 'Comfortable and lightweight slip-on sneakers for women. Designed for daily active lifestyle.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500'),
(3011, 'Asics GT-2000 Women Runners', 9999.00, 'Designed for runners seeking stability. GT-2000 offers lightweight and responsive cushioning.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=500'),
(3012, 'New Balance 327 Women Shoes', 8999.00, 'Bold lifestyle silhouette combining retro 70s design with modern comfort and oversized branding.', 8, 1, 0, 100, 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=500');
