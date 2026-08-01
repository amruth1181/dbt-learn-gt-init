-- Singular test: Verify that total payment amount for any order is non-negative
-- dbt tests pass when 0 rows are returned. If any row is returned, the test fails.

select
    order_id,
    sum(amount) as total_amount
from {{ ref('stg_payments') }}
group by 1
having total_amount < 0
