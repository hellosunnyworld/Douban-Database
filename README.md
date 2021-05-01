# Douban-Database
File Folder Description:
"data" contains the data and Mysql instructions for Douban Database.
"djangoProject" contains all the content of the website.
"MYSQL-python-1.2.5" is the pymysql package.
"recommend_describ" contains the graphs and the Readme file of recommendation program.
"snapshots" contains snapshots of the website.
"Spider" contains Python Spider codes
"recommendation" contains Apriori algorithm using R language, specific recommendation codes using Python, and rules.

Usage:
You need to have mysql, pymysql, Django installed on your computer.

(A) Install Douban Database using "data" file folder
1.execute initi.sql in Mysql to create tables
2.Change the directory in import_data.sql, and then execute it to load data
3.Notice that "queries.sql" contains sample Mysql queries

(B) Run the website using "djangoProject" file folder
1.Before using it, change database password to yourself's in views.py search.py recommendation.py settings.py
2.Open your mysql
3. Run
Suppose you store this package at D:
Then run the following codes in the terminal:

cd D:\djangoProject
python manage.py runserver

Then go to the website http://127.0.0.1:8000/index/

