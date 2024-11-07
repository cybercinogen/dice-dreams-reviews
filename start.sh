#!/bin/bash

# Start the scheduler in the background
echo "Starting scheduler..."
python scheduler.py &

# Start the Flask app using Gunicorn with a 120-second timeout
echo "Starting Flask app with Gunicorn..."
gunicorn --timeout 120 -b 0.0.0.0:$PORT app:app
