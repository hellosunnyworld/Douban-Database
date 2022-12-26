# Douban-Database
This project is completed by Lin Muhan, Liu Quan, Shu Xin, Zhang Yanglin together. It constructed a Douban Database, including data of movies, books and users. There are around 2 million pieces of data in this Mysql Database. We have over 30 data analysis results, as well as a recommendation function.

## File Folder Description:

* "data" contains the data and Mysql instructions for Douban Database.   
* "djangoProject" contains all the content of the website.    
* "MYSQL-python-1.2.5" is the pymysql package.   
* "recommend_describ" contains the graphs and the Readme file of recommendation program.   
* "snapshots" contains snapshots of the website.   
* "Spider" contains Python Spider codes   
* "recommendation" contains Apriori algorithm using R language, specific recommendation codes using Python, and rules.   

## Usage:

You need to have mysql, pymysql, Django installed on your computer.   

(A) Install Douban Database using "data" file folder       
* execute initi.sql in Mysql to create tables
* Change the directory in import_data.sql, and then execute it to load data
* Notice that "queries.sql" contains sample Mysql queries

(B) Run the website using "djangoProject" file folder    
* Before using it, change database password to yourself's in views.py search.py recommendation.py settings.py
* Open your mysql
* Run    
Suppose you store this package at D:    
Then run the following codes in the terminal:    

> cd D:\djangoProject     
> python manage.py runserver

Then go to the website http://127.0.0.1:8000/index/

