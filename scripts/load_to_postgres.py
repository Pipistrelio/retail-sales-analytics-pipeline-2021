import sqlalchemy as sa

def load_to_postgres(df, table_name="sales"):
    print(f"Would load {len(df)} rows into {table_name} table.")

if __name__ == "__main__":
    print("Load simulation complete.")
