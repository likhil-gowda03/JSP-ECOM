categories = {
    1: "menswear,clothing",
    2: "womenswear,dress",
    3: "toys,children",
    4: "electronics,gadget",
    5: "jewelry,necklace"
}

sql_statements = ["USE `jsp-servlet-ecommerce-website`;\n"]

product_id = 1000

for cat_id, keywords in categories.items():
    for i in range(15):
        img_url = f"https://loremflickr.com/600/600/{keywords}?lock={product_id}"
        sql = f"UPDATE product SET product_image_url = '{img_url}' WHERE product_id = {product_id};"
        sql_statements.append(sql)
        product_id += 1

with open("update_product_images.sql", "w") as f:
    f.write("\n".join(sql_statements))

print("Update SQL generated successfully.")
