--use mafia


--The hotel industry relies on data to make informed decisions and provide a better guest experience.
--you will work with a hotel reservation dataset to gain insights into guest preferences, booking trends
--and other key factors that impact the hotel's operations. You will use SQL to query and analyze the data, 
--as well as answer specific questions about the dataset

 
--Here are 15 Queries which i will write to gain insight




--#1 What is the tota Number of reservation in the Dataset?


SELECT DISTINCT COUNT(*) as total_count_of_Reservation
FROM Hotel



--#2 Which Meal plan is the most common among guests?


SELECT type_of_meal_plan, 
COUNT(type_of_meal_plan) as count_of_type_of_meal_plan
FROM Hotel
GROUP BY type_of_meal_plan
ORDER BY 2 DESC 


--#3 what is the average price per room for reservation involving chidren?


SELECT 
AVG(avg_price_per_room) as avg_price_per_room_involving_children
FROM Hotel
WHERE no_of_children <> 0


--#4 how many reservation were made for the year 2017


SELECT COUNT(*) Total_reservation_of_2017
FROM Hotel
WHERE arrival_date IN ('2017')



--#5What is the most commonly booked Room type?


SELECT  room_type_reserved,
COUNT(room_type_reserved) as Count_of_room_type_reserved
FROM Hotel
GROUP BY room_type_reserved
ORDER BY 2 DESC


--#6How many reservation fall on weekend( No_of_weekend_night>0)



SELECT COUNT(*)as Total_reservation_that_Fall_on_weekend
FROM Hotel
WHERE no_of_weekend_nights > 0


--#7 What is the highest and lowest lead time for reservation?


SELECT MIN(lead_time) min_lead_time, max(lead_time)max_lead_time 
FROM Hotel


--#8 what is the most common Market Segment Type for reservations?


SELECT market_segment_type, 
COUNT(market_segment_type) as Common_market_segment_type
FROM Hotel
GROUP BY market_segment_type
ORDER BY 2 DESC


--#9 how many reservatio have a booking status os "confirmed"? 


SELECT COUNT(*) bookingstatus  
FROM Hotel
WHERE booking_status = 'confirmed'


--#10 What is the total Number of adults and children across all reservation?


SELECT  
SUM(no_of_adults)Total_no_Of_Adults,
SUM(no_of_children)Total_no_of_Children
FROM Hotel


--#11 what is the Average Number of weekend night for reservaton involving children?


SELECT AVG(no_of_weekend_nights) avg_no_of_weekend_nights_INVOLVING_Children
FROM Hotel
WHERE no_of_children > 0



--#12 How Many Reservation were made for each month of the year ?


SELECT  DATENAME(month, arrival_date) as Month,
		COUNT(DATENAME(month, arrival_date)) as No_Of_reservation_made_in_a_Month
FROM Hotel
GROUP BY DATENAME(month, arrival_date)
ORDER BY CASE  
				WHEN DATENAME(month, arrival_date)  = 'January' THEN 1
				WHEN DATENAME(month, arrival_date) = 'February' THEN 2
				WHEN DATENAME(month, arrival_date) = 'march' THEN 3
				WHEN DATENAME(month, arrival_date) = 'April' THEN 4 
				WHEN DATENAME(month, arrival_date) = 'may' THEN 5
				WHEN DATENAME(month, arrival_date) = 'june' THEN 6 
				WHEN DATENAME(month, arrival_date)= 'july' THEN 7
				WHEN DATENAME(month, arrival_date) = 'august' THEN 8
				WHEN DATENAME(month, arrival_date) = 'september' THEN 9
				WHEN DATENAME(month, arrival_date) = 'october' THEN 10
				WHEN DATENAME(month, arrival_date) = 'november' THEN 11
				WHEN DATENAME(month, arrival_date) = 'december' THEN 12
				
			ELSE DATENAME(MONTH, arrival_date) 
END 


--#13 what is the average no of night (both weekend and weekday) spend by guest fro each rom type?



SELECT  room_type_reserved,
AVG(no_of_week_nights + no_of_weekend_nights) avg_no_of_night_per_room
FROM Hotel
GROUP BY room_type_reserved
			

--#14 for reservation involving children, what is the most common room type?
--and what is the average price for that room?


SELECT  room_type_reserved,
COUNT(room_type_reserved)as no_of_times_booked,
AVG(avg_price_per_room)as avg_Price_per_room
FROM Hotel
WHERE no_of_children <> 0
GROUP BY room_type_reserved
ORDER BY 2 DESC



--#15 find the market segment type that generate highest average price per room?



SELECT  market_segment_type,
ROUND(AVG(avg_price_per_room), 2) as Avg_price_per_room
FROM Hotel
GROUP BY market_segment_type
ORDER BY 2 DESC