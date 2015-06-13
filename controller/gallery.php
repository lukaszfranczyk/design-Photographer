<?php 

  require_once "controller/frames_content_controller.php";

	class GalleryController
	{
		public function initialize(ActionAbstract $context)
        {
//           $framesContentController = new FramesContentController();
//           $framesContentController->getData();
    
     			//$context->view->renderView($context->config->view);
          if (!isset($_POST['action']))
            return;

          switch ($_POST['action'])
          {
            case 'getThumbs': $this->getThumbs(); break;
            case 'getImageById': $this->getImageById(); break;
          }
    	}
    	
    	private function getThumbs()
    	{
    	  echo
        	  '{' .
        	     '{"imgId" : 1, "src" : "view/layout/img/thumb1.png"}' .
        	     '{"imgId" : 2, "src" : "view/layout/img/thumb2.png"}' .
        	     '{"imgId" : 3, "src" : "view/layout/img/thumb3.png"}' .
        	     '{"imgId" : 4, "src" : "view/layout/img/thumb4.png"}' .
        	  '}';
    	}
    	
    	private function getImageById()
    	{
          if (!isset($_POST['imgId']))
            return;
    	  
    	  echo
        	'{' .
        	   '"id" : 1' .
        	   '"path" : "view/layout/img/img.png"' .
        	   '"name" : "Imydz 1"' .
        	   '"album" : "Dummy album"' .
        	'}';
    	}
	}

?>
