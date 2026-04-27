CREATE TABLE zomato (
    res_id INT,
    name TEXT,
    establishment TEXT,
    url TEXT,
    city TEXT,
    city_id INT,
    locality TEXT,
    latitude FLOAT,
    longitude FLOAT,
    country_id INT,
    locality_verbose TEXT,
    cuisines TEXT,
    average_cost_for_two FLOAT,
    price_range INT,
    currency TEXT,
    highlights TEXT,
    aggregate_rating FLOAT,
    rating_text TEXT,
    votes INT,
    photo_count INT,
    opentable_support INT,
    delivery TEXT,
    takeaway TEXT,
    weighted_rating FLOAT,
    value_score FLOAT,
    popularity TEXT
);

select * from zomato;

COPY zomato (
    res_id,
    name,
    establishment,
    url,
    city,
    city_id,
    locality,
    latitude,
    longitude,
    country_id,
    locality_verbose,
    cuisines,
    average_cost_for_two,
    price_range,
    currency,
    highlights,
    aggregate_rating,
    rating_text,
    votes,
    photo_count,
    opentable_support,
    delivery,
    takeaway,
    weighted_rating,
    value_score,
    popularity
)
FROM 'T:/2. PROJECTS/5. Zomato Project/Data/cleaned/zomato_final.csv'
DELIMITER ','
CSV HEADER;

drop table if exists zomato;


SELECREATE TABLE zomato (
    res_id INT,
    name TEXT,
    establishment TEXT,
    url TEXT,
    city TEXT,
    city_id INT,
    locality TEXT,
    latitude FLOAT,
    longitude FLOAT,
    country_id INT,
    locality_verbose TEXT,
    cuisines TEXT,
    average_cost_for_two FLOAT,
    price_range INT,
    currency TEXT,
    highlights TEXT,
    aggregate_rating FLOAT,
    rating_text TEXT,
    votes INT,
    photo_count INT,
    opentable_support INT,
    delivery TEXT,
    takeaway TEXT,
    weighted_rating FLOAT,
    value_score FLOAT,
    popularity TEXT
);

select * from zomato;

COPY zomato (
    res_id,
    name,
    establishment,
    url,
    city,
    city_id,
    locality,
    latitude,
    longitude,
    country_id,
    locality_verbose,
    cuisines,
    average_cost_for_two,
    price_range,
    currency,
    highlights,
    aggregate_rating,
    rating_text,
    votes,
    photo_count,
    opentable_support,
    delivery,
    takeaway,
    weighted_rating,
    value_score,
    popularity
)
FROM 'T:/2. PROJECTS/5. Zomato Project/Data/cleaned/zomato_final.csv'
DELIMITER ','
CSV HEADER;

drop table if exists zomato;


SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'zomato';

select * from zomato;


CT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'zomato';

select * from zomato;

----------------------------1. City Analysis View---------------------------------------
CREATE VIEW city_analysis AS
SELECT city,
       COUNT(*) AS total_restaurants,
       ROUND(AVG(aggregate_rating)::numeric, 2) AS avg_rating,
       ROUND(AVG(votes)::numeric, 2) AS avg_votes
FROM zomato
GROUP BY city;
select * from city_analysis;

----------------------------------2. Cuisine Analysis View---------------------------------------
CREATE VIEW cuisine_analysis AS
SELECT cuisines,
       COUNT(*) AS total_restaurants,
       ROUND(AVG(aggregate_rating)::numeric, 2) AS avg_rating
FROM zomato
GROUP BY cuisines;
select * from cuisine_analysis;

------------------------------------3. Pricing Analysis View-----------------------------------------------------
CREATE VIEW pricing_analysis AS
SELECT price_range,
       ROUND(AVG(aggregate_rating)::numeric, 2) AS avg_rating,
       ROUND(AVG(average_cost_for_two)::numeric, 2) AS avg_cost
FROM zomato
GROUP BY price_range;
select * from pricing_analysis;

---------------------------------------4. Business Insights View-----------------------------------------------------
CREATE VIEW delivery_analysis AS
SELECT delivery,
       ROUND(AVG(aggregate_rating)::numeric, 2) AS avg_rating,
       ROUND(AVG(votes)::numeric, 2) AS avg_votes
FROM zomato
GROUP BY delivery;
select * from delivery_analysis;
