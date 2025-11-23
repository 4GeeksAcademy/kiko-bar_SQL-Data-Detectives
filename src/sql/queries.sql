-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon
-- 2) Ensure comments are well-formed:
--    - Use -- for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use /* */ multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

-- Level 1

-- 1) first 10 recorded observations;
SELECT * FROM observations
LIMIT 10;

-- 2) region identifiers (region_id) appear in the data;
SELECT DISTINCT region_id FROM observations;
-- Form the total 60 regions, species were only observed in 25 regions;

-- 3) How many distinct species (species_id) have been observed;
SELECT COUNT(DISTINCT species_id) FROM observations;
-- There are more than 1000 species identified but only 270 are observed from the observation database;


-- 4) How many observations are there for the region with region_id = 2;
SELECT * FROM observations
WHERE region_id = 2;
-- We can find 228 observations made in region_id 2;

-- 5) How many observations were recorded on 1998-08-08;
SELECT * FROM observations
WHERE observation_date = "1998-08-08";
-- In 1998-08-08 only one observation was recorded at Queensland region;

-- Level 2

-- 6) Which region_id has the most observations;
SELECT region_id, COUNT(*) AS most_obsrvations FROM observations
GROUP BY region_id
ORDER BY most_obsrvations desc
LIMIT 1;
-- Region_id 2 is the one concentraring the most observations of all with 228 recorded;

-- 7) What are the 5 most frequent species_id;
SELECT species_id, scientific_name, COUNT(*) AS frequency FROM observations
INNER JOIN species
    ON observations.species_id = species.id
GROUP BY species_id,scientific_name
ORDER BY frequency DESC
LIMIT 5;
-- My conclusion on this finding is that the 5 most frequent species are Grallina cyanoleuca, Rhipidura leucophrys, Cacatua galerita, Eopsaltria australis and Dacelo novaeguineae with more that 7+ in frequency;

-- 8) Which species (species_id) have fewer than 5 records;
SELECT species_id, COUNT(*) AS frequency FROM observations
GROUP BY species_id
HAVING frequency < 5
ORDER BY frequency;
-- This species identifies only represent a frequency of 1, making then the fewer observed during the investigation;

-- 9) Which observers (observer) recorded the most observations;
SELECT observer, COUNT(*) AS Total_recorded FROM observations
GROUP BY observer
ORDER by Total_recorded desc;
-- The orservers have made a good job recording more than 10 observations, and even one them have observed or recorded 72; 

-- Level 3

-- 10) Show the region name (regions.name) for each observation;
SELECT observation_date, observations.id, regions.name AS region_observed FROM observations
INNER JOIN regions
    ON observations.region_id = regions.id;
-- Regions were well identified and it helps to have a better control on were to lead next expeditions and plan for better species observations;

-- 11) Show the scientific name of each recorded species (species.scientific_name);
SELECT region_id, species.scientific_name AS scientific_name, observation_date FROM observations
INNER JOIN species
    ON observations.species_id = species.id;
-- 500 species named were register and I have found the 500 names for each of them recorded. Good data if we would like to identify names that still are missing for the project plan;

-- 12) Which is the most observed species in each region;
SELECT name AS region, scientific_name, COUNT(*) AS most_observed FROM observations
INNER JOIN species
    ON observations.species_id = species.id
INNER JOIN regions
    ON observations.region_id = regions.id
GROUP BY region, scientific_name
ORDER BY region, most_observed desc
LIMIT 10;
-- We can see that the most observed species were located in Buenos Aires region with at least 2 time observations;

-- 13) What is the total species observed by each observer (Additonal exercise to practise from my side);
SELECT observer, COUNT(*) AS species_observed FROM observations
INNER JOIN species
    ON observations.species_id = species.id
GROUP BY observer
ORDER BY species_observed desc;


-- Level 4

-- 14) Insert a new fictitious observation into the observations table;
INSERT INTO observations
VALUES (501, 1263, 49, "obsrsiqo5", "2025-11-21", -32.176884, 152.48874, 1);
SELECT * FROM observations
WHERE id = 501;

-- 15) Correct the scientific name of a species with a typo;
UPDATE species
SET scientific_name = "Acanthiza robusta"
WHERE  id = 1112; -- old name Acanthiza robustirostris

-- 16) Delete a test observation (use its id);
SELECT id, species_id, COUNT(*) AS Total_recorded FROM observations
GROUP BY species_id
ORDER BY Total_recorded; -- I did this, as a reference to see the specie with less total record and proceed to delet one of them

DELETE FROM observations
WHERE id = 3;



