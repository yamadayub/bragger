import pandas_datareader.data as web
import datetime

start = datetime.date(2022,7,1)
end = datetime.date(2022,7,31)

df = web.DataReader('9984.T', 'yahoo', start, end)
print(df)
