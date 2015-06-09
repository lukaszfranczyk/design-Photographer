<?php

	abstract class Singleton 
	{
		protected function __construct()
		{
			
		}
		
		protected function __wakeup() {
			
		}
		
		final public function getInstance($class_name, $params=NULL)
		{
			static $instances = array();
			if(!isset($instances[$class_name]))
			{
				if($params !== NULL)
					$instances[$class_name] = new $class_name($params);
				else
					$instances[$class_name] = new $class_name();
			}
			return $instances[$class_name];
		}
	
		final private function __clone()
		{
			
		}
	}