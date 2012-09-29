component {
	
	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}

	public void function login(rc) {
		// placeholder
	}
	
	public void function authenticate( rc ) {
		
		variables.fw.service( 'security.authenticate', 'authResult' );
		variables.fw.service('security.GetOriginalRC','returnList');
	}

	public void function endAuthenticate(rc) {
		session.userId = rc.authResult;
		variables.fw.redirect(rc.originalAction,rc.returnList);


	}

	public void function verify(rc) {
		 if (!session.userId) {
		 	rc.originalAction=fw.getSectionAndItem();
		 	variables.fw.redirect('security.login','all');
		 }
	}

	public void function logout(rc) {
		variables.fw.service('security.logout','logoutResult');
	}
	public void function endLogout(rc) {
		variables.fw.redirect('');
	}



	public any function twitter(rc) {

		session.objMonkehTweet = new com.coldfumonkeh.monkehTweet(
				consumerKey = 'dnvduBRau5MUWO2JNhWlCg',
				consumerSecret = 'n5SIl14qO15Vz7ZAaeZ3WxeVxhNpZiCZnn7bznNwvM',
				parseResults = true
			);	
		auth = session.objMonkehTweet.getAuthorisation(callBackURL="http://auth.dev:8888#variables.fw.buildUrl('security.dologintwitter')#");
		if (auth.success) {
			session.authDetails.token = auth.token;
			session.authDetails.token_secret = auth.token_secret;
			session.authDetails.authURL = auth.authURL;
			location(auth.authURL);
		}

	}



	public any function dologintwitter(rc) {
		
		accessToken = session.objMonkehTweet.getAccessToken(
				requestToken = session.authDetails.token,
				requestSecret = session.authDetails.token_secret,
				verifier = rc.oauth_verifier
			);
		

		session.token = accessToken.token;
		session.token_secret = accessToken.token_secret; 
		

		userDetails = session.objMonkehTweet.getUserDetails(
				user_id = accessToken.user_id,
				format="json"
			);
		session.img = userDetails.profile_image_url;
		session.username = userDetails.name;
		variables.fw.service('security.getTwitterUser','loginResult',{username=userDetails.name});
	}

	public void function endDoLoginTwitter(rc) {
		variables.fw.redirect('');
	}
	
}