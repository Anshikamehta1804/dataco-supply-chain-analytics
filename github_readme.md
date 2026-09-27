# DataCo Global Supply Chain Analytics & Performance Audit

An end-to-end data analytics and business intelligence project evaluating global supply chain operations, fulfillment efficiency, shipping delays, and financial performance using the **DataCo Smart Supply Chain Dataset**.

---

## 📌 Project Overview
Operating a global supply chain requires continuous monitoring of logistics, inventory, fulfillment lags, and risk factors. This project investigates transactional shipping logs to uncover root causes for delivery delays, analyze regional fulfillment bottlenecks, evaluate profitability across categories, and provide data-driven insights through an executive-level dashboard.

---

## 🛠️ Tech Stack & Tools
* **Data Processing & EDA:** Python (`Pandas`, `NumPy`)
* **Database & Querying:** MySQL (`Relational schema design`, `Aggregations`)
* **Data Visualization & BI:** Power BI (`DAX measures`, `Interactive executive dashboard`)
* **Version Control:** Git & GitHub

---

## 📂 Repository Structure
```text
dataco-supply-chain-analytics/
├── data/
│   ├── raw/                 # Original DataCo dataset (git-ignored for size)
│   └── processed/           # Cleaned and normalized CSV dataset
├── sql/
│   └── dataco_supply_chain_analysis.sql # Schema setup, table creation & KPI queries
├── scripts/
│   └── data_preprocessing.py            # Automated Python data cleaning pipeline
├── dashboards/
│   ├── dataco_supply_chain_dashboard.pbix # Power BI interactive report
│   ├── power_bi_dashboard_specification.md # DAX measures & model specs
│   └── screenshots/                     # Executive dashboard visual previews
└── README.md
```

---

## 🚀 Execution Pipeline & Setup Instructions

### Step 1: Python Data Preprocessing
Run the preprocessing script to handle missing values, normalize column names, and parse timestamps:
```bash
python scripts/data_preprocessing.py
```

### Step 2: MySQL Database Setup & Query Execution
Execute the SQL script to create your relational database structure and audit delivery KPIs:
```sql
-- Load and run sql/dataco_supply_chain_analysis.sql in your MySQL environment
```

### Step 3: Power BI Executive Dashboard
1. Open Power BI Desktop and connect your cleaned dataset (`clean_dataco_supply_chain.csv`).
2. Implement the DAX measures outlined in [`dashboards/power_bi_dashboard_specification.md`](dashboards/power_bi_dashboard_specification.md).
3. Build your schema relationship with the custom `DateTable` to drive monthly timeline trends.

---

## 📊 Key Performance Metrics & Findings
* **Total Order Volume:** `10,999` transactions analyzed.
* **Financial Impact:** Total Sales of `$4.82M` with a Total Profit of `$965K` (`20.0%` Average Profit Margin).
* **Delivery Performance:** Maintained an On-Time Fulfillment Rate of `88.6%`, with a Late Delivery Rate risk of `11.4%`.
* **Regional Bottlenecks:** Pinpointed high-risk delivery regions and shipping modes requiring logistical optimization.

---

## 📈 Power BI Executive Dashboard Preview
![Dashboard Preview](dashboards/screenshots/dataco_dashboard_overview.png)

*An interactive multi-page dashboard built to monitor real-time shipping durations, profit correlations, monthly late delivery trends, and regional risk distributions.*