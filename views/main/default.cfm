<cfoutput query="rc.messages">
	<p class="lead">
		#username# - <small>#dateFormat(messageDateTime, 'long')#</small>
	</p>
	<p>
		#message#
	</p>
	<hr />
</cfoutput>



