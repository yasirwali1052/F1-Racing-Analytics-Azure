
# F1-Racing-Analytics-Azure
## Summary
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

Here’s a concise and well-structured version for your **README.md**:  

---

## **Project Requirements**  

#### **1. Data Ingestion**  
- Ingest **8 files** into **Azure Data Lake** with a consistent schema.  
- Store data in **Parquet format** with audit columns.  
- Enable **SQL-based analysis** and **incremental load handling**.  

#### **2. Data Transformation**  
- Create new tables by **joining key data** for reporting and analysis.  
- Store transformed data in **Parquet format** with audit columns.  
- Support **incremental load handling** and SQL-based analysis.  

#### **3. Data Reporting**  
- Generate insights on **Driver Standings** and **Constructor Standings**.  

#### **4. Data Analysis**  
- Identify **dominant drivers and teams**.  
- Create **visualizations and Databricks dashboards**.  

#### **5. Scheduling & Monitoring**  
- **Scheduled execution: Every Sunday at 10 PM**.  
- Support **pipeline monitoring, failure alerts, and reruns**.  

#### **6. Other Requirements**  
- **Record deletion, history tracking, and rollback support**.  

## ** RESULTS **
![WhatsApp Image 2025-02-11 at 17 18 14_60a5d277](https://github.com/user-attachments/assets/45f6df2c-6505-41af-a7e4-99163b57edd1)


![WhatsApp Image 2025-02-11 at 17 21 05_b44af7e2](https://github.com/user-attachments/assets/1983b629-142b-412c-8b08-622ae56e98c0)



## **Tasks Performed**  

#### **Solution Architecture & Development**  
- Designed and implemented a **data engineering solution** using **Azure Databricks, Data Lake Gen2, Data Factory, and Power BI**.  
- Configured **Azure Databricks service**, clusters, pools, and jobs.  
- Created **Databricks notebooks**, used utilities, magic commands, and **notebook workflows**.  
- Mounted **Azure Storage** using secrets from **Azure Key Vault**.  
- Implemented **Lakehouse architecture** with **Delta Lake**.  
- Built **Power BI dashboards** for data visualization.  

#### **Spark & PySpark (ETL Processing)**  
- Processed **CSV and JSON files** into **Parquet format** in **Data Lake**.  
- Performed **joins, aggregations, filtering, window functions**, and created **views** in PySpark & Spark SQL.  
- Developed **incremental load** patterns using **partitioning and Delta Lake**.  

#### **Delta Lake**  
- Performed **Read, Write, Update, Delete, Merge** operations on **Delta tables**.  
- Enabled **History, Time Travel, Vacuum**, and **Parquet-to-Delta conversion**.  

#### **Azure Data Factory (ADF) Pipelines**  
- Developed pipelines to **execute Databricks notebooks**.  
- Implemented **dependency handling, error monitoring, and scheduling** using ADF triggers.  
- Managed **incremental and full refresh** ETL patterns.  

### **Technologies & Tools Used**  
✅ **PySpark, Spark SQL, Delta Lake**  
✅ **Azure Databricks, Azure Data Factory, Azure Data Lake Gen2**  
✅ **Azure Key Vault, Power BI**  




