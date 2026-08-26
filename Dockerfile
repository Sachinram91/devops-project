# Use a lightweight Python base image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy dependencies file first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Run Flask app with Gunicorn (production-ready WSGI server)
CMD ["gunicorn", "-w", "9", "-b", "0.0.0.0:5000", "app:app"]
