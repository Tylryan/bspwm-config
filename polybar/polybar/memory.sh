#!/usr/bin/bash
free -h | awk 'NR==2 {print $3}'

