# PG Property Analytics

End-to-end Property Analytics solution built using Microsoft Fabric, SQL, Power BI and DAX.

## 📊 Dashboard Preview

![PG Property Analytics Dashboard](dashboard_overview.png)

## 🎯 Project Overview

This project demonstrates an end-to-end business intelligence solution for analyzing a multi-property PG (Paying Guest) portfolio.

The solution focuses on:

- Occupancy performance
- Rent collection
- Outstanding rent
- Revenue and expenses
- Property-level performance
- Area-level analysis
- Tenant movements
- Operational performance
- Complaints analysis

> **Note:** The dataset used in this project is synthetic and created for learning and portfolio demonstration purposes.

## 🛠️ Technology Stack

| Technology | Usage |
|---|---|
| Microsoft Fabric | Data warehouse and analytics platform |
| SQL | Data validation, transformation and business queries |
| Power BI | Interactive dashboards and reporting |
| DAX | Business KPIs and analytical measures |
| Excel / CSV | Source datasets |

## 🏗️ Architecture

Synthetic CSV Data
        ↓
Microsoft Fabric Warehouse
        ↓
SQL Validation & Business Queries
        ↓
Power BI Semantic Model
        ↓
DAX Measures
        ↓
Interactive Power BI Dashboard

See the detailed architecture:
[Architecture](architecture.md)
📐 Data Model
The analytical model contains property, room, bed, tenant, rent, expense, occupancy and operations data.

📈 Dashboard
The Power BI report contains multiple analytical pages:
- Overview
- Revenue
- Occupancy
- Operations
- Tenants
- Complaints
The dashboard provides interactive PG-level filtering and KPI analysis.
🧮 Key KPIs
Examples of analytical measures include:
- Total Beds
- Occupied Beds
- Occupancy %
- Rent Collected
- Outstanding Rent
- Total Expenses
- Net Revenue
- Month-over-Month Rent Collection
- Property-level performance
DAX measures are available in:
measures.dax
🗄️ SQL
SQL scripts are included for:
- Table creation
- Data quality checks
- Business KPI queries
Files:
- 01_create_tables.sql
- 02_data_quality_checks.sql
- 03_business_queries.sql


📁 Repository Structure
PG_Property_Analytics/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── *.csv
├── *.sql
├── measures.dax
│
├── dashboard_overview.png
├── architecture.png
├── data_model.png
│
├── architecture.md
├── data_model.md
├── dashboard_pages.md
├── REPORT_SETUP.md
├── interview_guide.md
└── resume_project_entry.md

💼 Skills Demonstrated
- SQL
- Microsoft Fabric
- Power BI
- DAX
- Data Modeling
- KPI Development
- Data Quality Validation
- Dashboard Design
- Business Analysis
- Analytical Reporting
👤 Portfolio Project
Created as a portfolio project to demonstrate practical Data Analyst / BI Analyst capabilities using Microsoft Fabric, SQL and Power BI.
