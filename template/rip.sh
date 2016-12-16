#!/bin/bash
youtube-dl -i -o "%(upload_date)s/%(title)s-%(id)s.%(ext)s" --embed-thumbnail --add-metadata --sleep-interval=20 --rate-limit=1M --download-archive .archive $(cat url.txt)