PRIMEOR SOLUTIONS DATA ANALYTICS PROJECT
Tanvir Ali

Required deliverables
Level_1/Cleaned_Dataset.csv
Level_1/Excel_Analysis.xlsx
Level_2/SQL_Queries.sql
Level_3/Primeor_Dashboard.pbix
Final_Business_Insights_Report.pdf

Supporting SQL outputs, SQLite database, and a Python 3 query runner are included in Level_2. After extracting the ZIP, run python Level_2/run_analysis.py to regenerate the query outputs from the cleaned CSV. The runner uses the Python standard library.

DASHBOARD USE
Open Level_3/Primeor_Dashboard.pbix in Power BI Desktop. It contains three pages: Executive Overview, Sales Analysis, and Product and Customer Insights.
The file preserves the user's saved test selections. Clear the selection on each Year, Market, Category and Segment slicer on each page to view all records. Slicers can have different selections on different pages. No external data connection is required for the embedded historical dataset.

All-record controls: Sales 12,635,222.00; Known Profit 1,467,497.61454; distinct working order keys 25,745; mean line discount 14.292009%; missing profit lines 14. Selecting 2014 alone gives sales 4,293,920.00.

DATA DEFINITIONS
The data covers 2011-2014. Currency is unspecified. Missing profit remains blank and profit totals use known values only. Customer keys use name plus country; order keys use market plus order ID plus order date. These are analytical proxies because stable unique identifiers were not supplied.

EXCEL
The workbook includes four native PivotTables and four editable charts. PivotTables use the one-dimension summaries on Analysis; their definitions and caches have been checked with an independent parser. Excel application refresh behavior has not been independently tested. The full transaction-level records are in Cleaned_Dataset.csv. Workbook aggregate inputs and ranking selections are snapshots of that file; changing source records requires updating those inputs and selections.

SOURCE
Primeor Solutions shared project folder, accessed 18 October 2026:
https://drive.google.com/drive/folders/1sIYMtCNph9YkSoLI_x1D89ZDSxvP6LdW
