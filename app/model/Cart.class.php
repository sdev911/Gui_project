<?php

class Cart extends DbObject {
    // name of database table
    const DB_TABLE = 'cart';

    // database fields
    protected $id;
    protected $title;
    protected $price;
    protected $image_url;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'title' => '',
            'price' => 0,
            'image_url' => null,
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->title = $args['title'];
        $this->price = $args['price'];
        $this->image_url = $args['image_url'];
    }

    // save changes to object
    public function save() {
        //instanciates new database object
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'title' => $this->title,
            'price' => $this->price,
            'image_url' => $this->image_url,
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load all products
    public static function getAllProducts($limit=null) {
        $query = sprintf(" SELECT id FROM %s ORDER BY id DESC ", self::DB_TABLE);
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $objects = array();
            while($row = mysql_fetch_assoc($result)) {
                $objects[] = self::loadById($row['id']);
            }
            return ($objects);
        }
    }

    //remove products from cart
    public function removeProduct($id, $uid){
      $query = sprintf(" DELETE FROM %s WHERE id=$id AND creator_id=$uid; ",
          (string)self::DB_TABLE);
      $db = Db::instance();
      $db->execute($query);
    }

    //add product to cart
    public function addProduct($title, $price, $img, $uid){
      $query = "INSERT INTO cart VALUES (DEFAULT, '$uid', '$title', '$img', '$price')";
      $db = Db::instance();
      $db->execute($query);
    }

    //get the items by the user who added them
    public function getProductsByUser($id) {
      $query = sprintf(" SELECT id FROM %s WHERE creator_id={$id} ORDER BY id DESC ",
          self::DB_TABLE);
      $db = Db::instance();
      $result = $db->lookup($query);
      if(!mysql_num_rows($result))
          return null;
      else {
          $objects = array();
          while($row = mysql_fetch_assoc($result)) {
              $objects[] = self::loadById($row['id']);
          }
          return ($objects);
      }
    }
}
