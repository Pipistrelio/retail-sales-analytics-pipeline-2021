import pandas as pd

def clean_data(df):
    df.columns = [c.strip().lower() for c in df.columns]
    df = df.drop_duplicates()
    df = df.dropna(subset=["sale_date", "product_id", "total_amount"])
    return df

if __name__ == "__main__":
    sample = pd.DataFrame({"sale_date": ["2021-01-01"], "product_id": [1], "total_amount": [100.0]})
    print(clean_data(sample))
