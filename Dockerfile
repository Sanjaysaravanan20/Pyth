# Use Python 3.9 base image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy all files
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Expose Flask app port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
