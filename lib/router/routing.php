<?php
require_once 'router.php';
require_once 'lib/action/controller_handling.php';
require_once 'lib/auth/auth.php';
class Routing extends Router {
	
	public function __construct() {
		parent::__construct ();
		$this->traverse_path ();
	}
	/**
	 * method check that action required to be logged. 
	 * if not call action controller. 
	 * if yes check if user is sign in and if has acces level for that action
	 */
	private function traverse_path() {
		if ($this->_action !== NULL) {
			if ($this->_action->onlyLogged) {
				$auth_result = new Auth ( $this->_action->accessLevel );
				if (is_array ( $auth_result->getStatus () )) {
					// return error info -> redirect todo
					echo $auth_result->getStatus ()['error_code'];
				} else {
					// return db connection
					var_dump ( $auth_result->getStatus () );
				}
			} else {
				$this->call_controller ( $this->_action );
			}
		} else {
			//header ( "HTTP/1.0 404 Not Found" );
			header ( "Location: index.html" );
			exit();
		}
	}
	
	private function call_controller($action) {
		$ctrl_handler = new ControllerHandling ( $action );
	}
}

?>