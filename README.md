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
## Key Findings (2011–2014)

*Monetary values are reported in source units (currency unspecified). Fourteen missing profit entries are preserved as blanks rather than imputed with zero.*

| Metric | Value |
| :--- | ---: |
| Retained Order Lines | 51,271 |
| Distinct Working Order Keys | 25,745 |
| Total Sales | 12,635,222.00 |
| Known Profit | 1,467,497.61 |
| Known Profit-to-Sales Ratio | 11.61% |
| Average Discount per Line | 14.29% |
| Negative-Profit Lines | 12,538 |
| Missing Profit Lines | 14 |

* **Top Markets:** APAC leads with `3,581,785.00` in revenue (28.35% of total sales) and `436,991.31` in known profit. Together, APAC and EU account for 51.59% of total revenue.
* **Category Performance:** Technology delivers the highest total known profit (`663,200.15`; mean `65.46`/line). Furniture records the lowest total known profit (`286,124.88`) and the highest average line discount (`16.80%`), while Office Supplies has the lowest mean profit per line (`16.58`).
* **Top Product:** *Canon imageCLASS 2200 Advanced Copier* leads known product profit at `25,199.93`.
* **Shipping Mode:** Standard Class accounts for `30,764` order lines (60.00% of retained lines) across `15,409` distinct order keys.

## Data Preparation & Analytical Definitions

* **Cleaning:** Removed 54 exact duplicates after trimming/normalizing 273 whitespace-affected text fields; parsed dates day-first to ISO format; labeled 79 missing customer names as `Unknown` (excluded from customer rankings).
* **Analytical Keys:** Because globally unique customer and transaction IDs were not supplied, `customer_key` combines customer name + country, and `order_key` combines market + order ID + order date. Product rankings aggregate by `product_name`.
* **Excel Workbook (`Level_1/Excel_Analysis.xlsx`):** Contains four native PivotTables and four editable charts built as snapshots of `Cleaned_Dataset.csv` and reconciled against independent Python and SQL totals.

## How to Reproduce & Explore

1. **Regenerate SQL Outputs (Python 3 — Standard Library Only):** Run `python Level_2/run_analysis.py` to rebuild `Level_2/Analysis.sqlite` from `Level_1/Cleaned_Dataset.csv` and regenerate all 11 CSV outputs in `Level_2/`.
2. **Explore the Power BI Dashboard:** Open `Level_3/Primeor_Dashboard.pbix` in **Power BI Desktop** (no external data connection required). The report has three pages: *Executive Overview*, *Sales Analysis*, and *Product and Customer Insights*. Clear the **Year**, **Market**, **Category**, and **Segment** slicers on each page to view full-dataset totals (All-record Sales = `12,635,222.00` | Known Profit = `1,467,497.61` | 2014 Sales alone = `4,293,920.00`).

## Data Source
Primeor Solutions shared project folder (accessed 18 October 2026): [Google Drive Link](https://drive.google.com/drive/folders/1sIYMtCNph9YkSoLI_x1D89ZDSxvP6LdW)
