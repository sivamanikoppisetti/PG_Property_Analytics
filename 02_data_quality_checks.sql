-- Data quality checks

-- Row counts
SELECT 'pg_master' AS Table_Name, COUNT(*) AS Row_Count FROM dbo.pg_master
UNION ALL SELECT 'rooms', COUNT(*) FROM dbo.rooms
UNION ALL SELECT 'beds', COUNT(*) FROM dbo.beds
UNION ALL SELECT 'tenants', COUNT(*) FROM dbo.tenants
UNION ALL SELECT 'tenant_scd2', COUNT(*) FROM dbo.tenant_scd2
UNION ALL SELECT 'tenant_movements', COUNT(*) FROM dbo.tenant_movements
UNION ALL SELECT 'rent_transactions', COUNT(*) FROM dbo.rent_transactions
UNION ALL SELECT 'expenses', COUNT(*) FROM dbo.expenses
UNION ALL SELECT 'electricity', COUNT(*) FROM dbo.electricity
UNION ALL SELECT 'complaints', COUNT(*) FROM dbo.complaints
UNION ALL SELECT 'daily_occupancy', COUNT(*) FROM dbo.daily_occupancy
UNION ALL SELECT 'daily_operations', COUNT(*) FROM dbo.daily_operations
UNION ALL SELECT 'dim_date', COUNT(*) FROM dbo.dim_date;

-- Duplicate bed IDs
SELECT Bed_ID, COUNT(*) AS Duplicate_Count
FROM dbo.beds
GROUP BY Bed_ID
HAVING COUNT(*) > 1;

-- Duplicate tenant IDs
SELECT Tenant_ID, COUNT(*) AS Duplicate_Count
FROM dbo.tenants
GROUP BY Tenant_ID
HAVING COUNT(*) > 1;

-- Orphan PG IDs in beds
SELECT DISTINCT b.PG_ID
FROM dbo.beds b
LEFT JOIN dbo.pg_master p ON b.PG_ID = p.PG_ID
WHERE p.PG_ID IS NULL;

-- Orphan PG IDs in rent transactions
SELECT DISTINCT r.PG_ID
FROM dbo.rent_transactions r
LEFT JOIN dbo.pg_master p ON r.PG_ID = p.PG_ID
WHERE p.PG_ID IS NULL;

-- Invalid rent arithmetic
SELECT COUNT(*) AS Invalid_Rent_Rows
FROM dbo.rent_transactions
WHERE ABS(Amount_Due - Amount_Paid - Outstanding_Amount) > 0.01;

-- Occupancy percentage validation
SELECT COUNT(*) AS Invalid_Occupancy_Rows
FROM dbo.daily_occupancy
WHERE Occupancy_Percent < 0
   OR Occupancy_Percent > 1
   OR Occupied_Beds < 0
   OR Total_Beds < Occupied_Beds;

-- Latest occupancy snapshot
SELECT
    Snapshot_Date,
    SUM(Total_Beds) AS Total_Beds,
    SUM(Occupied_Beds) AS Occupied_Beds,
    SUM(Vacant_Beds) AS Vacant_Beds,
    CAST(SUM(Occupied_Beds) * 100.0 / NULLIF(SUM(Total_Beds),0) AS DECIMAL(10,2)) AS Occupancy_Percent
FROM dbo.daily_occupancy
WHERE Snapshot_Date = (SELECT MAX(Snapshot_Date) FROM dbo.daily_occupancy)
GROUP BY Snapshot_Date;
