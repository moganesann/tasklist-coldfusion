<!-- Application.cfm -->
<cfset application.name = "TaskList">
<cfset application.datasource = "taskproject">

<cfif NOT structKeyExists(application, "initialized")>
    <cfset application.initialized = true>
    
    <!-- Include Settings -->
    <cfinclude template="Settings.cfm">
    
    <!-- Include OnRequestEnd.cfm -->
    <cfinclude template="OnRequestEnd.cfm">
</cfif>


<!-- Session management -->
<cfparam name="session.loggedIn" default="false">
<cfparam name="session.username" default="">
