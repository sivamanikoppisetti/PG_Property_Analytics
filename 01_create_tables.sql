-- KoLogs PG Property Analytics
-- Fabric Warehouse table definitions
-- Synthetic dataset

CREATE TABLE dbo.pg_master (
    PG_ID VARCHAR(20),
    PG_Name VARCHAR(200),
    Area VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Pincode INT,
    PG_Type VARCHAR(50),
    Opening_Date DATE,
    Status VARCHAR(50),
    Manager_ID VARCHAR(50)
);

CREATE TABLE dbo.rooms (
    Room_ID VARCHAR(30),
    PG_ID VARCHAR(20),
    Room_Number INT,
    Floor INT,
    Room_Type VARCHAR(50),
    Bed_Count INT,
    Monthly_Rent INT,
    Status VARCHAR(50)
);

CREATE TABLE dbo.beds (
    Bed_ID VARCHAR(30),
    Room_ID VARCHAR(30),
    PG_ID VARCHAR(20),
    Bed_Number VARCHAR(30),
    Bed_Type VARCHAR(50),
    Monthly_Rent INT,
    Status VARCHAR(50)
);

CREATE TABLE dbo.tenants (
    Tenant_ID VARCHAR(30),
    Tenant_Name VARCHAR(200),
    Gender VARCHAR(30),
    Join_Date DATE,
    Exit_Date DATE,
    Initial_PG_ID VARCHAR(20),
    Initial_Bed_ID VARCHAR(30),
    Monthly_Rent INT,
    Security_Deposit INT,
    Status VARCHAR(50),
    Acquisition_Source VARCHAR(100)
);

CREATE TABLE dbo.tenant_scd2 (
    Tenant_ID VARCHAR(30),
    Tenant_Name VARCHAR(200),
    Acquisition_Source VARCHAR(100),
    Tenant_SK VARCHAR(50),
    PG_ID VARCHAR(20),
    Bed_ID VARCHAR(30),
    Effective_From DATE,
    Effective_To DATE,
    Is_Current BIT,
    Monthly_Rent INT,
    Record_Hash VARCHAR(100)
);

CREATE TABLE dbo.tenant_movements (
    Movement_ID VARCHAR(30),
    Tenant_ID VARCHAR(30),
    PG_ID VARCHAR(20),
    Bed_ID VARCHAR(30),
    Movement_Type VARCHAR(50),
    Movement_Date DATE,
    Previous_Bed_ID VARCHAR(30),
    Reason VARCHAR(200),
    Created_At DATETIME2
);

CREATE TABLE dbo.rent_transactions (
    Payment_ID VARCHAR(30),
    Tenant_ID VARCHAR(30),
    PG_ID VARCHAR(20),
    Billing_Month DATE,
    Due_Date DATE,
    Payment_Date DATE,
    Amount_Due DECIMAL(18,2),
    Amount_Paid DECIMAL(18,2),
    Outstanding_Amount DECIMAL(18,2),
    Payment_Status VARCHAR(50),
    Payment_Mode VARCHAR(50),
    Late_Days INT,
    Source_System VARCHAR(100),
    Created_At DATETIME2
);

CREATE TABLE dbo.expenses (
    Expense_ID VARCHAR(30),
    PG_ID VARCHAR(20),
    Expense_Date DATE,
    Category VARCHAR(100),
    Vendor VARCHAR(200),
    Amount DECIMAL(18,2),
    Payment_Status VARCHAR(50),
    Created_At DATETIME2
);

CREATE TABLE dbo.electricity (
    Meter_Record_ID VARCHAR(30),
    PG_ID VARCHAR(20),
    Month DATE,
    Units_Consumed INT,
    Rate_Per_Unit DECIMAL(18,2),
    Electricity_Cost DECIMAL(18,2),
    Created_At DATETIME2
);

CREATE TABLE dbo.complaints (
    Complaint_ID VARCHAR(30),
    PG_ID VARCHAR(20),
    Tenant_ID VARCHAR(30),
    Complaint_Type VARCHAR(100),
    Priority VARCHAR(50),
    Created_Date DATE,
    Resolved_Date DATE,
    Status VARCHAR(50),
    Resolution_Hours INT,
    SLA_Hours INT,
    Assigned_To VARCHAR(100),
    Created_At DATETIME2
);

CREATE TABLE dbo.daily_occupancy (
    Snapshot_ID VARCHAR(30),
    PG_ID VARCHAR(20),
    Snapshot_Date DATE,
    Total_Beds INT,
    Occupied_Beds INT,
    Vacant_Beds INT,
    Occupancy_Percent DECIMAL(8,4),
    Available_For_Booking INT,
    Created_At DATETIME2
);

CREATE TABLE dbo.daily_operations (
    Ops_ID VARCHAR(30),
    PG_ID VARCHAR(20),
    Date DATE,
    Checkins INT,
    Checkouts INT,
    Complaints_Logged INT,
    Maintenance_Jobs INT,
    Food_Quality_Score DECIMAL(8,2),
    Housekeeping_Score DECIMAL(8,2),
    Created_At DATETIME2
);

CREATE TABLE dbo.dim_date (
    Date DATE,
    Year INT,
    Month INT,
    Month_Name VARCHAR(20),
    Month_Short VARCHAR(10),
    Quarter VARCHAR(10),
    YearMonth VARCHAR(20),
    Week INT,
    Day_Name VARCHAR(20),
    Is_Weekend BIT,
    Financial_Year VARCHAR(20)
);
