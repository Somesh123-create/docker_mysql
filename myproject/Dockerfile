# Use a base image
FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Copy the application code
COPY . /app/


# Create a virtual environment
RUN python3 -m venv /opt/venv


# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*


# Install dependencies and make the entrypoint script executable
RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install -r requirements.txt


# Copy wait-for-it script and make it executable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Copy the migrate.sh script and make it executable
COPY migrate.sh /app/migrate.sh
RUN chmod +x /app/migrate.sh

CMD ["/app/entrypoint.sh"]
