-- Databricks notebook source
SELECT * FROM f1_race_results_presentation.calculated_race_results;

-- COMMAND ----------

SELECT driver_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(total_points/num_races,2) as points_per_race FROM f1_race_results_presentation.calculated_race_results
GROUP BY driver_name
HAVING num_races > 50
ORDER BY points_per_race DESC;

-- COMMAND ----------

SELECT driver_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(total_points/num_races,2) as points_per_race FROM f1_race_results_presentation.calculated_race_results
WHERE race_year BETWEEN 2011 AND 2020
GROUP BY driver_name
HAVING num_races > 50
ORDER BY points_per_race DESC;

-- COMMAND ----------

SELECT driver_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(total_points/num_races,2) as points_per_race FROM f1_race_results_presentation.calculated_race_results
WHERE race_year BETWEEN 2001 AND 2010
GROUP BY driver_name
HAVING num_races > 50
ORDER BY points_per_race DESC;

-- COMMAND ----------

