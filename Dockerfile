# Pull base image
FROM python:3.10
# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Set work directory
WORKDIR /learn-docker
# Install dependencies
COPY Pipfile Pipfile.lock /learn-docker/
RUN pip install pipenv && pipenv install --system

COPY requirements.txt /learn-docker/requirements.txt
RUN pipenv install -r requirements.txt
# Copy project
COPY . /learn-docker/
