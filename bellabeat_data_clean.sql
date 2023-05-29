-- Go through each table:
    -- # of unique IDs in each table (should be 30 unique IDs) 
    -- # of times each user logged their information out of 31 days (04/12/2016 - 05/12/2016)
    
-- # of unique IDs: 33 
SELECT COUNT(DISTINCT Id) AS number_of_users
FROM daily_activity;

-- 21 users logged the expected 31 days 
SELECT DISTINCT Id, COUNT(Id) AS Id_count
FROM daily_activity
GROUP BY Id;
-- HAVING COUNT(Id) = 31

-- # of unique IDs: 33 
SELECT COUNT(DISTINCT Id) AS number_of_users
FROM hourly_calories;

-- No users logged the maximum amount of time, which in this case, would be 744 times (31 days * 24 hrs)
-- 23 users logged more than 700 times
SELECT DISTINCT Id, COUNT(Id) AS Id_count
FROM hourly_calories
GROUP BY Id;
-- HAVING COUNT(Id) > 700

-- # of unique IDs: 33
SELECT COUNT(DISTINCT Id) AS number_of_users
FROM hourly_steps;

-- 23 users logged more than 700 times 
SELECT DISTINCT Id, COUNT(Id) AS Id_count
FROM hourly_steps
GROUP BY Id;
-- HAVING COUNT(Id) > 700

-- # of unique IDs: 24
SELECT COUNT(DISTINCT Id) AS number_of_users
FROM sleep_day;

-- Maximum logged days would be 31 times 
SELECT DISTINCT Id, COUNT(Id) AS Id_count
FROM sleep_day
GROUP BY Id;
-- HAVING COUNT(Id) < 10 -- 9 users
-- HAVING COUNT(Id) = 31 -- 2 users
-- HAVING COUNT(Id) > 10 AND COUNT(Id) < 31 -- 12 users

-- Do not use sleep_day table in analysis. Not enough users --

-- Remove columns not relevant to analysis
ALTER TABLE daily_activity
DROP COLUMN tracker_distance,
DROP COLUMN logged_activities_distance;

-- Add a column for the days of the week
ALTER TABLE daily_activity
ADD day_of_the_week VARCHAR(10);
UPDATE daily_activity
SET day_of_the_week = DAYNAME(activity_date);

-- Add a column for the month 
ALTER TABLE daily_activity
ADD month VARCHAR(10);
UPDATE daily_activity
SET month = MONTHNAME(activity_date);

-- Create new table that joins hourly_calories and hourly_steps
CREATE TABLE hourly_calories_and_steps AS
	(SELECT hourly_calories.*, hourly_steps.step_total
	 FROM hourly_calories 
         INNER JOIN hourly_steps
         ON hourly_calories.Id = hourly_steps.Id AND hourly_calories.activity_hour = hourly_steps.activity_hour);

-- Add a column for time_of_day to retrieve hour (1 to 12) and AM or PM
ALTER TABLE hourly_calories_and_steps
ADD time_of_day VARCHAR(10);
UPDATE hourly_calories_and_steps
SET time_of_day = DATE_FORMAT(activity_hour, "%l %p");
