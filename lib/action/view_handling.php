<?php
	
	class ViewHandling extends Singleton
	{
		
		private 
			$prefix_modules = 'view/modules/',
			$prefix_layout = 'view/layout/';
		
		private function prepare_file($file_name, $type)
		{
			if(is_array($file_name) && count($file_name) > 0)
			{
				$file_path = '';
				foreach($file_name as $val)
				{
					switch($type)
					{
						case 'css':
							$file_path .= "<link rel='stylesheet' type='text/css' href='public/css/{$val}' />";
							break;
						case 'vendor':
							$file_path .= "<script src='public/vendor/{$val}'></script>";
							break;
						case 'js':
							$file_path .= "<script src='public/js/{$val}'></script>";
							break;
					}
				}
				return $file_path;
			}
			else
			{
				return "";
			}
		}
		
		public function renderView($view)
		{
			ob_start();
			$meta_title = $view->layout[1];
			$config = [
				'css' => $this->prepare_file($view->css, 'css'),
				'vendor' => $this->prepare_file($view->vendor, 'vendor'),
				'js' => $this->prepare_file($view->js, 'js')
			];
			foreach($view->sections as $key => $val)
			{
				$sections[$key] = $this->prefix_modules.$val[0];
				$data[$key] = $val[1];
			}
			require_once $this->prefix_layout.$view->layout[0];
			ob_flush();
		}
	}