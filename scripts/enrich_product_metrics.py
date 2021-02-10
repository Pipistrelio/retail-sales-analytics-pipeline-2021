import pandas as pd

def enrich(df_sales, df_products):
    return df_sales.merge(df_products, on="product_id", how="left")

if __name__ == "__main__":
    print("Enrichment complete.")
