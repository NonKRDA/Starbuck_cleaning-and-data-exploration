SELECT * FROM starbuck_ww.starbuck_update;

SELECT distinct(Brand) FROM starbuck_update;

-- Count of Stores by state
SELECT distinct(Store_Name) AS StoreCount, State_Name
FROM starbuck_update
GROUP BY State_Name , store_Name
ORDER BY StoreCount ASC;

-- Count of Stores by City
SELECT City, COUNT(*) AS StoreCount
FROM starbuck_update
GROUP BY City
ORDER BY StoreCount DESC;

-- Count of Stores by Ownership Type

SELECT Ownership_Type, COUNT(*) AS StoreCount
FROM starbuck_update
GROUP BY Ownership_Type
ORDER BY StoreCount DESC;

-- Analyze store locations
SELECT State_Name, City, COUNT(*) AS StoreCount
FROM starbuck_update
GROUP BY State_Name, City
ORDER BY StoreCount DESC;


ALTER TABLE `starbuck_update`
CHANGE COLUMN `ï»¿Brand` `Brand` VARCHAR(255);

-- POW(Latitude - 37.7749, 2) calculates the squared difference between the latitude of each store and the reference latitude (37.7749). 
-- POW(Longitude - (-122.4194), 2) calculates the squared difference between the store's longitude and the reference longitude (-122.4194).
-- (37.7749, -122.4194) (San Francisco):
SELECT Store_Name, Street_Address, City, State_Name, 
    SQRT(POW(Latitude - 37.7749, 2) + POW(Longitude - (-122.4194), 2)) AS Distance
FROM starbuck_update
ORDER BY Distance ASC;

-- Identify Timezones with the Most Stores
SELECT Timezone, COUNT(*) AS StoreCount
FROM starbuck_update
GROUP BY Timezone
ORDER BY StoreCount DESC;

-- Count stores in each country.
SELECT Country, COUNT(*) AS StoreCount
FROM starbuck_update
GROUP BY Country
ORDER BY StoreCount DESC;

select *
FROM starbuck_update;
-- Find Null
SELECT *
FROM starbuck_update
WHERE State_Name IS NULL OR City IS NULL;

SELECT Store_Name, City, State_Name,Street_Address, Phone_Number
FROM starbuck_update
WHERE State_Name = 'AJ';

ALTER TABLE starbuck_update
DROP COLUMN location;

-- Find all stores within a specific distance from a point

SELECT Store_Name, Street_Address, City, State_Name, 
    ST_Distance(location, POINT(37.7749, -122.4194)) AS Distance
FROM starbuck_update
WHERE ST_Distance(location, POINT(37.7749, -122.4194)) <= 5000  -- 5 km
ORDER BY Distance;


