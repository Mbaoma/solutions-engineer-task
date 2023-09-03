CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    order_status_id INTEGER REFERENCES order_statuses(id),
    payment_id INTEGER REFERENCES payments(id),
    uuid UUID NOT NULL,
    products JSON NOT NULL,
    address JSON NOT NULL,
    delivery_fee FLOAT NULL,
    amount FLOAT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    shipped_at TIMESTAMP NULL
);