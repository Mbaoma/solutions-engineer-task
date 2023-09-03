CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL,
    title VARCHAR NOT NULL,
    slug VARCHAR NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);