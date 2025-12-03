use blinkit_data;
select * from blinkit;
select Rating from blinkit;
set sql_safe_updates = 0;

alter table blinkit
change column ï»¿Item_Fat_Content Item_Fat_Content varchar(50);

update blinkit
set Item_Fat_Content =
case
when Item_Fat_Content in ("LF", "low fat") then "Low Fat"
when Item_Fat_Content = "reg" then "Regular"
else Item_Fat_Content 
end;

select distinct(Item_Fat_Content) from blinkit;

select sum(Total_Sales) from blinkit;

select cast(sum(Total_Sales) as decimal(10, 2)) as totalsales
from blinkit;

select cast(avg(Total_Sales) as decimal(10, 2)) as avgoftotalsales
from blinkit;

select distinct count(Item_Fat_Content) as items_sold 
from blinkit;

select cast(avg(Rating) as decimal(10, 2)) as avg_rating from blinkit;

select distinct Item_Fat_Content,
cast(sum(Total_Sales) as decimal(10, 2)) as totalsales,
cast(avg(Total_Sales) as decimal(10, 2)) as avgoftotalsales,
count(Item_Fat_Content) as items_sold,
cast(avg(Rating) as decimal(10, 2)) as avg_rating
from blinkit
group by Item_Fat_Content;

select distinct Item_Type,
cast(sum(Total_Sales) as decimal(10, 2)) as totalsales,
cast(avg(Total_Sales) as decimal(10, 2)) as avgoftotalsales,
count(Item_Fat_Content) as items_sold,
cast(avg(Rating) as decimal(10, 2)) as avg_rating
from blinkit
group by Item_Type
order by totalsales desc
limit 5;

select distinct Item_Fat_Content,
Outlet_Type,
cast(sum(Total_Sales) as decimal(10, 2)) as totalsales,
cast(avg(Total_Sales) as decimal(10, 2)) as avgoftotalsales,
count(Item_Fat_Content) as items_sold,
cast(avg(Rating) as decimal(10, 2)) as avg_rating
from blinkit
group by Item_Fat_Content, Outlet_Type;

select distinct Outlet_Establishment_Year,
cast(sum(Total_Sales) as decimal(10, 2)) as totalsales,
cast(avg(Total_Sales) as decimal(10, 2)) as avgoftotalsales,
count(Item_Fat_Content) as items_sold,
cast(avg(Rating) as decimal(10, 2)) as avg_rating
from blinkit
group by Outlet_Establishment_Year;

select outlet_size,
cast(sum(Total_Sales) as decimal(10, 2)) as totalsales,
cast((sum(Total_Sales) * 100 / sum(sum(Total_Sales)) over()) as decimal(10, 2)) sales_perecntage
from blinkit
group by outlet_size
order by totalsales desc
limit 5;

select distinct Outlet_Location_Type,
cast(sum(Total_Sales) as decimal(10, 2)) as totalsales
from blinkit
group by Outlet_Location_Type;

select distinct Outlet_Type,
cast(sum(Total_Sales) as decimal(10, 2)) as totalsales,
cast(avg(Total_Sales) as decimal(10, 2)) as avgoftotalsales,
count(Item_Fat_Content) as items_sold,
cast(avg(Rating) as decimal(10, 2)) as avg_rating
from blinkit
group by Outlet_Type;






