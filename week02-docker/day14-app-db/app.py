import time
import mysql.connector

while True:
    try:
        conn = mysql.connector.connect(
            host="db",
            user="root",
            password="rootpass"
        )
        print("DB connection successful")
        conn.close()
    except Exception as e:
        print("DB connection failed:", e)

    time.sleep(5)

