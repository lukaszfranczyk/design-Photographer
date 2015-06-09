<?php 
	
	require_once 'lib/action/singleton.php';
	require_once 'lib/action/model_handling.php';
	require_once 'lib/action/view_handling.php';

	class ActionAbstract extends Singleton
	{
		public
			$config = NULL,
			$model = NULL,
			$view = NULL;

		public function __construct()
		{
			$this->model = self::getInstance('ModelHandling');
			$this->view = self::getInstance('ViewHandling');
		}

		public function getContext($name="")
		{
			if(empty($name))
				return self::getInstance(get_class());
			else
				return self::getInstance($name);
		}
		
		public function setAction($name) {
			header("Location: {$name}.html");
			exit;
		}
	}

?>