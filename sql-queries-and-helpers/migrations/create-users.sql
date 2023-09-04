CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT false,
    email VARCHAR(255) UNIQUE NOT NULL,
    email_verified_at TIMESTAMP NULL,
    password VARCHAR(255) NOT NULL,
    avatar UUID NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    is_marketing BOOLEAN DEFAULT false,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    last_login_at TIMESTAMP NULL
);