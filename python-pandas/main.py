#!/usr/bin/python

import pandas as pd
import os

# Read CSV files
csv_files = ['branch_a.csv', 'branch_b.csv', 'branch_c.csv']
dfs = [pd.read_csv(file) for file in csv_files]

# Combine all DataFrames
combined_df = pd.concat(dfs, ignore_index=True)

# Clean data
# 1. Remove rows with NaN in transaction_id, date, and customer_id
combined_df = combined_df.dropna(subset=['transaction_id', 'date', 'customer_id'])

# 2. Convert date column to datetime
combined_df['date'] = pd.to_datetime(combined_df['date'])

# 3. Remove duplicates based on transaction_id, keep the latest date
combined_df = combined_df.sort_values('date', ascending=False).drop_duplicates('transaction_id', keep='first')

# 4. Calculate total sales per branch
combined_df['total_sale'] = combined_df['quantity'] * combined_df['price']
total_sales = combined_df.groupby('branch')['total_sale'].sum().reset_index()

# Save total sales per branch to CSV
total_sales.to_csv('total_sales_per_branch.csv', index=False)

print("Data processing completed. Results saved to total_sales_per_branch.csv")
