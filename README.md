# Cancer Data Management System
We like to build a management system could enable researchers to query the cancer information. There are 11 tables in this system now and we assume the users understand how to operate the MySQL. We currently finish the CRUD (Create, Read, Update, and Delete) actions for these tables in JSP. 

### Usage
Step 1: Dump the data of create table statements into your MySQL database server via createTables.sql file.

Step 2: Copy all the folders and index.jsp to your web server.

Setp 3: Modify the connection string to your MySQL database in the Connections/Conns.jsp file. Please pay attention to the string variables IP, databaseName, USERNAME, and PASSWORD.

Step 4: Be sure you have the MySQL JDBC driver your the web server path. Run your web server and execute the index.jsp.

Step 5: Click the Users link and then input your user information.