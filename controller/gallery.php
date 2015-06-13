<?php 
    
    require_once 'lib/action/model_handling.php';

	class GalleryController
	{
	  public function getData()
	  {
	  }
	  
	  
		public function initialize(ActionAbstract $context)
        {
          if (!isset($_POST['action']))
            return;
          
  	     $modelHandler = new ModelHandling();
  	  
  	     if (!$this->_galleryModel)
  	       $this->_galleryModel = $modelHandler->addModel("GalleryModel");
  	     
          switch ($_POST['action'])
          {
            case 'getThumbs': $this->getThumbs(); break;
            case 'getImageById': $this->getImageById(); break;
          }
    	}
    	
    	private function getThumbs()
    	{
          header('Content-Type: application/json');
    	  echo json_encode($this->_galleryModel->getImages());
    	}
    	
    	private function getImageById()
    	{
          if (!isset($_POST['imgId']))
            return;
    	  
    	  echo
        	'{' .
        	   '"id" : 1' .
        	   '"src" : "view/layout/img/img.png"' .
        	   '"name" : "Imydz 1"' .
        	   '"album" : "Dummy album"' .
        	'}';
    	}
    	
    	private $_galleryModel = NULL;
	}

?>
