<?php 

	class IndexController
	{
		public function initialize($context)
		{
			$context->view->renderView($context->config->view);
		}
	}

?>