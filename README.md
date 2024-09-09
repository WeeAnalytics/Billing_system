# Billing System for a Payment Processor (Part 1) - Building it

## Executive Summary

### Purpose of the Project
In this project, I will use SQL and Python  to build a system that simulate a payment processing scenario similar to Stripe, focusing on accuracy, scalability, and data quality. 

The system will:
1. calculate fees for transactions
2. ensure billing accuracy 
3. detect data inconsistencies
### Key Features
- Fee calculation is based on transaction volume, user type, or custom contracts
- Data quality checks to identify missing or inaccurate transaction data
- An exception report is generated to flag out inconsistent data

## Objectives
The billing system will replicate real-world complexities, handling merchants with varying transaction volumes, detecting inconsistencies, and ensuring accurate billing.

The key challenge was to understand how such systems operate in practice and gather the necessary information to build a realistic and functional model.

## Approach
The project was broken down into smaller components and worked on based on the following approach:

|Step|  Component           | To Do                                 |                  
|-----|---------------------|----------------------------------------|
| 1| Scope and Objectives| - Research and understand billing systems<br>- Define     scope and objectives|
| 2   | - Data source <br>- Pricing model | - Determine data source<br> - Explore and understand data set <br> - Identify pricing model that align with real-world practice |
| 3   | - Database schema<br> - Data Model<br> - Data Load| - Determine the database schema and data model based on the data source<br> - Create necessary database tables using PostgreSQL<br> - Write SQL scripts to set up database schemas<br> - Transform data using Panda and load data into SQL database|
|4 |Fee Calculator|- Develop Python scripts to calculate transaction fees based on pricing models<br> -Test the fee calculator with a sample transaction data set to ensure accuracy  |
|5 |Exception Report| Use Python to create exceptions on:<br>- users with missing pricing model<br>- zero or negative transaction amount<br>- large transaction amount<br>- duplicated transactions within a short time|

## Decision Making

### 1.  Dataset Selection
The [credit card transaction dataset from Kaggle](https://www.kaggle.com/datasets/priyamchoksi/credit-card-transactions-dataset/data) was chosen for this project because 
-  it has a large number of transactions to test the scalability of the billing system
-  it contains transaction data from multiple merchants with various transaction volume for different tiered pricing models

### 2.  User Selection
Merchants in the dataset are identified as users because the main customers of payment processors are businesses (merchants) rather than end consumers. 

### 3. Pricing Models
The pricing models are determined based on:
- the merchants' transactional distribution ( transaction volume and size )
- merchants with medium volume transactions are given a slightly lower rate to encourage more businesses and profitability
- merchants with high volume transactions are able to negotiate or customize their rates
- pricing models that align to the real-world

The following pricing models are identified for this project:
| Tier  | Transaction Volume | Pricing Details               |
|-------|--------------------|-------------------------------|
| Low   | < 1,000            | - Per transaction fee<br> $0.30 per transaction + 2.9% of the transaction value         |
| Medium| 1,000 - 3,000      | - Slightly reduced fee<br> $0.25 per transaction + 2.5% of the transaction value |
| High  | > 3,000            | - Custom pricing<br>Negotiated/custom rate<br> e.g. $0.20 per transaction + 2.2% of the transaction value, or a flat monthly fee plus a reduced per-transaction cost |

### 4. Data Model

The data model is designed this way to 
- ensure efficient data management by storing each piece of information once
- handle increasing data volumes and business growth
- ensure accurate relationships between different pieces of data through primary and foreign keys

### 5. SQL or Python
SQL for data storage because:
-  it can be optimized for large scale data operations
-  can be integrated with other business itelligence tools for visualization and analysis

Python and Panda:
- for data manipulation and cleaning
- complex calcuations and generating exception reports

### 6. Inconsistent Data
An exception report in CSV format is generated so that inconsistent data can be reviewed and amended.

## Project Workflow

### 1. Data Exploration & Cleaning

#### Steps Taken

- Exploration: Downloaded dataset and performed initial analysis to understand its structure, identify key columns, and recognize any missing or inconsistent data
- Cleaning: Remove unnecessary columns and updated merchant names. Corrected data types (e.g. converting date columns to proper datetime formats)

#### Tools Used

Python (Pandas): For data exploration and cleaning tasks

### 2. System Design

#### Architecture

- Designed tables for users, pricing_model, transactions and fees
- Defined relationships and logic for calculating fees based on transaction volumes and pricing models.
- The following 5 tables were created:

|Table|What is it for|
|-----|--------------|
|users| Contains user information|
|sales_transaction|Contains records of each transaction|
|pricing_model|Contains details of different fee structures|
|fees|Stores the calculated fees for each transaction|
|monthly_bill|Stores the total monthly fee for each merchant|

### 3. Implementation

#### Coding
Wrote Python scripts for data manipulation, fee calculations and exception handling, and reporting.

#### Integration
Integrated data processing with the SQL database and applied fee calculation logic in Python scripts.

### 4. Testing & Validation

### Process
Conducted tests to validate accuracy of calculations and exception reporting.
Reviewed results to ensure consistency and correctness.

#### Results
Produced accurate billing calculations and exception reports, demonstrating the effectiveness of the system.
 
##Future Enhancements
#### Potential Additions
- the system can be futher enhanced with fraud detection capability
- additional exception reports e.g. incorrect date/time entry, unusual transaction patterns

#### Scalability Plans
- To handle a sales transaction database that gets updated regularly, data loading, fees calculation and exception reports will be more efficiently managed using a batch processing system.

## Key Learning

### Challenges
One of the main challenges that I faced was to understand the complexity of a real-world billing system. Finding an appropriate data set to replicate the large transaction volume in the real world and designing a system that can handle large dataset without performance issues were some of the other challenges. I overcame these challenges by researching real world billing systems and breaking the project into small manageable chunks to work on. 

### Skills Demonstrated
#### Data Analysis & Cleaning
- Exploring, cleaning, and processing large datasets using Python (Pandas) and ensuring data quality for accurate billing.
#### SQL & Database Design
- Design and created an efficient database structure
#### Exception Handling & Reporting
-  Developed custom exception reports to capture and handle missing or inconsistent data, ensuring transparency in the billing process.
#### Problem Solving
- Overcame challenges related to data discrepancies and system scalability by researching and applying best practices from the industry.








