create database weather_project;

use database weather_project;

CREATE or replace TABLE weather_data(
    temp       NUMBER(20,0),
    CITY          VARCHAR(128),
    humidity   NUMBER(20,5),
    wind_speed      NUMBER(20,5), 
    time             VARCHAR(128), 
    wind_dir        VARCHAR(128),
    pressure_mb    NUMBER(20,5)
);

create storage integration s3_int
    type = external_stage
    storage_provider = s3
    enabled = true
    storage_aws_role_arn = 'arn:aws:iam::646087814792:role/aws_s3_fullaccess'
    storage_allowed_locations = ('s3://weather-api-buck/snowflake/');

DESC INTEGRATION s3_int;

create file format csv_format
    type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL', 'null')
    empty_field_as_null = true

create stage ext_csv_stage
    STORAGE_INTEGRATION = s3_int
    URL = 's3://weather-api-buck/snowflake/'
    file_format = csv_format;

create pipe mypipe auto_ingest=true as
copy into weather_data
from @ext_csv_stage
on_error = CONTINUE;

show pipes;

select * from weather_data limit 10