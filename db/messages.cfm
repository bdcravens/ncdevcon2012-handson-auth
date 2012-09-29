<!--- <cfquery name="dropMessagesTable">
DROP TABLE messages
</cfquery>
message table dropped


<cfabort> --->

<cfquery name="createMessageTable">
CREATE TABLE messages(messageId IDENTITY PRIMARY KEY, message VARCHAR(140),
						userId int, messageDateTime DATETIME)
</cfquery>


<cfquery name="createFirstMessage">
insert into messages (message,userId,messageDateTime)
values ('Hello world!',1,'2012-08-15 13:24:56')
</cfquery> 

<cfquery name="createSecondMessage">
insert into messages (message,userId,messageDateTime)
values ('I second that motion',2,'2012-09-23 03:45:17')
</cfquery> 

<cfquery name="createThirdMessage">
insert into messages (message,userId,messageDateTime)
values ('I''m at NCDevCon!',1,now())
</cfquery> 

<cfquery name="showMessages">
select *
from messages
</cfquery>

<cfdump var="#showMessages#">