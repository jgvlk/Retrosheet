from datetime import datetime
import sys

from Retrosheet.PyRetrosheet.Loader import load_retro_data


try:
    if __name__ == '__main__':
        load_retro_data()

except Exception as e:
    print('||ERR', datetime.now(), '|| ERROR MESSAGE', e)

