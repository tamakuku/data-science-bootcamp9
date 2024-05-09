
## Project File [_Click Notion Link_](https://www.notion.so/suphakit-panthu/MySQL-Excel-ETL-Sync-Data-with-SQL-Python-code-19b06fede8704189b71902406e413509?pvs=4)

# MySQL-Excel ETL Sync Data with SQL & Python code

This project come from practice made by Zinglecode.

youtube https://www.youtube.com/@Zinglecode/

Thanks for the knowledge for practice.

## 01 Objective
- This project aims to synchronize category data between a MySQL database and an Excel file using Python
- implementing an Extract, Transform, Load (ETL) process.

## 02 Data Sources
- Data is extracted from two sources: the MySQL database, where category information is stored in a 'categories' table
- and an Excel file containing updated category data.

## 03 Comparison and Matching
- Using Python code compares category names from the Excel file with those in the MySQL 'categories' table to identify new or updated categories.

## 04 Transformation
- Using Python code to transforms the raw category data by assigning category IDs from MySQL to categories in the Excel file
- preparing it for loading back into the database.

## 05 Loading Data
- Transformed data is loaded back into the MySQL database using SQL insertion queries
- updating the 'products' table with new or updated category IDs associated with each product.

## 06 Automation and Scalability
- This project can be automated to run periodically, ensuring that category data in the database remains synchronized with the latest updates from the Excel file.
- Additionally, the code can be scaled to handle larger datasets or extended to include more complex transformations if needed.
