<?php

class Product extends DbObject {
    // name of database table
    const DB_TABLE = 'product';

    // database fields
    protected $id;
    protected $title;
    protected $description;
    protected $price;
    protected $sizes;
    protected $image_url;
    protected $creator_id;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'title' => '',
            'description' => null,
            'price' => 0,
            'sizes' => '',
            'image_url' => null,
            'creator_id' => 0,
            'creation_date' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->title = $args['title'];
        $this->description = $args['description'];
        $this->price = $args['price'];
        $this->sizes = $args['sizes'];
        $this->image_url = $args['image_url'];
        $this->creator_id = $args['creator_id'];
        $this->creation_date = $args['creation_date'];
    }

    // save changes to object
    public function save() {
        //instantiates new database object
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'title' => $this->title,
            'description' => $this->description,
            'price' => $this->price,
            'sizes' => $this->sizes,
            'image_url' => $this->image_url,
            'creator_id' => $this->creator_id
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // Returns the last id created
    public function getId() {
      $id = mysql_insert_id();
      return $id;
    }

    // load all products
    public static function getAllProducts($limit=null) {
        $query = sprintf(" SELECT id FROM %s ORDER BY creation_date DESC ", self::DB_TABLE);
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

// gets 3 most recently added products
    public static function getMostRecent($limit=null) {
        $query = sprintf(" SELECT id FROM %s ORDER BY creation_date DESC ", self::DB_TABLE);
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $objects = array();
	          $count = 0;
            while($row = mysql_fetch_assoc($result) && $count < 3) { //stops after 3 items
                $objects[] = self::loadById($row['id']);
		              $count++;
            }
            return ($recentobjects);
        }
    }

    //remove product
    public function removeProduct($id){
      $query = sprintf(" DELETE FROM %s WHERE id=$id; ", (string)self::DB_TABLE);
      $db = Db::instance();
      $db->execute($query);
    }

    //add product to db
    public function addProduct($title, $desc, $sizes, $price, $img){
      $query = "INSERT INTO product VALUES (DEFAULT, '$title', '$desc', '$sizes', '$price', '$img', DEFAULT, DEFAULT)";
      $db = Db::instance();
      $db->execute($query);
    }
}
