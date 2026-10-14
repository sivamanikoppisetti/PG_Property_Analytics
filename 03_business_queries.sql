-- Business KPI validation queries

-- 1. Total beds
SELECT COUNT(DISTINCT Bed_ID) AS Total_Beds
FROM dbo.beds;

-- 2. Latest occupied beds
SELECT SUM(Occupied_Beds) AS Occupied_Beds
FROM dbo.daily_occupancy
WHERE Snapshot_Date = (
    SELECT MAX(Snapshot_Date)
    FROM dbo.daily_occupancy
);

-- 3. Latest occupancy %
SELECT
    CAST(
        SUM(Occupied_Beds) * 100.0 /
        NULLIF(SUM(Total_Beds), 0)
        AS DECIMAL(10,2)
    ) AS Occupancy_Percent
FROM dbo.daily_occupancy
WHERE Snapshot_Date = (
    SELECT MAX(Snapshot_Date)
    FROM dbo.daily_occupancy
);

-- 4. Rent collected
SELECT SUM(Amount_Paid) AS Rent_Collected
FROM dbo.rent_transactions;

-- 5. Outstanding rent
SELECT SUM(Outstanding_Amount) AS Outstanding_Rent
FROM dbo.rent_transactions;

-- 6. Total expenses
SELECT SUM(Amount) AS Total_Expenses
FROM dbo.expenses;

-- 7. Net revenue
SELECT
    (SELECT SUM(Amount_Paid) FROM dbo.rent_transactions)
    -
    (SELECT SUM(Amount) FROM dbo.expenses) AS Net_Revenue;

-- 8. Revenue by area
SELECT
    p.Area,
    SUM(r.Amount_Paid) AS Rent_Collected
FROM dbo.rent_transactions r
JOIN dbo.pg_master p
    ON r.PG_ID = p.PG_ID
GROUP BY p.Area
ORDER BY Rent_Collected DESC;

-- 9. Outstanding rent by area
SELECT
    p.Area,
    SUM(r.Outstanding_Amount) AS Outstanding_Rent
FROM dbo.rent_transactions r
JOIN dbo.pg_master p
    ON r.PG_ID = p.PG_ID
GROUP BY p.Area
ORDER BY Outstanding_Rent DESC;

-- 10. Occupancy by area using latest snapshot
SELECT
    p.Area,
    CAST(
        SUM(o.Occupied_Beds) * 100.0 /
        NULLIF(SUM(o.Total_Beds), 0)
        AS DECIMAL(10,2)
    ) AS Occupancy_Percent
FROM dbo.daily_occupancy o
JOIN dbo.pg_master p
    ON o.PG_ID = p.PG_ID
WHERE o.Snapshot_Date = (
    SELECT MAX(Snapshot_Date)
    FROM dbo.daily_occupancy
)
GROUP BY p.Area
ORDER BY Occupancy_Percent DESC;
