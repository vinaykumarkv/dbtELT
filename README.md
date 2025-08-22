# dbtELT Project

## Overview
This is an ETL (Extract, Transform, Load) portfolio project demonstrating data transformation using dbt. The project connects to a PostgreSQL database named my_etl_db and processes taxi ride data to generate insights.

## Project Structure
- models/: Contains dbt models (e.g., marketing/total_creditcard_riders_by_day.sql).
- seeds/: Stores seed data (e.g., taxi_rides_raw.csv).
- tests/: Defines data quality tests (e.g., not_null, accepted_range).
- dbt_project.yml: Configures the dbt project.
- profiles.yml: Stores database connection details.
- packages.yml: Lists dependencies (e.g., dbt-utils).

## Setup Instructions
1. Install Dependencies:
   - Create a virtual environment: python -m venv .venv.
   - Activate it: .venv\Scripts\activate (Windows).
   - Install dbt: pip install dbt-core==1.10.9 dbt-postgres==1.10.*.
   - Install packages: dbt deps.

2. Configure Database:
   - Ensure PostgreSQL is running with my_etl_db created.
   - Update C:\Users\vinay\.dbt\profiles.yml with your credentials:
     dbtELT:
       target: dev
       outputs:
         dev:
           type: postgres
           host: localhost
           user: your_username
           pass: your_password
           dbname: my_etl_db
           port: 5432

3. Run the Project:
   - Navigate to C:\DataEngineer\Projects\dbtELT\dbtELT.
   - Run: dbt run --select total_creditcard_riders_by_day.
   - Test: dbt test --select total_creditcard_riders_by_day.
   - Generate docs: dbt docs generate && dbt docs serve.

## Data Model
- Source: public.taxi_rides_raw contains raw taxi ride data (e.g., tpep_pickup_datetime, passenger_count, payment_type).
- Model: marketing.total_creditcard_riders_by_day aggregates daily credit card payments from taxi_rides_raw.

## Notes
- The project uses the marketing schema for output tables.
- Ensure the marketing schema exists in my_etl_db with CREATE SCHEMA marketing;.
- Address deprecation warnings by using --select and updating dbt_utils.accepted_range tests with arguments.

## License
MIT License