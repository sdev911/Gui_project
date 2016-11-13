<?php

class Comment extends DbObject {
    // name of database table
    const DB_TABLE = 'comments';

    // database fields
    protected $id;
    protected $product_id;
    protected $comment;
    protected $creator_id;
    protected $creator_username;
    protected $date_created;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'product_id' => null,
            'comment' => '',
            'creator_id' => null,
            'creator_username' => '',
            'date_created' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->product_id = $args['product_id'];
        $this->comment = $args['comment'];
        $this->creator_id = $args['creator_id'];
        $this->creator_username = $args['creator_username'];
        $this->date_created = $args['date_created'];
    }

    // save changes to object
    public function save() {
        //instanciates new database object
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'product_id' => $this->product_id,
            'comment' => $this->comment,
            'creator_id' => $this->creator_id,
            'creator_username' => $this->creator_username,
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    public static function loadByProductId($pid, $limit=null) {
        $query = sprintf(" SELECT id FROM %s WHERE product_id=%d ORDER BY date_created DESC ", self::DB_TABLE, $pid);
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

    // load all products
    public static function getAllComments($limit=null) {
        $query = sprintf(" SELECT id FROM %s ORDER BY date_created DESC ",
            self::DB_TABLE
            );
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

    //remove product
    public function removeComment($id){
      $query = sprintf(" DELETE FROM %s
                          WHERE id=$id; ",
          (string)self::DB_TABLE
          );
      $db = Db::instance();
      $db->execute($query);
    }

    //add product issues
    public function addComment($product_id, $comment, $creator_id, $creator_username){
      echo $product_id, "<br>", $comment, "<br>", $creator_id, "<br>", $creator_username, "<br>";
      /**$query = sprintf("INSERT INTO %s (`title`, `description`, `price`, `sizes`, `image_url`)
                         VALUES (%s, %s, %s, %s, %s);",
                         (string)self::DB_TABLE, $title, $desc, $sizes, $price, $img
                       );**/
      $query = "INSERT INTO product VALUES (DEFAULT, '$product_id', '$comment', '$creator_id', '$creator_username', DEFAULT)";
      $db = Db::instance();
      $db->execute($query);
    }

}
