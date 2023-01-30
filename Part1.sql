-- Question 1 - There are 23 planes with listed speeds. The minimum listed speed is 90. The maximum listed speed is 432.

SELECT COUNT(speed) FROM planes WHERE speed IS NOT NULL;

SELECT MIN(speed) FROM planes;

SELECT MAX(speed) FROM planes;

-- Question 2 - The total distance flown by all planes in January 2013 is 27,188,805. The total distance flown by all planes in January 2013 where the tailnum is missing is 81,763. 

SELECT SUM(distance) from flights WHERE year = "2013" AND month = '1';

SELECT SUM(distance) from flights WHERE year = "2013" AND month = '1' AND tailnum = '';

-- Question 3 - If joining planes to flights, there is no difference between the INNER JOIN and the LEFT OUTER JOIN. 
-- However, if joining flights to planes, the results of the LEFT OUTER JOIN includes the total distance flown for all planes where the manufacturer field contains a NULL value.

-- If planes are joined to flights

SELECT manufacturer, SUM(distance)
FROM planes
INNER JOIN flights
ON planes.tailnum = flights.tailnum
WHERE flights.year = "2013" AND flights.month = "7" AND flights.day = "5"
GROUP BY planes.manufacturer
ORDER BY planes.manufacturer ASC;

SELECT manufacturer, SUM(distance)
FROM planes
LEFT OUTER JOIN flights
ON planes.tailnum = flights.tailnum
WHERE flights.year = "2013" AND flights.month = "7" AND flights.day = "5"
GROUP BY planes.manufacturer
ORDER BY planes.manufacturer ASC;

-- If flight is joined to planes

SELECT manufacturer, SUM(distance)
FROM flights
INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.year = "2013" AND flights.month = "7" AND flights.day = "5"
GROUP BY planes.manufacturer
ORDER BY planes.manufacturer ASC;

SELECT manufacturer, SUM(distance)
FROM flights
LEFT OUTER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.year = "2013" AND flights.month = "7" AND flights.day = "5"
GROUP BY planes.manufacturer
ORDER BY planes.manufacturer ASC;


-- Question 4 - How many flights originating from EWR were manufactuered by BOEING and flown by American Airlines? 55 flights

SELECT flights.origin, airlines.carrier, planes.manufacturer
FROM flights
INNER JOIN airlines ON flights.carrier = airlines.carrier
INNER JOIN planes ON flights.tailnum = planes.tailnum
WHERE origin = "EWR" AND manufacturer = "BOEING" AND airlines.carrier = "AA";