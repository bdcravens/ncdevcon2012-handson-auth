<cfcomponent>
	<cffunction name="GetMessages">
		<cfquery name="qryMessages">
			select m.messageId, m.message, m.messageDateTime, u.username
			from messages m
			join users u on u.userId=m.userId
			order by messageDateTime desc
		</cfquery>
		<cfreturn qryMessages>
	</cffunction>

	<cffunction name="SaveMessage">
		<cfargument name="userid">
		<cfargument name="message">
		<cfquery name="saveMessage">
			insert into messages (userid, message, messageDateTime) 
			values (#arguments.userid#, '#arguments.message#',#now()#)
		</cfquery>
		<cfreturn true>
	</cffunction>

</cfcomponent>