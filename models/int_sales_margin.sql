select
        date_date,
        orders_id,
        pdt_id as products_id,
        revenue,
        quantity,
        purchase_price,
        (sales.quantity*prod.purchase_price) as purchase_cost,
        sales.revenue - sales.quantity*prod.purchase_price as margin
from {{ ref('stg_gz_raw_data__raw_gz_sales') }} as sales
left join {{ ref('stg_gz_raw_data__raw_gz_product') }} as prod
    using(products_id)