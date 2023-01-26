-- 0.- Using original VW
USE ROLE SYSADMIN;
USE WAREHOUSE COMPUTE_WH;

-- 1.- Resource creation
USE ROLE SYSADMIN;
CREATE OR REPLACE WAREHOUSE LEARNINGSNOWPARKVW WITH COMMENT = 'To be used in repo: learning-snowpark'
  WAREHOUSE_SIZE = XLARGE
  MIN_CLUSTER_COUNT = 1
  MAX_CLUSTER_COUNT = 2
  SCALING_POLICY = STANDARD
  AUTO_SUSPEND = 300
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  ENABLE_QUERY_ACCELERATION = TRUE;

USE ROLE SYSADMIN;
CREATE OR REPLACE DATABASE LEARNINGSNOWPARKDB COMMENT = 'LEARNING SNOWPARK DEMO'
    DATA_RETENTION_TIME_IN_DAYS = 3
    MAX_DATA_EXTENSION_TIME_IN_DAYS = 3;

USE ROLE SYSADMIN;
CREATE OR REPLACE DATABASE HOL_DB COMMENT = 'LEARNING SNOWPARK DEMO'
    DATA_RETENTION_TIME_IN_DAYS = 3
    MAX_DATA_EXTENSION_TIME_IN_DAYS = 3;

USE ROLE ACCOUNTADMIN;
ALTER SCHEMA LEARNINGSNOWPARKDB.PUBLIC ENABLE MANAGED ACCESS;

USE ROLE ACCOUNTADMIN;
ALTER SCHEMA HOL_DB.PUBLIC ENABLE MANAGED ACCESS;

USE ROLE SECURITYADMIN;
CREATE OR REPLACE ROLE LEARNINGSNOWPARKROLE COMMENT = 'SNOWPARK PYTHON LEARNING';

-- 2.- Access
-- Warehouse
USE ROLE SECURITYADMIN;
GRANT USAGE, OPERATE ON WAREHOUSE LEARNINGSNOWPARKVW TO ROLE LEARNINGSNOWPARKROLE;
USE ROLE SECURITYADMIN;
GRANT USAGE, OPERATE ON WAREHOUSE LEARNINGSNOWPARKVWM TO ROLE LEARNINGSNOWPARKROLE;

-- LEARNINGSNOWPARKDB
USE ROLE SECURITYADMIN;
GRANT USAGE ON DATABASE LEARNINGSNOWPARKDB TO ROLE LEARNINGSNOWPARKROLE;
GRANT CREATE SCHEMA ON DATABASE LEARNINGSNOWPARKDB TO ROLE LEARNINGSNOWPARKROLE;
GRANT ALL ON ALL SCHEMAS IN DATABASE LEARNINGSNOWPARKDB TO ROLE LEARNINGSNOWPARKROLE;
GRANT ALL ON FUTURE SCHEMAS IN DATABASE LEARNINGSNOWPARKDB TO ROLE LEARNINGSNOWPARKROLE;

-- HOL_DB
USE ROLE SECURITYADMIN;
GRANT USAGE ON DATABASE HOL_DB TO ROLE LEARNINGSNOWPARKROLE;
GRANT CREATE SCHEMA ON DATABASE HOL_DB TO ROLE LEARNINGSNOWPARKROLE;
GRANT ALL ON ALL SCHEMAS IN DATABASE HOL_DB TO ROLE LEARNINGSNOWPARKROLE;
GRANT ALL ON FUTURE SCHEMAS IN DATABASE HOL_DB TO ROLE LEARNINGSNOWPARKROLE;

-- 3.- User creation
-- !!!!! IMPORTANT, BEFORE RUNNING THIS LINE MAKE SURE YOU REPLACE XXX FOR AN ACTUAL PASSWORD !!!!!
USE ROLE USERADMIN;
CREATE OR REPLACE USER SVCSNOWPARK
 LOGIN_NAME = 'SVCSNOWPARK'
 DISPLAY_NAME = 'SVCSNOWPARK'
 PASSWORD = 'XXX'
 DEFAULT_ROLE = LEARNINGSNOWPARKROLE
 DEFAULT_WAREHOUSE = LEARNINGSNOWPARKVW
 DEFAULT_NAMESPACE = LEARNINGSNOWPARKDB
 MUST_CHANGE_PASSWORD = FALSE;

USE ROLE SECURITYADMIN;
GRANT ROLE LEARNINGSNOWPARKROLE TO USER SVCSNOWPARK;

USE ROLE SECURITYADMIN;
GRANT ROLE LEARNINGSNOWPARKROLE TO ROLE SYSADMIN;
