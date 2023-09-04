CREATE TABLE product_sub_categories (
    product_id INT REFERENCES products(id),
    sub_category_id INT REFERENCES sub_categories(id),
    PRIMARY KEY (product_id, sub_category_id)
);