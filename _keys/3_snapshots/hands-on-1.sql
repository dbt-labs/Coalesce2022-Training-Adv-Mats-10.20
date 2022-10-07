1. right click the ... next to the snapshots folder and click "create file". Name
your file products_snapshot.sql. Add the necessary Snapshot fields to the file.
***For the target_schema, updated it with "snapshots_(your dbt username)"

--------
-- file: snapshots/products_snapshots.sql
--------

{% snapshot product_snapshot %}
{{
  config(
    target_database='advanced_materializations',
    target_schema='',
    unique_key='id',
    strategy='timestamp',
    updated_at='updated_at',
  )
}}
select * from {{ source('jaffle_shop', 'products') }}
{% endsnapshot %}

2. dbt snapshot

3. Open a scratchpad and query the snapshot data using the following code:

--------
-- scratchpad
--------

select * from {{ ref('products_snapshot') }}

4. dbt snapshot

5. Rerun the query that checked your snapshot:

--------
-- scratchpad
--------

select * from {{ ref('products_snapshot') }}