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
	
}