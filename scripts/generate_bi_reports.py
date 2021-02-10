import pandas as pd

def generate_report(df):
    summary = df.groupby("region")["total_amount"].sum().reset_index()
    summary.to_csv("out/revenue_by_region.csv", index=False)
    print("Report generated: out/revenue_by_region.csv")

if __name__ == "__main__":
    print("BI report generation simulated.")
