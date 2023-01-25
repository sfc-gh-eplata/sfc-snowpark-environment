# Learning-Snowflake-Snowpark
This repository will walk you through running Snowflake Snowpark Python demo in a Chrome browser.

## Requirements
* Install [Chrome](https://www.google.com/chrome/)
* Sign up for a [Github](https://github.com/) account
  * Once you have a GitHub account you need to fork [this](https://github.com/sfc-gh-eplata/sfc-snowpark-environment) repository to your own space
   * <img src="images/8.png" width="1000">
   * <img src="images/9.png" width="1000">
* Snowflake Account
   * [Signup](https://signup.snowflake.com/) for a FREE Snowflake account, make sure that you select the following setup is placed:
   * <img src="images/1.png" width="1000">
   * In your mailbox you should have received an email, this will activate the account
   * <img src="images/2.png" width="1000">
   * Activate your account, and make sure you remember the user & password, you will need them in the next step to log in, it's VERY important you remember them otherwise this will NOT work.

## Setup
  * Once you are logged into your Snowflake account, click in the top right corner and create a new worksheet
    * <img src="images/3.png" width="1000">
  * Inside of this repository there is a sql scrip, copy the code and paste it in the new worksheet you just created, here is the script link [setup.sql](sql-setup/setup.sql)
  * Once you pasted, scroll down to the bottom and replace 'XXX' for the password you prefer.
    * <img src="images/4.png" width="1000">
  * After changing the value go to the top and select everything and run the script by clicking the play button (top right corner), make sure you select all the scripts first.
    * <img src="images/5.png" width="1000">
  * Go back to the home menu
    * <img src="images/6.png" width="1000">
  * Once you are in the home menu, copy the locator from your account by:
    * <img src="images/7.png" width="1000">
  * Go back to your browser (GitHub) and click on settings, make sure you are in the repository you forked (starts with your GitHub username)
    * <img src="images/10.png" width="1000">
    * <img src="images/11.png" width="1000">
  * Under this repository there is a file named .env you will need to replace the XXX with the locator and the password and create a variable for each of the following variables:
    * SNOWFLAKE_ACCOUNT=XXX.eu-west-3.aws
    * SNOWFLAKE_USER=SVCSNOWPARK
    * SNOWFLAKE_PASSWORD=XXX
    * SNOWFLAKE_VW=LEARNINGSNOWPARKVW
    * SNOWFLAKE_DB=LEARNINGSNOWPARKDB
  * At the end you should have some like this:
  ![Screenshot 2023-01-10 at 14 55 06](https://user-images.githubusercontent.com/107192982/211569900-2544219e-239d-482f-9965-a83b3e454d74.png)

* The last change we need to make is to change the .env files with the actual credentials, edit the file within Github
<img width="1275" alt="Screenshot 2023-01-11 at 10 41 02" src="https://user-images.githubusercontent.com/107192982/211772452-82de4f51-81e3-422d-845a-6dc8230cc99b.png">

## Author
* **Enrique Fuentes** - *2023-01-12*
