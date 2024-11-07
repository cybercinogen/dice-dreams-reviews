# Use a slightly larger base image with more libraries
FROM python:3.8

# Install system dependencies required by some Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose port 5000 for the Flask API
EXPOSE 5000

# Run the start.sh script to initiate both the scheduler and the API
CMD ["./start.sh"]
