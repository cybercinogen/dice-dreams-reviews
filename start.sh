#!/bin/bash

# Start the scheduler in the background
echo "Starting scheduler..."
python scheduler.py &

# Start the Flask app using Gunicorn
echo "Starting Flask app..."
gunicorn -b 0.0.0.0:5000 app:app
