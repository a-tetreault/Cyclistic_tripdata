CREATE TABLE IF NOT EXISTS member_v_casual(
	moyr INT,
	member_casual TEXT,
	total_rides INT,
	avg_ride_length	TEXT,
	MaxAvg_Daily_Rides INT,
	Day_of_week TEXT
)

-- Calculate Average ride length and Count total rides
WITH ride_length AS (
	SELECT
		moyr,
		member_casual,
		COALESCE(TIME(AVG(ride_length)), '00:00:00') AS avg_ride_length,
		COALESCE(COUNT(ride_id), 0) AS total_rides
	FROM Full_Year fy
	GROUP BY member_casual, moyr),
trip_data AS (
	--
		WITH ride_counts AS ( 
			SELECT
				moyr,
				day_of_week,
				COUNT(*) AS trip_count,
				member_casual
			FROM Full_Year fy 
			GROUP BY moyr, day_of_week, member_casual
		),
		--average count rides per day
		averagetrips AS ( 
			SELECT
				moyr,
				day_of_week,
				AVG(trip_count) AS avg_trip_count,
				member_casual
			FROM Ride_counts
			GROUP BY moyr, day_of_week, member_casual
		),
		--Maximum average count per day
		maxavgtrips AS ( 
			SELECT
				moyr,
				day_of_week,
				MAX(avg_trip_count) AS MaxAvg_Daily_Rides,
				member_casual
			FROM averagetrips
			--Not grouping by day_of_week allows us to get highest in next step
			GROUP BY moyr, member_casual
		)
	SELECT
		moyr,
		member_casual,
		Day_of_week AS Day_of_Week,
		MaxAvg_Daily_Rides AS MaxAvg_Daily_Rides
	FROM maxavgtrips 
	GROUP BY
		moyr, day_of_week, member_casual
)
UPDATE member_v_casual
SET 
	avg_ride_length = COALESCE(rl.avg_ride_length, '00:00:00'),
	total_rides = COALESCE(rl.total_rides, 0),
	MaxAvg_Daily_Rides = COALESCE(td.MaxAvg_Daily_Rides, 0),
	Day_of_week = COALESCE(td.day_of_week, 'N/A')
FROM ride_length rl
JOIN trip_data td
	ON rl.moyr = td.moyr
	AND rl.member_casual = td.member_casual
WHERE 
	member_v_casual.moyr = rl.moyr
AND
	member_v_casual.member_casual = rl.member_casual;
