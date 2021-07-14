{{ config(schema="edm") }}

SELECT * FROM {{ source('bike_production', 'categories') }}
