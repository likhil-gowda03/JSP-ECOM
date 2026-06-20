import urllib.request
import json

category_mapping = {
    1: ['mens-shirts', 'mens-shoes', 'mens-watches'],
    2: ['womens-dresses', 'womens-shoes', 'womens-bags', 'tops', 'womens-watches'],
    3: ['sports-accessories'],
    4: ['smartphones', 'laptops', 'tablets', 'mobile-accessories'],
    5: ['womens-jewellery', 'sunglasses']
}

sql_statements = ["USE `jsp-servlet-ecommerce-website`;\n"]
sql_statements.append("DELETE FROM product WHERE product_id >= 1000;\n")

product_id = 1000

for db_cat_id, slugs in category_mapping.items():
    for slug in slugs:
        try:
            req = urllib.request.Request(f'https://dummyjson.com/products/category/{slug}', headers={'User-Agent': 'Mozilla/5.0'})
            res = urllib.request.urlopen(req)
            data = json.loads(res.read())
            for p in data['products']:
                name = p['title'].replace("'", "''")
                price = p['price'] * 80 # Approx conversion
                desc = p['description'].replace("'", "''")
                img = p['thumbnail'].replace("'", "''")
                sql = f"INSERT INTO product (product_id, product_name, product_price, product_description, fk_category_id, fk_account_id, product_is_deleted, product_amount, product_image_url) VALUES ({product_id}, '{name}', {price}, '{desc}', {db_cat_id}, 1, 0, 100, '{img}');"
                sql_statements.append(sql)
                product_id += 1
        except Exception as e:
            print(f"Failed slug {slug}: {e}")

with open("seed_real_images.sql", "w") as f:
    f.write("\n".join(sql_statements))

print("SQL generated successfully!")
