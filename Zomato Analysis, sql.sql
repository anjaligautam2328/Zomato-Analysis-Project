-- Zomato Analysis

Create Database Zomato;
Use Zomato;

Select * from Zomato;

-- Total no. of Restaurants
select count(restaurantID) as Total_Restaurants from zomato;

-- Top 5 Restaurants (as per votes).
Select Restaurantname, sum(Votes) as Total_Votes from Zomato
group by RestaurantName 
order by Total_Votes desc 
limit 5;

-- Countries with total Restaurants.
Select Country_Name, count(RestaurantID) as Total_Restaurant from Zomato 
Group by Country_Name 
order by Total_Restaurant desc;

-- Total cuisines
Select Country_Name, Cuisines ,  avg(Average_cost_per_Person) as Average_cost_per_person from Zomato 
group by Cuisines , Country_Name
Order by Average_cost_per_person desc;

-- Restaurants with zero votes and doesn't have online delivery 
select restaurantID, restaurantname, votes, Has_online_delivery from zomato 
where votes = "0" and Has_online_delivery = "No";

-- Rating Bucket
select 
  case when rating>0 and rating<=1 then "0-1"
	   when rating>1 and rating<=2 then "1.1-2"
       when rating>2 and rating<=3 then "2.1-3"
       when rating>3 and rating<=4 then "3.1-4"
else "4.1-5"
end as Rating_bucket,
Count(Restaurantname) as No_of_rest 
from zomato
group by Rating_bucket
order  by Rating_bucket;