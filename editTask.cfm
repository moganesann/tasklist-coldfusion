<!-- editTask.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>
</head>
<body>

<cfif NOT isDefined("url.taskId")>
    <cflocation url="index.cfm">
</cfif>

<cfquery name="getTasks" datasource="#application.datasource#">
    SELECT * FROM #application.taskTableName#
    WHERE id = #url.taskId#
</cfquery>

<cfif getTasks.status EQ "Completed">
    <cflocation url="index.cfm">
</cfif>

<cfparam name="url.taskId" default="">

<cfif structKeyExists(form, "submit")>
    <!-- Handle Form Submission and Update Database -->
    <cfset taskId = url.taskId>
    <cfset taskTitle = form.taskTitle>
    <cfquery name="updateTask" datasource="#application.datasource#">
        UPDATE #application.taskTableName# 
        SET 
        title =  <cfqueryparam value="#taskTitle#">,
        description =  <cfqueryparam value="#description#">
        WHERE id = <cfqueryparam value="#taskId#">
    </cfquery>
    <cflocation url="index.cfm" addtoken="false">
</cfif>

<!-- Edit Task Form -->
<cfquery name="getTask" datasource="#application.datasource#">
    SELECT * FROM #application.taskTableName# WHERE id = #url.taskId#
</cfquery>

<cfoutput>
<h2>Edit Task</h2>
<form method="post" action="index.cfm?action=edit&taskId=#url.taskId#">
    <label class="center-label" for="taskTitle">Task Title:</label><br>
    <input type="text" id="taskTitle" name="taskTitle" value="#getTask.title#" maxlength="45" style="width: 300px; height: 30px;" required><br><br>
    <label class="center-label" for="taskTitle">Description:</label><br>
    <input type="text" name="description" value="#(getTask.description IS "" ? "-" : getTask.description)#" maxlength="255" style="width: 300px; height: 80px;"><br><br>
    <div class="button-container">
        <input type="submit" name="submit" value="Update Task">
    </div>
</form>
</cfoutput>

</body>
</html>

<script>
    document.getElementById('taskTitle').addEventListener('blur', function() {
        // Trim whitespaces on blur event
        this.value = this.value.trim();
    });
</script>

