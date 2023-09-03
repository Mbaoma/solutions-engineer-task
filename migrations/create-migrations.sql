CREATE TABLE migrations (
    id SERIAL PRIMARY KEY,
    migration VARCHAR NOT NULL,
    batch INTEGER NOT NULL
);    