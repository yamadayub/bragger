import stock_value_latest as svl
import time

def main():
    while True:
        svl.stock_value_latest()
        
        # 1日待ち
        time.sleep(86400)

if __name__=="__main__":
    main()