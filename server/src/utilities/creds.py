from os import environ as env

class Credentials:
    def __init__(self) -> None:
        self.account:str = self.__parsing_account_url(env.get('SNOWFLAKE_ACCOUNT'))
        self.user:str = env.get('SNOWFLAKE_USER')
        self.password:str = env.get('SNOWFLAKE_PASSWORD')
        self.database:str = env.get("SNOWFLAKE_DB")
        self.warehouse:str = env.get("SNOWFLAKE_VW")

    def __parsing_account_url (self, original_value: str) -> str:
        """Replaces https and snowflake in the origial value

        Args:
            original_value (str): https://XXXXX.eu-central-1.snowflakecomputing.com

        Returns:
            str: XXXXX.eu-central-1
        """
        return original_value.replace("https://", "").replace(".snowflakecomputing.com", "")
