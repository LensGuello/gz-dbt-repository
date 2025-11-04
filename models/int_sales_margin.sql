select
        date_date,
        orders_id,
        products_id,
        revenue,
        quantity,
        purchase_price,
        (sales.quantity*prod.purchase_price) as purchase_cost,
        sales.revenue - sales.quantity*prod.purchase_price as margin
from {{ref('stg_gz_raw_data__raw_gz_sales')}} as sales
left join {{ref('stg_gz_raw_data__raw_gz_product')}} as prod
    on sales.pdt_id = prod.products_id