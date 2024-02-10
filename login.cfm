<!-- login.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>
</head>
<body>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet"><link rel="stylesheet" href="style.css">
<cfif structKeyExists(form, "loginSubmit")>
    <!-- Handle Login Form Submission -->
    <cfset enteredUsername = form.username>
    <cfset enteredPassword = form.password>

    <cfquery name="getUser" datasource="#application.datasource#">
        SELECT * FROM #application.userList#
        WHERE username = <cfqueryparam value="#enteredUsername#" >
        AND Password = <cfqueryparam value="#Hash(enteredPassword)#" >
    </cfquery>

    <cfif getUser.recordCount EQ 1 >
        <!-- Successful login -->
        <cfset session.loggedIn = true>
        <cfset session.username = getUser.username>
        <cflocation url="index.cfm" addtoken="false">
    <cfelse>
        <!-- Failed login -->
        <cfset loginError = true>
    </cfif>
</cfif>

<h2>Task List Manager</h2>
<h2>Login</h2>
<cfif structKeyExists(variables, "loginError")>
    <p class="center-p-red">Invalid username or password. Please try again.</p>
</cfif>
<form method="post" action="login.cfm">
    <label class="center-label" for="username">Username:</label><br>
    <input id= "username" type="text" name="username" maxlength="45" style="width: 300px; height: 20px;" required>
    <br><br>
    <label class="center-label" for="password">Password:</label><br>
    <input id= "password" type="password" name="password" maxlength="45" style="width: 300px; height: 20px;" required>
    <br><br>
    <div class="button-container">
        <input type="submit" name="loginSubmit" value="Login">
    </div>
</form>

<!-- Link to Signup Page -->
<p class="center-p" >Don't have an account? <a href="signup.cfm">Sign Up</a></p>

</body>
</html>


<script>
    document.getElementById('username').addEventListener('blur', function() {
        // Trim whitespaces on blur event
        this.value = this.value.trim();
    });
    document.getElementById('password').addEventListener('blur', function() {
        // Trim whitespaces on blur event
        this.value = this.value.trim();
    });
</script>

