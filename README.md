# DataCo Global Supply Chain Analytics & Performance Audit

An end-to-end data analytics project evaluating global supply chain operations, fulfillment efficiency, shipping delays, and financial performance using the **DataCo Smart Supply Chain Dataset**.

---

## 📌 Project Overview
Operating a global supply chain involves navigating complex logistics, shipping bottlenecks, and inventory challenges. This project investigates transactional shipping logs to uncover root causes for delivery delays, assess regional fulfillment patterns, and analyze financial impacts associated with order cancellations and late shipments.

---

## 🛠️ Tech Stack
* **Data Processing & EDA:** Python (Pandas, NumPy)
* **Database & Querying:** MySQL (Relational schema design, aggregate analytics)
* **Data Visualization & BI:** Power BI (Interactive executive dashboard, DAX measures)
* **Version Control:** Git & GitHub

---

## 📂 Repository Structure
```text
dataco-supply-chain-analytics/
├── data/
│   ├── raw/                 # Original DataCo dataset (ignored in git if too large)
│   └── processed/           # Cleaned and transformed CSV files
├── sql/
│   ├── dataco_supply_chain_analysis.sql # Schema setup and KPI query scripts
├── scripts/
│   ├── data_preprocessing.py# Python script for cleaning, formatting, and parsing dates
├── dashboards/
│   ├── dataco_supply_chain_dashboard.pbix # Power BI report file
│   ├── power_bi_dashboard_specification.md # DAX measures and layout blueprint
│   └── screenshots/         # Dashboard preview images for the README
├── .gitignore
└── README.md
