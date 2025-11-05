-- ==========================================================
--  Script: create_tables.sql
--  Description: Creation of the "envelopes" and "transactions" tables
--  Project: Personal Budget API
-- ==========================================================

CREATE TABLE IF NOT EXISTS envelopes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    budget NUMERIC(12,2) NOT NULL CHECK (budget >= 0),
    balance NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (balance >= 0)
);

CREATE TABLE IF NOT EXISTS transactions (
    id SERIAL PRIMARY KEY,
    transaction_type VARCHAR(20) NOT NULL CHECK (transaction_type IN ('transfer', 'expense', 'income')),
    from_envelope_id INT REFERENCES envelopes(id) ON DELETE SET NULL,
    to_envelope_id INT REFERENCES envelopes(id) ON DELETE SET NULL,
    amount NUMERIC(12,2) NOT NULL CHECK (amount > 0),
    description TEXT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);