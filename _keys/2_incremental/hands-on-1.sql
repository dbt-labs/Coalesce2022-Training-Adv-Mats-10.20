1. dbt run

2. This config block will sit at the top of your model

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
    where collector_tstamp >= (select max(max_collector_tstamp) from {{ this}})
    {% endif %}

),

3. dbt run

4. Go to learn.getdbt.com. You can choose any of the slide links and browse through
them. Snowplow page views captures current interactions on the slides and can be viewed
in your own incremental build. Try running dbt build again and reviewing the results