<?php

	require_once "lib/db/db.php";

	class ModelHandling
	{
		public $_db;
		
		public function __construct()
		{
			$this->_db = new DB();
			$this->_db->connect();
		}
		
		public function addModel($modelName) 
		{
			$model_path = 'model/'.$modelName.'.php';
			require_once $model_path;
			$modelClass = ucfirst($modelName);
			return new $modelClass($this->_db);
		}

		public function execute()
		{
			
		}
	}
