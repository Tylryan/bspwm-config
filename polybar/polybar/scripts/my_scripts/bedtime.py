#!/usr/bin/python
from datetime import datetime, date, time

bedtime_hour   = 23
bedtime_minute = 0


def main(bedtime_hour, bedtime_minute):
    current_hour   = datetime.now().hour
    current_minute = datetime.now().minute

    hours_til_bed   = bedtime_hour - current_hour
    minutes_til_bed = bedtime_minute - current_minute
    print("MTB: ", minutes_til_bed)
    print("HTB: ", hours_til_bed)

    if minutes_til_bed < 10: 
        minutes_til_bed = f"0{minutes_til_bed}"
    if minutes_til_bed < 0 and hours_til_bed <= 0: 
        minutes_til_bed = "00"

    if   hours_til_bed < 10: hours_til_bed = f"0{hours_til_bed}"
    elif hours_til_bed < 0 : hours_til_bed = "00"
    elif hours_til_bed == 0: hours_til_bed = "00"

    print(f"{hours_til_bed}:{minutes_til_bed}")



main(bedtime_hour, bedtime_minute)
