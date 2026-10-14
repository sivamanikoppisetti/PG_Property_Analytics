# Solution Architecture

## End-to-end flow

```text
CSV / Synthetic Operational Data
              |
              v
       Fabric Lakehouse
              |
              v
       Fabric Warehouse
              |
              +---- SQL validation
              |
              v
      Power BI Semantic Model
              |
       +------+------+
       |             |
       v             v
   Dimensions      Facts
       |             |
       +------+------+
              |
              v
        Reusable DAX
              |
              v
       Power BI Report
              |
              v
     Executive Decision Layer
```

## Design principles

1. Keep property attributes in `pg_master`.
2. Keep dates in `dim_date`.
3. Keep transactional and snapshot events in fact tables.
4. Avoid fact-to-fact relationships.
5. Prefer measures for dynamic business KPIs.
6. Use SQL for validation and source-level transformations.
7. Use DAX for interactive filter-aware analytics.
8. Keep the executive page concise.
