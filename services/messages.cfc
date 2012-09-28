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

</cfcomponent>