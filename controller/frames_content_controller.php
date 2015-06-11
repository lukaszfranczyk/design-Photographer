<?php

  require_once "lib/action/model_handling.php";

  class FramesContentController
  {
    public function getData()
    {
      $modelHandler = new ModelHandling();

      if (!$this->_framesContentModel)
        $this->_framesContentModel = $modelHandler->addModel("FramesContent");

      $this->_framesContentModel->getData();
    }

    private $_framesContentModel = NULL;

  }

?>
