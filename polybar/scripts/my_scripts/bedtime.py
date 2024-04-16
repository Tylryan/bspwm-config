#!/usr/bin/python
from datetime import datetime, date, time

current_hour   = datetime.now().hour
current_minute = datetime.now().minute
bedtime_hour   = 23
bedtime_minute = 0

hours_til_bed   = bedtime_hour - current_hour
minutes_til_bed = bedtime_minute - current_minute

if minutes_til_bed <= 0: 
    minutes_til_bed %= 60
    hours_til_bed-=1

elif minutes_til_bed < 10: minutes_til_bed = f"0{minutes_til_bed}"

if hours_til_bed < 0 : 
    hours_til_bed   = "00"
    minutes_til_bed = "00"
elif hours_til_bed < 10: hours_til_bed = f"0{hours_til_bed}"
elif hours_til_bed == 0: hours_til_bed = "00"

print(f"{hours_til_bed}:{minutes_til_bed}")
