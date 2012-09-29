Logged in as: <cfoutput>#rc.username#</cfoutput>

<h1>Post a message</h1>

<div class="hero-unit">
	<cfoutput>
	<form class="form-horizontal" method="post" action="#buildUrl('messages.post')#">
	</cfoutput>
	  <div class="control-group">
	    <label class="control-label" for="username">Message</label>
	    <div class="controls">
	      <textarea cols="60" rows="3" name="message"></textarea>
	    </div>
	  </div>
	  
	  <div class="control-group">
	  <div class="controls">
		  <button type="submit" class="btn btn-primary">Login</button>
	  </div>
	  </div>

	</form>

</div>