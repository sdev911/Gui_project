<?php

class Actions extends DbObject {
  // name of database table
  const DB_TABLE = 'actions';

  // database fields
  protected $id;
  protected $target_id;
  protected $action;
  protected $description;
  protected $creator_id;
  protected $creator_username;
  protected $date_created;
  protected $url_mod;
  protected $target_name;

  // constructor
  public function __construct($args = array()) {
    $defaultArgs = array(
      'id' => null,
      'action' => null,
      'url_mod' => null,
      'description' => null,
      'target_id' => null,
      'target_name' => null,
      'creator_id' => null,
      'creator_username' => null,
      'date_created' => null
    );

    $args += $defaultArgs;

    $this->id = $args['id'];
    $this->action = $args['action'];
    $this->url_mod = $args['url_mod'];
    $this->description = $args['description'];
    $this->target_id = $args['target_id'];
    $this->target_name = $args['target_name'];
    $this->creator_id = $args['creator_id'];
    $this->creator_username = $args['creator_username'];
    $this->date_created = $args['date_created'];
  }

  // save changes to object
  public function save() {
    $db = Db::instance();
    $db_properties = array(
      'action' => $this->action,
      'url_mod' => $this->url_mod,
      'description' => $this->description,
      'target_id' => $this->target_id,
      'target_name' => $this->target_name,
      'creator_id' => $this->creator_id,
      'creator_username' => $this->creator_username
    );
    $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
  }

  // Load object by ID. Not needed in current implementation of site
  public static function loadById($id) {
    $db = Db::instance();
    $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
    return $obj;
  }

 //get 10 most recent actions by id (for profile pages)
  public static function getUserActions($id) {
    $query = sprintf(" SELECT id FROM %s WHERE creator_id=".$id." ORDER BY date_created DESC", self::DB_TABLE);
    $db = Db::instance();
    $result = $db->lookup($query);
    if(!mysql_num_rows($result))
        return null;
    else {
        $objects = array();
        $counter = 0; //instantiate counter
        while($row = mysql_fetch_assoc($result)) {
            $objects[] = self::loadById($row['id']);
            $counter++; // increment counter
            if ($counter > 9) { //return first 10 objects
              return ($objects);
            }
        }
        return ($objects);
    }
  }

  // Load all actions
  public static function getAllActions($limit=null) {
    $query = sprintf(" SELECT id FROM %s ORDER BY date_created DESC ",self::DB_TABLE);
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

// get 10 most recent actions belonging to a particular product (for itemdetailview feeds)
  public static function getProductActions($id) {
    $name = Product::loadById($id)->get('title'); //load product
    $query = sprintf("SELECT id FROM %s WHERE target_name=".'"'.$name.'"'." ORDER BY date_created DESC",
        self::DB_TABLE); //get all items that refer to changes to that product
    $db = Db::instance();
    $result = $db->lookup($query);
    if(!mysql_num_rows($result))
        return null;
    else {
        $objects = array(); //create an array
        $counter = 0; // initialize counter to 0
        while($row = mysql_fetch_assoc($result)) {
            $objects[] = self::loadById($row['id']);
            $counter++; //increment counter
            if ($counter > 9) {
              return ($objects); //return 10 objects
            }
        }
        return ($objects);
    }
  }

// get 10 most recent actions that one user follows
  public static function getActionsFollowed($id) {
    // Create array of ids
    $followed = Follower::loadByFollowerId($id); // load the users followed
    if ($followed == NULL) return null;
    $ids = '';
    $counter = 0;
    foreach ($followed as $num) {
      if ($counter != 0) $ids = $ids.',';
      $counter++;
      $ids = $ids.$num->get('following_id');
    }
    $ids = $ids.','.$id;
    // Only return correct actions.
    $query = sprintf(" SELECT id FROM %s WHERE creator_id IN ({$ids}) ORDER BY date_created DESC ", self::DB_TABLE);
    $db = Db::instance();
    $result = $db->lookup($query);
    if(!mysql_num_rows($result))
        return null;
    else {
        $objects = array();
        $counter = 0;
        while($row = mysql_fetch_assoc($result)) {
            $objects[] = self::loadById($row['id']);
            $counter++;
            if ($counter > 9) {
              return ($objects); // return 10 most recent items
            }
        }
        return ($objects);
    }
  }

  //add action to db
  public function addAction($url_mod, $target_id, $target_name, $action, $description, $creator_id, $creator_username){
    $query = "INSERT INTO actions VALUES (DEFAULT, '$action', '$url_mod', '$description', '$target_id','$target_name','$creator_id', '$creator_username', DEFAULT)";
    $db = Db::instance();
    $db->execute($query);
  }
}
