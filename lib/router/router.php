<?php

	class Router
	{
		public
			$_action = NULL; 
	
		protected function get_action_name($uri)
		{
			$pattern = '/\/([a-zA-Z0-9]*).html$/';
			$match = array();
			$u = preg_replace("/\?.*/", "", $uri);
			preg_match($pattern, $u, $match);

			if(!empty($match[1]))
			{
				$this->parse_action($match[1]);
			}
		}
		
		private function parse_action($action_name)
		{
			$filename = "actions/".$action_name.".html.json";
			$action_def = @file_get_contents($filename);
			if($action_def !== NULL)
			{
				$this->_action = json_decode($action_def);
			}
		}
		
		public function __construct()
		{
			$this->get_action_name($_SERVER['REQUEST_URI']);
		}
	}

?>