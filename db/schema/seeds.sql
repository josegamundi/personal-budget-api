-- ==========================================================
--  Script: seeds.sql
--  Description: Insertion of initial data (seeds)
--  Project: Personal Budget API
-- ==========================================================

-- Seeds for envelopes
INSERT INTO envelopes (name, budget, balance)
VALUES
    ('Groceries', 500.00, 300.00),
    ('Rent', 1200.00, 1200.00),
    ('Utilities', 200.00, 150.00),
    ('Entertainment', 150.00, 75.00);

-- Seeds for transactions
INSERT INTO transactions (transaction_type, from_envelope_id, to_envelope_id, amount, description)
VALUES
    ('expense', 1, NULL, 50.00, 'Grocery shopping at market'),
    ('income', NULL, 4, 25.00, 'Refund from concert ticket'),
    ('transfer', 4, 1, 20.00, 'Moved funds to groceries');
