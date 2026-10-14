# Data Model

## Property dimension

`pg_master`

Grain: one row per PG/property.

Important fields:

- PG_ID
- PG_Name
- Area
- City
- PG_Type
- Status

## Date dimension

`dim_date`

Grain: one row per calendar date.

Important fields:

- Date
- Year
- Month
- Month_Name
- Month_Short
- YearMonth
- Quarter
- Financial_Year

## Main fact tables

### rent_transactions
Grain: tenant × billing month.

### daily_occupancy
Grain: PG × day.

### daily_operations
Grain: PG × day.

### expenses
Grain: expense event.

### complaints
Grain: complaint event.

### tenant_movements
Grain: movement event.

## Why the model avoids fact-to-fact joins

Joining multiple event tables directly can create ambiguous filter paths and unexpected aggregations. Shared dimensions provide a cleaner analytical model and make DAX behavior easier to reason about.
