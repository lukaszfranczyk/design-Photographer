<?php
class DB {
	private $host, $user, $password, $database, $port, $socket, $conn;

	public function __construct() {
		$this->setDBConnection();
	}

	private function setDBConnection() {
		$json = file_get_contents("config/config.json");
		$d = json_decode ($json, true);
		$this->host = $d['host'];
		$this->user = $d['user'];
		$this->password = $d['password'];
		$this->database = $d['database'];
		$this->port = $d['port'];

	}

	public function connect() {
		$this->conn = mysqli_connect($this->host, $this->user, $this->password, 
									 $this->database, $this->port) 
		or die("Error ".mysqli_error($this->conn));
	}

	public function getConnection() {
		return $this->conn;
	}
}
?>