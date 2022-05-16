FROM debian:11
FROM python:3.10.4-slim-buster

WORKDIR /EmikoRobot/

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install git
RUN python -m pip install -U pip
RUN apt-get install -y wget python-pip curl bash neofetch ffmpeg software-properties-common

COPY requirements.txt .

RUN pip install wheel
RUN pip install --no-cache-dir -U -r requirements.txt

COPY . .
CMD ["python", "-m", "EmikoRobot"]
