# Remedious

Project submitted to RU Hacks 2021: Digital

[Project details](https://devpost.com/software/remedious)

## About

Remedious is a web app for validating remedies for long covid. The app collects data including demographic data (e.g. age/ gender), long covid symptoms, remedies and the severity and frequency of symptoms before and after taking remedies. The app then process and display the data in data visualization dashboard for researchers to do analysis.

The app also includes a discord bot that extracts validated information from reliable sources and presents it in a simple and easy-to-understand manner for the public, and provides information on whether a remedy is backed by science.

## Web app 

**Installation**


  1. Create a new Flutter Project

  2. Make sure you have flutter web enabled (See flutter docs)

  3. Delete the test,lib,web and pubspec.yaml files

  4. Paste all the files from the github front end folder

  5. Run flutter pub get in the project root terminal

  6. And voila, it is set up on your system

**Packages**

google_fonts: ^1.1.1

url_strategy: ^0.2.0

charts_flutter: ^0.10.0

pie_chart: 4.0.1

http: ^0.12.0+2


**API requirements**

aniso8601==9.0.1

click==7.1.2

Flask==1.1.2

Flask-Login==0.5.0

Flask-MySQLdb==0.2.0

Flask-RESTful==0.3.8

Flask-SQLAlchemy==2.5.1

greenlet==1.0.0

itsdangerous==1.1.0

Jinja2==2.11.3

MarkupSafe==1.1.1

mysql-connector-python==8.0.24

mysqlclient==2.0.3

protobuf==3.15.8

python-dotenv==0.17.1

pytz==2021.1

six==1.15.0

SQLAlchemy==1.4.12

Werkzeug==1.0.1


## Discord bot 

Please refer to [this repo](https://github.com/Remedious-RUHacks/remedious-bot)

## Testing

[Web app](http://remedious.tech/)

[Discord bot](https://discord.com/oauth2/authorize?client_id=837881881252724767&permissions=8&scope=bot)
