CREATE TABLE jwt_tokens (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    unique_id VARCHAR NOT NULL,
    token_title VARCHAR NOT NULL,
    restrictions JSON NULL,
    permissions JSON NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    expires_at TIMESTAMP NULL,
    last_used_at TIMESTAMP NULL,
    refreshed_at TIMESTAMP NULL
);