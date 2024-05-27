
# R-PostgreSQL-DataFrame-Creation-and-Upload

Project Code [_click file_](https://github.com/tamakuku/data-science-bootcamp9/blob/a2fbfb4d156e127b4ddce8e11c77a0a42981b12f/Portfolio-Project/R-Programming/Churn%20Prediction%20Model%20Logistic%20Regression/Churn%20Prediction%20Model%20Logistic%20Regression)

This project come from practice made by Data Rockie School.

website https://data-science-bootcamp1.teachable.com/

Thanks for the practice.

## Objective
- This project demonstrates the process of connecting to a PostgreSQL server using R, creating dataframes for a pizza shop database, and uploading these dataframes to the server. The primary objective is to provide a practical example of database connection, dataframe creation, and data transfer from R to PostgreSQL.

## Data Sources
- Data is manually created within R using the tribble() function from the tidyverse package. Four dataframes are constructed: shops, customers, menu, and orders. These dataframes simulate a pizza shop's database structure, including details about shops, customers, menu items, and orders.

## DataFrame Creation
01 Shops: Contains shop IDs and locations.

02 Customers: Contains customer IDs, names, and countries.

03 Menu: Contains menu item IDs, names, and prices.
04 Orders: Contains order details, including order ID, date, customer ID, shop ID, and menu ID.

## Database Connection and Data Upload
- Connecting to PostgreSQL: A connection to a PostgreSQL server is established using the dbConnect() function from the RPostgreSQL package. Connection details include the host, database name, user credentials, and port.
- Data Upload: The dbWriteTable() function is used to upload each dataframe to the PostgreSQL server. The dataframes are written to corresponding tables in the database.
- Verification: The dbListTables() function is used to verify that the tables have been successfully created and uploaded to the server.

## Automation and Scalability
- This project provides a template for automating the process of data transfer from R to a PostgreSQL server. It can be extended to handle larger datasets, more complex table structures, or additional data transformations as needed. By rotating passwords and securely managing connection details, the process can be scaled while maintaining data security.
