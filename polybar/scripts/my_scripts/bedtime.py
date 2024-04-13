#!/usr/bin/python
from datetime import datetime, date, time

current_hour = datetime.now().hour
current_minute = datetime.now().minute
bedtime = 23

hours_til_bed = bedtime - current_hour
minutes_til_bed = 60 - current_minute

if hours_til_bed < 0:
    print("00:00")
else:
    print(f"{hours_til_bed}:{minutes_til_bed}")
