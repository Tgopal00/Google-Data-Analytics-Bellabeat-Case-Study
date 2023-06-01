-- Total records = 940
SELECT COUNT(*)
FROM daily_activity;

-- Find the average of each variable by day of the week 
-- Very little differences between days of the week 
SELECT 
    day_of_the_week,
    AVG(total_steps) AS avg_tot_steps,
    AVG(total_distance) AS avg_tot_dist,
    AVG(very_active_distance) AS avg_very_active_dist,
    AVG(moderately_active_distance) AS avg_mod_active_dist,
    AVG(light_active_distance) AS avg_light_active_dist,
    AVG(sedentary_active_distance) AS avg_sed_active_dist,
    AVG(very_active_minutes) AS avg_very_active_min,
    AVG(fairly_active_minutes) AS avg_fair_active_min,
    AVG(lightly_active_minutes) AS avg_light_active_min,
    AVG(sedentary_minutes) AS avg_sed_min,
    AVG(calories) AS avg_cal,
    AVG(total_active_minutes) AS avg_tot_active_min,
    AVG(total_active_hours) AS avg_tot_active_hr
FROM daily_activity
GROUP BY day_of_the_week;
    
-- Find the average of each variable by month
-- Very little difference between each month
SELECT 
    month,
    AVG(total_steps) AS avg_tot_steps,
    AVG(total_distance) AS avg_tot_dist,
    AVG(very_active_distance) AS avg_very_active_dist,
    AVG(moderately_active_distance) AS avg_mod_active_dist,
    AVG(light_active_distance) AS avg_light_active_dist,
    AVG(sedentary_active_distance) AS avg_sed_active_dist,
    AVG(very_active_minutes) AS avg_very_active_min,
    AVG(fairly_active_minutes) AS avg_fair_active_min,
    AVG(lightly_active_minutes) AS avg_light_active_min,
    AVG(sedentary_minutes) AS avg_sed_min,
    AVG(calories) AS avg_cal,
    AVG(total_active_minutes) AS avg_tot_active_min,
    AVG(total_active_hours) AS avg_tot_active_hr
FROM daily_activity
GROUP BY month;

-- Find the sum of all active_minutes columns 
SELECT
	SUM(total_active_minutes) AS total_min,
    SUM(very_active_minutes) AS total_very_active_min,
    SUM(fairly_active_minutes) AS total_fair_active_min,
    SUM(lightly_active_minutes) AS total_light_active_min,
    SUM(sedentary_minutes) AS total_sed_min
FROM daily_activity;

-- Determine the total number of times users logged their activity each day 
SELECT
	day_of_the_week,
    COUNT(day_of_the_week) AS total_count
FROM daily_activity
GROUP BY day_of_the_week;
	
-- Total Records = 22,099 
SELECT COUNT(*)
FROM hourly_calories_and_steps;

-- Find the sum and averages of each variable by time of day 
SELECT
	time_of_day,
    SUM(calories) AS sum_cal,
    AVG(calories) AS avg_cal,
    SUM(step_total) AS sum_step,
	AVG(step_total) AS avg_step
FROM hourly_calories_and_steps
GROUP BY time_of_day
ORDER BY sum_cal DESC;