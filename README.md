# F1-Racing-Analytics-Azure
This project demonstrates a complete ETL pipeline for Formula 1 racing data using Azure Databricks, Delta Lake, and Azure Data Factory. It covers data ingestion, transformation with PySpark and Spark SQL, data governance with Unity Catalog, and visualization through Power BI. Designed to showcase real-world data engineering workflows in Azure.
## Formula1 Overview
Formula 1 (F1) is the highest level of single-seater auto racing worldwide and is governed by the FIA. It showcases advanced and powerful cars equipped with hybrid engines. The F1 season occurs once a year and consists of races that take place over the course of a weekend, typically from Friday to Sunday. These races are held at various circuits in different countries. In each race, there are 10 teams, each with two assigned drivers.

The F1 season typically includes 20 to 23 races, also known as Grands Prix. Safety is a paramount concern, with strict regulations and ongoing technological advancements to ensure the well-being of drivers and spectators. Pit stops are a common occurrence during races, allowing teams to change tires and make adjustments to the cars.

On Saturdays, a qualifying round is held to determine the starting positions of drivers on the grid for the Sunday race. The races themselves consist of a variable number of laps, usually ranging from 50 to 70 laps, depending on the circuit's length. Pit stops are available during races for tire changes or car adjustments.

The results of each race are used to calculate driver standings and constructor standings. The driver who leads the driver standings at the end of the season is crowned the drivers' champion, while the team that leads the constructor standings becomes the constructors' champion
## Architecture Diagram

![WhatsApp Image 2025-02-11 at 17 19 41_d6dc6225](https://github.com/user-attachments/assets/7ddee616-b802-4f8e-8f01-bb8e75e930d0)

## ER Diagram

![WhatsApp Image 2025-02-11 at 17 29 27_49e2a0bb](https://github.com/user-attachments/assets/63ba9e67-d9cb-4b61-bfb6-998c97662c04)

Here’s a more concise and structured version of your **Working Plan** while maintaining proper hierarchical headings for GitHub:  

---

## **Working Plan**  

#### **Source Data**  
We are using open-source data from the **Ergast Developer API**, covering **F1 race data from 1950 to 2022**.  

| **File Name**     | **File Type**              |  
|------------------|--------------------------|  
| Circuits        | CSV                        |  
| Races           | CSV                        |  
| Constructors    | Single Line JSON           |  
| Drivers        | Single Line Nested JSON    |  
| Results        | Single Line JSON           |  
| PitStops       | Multi-Line JSON            |  
| LapTimes       | Split CSV Files            |  
| Qualifying     | Split Multi-Line JSON Files |  

#### **Execution Overview**  
- **Azure Data Factory (ADF)** orchestrates and monitors the pipeline.  
- **Raw data** is ingested into **Azure Data Lake Storage Gen2 (ADLS)** (Bronze zone).  
- **Azure Databricks** processes and converts data into **Delta tables** using upserts.  
- Processed data moves to the **Silver zone** for further transformation (joining, aggregations).  
- Final analytical tables are stored in the **Gold zone** for insights and reporting.  

#### **ETL Pipeline**  
##### **1. Ingestion (Bronze → Silver)**  
- Reads JSON/CSV files using **Apache Spark**.  
- Performs minimal transformation (schema enforcement, renaming, audit columns).  
- Saves output as **Delta tables**.  

##### **2. Transformation (Silver → Gold)**  
- **Databricks SQL** processes and refines data.  
- Removes duplicates, applies joins, and aggregates data.  
- Generates final **dimensional model tables** in **Delta format**.  

**Scheduling:**  
- **ADF runs every Sunday at 10 PM**, skipping execution if no race occurred that week.  
- Uses **file_date** as a parameter for dynamic execution.  

#### **Azure Resources Used**  
- **Azure Data Lake Storage (ADLS)**  
- **Azure Data Factory (ADF)**  
- **Azure Databricks**  
- **Azure Key Vault**  



