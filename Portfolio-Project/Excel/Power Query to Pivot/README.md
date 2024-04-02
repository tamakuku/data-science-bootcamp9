Power-Query-to-Pivot-with-Excel

This project come from practice made by P'Bew (วิศรกรรีพอร์ต).

website https://reportingengineer.com/

Thanks for the practice.

# about This practice

## We will Clean data format, Join Table and create Pivot Table & Silcer with multples step as below.

### Clean wrong data format in 'Report' by Power Query Editor.
- Promote First Row as Headers
- Remove Top Rows
- Auto Fill Down
- Unpivot Other Columns
- Pivot Column
- Add Custom Column 'Date' with Date.From([Attribute], "th-TH") formula >>> change Thai Date from 'Attribute' column to right format Date
- Insert 'Year' column with Date.Year([Date]) formula >>> extract Year from 'Date' column
- Add Custom Column 'Month' with Date.ToText([Date], "MMM", "en-US") formula >>> extract Month from 'Data' column
- Remove Columns
- Sorted Rows in 'Date' column
- Insert 'Quarter' column with Date.QuarterOfYear([Date]) formula >>> extract Quarter 1-4 from 'Date' column
- Add Prefix in 'Quarter' column >>> after extract quarter from 'Data' column will get only number 1-4, must add Q in whole column

### And Join Table between 'Report' and 'Branch' table
- Merge Query with 'Branch' table by 'Branch' column as key with Left Outer Join
- Expand 'Province' and 'Country' from 'Branch' table
And build Data Model with 'Report' and 'Branch' table that cleaned data.
- Reorder Columns for Arange and Delete unnessary columns
- change type columns

### Then create Pivot Table and Slicer from Merged Query.

Please click [Power-Query-to-Power-Pivot.xlsx](https://github.com/tamakuku/data-science-bootcamp9/tree/9839c855f9453ce7c2b6e2e3deafdf71be8a8765/Portfolio-Project/Excel/Power%20Query%20to%20Power%20Pivot)] and press 'View raw' for download excel file