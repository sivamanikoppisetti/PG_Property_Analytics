# Interview Guide

## Project explanation — 60 seconds

"I built a synthetic PG property-management analytics solution using Microsoft Fabric and Power BI. I modeled property, tenant, bed, rent, expense, occupancy and operational data in a warehouse and Power BI semantic model. I then created reusable DAX measures for occupancy, rent collection, outstanding rent, net revenue and period-over-period analysis, and built an executive dashboard focused on property performance."

## Questions to prepare for

### Why Fabric?
To demonstrate an end-to-end Microsoft analytics workflow from warehouse to semantic model and Power BI reporting.

### Why a semantic model?
To centralize relationships and reusable measures so multiple report visuals use consistent business logic.

### Why DAX measures instead of calculated columns?
Measures are evaluated in filter context and are better suited to dynamic KPIs, slicers and aggregations.

### How is occupancy calculated?
Occupied beds divided by total beds, with the latest available occupancy snapshot selected for the current KPI context.

### Why use pg_master as a dimension?
It provides a single property-level filter path to multiple operational and financial fact tables.

### Why use dim_date?
It provides a consistent calendar for time-based analysis and avoids relying on disconnected date fields.

### Why avoid fact-to-fact relationships?
They can create ambiguous filter paths and unexpected aggregation behavior.

### How would you optimize this at 40M+ rows?
Use a proper star schema, push heavy transformations upstream, reduce model width, use incremental refresh/appropriate storage modes, optimize DAX, and inspect Performance Analyzer / model metadata.

### What is synthetic about the project?
The data is intentionally generated for portfolio and interview demonstration. The technical workflow and analytical logic are the focus; no real customer or company data is claimed.
