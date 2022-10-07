1. add a dateadd() block to your where clause that creates a 3-day span

--------
-- file: models/marts/snowplow/snowplow__page_views.sql
--------

{{
    config(
        materialized='incremental',
    )
}}

with events as (

    select * from {{ ref('stg_events') }}
    {% if is_incremental() %}
    where collector_tstamp >= (select dateadd('day', -3, max(max_collector_tstamp) from {{ this}})
    {% endif %}

),

2. Under materialized in your config block, you will add a unique_key identifier, pointing to page_view_id.

--------
-- file: models/marts/snowplow/snowplow__page_views.sql
--------

{{
    config(
        materialized='incremental',
        unique_key = 'page_view_id'
    )
}}


3. dbt run




Expand:
Increase the incremental cutoff by 3 days in `snowplow__page_views`
Add:
A unique key to the config block
Build:
Use the command that builds your models to your warehouse