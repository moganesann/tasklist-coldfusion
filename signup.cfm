<!-- signup.cfm -->
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
<cfif structKeyExists(form, "signupSubmit")>
    <!-- Handle Signup Form Submission -->
    <cfset newUsername = form.username>
    <cfset newPassword = form.password>

    <cfquery name="checkUsername" datasource="#application.datasource#">
        SELECT * FROM #application.userList# WHERE username = <cfqueryparam value="#newUsername#">
    </cfquery>

    <cfif checkUsername.recordCount EQ 0>
        <!-- Username is not taken, proceed with signup -->
        <cfquery name="insertUser" datasource="#application.datasource#">
            INSERT INTO #application.userList# (username, password) VALUES (
                <cfqueryparam value="#newUsername#">,
                <cfqueryparam value="#hash(newPassword)#">
            )
        </cfquery>
        <cfset session.loggedIn = true>
        <cfset session.username = newUsername>
        <cflocation url="index.cfm" addtoken="false">
    <cfelse>
        <!-- Username is taken, show error -->
        <cfset signupError = true>
    </cfif>
</cfif>

<h2>Task List Manager</h2>
<h2>Sign Up</h2>
<cfif structKeyExists(variables, "signupError")>
    <p class="center-p-red">Username is already taken. Please choose another username.</p>
</cfif>
<form method="post" action="signup.cfm">
    <label class="center-label" for="username">Username:</label><br>
    <input id= "username" type="text" name="username" maxlength="45" style="width: 300px; height: 20px;" required>
    <br><br>
    <label class="center-label" for="password">Password:</label><br>
    <input id= "password" type="password" name="password" maxlength="45" style="width: 300px; height: 20px;" required>
    <br><br>
    <div class="button-container">
        <input type="submit" name="signupSubmit" value="Sign Up">
    </div>
</form>

<!-- Link to Login Page -->
<p class="center-p" >Already have an account? <a href="login.cfm">Login</a></p>

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
