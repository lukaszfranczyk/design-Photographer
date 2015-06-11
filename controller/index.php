<?php 

  require_once "controller/frames_content_controller.php";

	class IndexController
	{
		public function initialize($context)
    {
      $framesContentController = new FramesContentController();
      $framesContentController->getData();

			$context->view->renderView($context->config->view);
		}
	}

?>
