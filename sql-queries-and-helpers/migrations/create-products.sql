CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    category_uuid UUID REFERENCES categories(uuid),
    uuid UUID NOT NULL,
    title VARCHAR NOT NULL,
    price FLOAT NOT NULL,
    description TEXT NOT NULL,
    metadata JSON NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP NULL
);