import random

images = [
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png",
    "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png",
    "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png",
    "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png",
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png",
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png",
    "https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png",
    "https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png",
    "https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png",
    "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png",
    "https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png",
    "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png",
    "https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png",
    "https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png",
    "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp",
    "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/1.webp",
    "https://cdn.dummyjson.com/product-images/beauty/powder-canister/1.webp",
    "https://cdn.dummyjson.com/product-images/beauty/red-lipstick/1.webp",
    "https://cdn.dummyjson.com/product-images/beauty/red-nail-polish/1.webp",
    "https://cdn.dummyjson.com/product-images/fragrances/calvin-klein-ck-one/1.webp",
    "https://cdn.dummyjson.com/product-images/fragrances/chanel-coco-noir-eau-de/1.webp",
    "https://cdn.dummyjson.com/product-images/fragrances/dior-j'adore/1.webp",
    "https://cdn.dummyjson.com/product-images/fragrances/dolce-shine-eau-de/1.webp",
    "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/1.webp",
    "https://cdn.dummyjson.com/product-images/furniture/annibale-colombo-bed/1.webp",
    "https://cdn.dummyjson.com/product-images/furniture/annibale-colombo-sofa/1.webp",
    "https://cdn.dummyjson.com/product-images/furniture/bedside-table-african-cherry/1.webp",
    "https://cdn.dummyjson.com/product-images/furniture/knoll-saarinen-executive-conference-chair/1.webp",
    "https://cdn.dummyjson.com/product-images/furniture/wooden-bathroom-sink-with-mirror/1.webp"
]

sql_statements = ["USE `jsp-servlet-ecommerce-website`;\n"]
product_id = 1000

for i in range(75):
    img_url = random.choice(images).replace("'", "''")
    sql = f"UPDATE product SET product_image_url = '{img_url}' WHERE product_id = {product_id};"
    sql_statements.append(sql)
    product_id += 1

with open("update_product_images_no_humans.sql", "w") as f:
    f.write("\n".join(sql_statements))

print("Update SQL generated successfully.")
