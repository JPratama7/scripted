#!/usr/bin/python

import pandas as pd
import urllib.request
import json
from urllib.parse import quote

def get_universities_data(country):
    # Encode the country name for URL
    encoded_country = quote(country)

    # API URL
    url = f'http://universities.hipolabs.com/search?country={encoded_country}'

    # Fetch data from API
    with urllib.request.urlopen(url) as response:
        data = json.loads(response.read().decode())

    # Create DataFrame
    df = pd.DataFrame(data)

    # Select required columns
    columns = ['name', 'web_pages', 'country', 'domains', 'state-province']
    df = df[columns]

    # Rename columns
    df = df.rename(columns={
        'name': 'Name',
        'web_pages': 'Web pages',
        'country': 'Country',
        'domains': 'Domains',
        'state-province': 'State Province'
    })


    while True:
        filter_state_province = input("Filter State Province?: (y/n) ").lower().strip()
        print(filter_state_province)
        if len(filter_state_province) > 1:
            print("Only one letter is accepted")
            continue

        if filter_state_province not in ["y", "n"]:
            print(f"Only y or n is accepted {filter_state_province}")
            continue

        if filter_state_province == "n":
            break

        df = df.dropna(subset=['State Province'])
        break

    return df

# Example usage
country = input("Country: ")
df = get_universities_data(country)

# Display the first few rows of the DataFrame
print(df.head())

# Save to CSV (optional)
df.to_csv('universities_data.csv', index=False)
print("Data saved to universities_data.csv")
