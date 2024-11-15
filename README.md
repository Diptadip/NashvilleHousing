
# Nashville Housing Data Cleaning Project

This project focuses on data cleaning and preparation of a real estate dataset in SQL. The objective is to standardize, organize, and optimize data in a format ready for analysis, ideal for applications such as real estate market analysis, property value assessments, and business reporting.

## Table of Contents

- [Overview](#overview)
- [Dataset](#dataset)
- [Data Cleaning Steps](#data-cleaning-steps)
- [Project Highlights](#project-highlights)
- [Skills Demonstrated](#skills-demonstrated)
- [Usage](#usage)

## Overview

In this project, I cleaned and transformed the `NashvilleHousing` table within a SQL database using a series of SQL scripts. This involved tasks like standardizing date formats, populating missing address data, breaking down address components, handling duplicates, and removing unnecessary columns.

## Dataset

The dataset used is a real estate table with fields related to property parcels, sale details, addresses, and more.
The dataset is taken from [here](https://github.com/AlexTheAnalyst/PortfolioProjects/blob/main/Nashville%20Housing%20Data%20for%20Data%20Cleaning.xlsx)
Key fields include:

- `ParcelID`: Unique identifier for each property parcel
- `SaleDate`: Date of sale
- `SalePrice`: Sale price of the property
- `PropertyAddress`: Address of the property
- `OwnerAddress`: Address of the property owner

## Data Cleaning Steps

Below are the primary data cleaning steps performed in this project:

1. **Standardized Date Format**: Converted the `SaleDate` column to a consistent `Date` format.
2. **Populated Missing Property Address Data**: Used existing data to fill in missing values in the `PropertyAddress` column based on matching `ParcelID`.
3. **Split Address Data**: Parsed `PropertyAddress` and `OwnerAddress` into separate columns for `Address`, `City`, and `State`.
4. **Handled Duplicate Records**: Identified and removed duplicate entries based on key fields like `ParcelID`, `PropertyAddress`, `SalePrice`, and `SaleDate`.
5. **Removed Unused Columns**: Dropped unnecessary columns to maintain a clean and optimized dataset.

## Project Highlights

- **Standardized Data Formats**: Ensured date consistency, making data easier to work with for reporting and analysis.
- **Data Imputation**: Populated missing values for critical fields using logical joins and conditions.
- **Column Splitting**: Made address fields more practical, improving usability for analyses by location.
- **Data Deduplication**: Improved data quality by removing duplicates using SQL CTE, ensuring accuracy in analysis.
- **Database Optimization**: Cleaned up unused fields, optimizing database storage and performance.

## Skills Demonstrated

- SQL Data Transformation and Cleaning
- String Manipulation and Parsing in SQL
- Deduplication Using Window Functions (`ROW_NUMBER()`)
- Database Table Management (Alter, Update, Drop)

## Usage

Download SQL Server Management Studio [SSMS](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16) 

To replicate this project:

1. Clone this repository.
   ```
    git clone https://github.com/Diptadip/NashvilleHousing
   ```
2. Import the data in the SSMS.
3. Run each SQL script in sequence to transform the raw data in the `NashvilleHousing` table.
4. Verify the results by querying the updated `NashvilleHousing` table.

This project can be modified for similar datasets with real estate or address-based records.

