"""
Project: DataCo Global Supply Chain Analytics & Performance Audit
File: data_preprocessing.py
Description: Cleans the raw DataCo dataset, normalizes column names, parses dates, 
             performs basic feature engineering, and exports a clean CSV ready for MySQL and Power BI.
"""

import pandas as pd
import numpy as np
import os

def clean_dataco_data(input_filepath, output_filepath):
    print("Loading raw DataCo dataset...")
    try:
        # DataCo dataset usually requires 'latin-1' or 'ISO-8859-1' encoding due to special characters
        df = pd.read_csv(input_filepath, encoding='latin-1')
    except FileNotFoundError:
        print(f"Error: The file at '{input_filepath}' was not found. Please verify your path.")
        return
    
    print(f"Initial dataset shape: {df.shape}")
    
    # 1. Normalize Column Names (convert to lowercase, replace spaces and punctuation with underscores)
    df.columns = (
        df.columns.str.strip()
        .str.lower()
        .str.replace(' ', '_', regex=False)
        .str.replace('(', '', regex=False)
        .str.replace(')', '', regex=False)
        .str.replace('/', '_', regex=False)
        .str.replace('-', '_', regex=False)
    )
    
    print("Column names normalized successfully.")

    # 2. Handle Missing Values in Critical IDs
    critical_ids = ['order_id', 'customer_id', 'product_card_id']
    for col in critical_ids:
        if col in df.columns:
            initial_count = len(df)
            df = df.dropna(subset=[col])
            print(f"Dropped {initial_count - len(df)} rows with missing {col}.")

    # Fill missing numerical values if necessary
    if 'sales_per_customer' in df.columns:
        df['sales_per_customer'] = df['sales_per_customer'].fillna(df['sales_per_customer'].median())

    # 3. Convert Date Columns to Standard Datetime Format
    date_columns = [col for col in df.columns if 'date' in col]
    for col in date_columns:
        df[col] = pd.to_datetime(df[col], errors='coerce')
    
    print(f"Parsed {len(date_columns)} date-related columns into datetime objects.")

    # 4. Feature Engineering
    # Calculate actual fulfillment duration if order and shipping dates exist
    if 'order_date_date_orders' in df.columns and 'shipping_date_date_orders' in df.columns:
        df['actual_fulfillment_days'] = (df['shipping_date_date_orders'] - df['order_date_date_orders']).dt.days

    # Ensure output directory exists
    os.makedirs(os.path.dirname(output_filepath), exist_ok=True)

    # 5. Export Processed Data
    df.to_csv(output_filepath, index=False)
    print(f"Preprocessing complete! Cleaned dataset saved to: {output_filepath}")
    print(f"Final dataset shape: {df.shape}")

if __name__ == "__main__":
    # Define paths relative to the script location
    input_path = "../data/raw/DataCoSupplyChainDataset.csv"
    output_path = "../data/processed/clean_dataco_supply_chain.csv"
    
    clean_dataco_data(input_path, output_path)