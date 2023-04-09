
use BikeStores
go

select * from production.brands
select * from production.categories
select * from production.products
select * from production.stocks
select * from sales.customers
select * from sales.order_items
select * from sales.orders
select * from sales.staffs
select * from sales.stores


select so.order_id
	,concat(sc.first_name,' ',sc.last_name) customer
	,sc.city
	,sc.state
	,order_date
	,pp.product_name
	,sum(soi.quantity) total_unit
	,sum(soi.quantity*soi.list_price) revenue	
	,category_name
	,store_name
	,concat(sstaff.first_name,' ',sstaff.last_name) sale_rep
		
from sales.orders so
left join sales.customers sc
on so.customer_id = sc.customer_id
left join sales.order_items soi
on so.order_id = soi.order_id
left join production.products pp
on soi.product_id = pp.product_id
left join production.categories pc
on pp.category_id = pc.category_id
left join sales.stores ss
on so.store_id = ss.store_id
left join sales.staffs sstaff
on sstaff.staff_id = so.staff_id
group by 
	so.order_id
	,concat(sc.first_name,' ',sc.last_name)
	,sc.city
	,sc.state
	,order_date
	,pp.product_name
	,category_name
	,store_name
	,concat(sstaff.first_name,' ',sstaff.last_name) 
order by order_id



	