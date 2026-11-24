# Primeor Solutions Data Analytics Project

End-to-end e-commerce sales and profitability analysis (2011–2014) completed by **Tanvir Ali** for the Primeor Solutions internship project. The workflow spans data cleaning and Excel modeling (Level 1), SQLite/SQL querying with a Python runner (Level 2), an interactive Power BI dashboard (Level 3), and an executive business insights report.

## Repository Structure

```text
Primeor_Data_Analytics/
├── Level_1/
│   ├── Cleaned_Dataset.csv            # 51,271 cleaned order lines (54 exact duplicates removed)
│   └── Excel_Analysis.xlsx            # 4 native PivotTables and 4 editable charts
├── Level_2/
│   ├── SQL_Queries.sql                # 11 analytical queries (SQLite dialect)
│   ├── run_analysis.py                # Python 3 standard-library runner to rebuild outputs
│   ├── Analysis.sqlite                # SQLite database built from Cleaned_Dataset.csv
│   └── 01–11_*.csv                    # Exported SQL query results
├── Level_3/
│   └── Primeor_Dashboard.pbix         # 3-page interactive Power BI report
├── Final_Business_Insights_Report.pdf # Executive summary, methodology, and recommendations
└── README.txt                         # Original project submission notes
