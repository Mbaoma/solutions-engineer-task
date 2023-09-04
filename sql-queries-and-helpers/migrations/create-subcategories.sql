CREATE TABLE sub_categories (
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL UNIQUE,
    title VARCHAR NOT NULL,
    parent_category_id INT REFERENCES categories(id),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);