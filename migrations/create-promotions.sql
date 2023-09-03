CREATE TABLE promotions (
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL,
    title VARCHAR NOT NULL,
    content VARCHAR NOT NULL,
    metadata JSON NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);