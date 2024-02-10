# A simple task list manager using Coldfusion-HTML-Javascript-CSS-MySQL

CRUD method applied, can view the entire task list by sorting the complete and incomplete tasks, and utilized login and sign up features for enhanced accessibility. 

This code's database dump in the DB folder (taskproject)


# Step-by-Step to setup this code

1. Extract/Unzip the entire folder in `C:\lucee\tomcat\webapps`. 

2. Make sure upload the database dump in Lucee server. 

3. Go here: `http://127.0.0.1:8888/lucee/admin/server.cfm` to set up DB in Lucee. Then, click `Datasource` under `Services`.
     
4. Enter the datasource Name (make sure it is the same as your database name in code, in this case `taskproject`). Choose `MySQL` as the `Type`.
    
5. For starters, just use all the default datasource settings. The only things you need to enter are the database Username (`root`) and Password (whatever you set up during your MySQL installation).
    
6. The datasource should be added and the `Check` column should be `OK`.

7. Now, you able to run the code, go to `http://localhost:8888/tasklist-coldfusion/index.cfm` (For `tasklist-coldfusion`, check the folder name that you unzip/extract in `C:\lucee\tomcat\webapps`)
