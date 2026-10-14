# Power BI / Fabric Report Setup

The report is built against the `PG_Analytics_Model` semantic model in Microsoft Fabric.

## Recommended model relationships

### Property
Use `pg_master[PG_ID]` as the property dimension key for:

- beds
- rooms
- rent_transactions
- expenses
- electricity
- complaints
- daily_occupancy
- daily_operations
- tenant_movements
- tenant_scd2

### Date
Use `dim_date[Date]` for date-based analysis:

- daily_occupancy[Snapshot_Date]
- daily_operations[Date]
- expenses[Expense_Date]
- rent_transactions[Payment_Date]
- complaints[Created_Date]
- tenant_movements[Movement_Date]

Avoid unnecessary fact-to-fact relationships.

## Recommended formatting

- Page background: light gray
- Visual background: white
- Primary accent: teal
- Secondary accent: orange
- Text: dark navy
- Use compact KPI cards
- Keep visual titles short and business-oriented

## Date-axis note

For multi-year revenue trends, prefer `dim_date[YearMonth]` or a properly sorted month field rather than a bare month number.

`Month_Short` should be sorted by numeric `Month` when using a month-of-year view.
