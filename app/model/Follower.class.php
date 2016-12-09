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
        //instantiates new database object
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

    //load relationship by the follower id (returns all people being followed by the id passed in)
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

//load relationship by the following id (returns all people following the id passed in)
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

    //removes the follow (unfollows)
      public function removeFollow($following_id, $follower_id){
      $query = sprintf(" DELETE FROM %s WHERE following_id=$following_id AND follower_id=$follower_id; ",
          (string)self::DB_TABLE);
      $db = Db::instance();
      $db->execute($query);
    }

    //adds a follow to the db
    public function addFollow($follower_id, $following_id){
      $query = "INSERT INTO followers VALUES (DEFAULT, '$follower_id', '$following_id', DEFAULT)";
      $db = Db::instance();
      $db->execute($query);
    }

    // returns true if the 2nd param is following the first param
    public function isFollowing($follower_id, $following_id){
      $query = sprintf(" SELECT id FROM %s WHERE follower_id=%d AND following_id=%d ORDER BY date_created DESC ", self::DB_TABLE, $follower_id, $following_id);
      $db = Db::instance();
      $result = $db->lookup($query);
      if(!mysql_num_rows($result))
          return false;
      else {
          return true;
          }
    }
}
