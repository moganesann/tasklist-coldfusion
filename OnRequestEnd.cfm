<!-- OnRequestEnd.cfm -->
<cfif NOT structKeyExists(session, "loggedIn") OR NOT session.loggedIn>
    <!-- Redirect to login page for secured pages -->
    <cfif NOT findNoCase("login.cfm", cgi.script_name) AND NOT findNoCase("signup.cfm", cgi.script_name)>
        <cflocation url="login.cfm" addtoken="false">
    </cfif>
</cfif>

<cfheader name="Cache-Control" value="no-store, no-cache, must-revalidate">
<cfheader name="Pragma" value="no-cache">
<cfheader name="Expires" value="0">



