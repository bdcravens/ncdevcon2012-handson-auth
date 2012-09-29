<h1>Please Login</h1>

<div class="hero-unit">
	<form class="form-horizontal" method="post" action="index.cfm?action=security.authenticate">
	  <div class="control-group">
	    <label class="control-label" for="username">Username</label>
	    <div class="controls">
	      <input type="text" id="username" name="username" placeholder="username">
	    </div>
	  </div>
	  <div class="control-group">
	    <label class="control-label" for="inputPassword">Password</label>
	    <div class="controls">
	      <input type="password" id="inputPassword" name="password" placeholder="password">
	    </div>
	  </div>
	  <div class="control-group">
	  <div class="controls">
		  <button type="submit" class="btn btn-primary">Login</button>
	  </div>
	  </div>

	  <cfloop collection="#rc#" item="key">
	  	<cfif not listFindNoCase("action,fw1pk",key)>
	  		<cfoutput><input type="hidden" name="#key#" value="#rc[key]#"></cfoutput>
	  	</cfif>
	  </cfloop>

	</form>

	<p>
		<cfoutput>
		<a href='#buildUrl('security.twitter')#' class="btn btn-info btn-large">Twitter</a>
		</cfoutput>
	</p>

</div>
