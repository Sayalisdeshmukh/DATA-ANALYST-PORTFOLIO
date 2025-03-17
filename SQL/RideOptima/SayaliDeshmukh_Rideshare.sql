USE `uber_and_lyft_db`;
# Drop all the existing tables
DROP VIEW IF EXISTS `ride_joint`;
DROP TABLE IF EXISTS `ride`;
DROP TABLE IF EXISTS `weather`;
DROP TABLE IF EXISTS `payment`;
DROP TABLE IF EXISTS `apparent_weather`;
DROP TABLE IF EXISTS `cab`;

# Create new tables
CREATE TABLE IF NOT EXISTS `cab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cab_type` TEXT NOT NULL,
  `name` TEXT NOT NULL,
  `product_id` TEXT NOT NULL,
  PRIMARY KEY (`id`)
  );

CREATE TABLE IF NOT EXISTS `apparent_weather` (
    id INT NOT NULL AUTO_INCREMENT,
    apparentTemperatureHigh double,
	apparentTemperatureLow double,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `payment` (
	id INT NOT NULL AUTO_INCREMENT,
    price INT NOT NULL,
    surge_multiplier INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `weather` (
	id INT NOT NULL AUTO_INCREMENT,
    temperature DOUBLE NOT NULL,
    windSpeed DOUBLE NOT NULL,
    visibility DOUBLE NOT NULL,
    precipIntensity DOUBLE NOT NULL,
    cloudCover DOUBLE NOT NULL,
    short_summary TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `ride` (
    id INT NOT NULL AUTO_INCREMENT,
    distance DOUBLE NOT NULL,
    dateTime TEXT NOT NULL,
    timezone TEXT NOT NULL,
    source text not null,
    destination TEXT NOT NULL,
    PRIMARY KEY (id),
    cabID INT,
    apparent_weatherID INT,
    weatherID INT,
    paymentID INT,
	FOREIGN KEY (cabID) REFERENCES cab(id),
	FOREIGN KEY (apparent_weatherID) REFERENCES apparent_weather(id),
    FOREIGN KEY (weatherID) REFERENCES weather(id),
    FOREIGN KEY (paymentID) REFERENCES payment(id)
);


# Insert into created tables
INSERT INTO cab (cab_type, name, product_id) (
	SELECT DISTINCT cab_type, name, product_id
	FROM rideshare
	WHERE cab_type IS NOT NULL);

INSERT INTO apparent_weather (apparentTemperatureHigh, apparentTemperatureLow) (
	SELECT DISTINCT apparentTemperatureHigh, apparentTemperatureLow
	FROM rideshare);

INSERT INTO payment (price, surge_multiplier) (
	SELECT DISTINCT price, surge_multiplier
	FROM rideshare);

INSERT INTO weather (temperature, windSpeed, visibility, precipIntensity, cloudCover, short_summary) (
	SELECT DISTINCT temperature, windSpeed, visibility, precipIntensity, cloudCover, short_summary
	FROM rideshare);

INSERT INTO ride (distance, dateTime, timezone,source, destination, cabID, apparent_weatherID, weatherID, paymentID) (
	SELECT
		distance, datetime, timezone, source,destination,
		(SELECT id FROM cab WHERE product_id = rideshare.product_id) AS cabID,
		(SELECT id FROM apparent_weather
			WHERE apparentTemperatureHigh = rideshare.apparentTemperatureHigh AND
				  apparentTemperatureLow = rideshare.apparentTemperatureLow) AS apparent_weatherID,
        (SELECT id FROM weather
			WHERE temperature = rideshare.temperature AND
				  windSpeed = rideshare.windSpeed AND
				  visibility = rideshare.visibility AND
                  precipIntensity = rideshare.precipIntensity AND
                  cloudCover = rideshare.cloudCover AND
                  short_summary = rideshare.short_summary) AS weatherID,
		(SELECT id FROM payment
			WHERE price = rideshare.price AND
				  surge_multiplier = rideshare.surge_multiplier) AS paymentID
	FROM rideshare);


#DATABASE IMPLEMENTATIONridesharerideshare
# 1.Retrievedata
#Retrieve Rides with Surge Pricing:
SELECT * FROM ride
	INNER JOIN payment on ride.paymentID = payment.id
	WHERE surge_multiplier > 1;

#Retrieve Rides by Source and Destination:
SELECT * FROM ride
	WHERE source = 'Haymarket Square' AND
          destination = 'North Station';


#Retrieve Lyft Line Rides
SELECT ride.*, cab.cab_type as cab_type, cab.name as cab_name, cab.product_id as cab_product FROM ride
	INNER JOIN cab ON ride.cabID = cab.id
	WHERE cab_type = 'Lyft' AND product_id = 'lyft_line' ;

#Retrieve Rides during Specific Hoursride
SELECT * FROM ride
	WHERE HOUR(datetime) BETWEEN 8 AND 12; -- Rides between 8 AM and 12 PM;

SET SQL_SAFE_UPDATES = 0;

#2.Updating Data:
#Update Weather Conditions for a Ride
UPDATE rideshare
	SET short_summary = ' Mostly Cloudy ', long_summary = ' Light rain in the morning and overnight. '
	WHERE cab_type = 'Uber' ;

#Adjust Price Based on Precipitation Probability:
UPDATE rideshare
	SET price = price * 1.2
	WHERE precipProbability > 0.5;

#Update Ride Timestamp and Timezone
UPDATE rideshare
SET timestamp = 1609459200, timezone = 'America/Los_Angeles';


#Increase Surge Multiplier for Lux Black Rides During Rush Hour:
UPDATE rideshare
SET surge_multiplier = surge_multiplier * 1.5
WHERE cab_type = 'Lyft' AND product_id = 'lyft_lux' AND hour BETWEEN 16 AND 18;


#3.Complex Filters (Use Cases)

#Retrieve Lyft Premier Rides with Rainy Weather:
SELECT ride.*, cab.cab_type as cab_type,
	   cab.product_id as product_id,
       weather.precipIntensity as precipIntensity FROM ride
	JOIN cab on ride.cabID = cab.id
    JOIN weather on ride.weatherID = weather.id
	WHERE cab_type = 'Lyft' AND product_id = 'lyft_premier' AND precipIntensity > 0;

#Retrieve Uber Black XL Rides with Low Temperature:
SELECT ride.*, cab.cab_type as cab_type,
	   cab.product_id as product_id,
       weather.temperature as temperature FROM ride
	JOIN cab on ride.cabID = cab.id
    JOIN weather on ride.weatherID = weather.id
	WHERE cab_type = 'Uber' AND product_id = '6f72dfc5-27f1-42e8-84db-ccc7a75f6969' AND temperature < 32;


#Retrieve Lyft Lux Rides with Low Cloud Cover:
SELECT ride.*, cab.cab_type as cab_type,
	   cab.product_id as product_id,
       weather.cloudCover as cloudCover FROM ride
	JOIN cab on ride.cabID = cab.id
    JOIN weather on ride.weatherID = weather.id
	WHERE cab_type = 'Lyft' AND product_id = 'lyft_lux' AND cloudCover < 0.5;


#JOINTS
-- Joining ride, cab, payment, weather, and apparent_weather tables using 'id' as the common key
CREATE VIEW ride_joint as 
SELECT
    ride.*,
    cab.cab_type,
    cab.name as cab_name,
    payment.price,
    weather.temperature,
    weather.visibility AS weather_visibility,
    apparent_weather.apparentTemperatureLow AS weather_apparentTemperatureLow
FROM
    ride
JOIN
    cab ON ride.cabID = cab.id
JOIN
    payment ON ride.paymentID = payment.id
JOIN
    weather ON ride.weatherID = weather.id
JOIN
    apparent_weather ON ride.apparent_weatherID = apparent_weather.id;
    
  SELECT * FROM ride_joint;  
    
#ANALYSIS

#1 Ride Statistics:
#Calculate the average distance of rides.
SELECT AVG(distance) AS average_distance FROM ride;
    
#2 Payment Analysis:
#Find the total revenue generated from rides.
SELECT SUM(payment.price) AS total_revenue FROM ride
	INNER JOIN payment ON ride.paymentID = payment.id;
    
#3.Weather Analysis:
#Calculate the average temperature during rides.
SELECT AVG(weather.temperature) AS average_temperature FROM ride
	INNER JOIN weather ON ride.weatherID = weather.id;
    
#4.Cab Type Analysis
#Comparing the number of uber and lyft rides
#Retrieve uber Rides
select cab_type, count(*) from ride_joint
where cab_type = 'uber' or cab_type = 'lyft'
Group by cab_type;

#5.Comparing the number of rides count in each group for lyft
SELECT cab_type, cab_name, COUNT(*) AS rides_count
	FROM ride_joint
	WHERE cab_type = 'lyft'
	GROUP BY cab_name;

#Comparing the number of rides count in each group for uber
SELECT cab_type, cab_name, COUNT(*) AS rides_count
	FROM ride_joint
	WHERE cab_type = 'uber'
	GROUP BY cab_name;

# Total revenew for  lyft
SELECT SUM(price) AS total_revenue FROM ride_joint
	WHERE cab_type = 'lyft';

# Total revenew for  uber
SELECT SUM(price) AS total_revenue FROM ride_joint
	WHERE cab_type = 'uber';


#REPORTS
#Report on Number of Rides on Each Day:
SELECT DATE(dateTime) AS ride_date, COUNT(*) AS total_rides
FROM ride_joint
GROUP BY ride_date
ORDER BY ride_date;

#Report on Busiest Hour of the Day:
SELECT EXTRACT(HOUR FROM dateTime) AS ride_hour, COUNT(*) AS rides_at_hour
FROM ride_joint
GROUP BY ride_hour
ORDER BY rides_at_hour DESC;

#Report on the Average Price for Rides with Distance Greater than 2 Miles:
SELECT AVG(price) AS avg_price_for_long_distance
FROM ride_joint
WHERE distance > 2;


#METRICS

#Most Common Source and Destination
SELECT source, destination, COUNT(*) AS ride_count
FROM ride_joint
GROUP BY source, destination
ORDER BY ride_count DESC
LIMIT 1;

#Most Expensive Ride (Maximum Price):
SELECT *
FROM ride_joint
WHERE price = (SELECT MAX(price) FROM ride_joint);
