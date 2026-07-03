# Use an official lightweight Python base image
FROM python:latest

# Set the working directory inside the container
WORKDIR /app

# Copy dependency files first to leverage Docker layer caching
COPY requirements.txt .

# Install dependencies without storing local cache files
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 5000

# Execute production-ready web server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
