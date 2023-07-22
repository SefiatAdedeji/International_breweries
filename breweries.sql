-- To view all the datasets --
SELECT * FROM international_breweries;
/* SECTION A */
-- Question 1: Within the space of the last three years, what was the profit worth of the breweries, inclusive of the anglophone and the francophone territories?--
SELECT SUM(profit) FROM international_breweries
WHERE years IN(2017,2018,2019);

-- Question 2: Compare the total profit between these two territories in order for the territory manager, Mr. Stone to make a strategic decision that will aid profit maximization in 2020.--
SELECT
CASE
	WHEN countries = 'Nigeria' OR countries = 'Ghana' THEN 'Anglophone'
	ELSE 'Francophone'
	END AS territories,
SUM(profit)profit_sum
FROM international_breweries
GROUP BY 1
ORDER BY 2 DESC;

-- Question 3: What country generated the highest profit in 2019. --
SELECT countries, SUM(profit)
FROM international_breweries 
WHERE years = 2019
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Question 4: Help him find the year with the highest profit.--
SELECT years, SUM(profit) AS highest_profit
FROM international_breweries
GROUP BY years
ORDER BY SUM(profit) DESC
LIMIT 1;

-- Question 5: Which month in the three years was the least profit generated?--
SELECT months, SUM(profit)
FROM international_breweries
GROUP BY 1
ORDER BY 2
LIMIT 1;

-- Question 6: What was the minimum profit in the month of December 2018?--
SELECT MIN(profit)AS minimum_profit
FROM international_breweries
WHERE months = 'December' AND years = 2018;

-- Question 7: Compare the profit for each of the months in 2019--
SELECT DISTINCT(months), SUM(profit)
FROM international_breweries
WHERE years = 2019
GROUP BY 1
ORDER BY 2 DESC;
-- Question 8: Which particular brand generated the highest profit in Senegal?--
SELECT brands, SUM(profit)
FROM international_breweries
WHERE countries = 'Senegal'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/* SECTION B */
-- Question 1: Within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries--
SELECT brands, SUM(quantity)
FROM international_breweries
WHERE countries IN ('Senegal', 'Togo', 'Benin')
AND years BETWEEN 2018 AND 2019
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

-- Question 2: Find out the top two choice of consumer brands in Ghana --
SELECT brands, SUM(quantity)
FROM international_breweries
WHERE countries = 'Ghana'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;

-- Question 3: Find out the details of beers consumed in the past three years in the most oil reached country in West Africa.--
SELECT *
FROM international_breweries
WHERE countries = 'Nigeria' AND brands NOT LIKE '%malt';

-- Question 4: Favorites malt brand in Anglophone region between 2018 and 2019 --
SELECT brands, SUM(quantity)
FROM international_breweries
WHERE brands LIKE '%malt'
AND countries IN ('Nigeria', 'Ghana') AND years IN(2018, 2019)
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 1;

-- Question 5: Which brands sold the highest in 2019 in Nigeria? --
SELECT brands, SUM(quantity)
FROM international_breweries
WHERE countries =  'Nigeria' AND years = 2019
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Question 6: Favorites brand in South_South region in Nigeria --
SELECT brands, SUM(quantity)
FROM international_breweries
WHERE countries = 'Nigeria' AND region = 'southsouth'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--Question 7: Bear consumption in Nigeria--
SELECT SUM (quantity)
FROM international_breweries
WHERE countries = 'Nigeria' AND brands NOT LIKE '%malt';

-- Question 8: Level of consumption of Budweiser in the regions in Nigeria --
SELECT region, SUM(quantity) AS budweiser_consumed
FROM international_breweries
WHERE countries = 'Nigeria' AND brands = 'budweiser'
GROUP BY 1
ORDER BY 2 DESC;

-- Question 9: Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)--
SELECT region, SUM(quantity)
FROM international_breweries
WHERE  brands = 'budweiser' AND countries = 'Nigeria' AND years = 2019
GROUP BY 1
ORDER BY 2 DESC;

/* SECTION C */
-- Question 1: Country with the highest consumption of beer.--
SELECT countries, SUM(quantity) AS highest_consumption_of_beer
FROM international_breweries
WHERE brands NOT LIKE ('%malt%')
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 1;

-- Question 2: Highest sales personnel of Budweiser in Senegal --
SELECT sales_rep, SUM (quantity)highest_personnel
FROM international_breweries
WHERE brands = 'budweiser' AND countries = 'Senegal'
GROUP BY sales_rep
ORDER BY 2 DESC
LIMIT 1;

-- Question 3: Country with the highest profit of the fourth quarter in 2019 --
SELECT countries, SUM(profit)
FROM international_breweries
WHERE months IN ('October', 'November', 'December') AND years = 2019
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
