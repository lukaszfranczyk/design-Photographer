<?php
require_once 'lib/router/routing.php';
require_once 'lib/db/db.php';
require_once 'lib/router/router.php';
class Auth {
	private $conn;
	private $acces_level;
	public $status;
	public function __construct($level) {
		session_start ();
		$this->connect ();
		$this->acces_level = $level;
		$this->mock ();
		$this->status = $this->authenticate ();
	}
	public function authenticate() {
		if ($_SESSION ['logged'] == 1) {
			if (isset ( $_SESSION ['login'] ) && isset ( $_SESSION ['password'] ) && isset ( $_SESSION ['level'] )) {
				$l = $this->checkUser ( $_SESSION ['login'], $_SESSION ['password'] );
				if ($this->acces_level <= $l) {
					return $this->conn;
				} else {
					echo'FFFFFFFFF';
					return array (
							"msg" => "ACCESS_DENIED",
							"error_code" => 0 
					);
				}
			} else {
				echo 'in';
				session_destroy ();
				return array (
						"msg" => "IS_NOT_LOGGED",
						"error_code" => - 1 
				);
			}
		} else {
			echo 'ininini';
			session_destroy ();
			return array (
					"msg" => "IS_NOT_LOGGED",
					"error_code" => - 2 
			);
		}
	}
	public function authorize() {
	}
	public function getStatus() {
		return $this->status;
	}
	private function mock() {
		$_SESSION ['logged'] = 1;
		$_SESSION ['login'] = 'franek';
		$_SESSION ['password'] = 'abc321';
		$_SESSION ['level'] = 1;
	}
	private function connect() {
		$db = new DB ();
		$db->connect ();
		$this->conn = $db->getConnection ();
	}
	private function checkUser($login, $password) {
		$l = mysqli_real_escape_string ( $this->conn, $login );
		$p = mysqli_real_escape_string ( $this->conn, $password );
		$query = "select * from users where login=\"{$l}\" and password=\"{$p}\";";
		$res = mysqli_query ( $this->conn, $query );
		while ( $row = mysqli_fetch_assoc ( $res ) ) {
			echo $row ['accesLevel'];
			return $row ['accesLevel'];
		}
	}
}

?>