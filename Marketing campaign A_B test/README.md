# A/B Testing Analysis: Black Friday & New Year Campaigns

## Project Overview

This project analyses A/B testing results from **Black Friday** and **New Year** marketing campaigns. The goal is to determine whether **Version 1 (V1) or Version 2 (V2)** of each campaign performed better in terms of user engagement (clicks). The data is processed using **SQL queries**, and insights are documented in an **Excel file** for validation and reporting.

## Key Objectives

- Compare engagement metrics (impressions, clicks) between **V1** and **V2** campaign versions.
- Use SQL queries to extract and aggregate data for A/B testing.
- Validate statistical significance of observed differences.
- Summarise findings.

---

## Project Structure

### SQL Queries (`A_B_testing_SQL_code_all.sql`)
This file contains SQL queries that extract and process data from a database, focusing on:
  - User interactions (page views & clicks)
  - Ad impressions & click-through rates
  - Campaign versions:
    - `NewYear_V1` vs. `NewYear_V2`
    - `BlackFriday_V1` vs. `BlackFriday_V2`

---

### Excel Analysis (`A_B test - Black Friday, New Year.xlsx`)
This file includes multiple sheets:

| Sheet Name                | Description |
|---------------------------|-------------|
| A_B test.NewYear          | New Year campaign A/B test data and hypotheses |
| A_B test.BlackFriday      | Black Friday campaign A/B test data and hypotheses |
| A_B test.Validation       | Data validation for consistency |
| A_B test.ResultsOverview  | Summary of impressions, clicks, and conversion rates (COV%) |

---

## How to Use

### Running the SQL Queries
1. Load the SQL script (`A_B_testing_SQL_code_all.sql`) in a database that supports **Google BigQuery SQL**.
2. Ensure that the datasets exist with the required schema.
3. Execute the queries to generate results.

### Analysing Results
1. Open the Excel file (`A_B test - Black Friday, New Year.xlsx`).
2. Go to the `ResultsOverview` sheet to compare:
   - Impressions (total ads displayed)
   - Clicks (total user interactions)
   - Conversion Rate (COV%) (clicks/impressions)
3. Use the `Validation` sheet to ensure data consistency.

---

## A/B Test Results

### New Year Campaign

- **Null hypothesis (H₀)**: There is no significant difference between the conversion rates of **NewYear_V1 (control)** and **NewYear_V2 (variant)**.
- **Alternative hypothesis (Hₐ)**: There is a significant difference between the conversion rates of **NewYear_V1** and **NewYear_V2**.
- **Significance level**: 0.05 (5%)
- **Test type**: Two-tailed

#### Findings:
- **p-value**: `0.0000`, which is well below the 0.05 threshold, providing strong evidence to reject the null hypothesis.
- **Observed power**: `100%`, indicating high reliability.
- **Relative uplift in conversion rate**: `-82.12%`, meaning **NewYear_V2 performed significantly worse than NewYear_V1**.
- **Z-score**: `-6.0569`, further confirming statistical significance.

#### Conclusion:
With **95% confidence**, we reject the null hypothesis and conclude that **NewYear_V1 (control) has a significantly higher conversion rate than NewYear_V2 (variant).**  
Additionally, the results are significant even at a **99% confidence level**, though this was beyond the scope of the initial test.

---

### Black Friday Campaign

- **Null hypothesis (H₀)**: There is no significant difference between the conversion rates of **BlackFriday_V1** and **BlackFriday_V2**.
- **Alternative hypothesis (Hₐ)**: There is a significant difference between the conversion rates of **BlackFriday_V1** and **BlackFriday_V2**.
- **Significance level**: 0.05 (5%)
- **Test type**: Two-tailed

#### Findings:
- **p-value**: `0.9692`, which is far greater than the 0.05 threshold, meaning there is not enough evidence to reject the null hypothesis.
- **Observed power**: `0.05%`, indicating weak statistical power.
- **Relative uplift in conversion rate**: `1.58%`, but this difference is **not statistically significant**.
- **Z-score**: `0.0386`, which is very close to zero, suggesting no meaningful effect.

#### Conclusion:
At a **95% confidence level**, we **fail to reject the null hypothesis**. This means there is **no significant difference between BlackFriday_V1 and BlackFriday_V2**, and we cannot conclude that one performed better than the other.

