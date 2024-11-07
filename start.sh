#!/bin/bash

# Start the scheduler in the background
echo "Starting scheduler..."
python scheduler.py &

# Start the Flask app in the foreground
echo "Starting Flask app..."
python app.py
