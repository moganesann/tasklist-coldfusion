<!-- taskList.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>

    <!-- Combined CSS links in style.css -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />
</head>
<body>

<cfset username = session.username>

<cfquery name="getUser" datasource="#application.datasource#">
    SELECT * FROM #application.userList#
    WHERE Username = <cfqueryparam value="#username#">
</cfquery>

<cfquery name="getTasks" datasource="#application.datasource#">
    SELECT * FROM #application.taskTableName#
    WHERE userID = <cfqueryparam value="#getUser.id#">
</cfquery>

<cfoutput>
<h2>#session.username#'s Task List</h2>
</cfoutput>

<div class="container">
<table id="myTable">
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Options</th>
        <th>Status</th>
    </tr>
    </thead>
<tbody>
<cfif getTasks.recordCount EQ 0>
        <tr>
            <td>No records found</td>
            <td>No records found</td>
            <td>No records found</td>
            <td>No records found</td>
            <td>No records found</td>
        </tr>
        <p><b>Please enter tasks to display</b></p>
<cfelse>
    <cfset rowNumber = 1>
    <cfoutput query="getTasks">
        <tr>
            <td>#rowNumber#</td>
            <td>#getTasks.title#</td>
            <td>#(getTasks.description IS "" ? "-" : getTasks.description)#</td>
            <!--- <td>
                <a href="index.cfm?action=complete&taskId=#getTasks.id#">Complete</a> |
                <a href="index.cfm?action=edit&taskId=#getTasks.id#">Edit</a> | 
                <a href="index.cfm?action=delete&taskId=#getTasks.id#">Delete</a>
            </td> --->
            <td>
                <cfif getTasks.status NEQ "Completed">
                    <a href="index.cfm?action=complete&taskId=#getTasks.id#">Complete</a> |
                    <a href="index.cfm?action=edit&taskId=#getTasks.id#">Edit</a> | 
                    <a href="index.cfm?action=delete&taskId=#getTasks.id#">Delete</a>
                <cfelse>
                    <a href="index.cfm?action=delete&taskId=#getTasks.id#">Delete</a>
                </cfif>
            </td>
            <td>
                <!--- #(getTasks.completion IS "" ? "Ongoing" : getTasks.completion)# --->
                <cfif getTasks.status EQ "Completed">
                    #getTasks.status#
                <cfelse>
                    Ongoing
                </cfif>
            </td>
        </tr>
        <cfset rowNumber = rowNumber + 1>
    </cfoutput>
</cfif>
</tbody>
</table>
</div>

<!-- JavaScript files -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>

<!-- script to initialize DataTable -->
    <script>
        $(document).ready(function() {
            // Initialize DataTable
            let table = $('#myTable').DataTable();
        });
    </script>

</body>
</html>





