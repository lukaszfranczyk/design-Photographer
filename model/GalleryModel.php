<?php

  require_once 'data_model/image_data.php';
  require_once "lib/db/db.php";

  class GalleryModel
  {
    public function __construct(DB $db)
    {
      $this->_db = $db;
    }

    public function getImages()
    {
      $query = "SELECT * FROM v_gallery_images;";
      
      $queryResult = $this->_db->getConnection()->query($query);
      if ($queryResult)
      {
        $result = array();
        while ($row = $queryResult->fetch_assoc())
        {
          $entry = new ImageData();
          $entry->idImg = $row['id_img'];
          $entry->name = $row['name'];
          $entry->src = $row['src'];
          $entry->albumName = $row['album_name'];
          $entry->userAdded = $row['user_added'];
          
          array_push($result, $entry);
        }
        
        return $result;
      }
      
      return NULL;
    }

    private $_db = NULL;
  }
?>
