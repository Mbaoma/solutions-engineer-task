CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL,
    type VARCHAR NOT NULL CHECK (type IN ('credit_card', 'cash_on_delivery', 'bank_transfer')),
    details JSON NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);