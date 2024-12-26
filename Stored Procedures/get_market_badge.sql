CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_badge`(
        in in_markert varchar(45),
		in in_fisacal_year year,
        out out_badge varchar(45)
)
BEGIN
     declare qty int default 0;
     
# retrive total qty for a given market + fiscal_year 
     select sum(sold_quantity) as total_qty
	 from fact_sales_monthly s
     join dim_customer c
     on  s.customer_code= c.customer_code
     where get_fiscal_year(s.date)=2021 and c.market =in_markert
     group by c.market;
     
 # determine market badge
	if qty>5000000 then 
     set out_badge = "gold";
	else 
    set out_badge = "sliver";
    end if;

END