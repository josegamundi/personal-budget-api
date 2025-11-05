# Data Base – Personal Budget API

This module contains the SQL scripts needed to initialize the **Personal Budget API** project database.

## Main tables

### Envelopes
An individual budget envelope:

| Campo | Tipo | Descripción |
|-------|------|--------------|
| id | SERIAL | Unique identifier |
| name | VARCHAR(100) | Envelope name |
| budget | NUMERIC(12,2) | Allocated budget |
| balance | NUMERIC(12,2) | Remaining balance |

### Transactions
A record of money movement between envelopes or income/expenses:

| Campo | Tipo | Descripción |
|-------|------|--------------|
| id | SERIAL | Unique identifier |
| transaction_type | VARCHAR(20) | Type (`transfer`, `expense`, `income`) |
| from_envelope_id | INT | Originating envelope ID |
| to_envelope_id | INT | Destination envelope ID |
| amount | NUMERIC(12,2) | Transaction amount |
| description | TEXT | Brief description |
| date | TIMESTAMP | Automatic registration date |

## Manual initialization

Run the scripts in the following order on the **development** and **test** databases:

```bash
psql -U <usuario> -d personal_budget_dev -f db/schema/create_tables.sql
psql -U <usuario> -d personal_budget_dev -f db/schema/seeds.sql
