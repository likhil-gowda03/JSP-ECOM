USE `jsp-servlet-ecommerce-website`;

-- 1. Create Sports category if it doesn't exist
INSERT INTO category (category_id, category_name, category_number_product)
VALUES (6, 'Sports', 17)
ON DUPLICATE KEY UPDATE category_name = 'Sports';

-- 2. Move sports accessories to category 6 (Sports)
UPDATE product SET fk_category_id = 6 WHERE product_id >= 1041 AND product_id <= 1057;

-- 3. Delete existing kids clothing products if they exist (just to be safe and clean)
DELETE FROM product WHERE product_id >= 2000 AND product_id <= 2010;

-- 4. Insert kids clothing products into category 3 (Children)
INSERT INTO product (product_id, product_name, product_price, product_description, fk_category_id, fk_account_id, product_is_deleted, product_amount, product_image_url) VALUES
(2000, 'Kids Denim Dungaree Set', 1299.00, 'Classic blue denim dungaree set with a soft cotton inner t-shirt. Durable and comfortable for active play.', 3, 1, 0, 100, 'https://images.unsplash.com/photo-1622290291468-a28f7a7dc6a8?w=500'),
(2001, 'Little Girls Floral Party Dress', 1899.00, 'Beautiful floral print dress with a flared tulle skirt. Perfect for birthdays, weddings, and special events.', 3, 1, 0, 100, 'https://images.unsplash.com/photo-1519457431-44cdc64a143c?w=500'),
(2002, 'Kids Cotton Plaid Shirt & Jeans Set', 1499.00, 'Smart casual set featuring a breathable cotton plaid shirt paired with stretchable denim jeans.', 3, 1, 0, 100, 'https://images.unsplash.com/photo-1503919545889-aef636e10ad4?w=500'),
(2003, 'Toddler Hooded Fleece Jacket', 1799.00, 'Warm and cozy hooded fleece jacket with zipper closure. Keeps toddlers snug in chilly weather.', 3, 1, 0, 100, 'https://images.unsplash.com/photo-1607453813894-220f21266847?w=500'),
(2004, 'Kids Colorful Summer T-Shirt', 799.00, 'Bright and vibrant 100% cotton crewneck t-shirt with a playful chest print. Lightweight and perfect for summer.', 3, 1, 0, 100, 'https://images.unsplash.com/photo-1519238263530-99bdd11df2ea?w=500'),
(2005, 'Baby Knit Cotton Romper', 1199.00, 'Super soft organic cotton knit romper with convenient snap button closures for easy diaper changes.', 3, 1, 0, 100, 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=500'),
(2006, 'Girls Princess Pink Tulle Gown', 2499.00, 'Elegant pink tulle dress with soft satin lining and sequin accents. Creates a fairytale look for any party.', 3, 1, 0, 100, 'https://images.unsplash.com/photo-1622290291468-a28f7a7dc6a8?w=500'),
(2007, 'Kids Unisex Active Cotton Joggers', 999.00, 'Comfortable cotton joggers with elastic waistband and pockets. Great for sports, play, or lounging.', 3, 1, 0, 100, 'https://images.unsplash.com/photo-1544816155-12df9643f363?w=500');
