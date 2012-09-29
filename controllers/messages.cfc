component {
	
	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	public void function new( rc ) {
		
		variables.fw.service( 'security.GetUsername', 'username' );
	}
	
	public void function post(rc) {
		variables.fw.service('messages.SaveMessage', 'saveResult', {userid=session.userid});
	}
	public void function endPost(rc) {
		variables.fw.redirect('');
	}
}