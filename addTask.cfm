<!-- addTask.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>
</head>
<body>

<cfif structKeyExists(form, "submit")>
    <!-- Handle Form Submission and Insert into Database -->
    <cfset taskTitle = form.taskTitle>
    <cfset description = form.description>
    <cfset username = session.username>

    <cfquery name="getUser" datasource="#application.datasource#">
        SELECT * FROM #application.userList#
        WHERE Username = <cfqueryparam value="#username#">
    </cfquery>

    <cfquery name="insertTask" datasource="#application.datasource#">
        INSERT INTO #application.taskTableName# (title, description, userID) 
        VALUES (
            <cfqueryparam value="#taskTitle#">,
            <cfqueryparam value="#description#">,
            <cfqueryparam value="#getUser.id#">
            )
    </cfquery>
    <cflocation url="index.cfm" addtoken="false">
</cfif>

<!-- Add Task Form -->
<h2>Add Task</h2>
<form method="post" action="index.cfm?action=add">
    <label class="center-label" for="taskTitle">Task Title:</label><br>
    <input type="text" id="taskTitle" name="taskTitle" maxlength="45" style="width: 300px; height: 30px;" required><br><br>
    <label class="center-label" for="taskTitle">Description:</label><br>
    <input type="text" name="description" maxlength="255" style="width: 300px; height: 80px;"><br><br>
    <div class="button-container">
        <input type="submit" name="submit" value="Add Task">
    </div>
</form>

</body>
</html>

<script>
    document.getElementById('taskTitle').addEventListener('blur', function() {
        // Trim whitespaces on blur event
        this.value = this.value.trim();
    });
</script>