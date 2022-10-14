1. located at models/marts/snowplow/snowplow__page_views.sql

2. This can be done in 2 locations: dbt_project.yml file or in the model itself. We 
recommend you manage materializations in the dbt_project.yml file. Open the file, scroll
to the bottom and identify the "materialized:" statement. Update the materialization of marts
to table and keep the materializaiton of staging as view

3. dbt run

4. located in Snowflake under your target schema

