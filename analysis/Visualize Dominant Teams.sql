-- Databricks notebook source
SELECT * FROM f1_race_results_presentation.calculated_race_results;

-- COMMAND ----------

CREATE OR REPLACE TEMP VIEW dominant_teams AS
SELECT team_name, COUNT(*) as num_races, SUM(calculated_points) as total_points, ROUND(AVG(calculated_points),2) as avg_points,
RANK() OVER(ORDER BY AVG(calculated_points) DESC) as team_rank FROM f1_race_results_presentation.calculated_race_results
GROUP BY team_name
HAVING num_races >= 100
ORDER BY total_points DESC;

-- COMMAND ----------

SELECT * FROM dominant_teams;

-- COMMAND ----------

SELECT race_year, team_name, COUNT(*) AS num_races, SUM(calculated_points) AS total_points, ROUND(AVG(calculated_points),2) as avg_points FROM f1_race_results_presentation.calculated_race_results
WHERE team_name IN (SELECT team_name FROM dominant_teams WHERE team_rank <= 10)
GROUP BY race_year, team_name
ORDER BY race_year, avg_points DESC;

-- COMMAND ----------

-- MAGIC %python
-- MAGIC html = """
-- MAGIC <h1 style="text-align:center;color:black;font-family:Ariel;font-size:32px">Report on Dominant Formula 1 Teams</h1>
-- MAGIC """
-- MAGIC displayHTML(html)