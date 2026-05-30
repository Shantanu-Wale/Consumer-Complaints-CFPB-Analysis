# 📊 Consumer Financial Complaints Analysis — CFPB USA

> **Tools:** SQL · MySQL Workbench · Power BI  
> **Dataset:** US Consumer Financial Protection Bureau (CFPB) — Jan & Feb 2023  
> **Records:** 2,275 complaints · 9 product categories · 45 states · 5 submission channels

---

## 📌 Project Overview

This project analyses real consumer financial complaint data published by the **US Consumer Financial Protection Bureau (CFPB)** — a government agency that supervises banks, lenders, and other financial companies.

The goal was to identify complaint patterns, pinpoint high-risk products and states, evaluate company response quality, and visualise findings through an interactive Power BI dashboard.

---

## 🗂️ Dataset Details

| Attribute | Details |
|---|---|
| Source | Consumer Financial Protection Bureau (CFPB) |
| Period | January – February 2023 |
| Total Records | 2,275 complaints |
| Products | 9 (Mortgage, Credit Card, Checking/Savings, etc.) |
| States Covered | 45 |
| Submission Channels | Web, Phone, Referral, Postal Mail, Web Referral |

---

## 🔑 Key Business Questions Answered

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

## 🛠️ SQL Techniques Used

- `GROUP BY` with `COUNT` and `SUM` for aggregations
- `WINDOW FUNCTIONS` — `SUM() OVER(PARTITION BY ...)` for running totals
- `CTEs` (Common Table Expressions) for modular query building
- `HAVING` with `COUNT(DISTINCT)` for sub-product complexity analysis
- `LAST_DAY()` date function for complaints-per-day calculation
- `WHERE` filters for delayed response isolation and receipt time analysis
- Multi-level `ORDER BY` for ranked state and product insights

---

## 📈 Power BI Dashboard — 4 Pages

### Page 1 — Complaints Overview
![Complaints Overview](C_Page_1.png)

- KPI Cards: Total Complaints (1,183), Timely Response % (87.24), Delayed Response % (12.76), Unique Products (9), Total States (45)
- Monthly complaints trend line chart with interactive product filter slicer

---

### Page 2 — Products & Sub-Products
![Products and Sub-Products](C_Page_2.png)

- 100% stacked bar chart showing sub-product complaint distribution across all 9 product categories
- Reveals internal complexity of each product — Money Transfer has 10 distinct sub-products

---

### Page 3 — Complaint Channels & Response Time
![Complaint Channels and Response Time](C_Page_3.png)

- Horizontal bar chart: complaints by submission channel — Web dominates at 1,972
- Donut chart: timely response breakdown — 88% Yes · 12% No (273 delayed)

---

### Page 4 — Top States & Company Response
![Top States and Company Response](C_Page_4.png)

- Donut chart: top 5 states by complaint share — CA leading at 42.25% (491 complaints)
- Donut chart: company response types — 68.62% closed with explanation · 20.84% closed with monetary relief

---

## 💡 Key Insights

1. **Checking/Savings Account** drives 45% of all complaints — highest priority product for resolution improvement
2. **California alone** accounts for 42.25% of top-5 state complaints and 64 of 273 delayed responses — a geographic hotspot
3. **88% of complaints** received timely responses — but 273 cases did not, representing a measurable service gap
4. **Web channel dominates** at 86.7% of submissions — digital complaint management is critical
5. **February had higher complaints per day** (39.0 vs 38.16) despite fewer total complaints — indicating increasing complaint intensity
6. **Money Transfer products** have the most complex sub-product structure (10 distinct types) — highest operational complexity

---

## 📁 Repository Structure

```
consumer-complaints-cfpb-analysis/
│
├── Consumer_Complaints_SQL.csv       # Raw dataset
├── complaints_analysis.sql           # Full SQL script with all queries
├── C_Page_1.png                      # Dashboard — Complaints Overview
├── C_Page_2.png                      # Dashboard — Products & Sub-Products
├── C_Page_3.png                      # Dashboard — Channels & Response Time
├── C_Page_4.png                      # Dashboard — Top States & Company Response
└── README.md
```

---

## 👤 Author

**Shantanu Rudresh Wale**  
Data Analyst | Pune, Maharashtra  
📧 wale.shantanu2001@gmail.com  
🔗 [GitHub Profile](https://github.com/Shantanu-Wale)

---

*Dataset sourced from the US Consumer Financial Protection Bureau (CFPB) public complaints database.*
