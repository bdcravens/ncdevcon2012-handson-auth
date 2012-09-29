<cfquery name="addServiceColumnToUsers">
alter table users
add service varchar(255)
</cfquery>
done