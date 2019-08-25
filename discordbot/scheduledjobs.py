# OH BOY I SURE DO LOVE SCHEDULING JOBS
import schedule
import threading
import time
import sys

def on_new_day():
    pass

def health_check():
    print("I'm healthy... on the outside.")

def run_jobs():
    while True:
        print("tryna run some jerbs")
        schedule.run_pending()
        time.sleep(1)
        print("I ran some jerbss")
        sys.stdout.flush()

schedule.every().day.at("08:00").do(on_new_day)
schedule.every(5).seconds.do(health_check)

job_thread = threading.Thread(target=run_jobs, daemon=True)
job_thread.start()

if __name__ == "__main__":
    while True:
        pass