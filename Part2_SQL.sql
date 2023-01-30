SELECT month, dep_delay, origin
FROM flights
WHERE origin = "JFK" OR origin = "EWR" OR origin = "LGA";