<?php

class Follower extends DbObject {
    // name of database table
    const DB_TABLE = 'followers';

    // database fields
    protected $follower_id;
    protected $following_id;
    protected $date_created;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'follower_id' => null,
            'following_id' => null,
            'date_created' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->follower_id = $args['follower_id'];
        $this->following_id = $args['following_id'];
        $this->date_created = $args['date_created'];
    }

    // save changes to object
    public function save() {
        //instanciates new database object
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'follower_id' => $this->follower_id,
            'following_id' => $this->following_id,
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    public static function loadByFollowerId($id, $limit=null) {
        $query = sprintf(" SELECT id FROM %s WHERE follower_id=%d ORDER BY date_created DESC ", self::DB_TABLE, $id);
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

    public static function loadByFollowingId($id, $limit=null) {
        $query = sprintf(" SELECT id FROM %s WHERE following_id=%d ORDER BY date_created DESC ", self::DB_TABLE, $id);
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
    public function removeFollow($following_id){
      $query = sprintf(" DELETE FROM %s
                          WHERE following_id=$following_id; ",
          (string)self::DB_TABLE
          );
      $db = Db::instance();
      $db->execute($query);
    }

    //add product issues
    public function addFollow($follower_id, $following_id){
      echo $follower_id, "<br>", $following_id, "<br>";
      /**$query = sprintf("INSERT INTO %s (`title`, `description`, `price`, `sizes`, `image_url`)
                         VALUES (%s, %s, %s, %s, %s);",
                         (string)self::DB_TABLE, $title, $desc, $sizes, $price, $img
                       );**/
      $query = "INSERT INTO followers VALUES (DEFAULT, '$follower_id', '$following_id', DEFAULT)";
      $db = Db::instance();
      $db->execute($query);
    }

}
