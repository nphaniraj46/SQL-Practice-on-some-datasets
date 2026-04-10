-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

select distinct city from station where right(city,1) not in ('a','e','i','o','u')

-- from this practice i got know this diffarance between this in and not in

-- in return only rows among the list we are going to give

-- not in return the rows which are not equal to the list of values