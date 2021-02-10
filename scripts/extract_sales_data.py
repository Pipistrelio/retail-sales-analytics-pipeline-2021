import pandas as pd

def extract_sales_data(path="data_sample/sales_2021_q1.csv"):
    df = pd.read_csv(path)
    print(f"Extracted {len(df)} sales records.")
    return df

if __name__ == "__main__":
    extract_sales_data()
