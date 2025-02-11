-- Databricks notebook source
-- WITH dominant_drivers AS (
-- SELECT driver_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(AVG(calculated_points),2) as avg_points, RANK() OVER (ORDER BY AVG(calculated_points) DESC) as driver_rank FROM f1_race_results_presentation.calculated_race_results
-- GROUP BY driver_name
-- HAVING num_races >= 50
-- ORDER BY avg_points DESC
-- )

-- SELECT * FROM dominant_drivers;

CREATE OR REPLACE TEMP VIEW dominant_drivers AS
SELECT driver_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(AVG(calculated_points),2) as avg_points, RANK() OVER (ORDER BY AVG(calculated_points) DESC) as driver_rank FROM f1_race_results_presentation.calculated_race_results
GROUP BY driver_name
HAVING num_races >= 50
ORDER BY avg_points DESC;

-- COMMAND ----------

SELECT race_year, driver_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(AVG(calculated_points),2) as avg_points FROM f1_race_results_presentation.calculated_race_results
WHERE driver_name IN (SELECT driver_name FROM dominant_drivers WHERE driver_rank <= 10) 
GROUP BY race_year, driver_name
ORDER BY race_year, avg_points DESC;

-- COMMAND ----------

-- MAGIC %python 
-- MAGIC html = """
-- MAGIC   <h1 style="color:purple;text-align:center;font-family:Ariel;font-size:30px">Report on Dominant Formula 1 Drivers</h1>
-- MAGIC """
-- MAGIC displayHTML(html)