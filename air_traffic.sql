-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
    id SERIAL PRIMARY KEY,
    airline_name TEXT UNIQUE NOT NULL
);

CREATE TABLE cities
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE flights
(
    id SERIAL PRIMARY KEY,
    seat TEXT NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    airline_id INTEGER NOT NULL REFERENCES airlines(id),
    from_city_id INTEGER NOT NULL REFERENCES cities(id),
    to_city_id INTEGER NOT NULL REFERENCES cities(id)
);

CREATE TABLE tickets 
(
    id SERIAL PRIMARY KEY,
    passenger_id INTEGER NOT NULL REFERENCES passengers(id),
    flight_id INTEGER NOT NULL REFERENCES flights(id)
);


-- Data inserts

INSERT INTO airlines 
  (airline_name) 
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


INSERT INTO cities 
  (city, country) 
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('New Orleans', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');


INSERT INTO passengers 
  (first_name, last_name) 
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');


INSERT INTO flights 
  (seat, departure, arrival, airline_id, from_city_id, to_city_id) 
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 7),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 14),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 15, 12),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 16, 17);