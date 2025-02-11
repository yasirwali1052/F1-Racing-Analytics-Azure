-- Databricks notebook source
SELECT * FROM f1_race_results_presentation.calculated_race_results;

-- COMMAND ----------

SELECT team_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(AVG(calculated_points),2) as avg_points FROM f1_race_results_presentation.calculated_race_results
GROUP BY team_name
HAVING num_races >= 50
ORDER BY avg_points DESC;

-- COMMAND ----------

SELECT team_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(AVG(calculated_points),2) as avg_points FROM f1_race_results_presentation.calculated_race_results
WHERE race_year BETWEEN 2011 AND 2020
GROUP BY team_name
HAVING num_races >= 50
ORDER BY avg_points DESC;

-- COMMAND ----------

SELECT team_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(AVG(calculated_points),2) as avg_points FROM f1_race_results_presentation.calculated_race_results
WHERE race_year BETWEEN 2001 AND 2010
GROUP BY team_name
HAVING num_races >= 50
ORDER BY avg_points DESC;

-- COMMAND ----------

SELECT team_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(AVG(calculated_points),2) as avg_points FROM f1_race_results_presentation.calculated_race_results
WHERE race_year BETWEEN 1950 AND 2000
GROUP BY team_name
HAVING num_races >= 50
ORDER BY avg_points DESC;

-- COMMAND ----------

