<cfcomponent>

	<cffunction name="authenticate">
		
		<cfargument name="username">
		<cfargument name="password">

		<cfset var locals.userid = 0>

		<cfquery name="qryAuth">
			select userId, username, password
			from users
			where username='#arguments.username#'
		</cfquery>

		<cfif qryAuth.recordCount>
			<cfif qryAuth.password eq hash(arguments.password)>
				<cfset locals.userid = qryAuth.userId>
			</cfif>
		</cfif>

		<cfreturn locals.userid>

	</cffunction>


	<cffunction name="GetOriginalRC">
		<cfset var blackList = "username,password,originalAction,action,fw1pk">
		<cfset var returnList =  "">
		<cfloop collection="#arguments#" item="key">
			<cfif not listFindNoCase(blackList,key)>
				<cfset returnList = listAppend(returnList,key)>
			</cfif>
		</cfloop>
		<cfreturn returnList>
	</cffunction>


	<cffunction name="GetUsername">
		<cfquery name="qryUsername">
			select username from users where userid=#session.userid#
		</cfquery>
		<cfreturn qryUsername.username>
	</cffunction>

	<cffunction name="Logout">
		<cfset session.userid=0>
		<cfreturn true>
	</cffunction>

</cfcomponent>