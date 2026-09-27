-- =========================================================================
-- Project: DataCo Global Supply Chain Analytics & Performance Audit
-- File: dataco_supply_chain_analysis.sql
-- Description: MySQL script for table creation, database schema setup, 
--              and analytical queries to audit supply chain KPIs.
-- =========================================================================

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS dataco_supply_chain;
USE dataco_supply_chain;

-- Step 2: Drop table if it already exists to ensure a fresh import
DROP TABLE IF EXISTS supply_chain_transactions;

-- Step 3: Create Main Transactions Table
-- Note: Adjust column data types as necessary depending on your exact processed CSV structure
CREATE TABLE supply_chain_transactions (
    type_transaction VARCHAR(50),
    days_for_shipping_real INT,
    days_for_shipment_scheduled INT,
    benefit_per_order DECIMAL(10, 2),
    sales_per_customer DECIMAL(10, 2),
    delivery_status VARCHAR(50),
    late_delivery_risk INT,
    category_id INT,
    category_name VARCHAR(100),
    customer_city VARCHAR(100),
    customer_country VARCHAR(100),
    customer_id INT,
    customer_segment VARCHAR(50),
    customer_state VARCHAR(50),
    department_id INT,
    department_name VARCHAR(100),
    latitude DECIMAL(10, 6),
    longitude DECIMAL(10, 6),
    market VARCHAR(50),
    order_city VARCHAR(100),
    order_country VARCHAR(100),
    order_customer_id INT,
    order_date DATETIME,
    order_id INT,
    order_item_card_prod_id INT,
    order_item_discount DECIMAL(10, 2),
    order_item_discount_rate DECIMAL(5, 4),
    order_item_id INT,
    order_item_product_price DECIMAL(10, 2),
    order_item_profit_ratio DECIMAL(5, 4),
    order_item_quantity INT,
    sales DECIMAL(10, 2),
    order_item_total DECIMAL(10, 2),
    order_profit_per_order DECIMAL(10, 2),
    order_region VARCHAR(50),
    order_state VARCHAR(100),
    product_card_id INT,
    product_category_id INT,
    product_description TEXT,
    product_image TEXT,
    product_name VARCHAR(255),
    product_price DECIMAL(10, 2),
    product_status INT,
    shipping_date DATETIME,
    shipping_mode VARCHAR(50)
);

-- =========================================================================
-- Step 4: Analytical & KPI Queries
-- =========================================================================

-- Query 1: Overall On-Time vs. Late Delivery Rate Breakdown
SELECT 
    delivery_status,
    COUNT(order_id) AS total_orders,
    ROUND(COUNT(order_id) * 100.0 / SUM(COUNT(order_id)) OVER(), 2) AS percentage_share
FROM supply_chain_transactions
GROUP BY delivery_status;

-- Query 2: Late Delivery Risk Percentage by Shipping Mode
SELECT 
    shipping_mode,
    COUNT(order_id) AS total_orders,
    SUM(late_delivery_risk) AS total_late_risk_orders,
    ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(order_id), 2) AS late_risk_percentage
FROM supply_chain_transactions
GROUP BY shipping_mode
ORDER BY late_risk_percentage DESC;

-- Query 3: Top 5 Markets by Total Sales and Profitability
SELECT 
    market,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(benefit_per_order), 2) AS total_benefit
FROM supply_chain_transactions
GROUP BY market
ORDER BY total_sales DESC
LIMIT 5;

-- Query 4: Department Performance - Total Orders and Average Profit Ratio
SELECT 
    department_name,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(order_item_profit_ratio) * 100, 2) AS avg_profit_ratio_percent,
    ROUND(SUM(sales), 2) AS total_department_sales
FROM supply_chain_transactions
GROUP BY department_name
ORDER BY total_department_sales DESC;