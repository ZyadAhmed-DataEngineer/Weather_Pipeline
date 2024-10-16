# Weather API Real-Time Data Pipeline

## Overview
   This project showcases a real-time data pipeline integrating DynamoDB, Snowflake, AWS Lambda and Snowpipe to ingest and process weather data from a live Weather API. The goal is to collect weather data in real-time, store it in DynamoDB and seamlessly transfer it to Snowflake for further analysis and reporting. This pipeline is scalable, reliable and optimized for performance.

## Architecture
The key components of this project include:

1. **DynamoDB**: NoSQL database used for storing the ingested real-time weather data.
2. **AWS Lambda**: Serverless functions to trigger and process the flow of data between DynamoDB and Snowflake.
3. **Weather API**: Source of real-time weather data.
4. **Snowpipe**: Snowflake feature used for automating the data loading process from AWS S3 to Snowflake in near real-time.
5. **Snowflake**: Cloud data platform used for storing, querying, and analyzing the weather data.

![Project_Architecture](https://github.com/user-attachments/assets/970f5367-4599-4eab-96b0-0151536a4ac0)


## Setup and Installation

### Prerequisites

- AWS account with permissions for Lambda, DynamoDB, S3, and IAM roles.
- Snowflake account with necessary permissions for Snowpipe and data ingestion.
- Access to a Weather API (such as OpenWeatherMap, Weatherstack, or similar).

### AWS Setup

1. **DynamoDB Table Setup**:
   - Create a DynamoDB table named `WeatherData`.
   - Define the appropriate attributes (e.g., city, temperature, humidity, etc.).

2. **Lambda Functions**:
   - Create a Lambda function to fetch data from the Weather API and store it in DynamoDB.
   - Create another Lambda function to send data from DynamoDB to S3 for Snowpipe ingestion.

3. **S3 Bucket Setup**:
   - Create an S3 bucket to store the data transferred from DynamoDB.
   - Ensure the bucket has the proper policies to allow access from Snowflake.

4. **Snowflake Configuration**:
   - Set up Snowpipe to automatically ingest data from the S3 bucket into Snowflake.
   - Configure Snowflake storage and compute resources based on the data volume.

### Monitoring and Maintenance

- Use **AWS CloudWatch** to monitor Lambda performance.
- Use **Snowflake Console** to verify that Snowpipe is ingesting data properly.
- Enable automatic alerts in case of pipeline failures.

## Conclusion

  This project demonstrates how to build a robust, scalable real-time data pipeline using AWS and Snowflake. By integrating services like DynamoDB, Lambda, and Snowpipe, you can create powerful, automated data workflows that adapt to real-time scenarios.
