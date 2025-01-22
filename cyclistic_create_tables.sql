-- Importing CSV files will perform most cleaning operations 
-- Handling duplicates, displaying null counts, and handling strings

-- Create tables before import for stability
CREATE TABLE IF NOT EXISTS "11-2023" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "12-2023" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "01-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "02-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "03-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF EXISTS NOT "04-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "05-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "06-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "07-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "08-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "09-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "10-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

CREATE TABLE IF NOT EXISTS "11-2024" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);
--Create table to be combined into
CREATE TABLE IF NOT EXISTS "Full_Year" (
	ride_id TEXT,
	rideable_type TEXT,
	started_at TEXT,
	ended_at TEXT,
	start_station_name TEXT,
	start_station_id TEXT,
	end_station_name TEXT,
	end_station_id TEXT,
	start_lat INT,
	start_lng INT,
	end_lat INT,
	end_lng INT,
	member_casual TEXT,
	ride_length TEXT,
	day_of_week INT
);

--Insert each month into Full_Year
INSERT INTO Full_Year 
( 
	SELECT * FROM "11-2023"
	UNION ALL
	SELECT * FROM "12-2023"
	UNION ALL
	SELECT * FROM "01-2024"
	UNION ALL
	SELECT * FROM "02-2024"
	UNION ALL
	SELECT * FROM "03-2024"
	UNION ALL
	SELECT * FROM "04-2024"
	UNION ALL
	SELECT * FROM "05-2024"
	UNION ALL
	SELECT * FROM "06-2024"
	UNION ALL
	SELECT * FROM "07-2024"
	UNION ALL
	SELECT * FROM "08-2024"
	UNION ALL
	SELECT * FROM "09-2024"
	UNION ALL
	SELECT * FROM "10-2024"
	UNION ALL
	SELECT * FROM "11-2024"
	UNION ALL
	SELECT * FROM "12-2024"
);

-- Add columns for month, year, and Month/Year to Full_Year
ALTER TABLE Full_Year
	ADD year TEXT
ALTER TABLE Full_Year
	ADD moyr TEXT;

-- Populate with extractions from ended_at
UPDATE Full_Year
SET month = STRFTIME('%m', ended_at),
	year = STRFTIME('%Y', ended_at),
	moyr = strftime('%Y%m', ended_at);



