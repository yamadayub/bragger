import pandas_datareader.data as web
import pandas_datareader._utils as utils
import datetime
import pymysql.cursors
import urllib3.exceptions
from urllib3.exceptions import ReadTimeoutError

def stock_value_latest():

    print(dir(datetime))
    
    today = datetime.date.today()
    yesterday = today + datetime.timedelta(days=-1)
    day_before_yesterday = today + datetime.timedelta(days=-2)
    print(type(yesterday))
    print(type(day_before_yesterday))
    
    
    connection = pymysql.connect(
    host='localhost',
    user='root',
    password='',
    database='bragger_development',
    cursorclass=pymysql.cursors.DictCursor
    )
    
    with connection.cursor() as cursor:
        sql = "SELECT ticker from ticker_sources where ticker not like '%^%'"
        cursor.execute(sql)
    
        #[ {'ticker': 'NMAI'}, {'ticker': 'NOA'} ]
        results = cursor.fetchall()
        
        
    for result in results:
        print(result['ticker'])
        
        #error handling needed
        try:
            df = web.DataReader(result['ticker'], 'yahoo', day_before_yesterday , yesterday)
            # print(df)
            
            connection = pymysql.connect(
            host='localhost',
            user='root',
            password='',
            database='bragger_development',
            cursorclass=pymysql.cursors.DictCursor
            )
                
            with connection:
                with connection.cursor() as cursor:
                    
                    #iterate for each row in DataReader return
                    for row in df.iterrows():
                        sql = "INSERT INTO `stock_values` (`ticker`, `date`, `value`, `created_at`, `updated_at`) VALUES (%s, %s, %s,NOW(),NOW())"
                        
                        #2nd and 3rd parameter depend on the data structure of pandas.DataFrame
                        #row[0] is index in TimeStapm
                        #row[1] is the tuple of attributes
                        
                        cursor.execute(sql, (result['ticker'], row[0], row[1]['Close']))
                        
                    connection.commit()
                    
        except utils.RemoteDataError:
            print('Catched a RemoteDataError')
            print(result['ticker'])
            continue
        
        except KeyError:
            print('Catched a KeyError')
            print(result['ticker'])
            continue
        
        except ReadTimeoutError:
            print('Catched a ReadTimeoutError')
            print(result['ticker'])
            continue
        
        except ConnectionError:
            print('Catched a ConnectionError')
            print(result['ticker'])
            continue
