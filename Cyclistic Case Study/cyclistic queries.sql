--https://divvy-tripdata.s3.amazonaws.com/index.html
--files were too large to be combined into one table. Instead I combined two months into each table and performed analysis on each table

--create new table
CREATE TABLE 2020607_tripdata
(
ride_id VARCHAR(255),
rideable_type VARCHAR(255),
started_at DATETIME,
ended_at DATETIME,
ride_length TIME,
day_of_week VARCHAR(255),
name_of_day VARCHAR(255),
start_station_name VARCHAR(255),
start_station_id VARCHAR(255),
end_station_name VARCHAR (255),
end_station_id VARCHAR(255),
member_casual VARCHAR(255)
);

-- LOAD DATA INFILE
LOAD DATA INFILE '20200607_tripdata.csv' INTO TABLE 20200607_tripdata
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

-- CREATE new column
ALTER TABLE 2020_0607_tripdata
ADD ride_duration int

-- UPDATE new column with time difference calculation
UPDATE 2020_0607_tripdata
SET ride_duration = timestampdiff(minute, started_at, end_at)
  
-- MAX, MIN, MEAN for member rides

SELECT MAX(ride_duration)
FROM 2020_0607_tripdata
WHERE member_casual LIKE 'm%'

SELECT MIN(ride_duration)
FROM 2020_0607_tripdata
WHERE member_casual LIKE 'm%'

SELECT avg(ride_duration)
FROM 2020_0607_tripdata
WHERE member_casual LIKE 'm%'

  -- MAX, MIN, MEAN for casual rides

SELECT MAX(ride_duration)
FROM 2020_0607_tripdata
WHERE member_casual LIKE 'c%'

SELECT MIN(ride_duration)
FROM 2020_0607_tripdata
WHERE member_casual LIKE 'c%'

SELECT avg(ride_duration)
FROM 2020_0607_tripdata
WHERE member_casual LIKE 'c%'

-- AVG ride duration of member rides in June
SELECT *
FROM 2020_0607_tripdata
WHERE substring(started_at,6,2) = 06;

SELECT avg(ride_duration)
FROM
(SELECT *
FROM 2020_0607_tripdata
WHERE substring(started_at,6,2) = 06) AS junetrips
WHERE member_casual LIKE 'm%';

-- AVG ride duration of casual rides in June
SELECT *
FROM 2020_0607_tripdata
WHERE substring(started_at,6,2) = 06;

SELECT avg(ride_duration)
FROM
(SELECT *
FROM 2020_0607_tripdata
WHERE substring(started_at,6,2) = 06) AS junetrips
WHERE member_casual LIKE 'c%';

-- find all june rides
SELECT *
FROM 2020_0607_tripdata
WHERE substring(started_at,6,2) = 06;

--subquery calculate avg ride duration for all June member rides
SELECT avg(ride_duration)
FROM
(SELECT *
FROM 2020_0607_tripdata
WHERE substring(started_at,6,2) = 06) AS junetrips
WHERE member_casual LIKE 'm%';

-- CTW calculate avg ride duration for all June member rides
WITH avg_june_member AS
(
SELECT *
FROM 2020_0607_tripdata
WHERE substring(started_at,6,2) = 06
)
SELECT avg(ride_duration)
FROM avg_june_member
WHERE member_casual LIKE 'm%';

-- find top start station names for members
SELECT distinct start_station_name, count(*)
FROM 2020_0607_tripdata
WHERE member_casual LIKE 'm%'
GROUP BY start_station_name
ORDER BY 2 DESC;

-- find top start station names for casual
SELECT distinct start_station_name, count(*)
FROM 2020_0607_tripdata
WHERE member_casual LIKE 'c%'
GROUP BY start_station_name
ORDER BY 2 DESC;

