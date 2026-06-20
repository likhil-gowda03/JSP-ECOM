import random

categories = {
    1: {"name": "Men", "keywords": ["Shirt", "Jacket", "Trousers", "Shoes", "Watch", "Suit", "Tie", "Belt", "Sweater", "Jeans", "Shorts", "Sneakers", "Boots", "Coat", "Hat"]},
    2: {"name": "Women", "keywords": ["Dress", "Handbag", "Heels", "Skirt", "Blouse", "Scarf", "Sunglasses", "Top", "Jeans", "Jacket", "Coat", "Boots", "Flats", "Earrings", "Necklace"]},
    3: {"name": "Children", "keywords": ["Toy", "T-shirt", "Shorts", "Dress", "Pajamas", "Sneakers", "Jacket", "Hat", "Socks", "Backpack", "Sweater", "Leggings", "Bib", "Romper", "Books"]},
    4: {"name": "Electronics", "keywords": ["Smartphone", "Laptop", "Headphones", "Tablet", "Smartwatch", "Camera", "Speaker", "Monitor", "Keyboard", "Mouse", "Microphone", "Router", "Charger", "Cable", "Powerbank"]},
    5: {"name": "Jewelery", "keywords": ["Ring", "Necklace", "Bracelet", "Earrings", "Pendant", "Brooch", "Watch", "Cufflinks", "Charm", "Anklet", "Tiara", "Locket", "Bangle", "Pin", "Chain"]}
}

adjectives = ["Premium", "Classic", "Modern", "Stylish", "Elegant", "Casual", "Luxury", "Vintage", "Sporty", "Comfortable", "High-Quality", "Exclusive", "Trendy"]

sql_statements = ["USE `jsp-servlet-ecommerce-website`;\n"]

product_id = 1000 # start from 1000 to avoid conflicts

for cat_id, cat_info in categories.items():
    cat_name = cat_info["name"]
    items = cat_info["keywords"]
    
    # Generate 15 items per category
    for i in range(15):
        adj = random.choice(adjectives)
        item = random.choice(items)
        product_name = f"{adj} {cat_name} {item}"
        price = round(random.uniform(500, 15000), 2)
        desc = f"A wonderful {product_name.lower()} perfect for any occasion. Made with high quality materials."
        # Use placehold.co for image
        img_text = f"{cat_name}+{item}".replace(" ", "+")
        img_url = f"https://placehold.co/600x600/eeeeee/31343c?text={img_text}"
        
        sql = f"INSERT INTO product (product_id, product_name, product_price, product_description, fk_category_id, fk_account_id, product_is_deleted, product_amount, product_image_url) VALUES ({product_id}, '{product_name}', {price}, '{desc}', {cat_id}, 1, 0, 100, '{img_url}');"
        sql_statements.append(sql)
        product_id += 1

with open("generate_more_products.sql", "w") as f:
    f.write("\n".join(sql_statements))

print("SQL generated successfully.")
