<cfquery name="dropUsersTable">
DROP TABLE users
</cfquery>
users table dropped




<cfquery name="createUsersTable">
CREATE TABLE users(userId IDENTITY PRIMARY KEY, username VARCHAR(255),
						password VARCHAR(255))
</cfquery>


<cfquery name="createFirstUser">
insert into users (username,password)
values ('user1','#hash('password1')#')
</cfquery> 

<cfquery name="createFirstUser">
insert into users (username,password)
values ('user2','#hash('password2')#')
</cfquery> 

<!--- <cfquery name="showUsers">
delete from users
</cfquery> --->

done.
