<!-- logout.cfm -->
<cfset session.loggedIn = false>
<cfset session.username = "">

<cflocation url="login.cfm" addtoken="false">
