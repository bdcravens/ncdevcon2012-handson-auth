component {
	
	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	public void function default( rc ) {
		
		variables.fw.service( 'messages.GetMessages', 'messages' );
	}
	
}