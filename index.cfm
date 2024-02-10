<!-- index.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>
</head>
<body>
<cfparam name="url.action" default="">
<cfset action = lcase(trim(url.action))>
<cfinclude template="header.cfm">

<cfswitch expression="#action#">
    <cfcase value="add">
        <!-- Add Task Form -->
        <cfinclude template="addTask.cfm">
    </cfcase>
    <cfcase value="complete">
        <!-- Complete Task-->
        <!--- <script>
            alert("Good Job! The task is completed.");
        </script> --->
        <cfset taskId = url.taskId>
        <cfquery name="completeTask" datasource="#application.datasource#">
        UPDATE #application.taskTableName# 
        SET 
        status =  <cfqueryparam value="Completed">
        WHERE id = <cfqueryparam value="#taskId#">
        </cfquery>
        <script>
            alert("Good Job! The task is completed.");
            // Redirect to the index.cfm page after the alert
            window.location.href = "index.cfm";
        </script>
    </cfcase>
    <cfcase value="edit">
        <!-- Edit Task Form -->
        <cfinclude template="editTask.cfm">
    </cfcase>
    <cfcase value="delete">
        <!-- Delete Task Form -->
        <cfinclude template="deleteTask.cfm">
    </cfcase>
    <cfdefaultcase>
        <!-- Display Task List -->
        <cfinclude template="taskList.cfm">
    </cfdefaultcase>
</cfswitch>

</body>
</html>