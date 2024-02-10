<!-- deleteTask.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>
</head>
<body>

<cfif NOT isDefined("url.taskId") >
    <cflocation url="index.cfm">
</cfif>

<cfparam name="url.taskId" default="">

<cfif structKeyExists(form, "delete")>
    <!-- Handle Form Submission and Delete Task from Database -->
    <cfset taskId = url.taskId>
    <cfquery name="deleteTask" datasource="#application.datasource#">
        DELETE FROM #application.taskTableName#  
        WHERE id = <cfqueryparam value="#taskId#">
    </cfquery>
    <cflocation url="index.cfm" addtoken="false">
<cfelseif structKeyExists(form, "cancel") >
    <cflocation url="index.cfm?taskList.cfm" addtoken="false">
</cfif>

<!-- Delete Task Form -->
<cfquery name="getTask" datasource="#application.datasource#">
    SELECT * FROM #application.taskTableName# WHERE id = <cfqueryparam value="#url.taskId#">
</cfquery>

<cfoutput>
<form method="post" action="index.cfm?action=delete&taskId=#url.taskId#">
    <h2>Are you sure you want to delete this task?</h2>
    <!--- <label for="taskTitle">Task Title:</label>
    <input type="text" name="taskTitle" value="#getTask.title#" readonly><br>
    <label for="taskTitle">Description:</label>
    <input type="text" name="description" value="#(getTask.description IS "" ? "-" : getTask.description)#" readonly><br><br> --->
    <label class="center-label" for="taskTitle">Task Title:</label><br>
    <input type="text" name="taskTitle" value="#getTask.title#" maxlength="45" style="width: 300px; height: 30px;" readonly><br><br>
    <label class="center-label" for="taskTitle">Description:</label><br>
    <input type="text" name="description" value="#(getTask.description IS "" ? "-" : getTask.description)#" maxlength="255" style="width: 300px; height: 80px;" readonly><br><br>
    <div class="button-container">
        <input type="submit" name="delete" value="Delete">
        <input type="submit" name="cancel" value="Cancel">
    </div>
</form>
</cfoutput>

</body>
</html>