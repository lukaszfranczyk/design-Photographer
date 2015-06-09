<?php

	require_once 'lib/action/action_abstract.php';

	class ControllerHandling {
		
		public function __construct($action)
		{
			$context = ActionAbstract::getContext();
			$context->config = $action;
			$ctrl_path = 'controller/'.$action->name.'.php';
			require_once $ctrl_path;
			$class_name = $action->name.'Controller';
			$ctrl_handle = new $class_name();
			$ctrl_handle->initialize($context);
			/*do handlera dolozyc model i widok*/
		}
	}