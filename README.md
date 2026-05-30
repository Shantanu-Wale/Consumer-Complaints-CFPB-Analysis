**Shantanu Rudresh Wale**  
📧 wale.shantanu2001@gmail.com 

**Dataset sourced from the US Consumer Financial Protection Bureau (CFPB) public complaints database.**


# Consumer Financial Complaints Analysis — CFPB USA

> **Tools:** SQL · MySQL Workbench · Power BI  
> **Dataset:** US Consumer Financial Protection Bureau (CFPB) — Jan & Feb 2023  
> **Records:** 2,275 complaints · 9 product categories · 45 states · 5 submission channels

---

## Project Overview

This project analyses real consumer financial complaint data published by the **US Consumer Financial Protection Bureau (CFPB)** — a government agency that supervises banks, lenders, and other financial companies.

The goal was to identify complaint patterns, pinpoint high-risk products and states, evaluate company response quality, and visualise findings through an interactive Power BI dashboard.

---

## Dataset Details

| Attribute | Details |
|---|---|
| Source | Consumer Financial Protection Bureau (CFPB) |
| Period | January – February 2023 |
| Total Records | 2,275 complaints |
| Products | 9 (Mortgage, Credit Card, Checking/Savings, etc.) |
| States Covered | 45 |
| Submission Channels | Web, Phone, Referral, Postal Mail, Web Referral |

---

## Key Business Questions Answered

| # | Question | Finding |
|---|---|---|
| Q1 | Which product has the highest complaints? | Checking/Savings Account — 1,029 complaints |
| Q2 | Top 5 states by complaints? | CA: 491 · FL: 237 · TX: 180 · NY: 155 · GA: 99 |
| Q3 | Which channel receives the most complaints? | Web — 1,972 out of 2,275 (86.7%) |
| Q4 | What is the delayed response rate? | 273 complaints (12%) received no timely response |
| Q5 | Most common issue across all products? | Managing an Account — 544 complaints |
| Q6 | Which product has the most sub-products? | Money Transfer — 10 distinct sub-products |
| Q7 | Which state has the most delayed responses? | CA — 64 of 273 total delayed responses |
| Q8 | Monthly complaints per day comparison? | Feb: 39.0/day vs Jan: 38.16/day |

---

## SQL Techniques Used

- `GROUP BY` with `COUNT` and `SUM` for aggregations
- `WINDOW FUNCTIONS` — `SUM() OVER(PARTITION BY ...)` for running totals
- `CTEs` (Common Table Expressions) for modular query building
- `HAVING` with `COUNT(DISTINCT)` for sub-product complexity analysis
- `LAST_DAY()` date function for complaints-per-day calculation
- `WHERE` filters for delayed response isolation and receipt time analysis
- Multi-level `ORDER BY` for ranked state and product insights

---

## Power BI Dashboard — 4 Pages

### Page 1 — Complaints Overview
- KPI Cards: Total Complaints, Timely Response %, Delayed Response %, Unique Products, Total States
- Monthly complaints trend line chart with product filter slicer

### Page 2 — Products & Sub-Products
- 100% stacked bar chart showing sub-product complaint distribution across all 9 product categories

### Page 3 — Complaint Channels & Response Time
- Horizontal bar chart: complaints by submission channel
- Donut chart: timely response breakdown (88% Yes · 12% No)

### Page 4 — Top States & Company Response
- Donut chart: top 5 states by complaint share (CA: 42.25%)
- Donut chart: company response types (68.62% closed with explanation · 20.84% closed with monetary relief)

---

## Key Insights

1. **Checking/Savings Account** drives 45% of all complaints — highest priority product for resolution improvement
2. **California alone** accounts for 42.25% of top-5 state complaints and 64 of 273 delayed responses — a geographic hotspot
3. **88% of complaints** received timely responses — but 273 cases did not, representing a measurable service gap
4. **Web channel dominates** at 86.7% of submissions — digital complaint management is critical
5. **February had higher complaints per day** (39.0 vs 38.16) despite fewer total complaints — indicating increasing complaint intensity
6. **Money Transfer products** have the most complex sub-product structure (10 distinct types) — highest operational complexity

---
