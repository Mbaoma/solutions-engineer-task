CREATE TABLE files (
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL,
    name VARCHAR NOT NULL,
    path VARCHAR NOT NULL,
    size VARCHAR NOT NULL,
    type VARCHAR NOT NULL, -- mime/type
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);