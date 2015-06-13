<?php

  require_once "lib/db/db.php";

  class FramesContentModel
  {
    public function __construct(DB $db)
    {
      $this->_db = $db;
    }

    public function getData()
    {
      echo "getting data...\n";
    }

    private $_db = NULL;
  }
?>
