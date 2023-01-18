def read_json_file() -> dict:
    """
    Reads the credentials.json file in this directory and transforms it into a python dictionary
    :return: dict
    """
    from json import load
    with open('credentials.json', 'r') as file:
        return load(file)


class Credentials:
    def __init__(self, **kwargs) -> None:
        self.creds: dict = read_json_file()
        self.account: str = self.creds.get('SNOWFLAKE_ACCOUNT')
        self.user: str = self.creds.get('SNOWFLAKE_USER')
        self.password: str = self.creds.get('SNOWFLAKE_PASSWORD')
        self.database: str = self.creds.get('SNOWFLAKE_DB')
        self.warehouse: str = self.creds.get('SNOWFLAKE_VW')
