<?php

class Rating extends DbObject {
  // name of database table
  const DB_TABLE = 'ratings';

  // database fields
  protected $id;
  protected $product_id;
  protected $rating;
  protected $creator_id;
  protected $date_created;

  // constructor
  public function __construct($args = array()) {
    $defaultArgs = array(
      'id' => null,
      'product_id' => null,
      'rating' => null,
      'creator_id' => null,
      'date_created' => null
    );

    $args += $defaultArgs;

    $this->id = $args['id'];
    $this->product_id = $args['product_id'];
    $this->rating = $args['rating'];
    $this->creator_id = $args['creator_id'];
    $this->date_created = $args['date_created'];
    }

 // loads object by id
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // save changes to object
    public function save() {
      $db = Db::instance(); //instantiates new database object
      $db_properties = array( // omit id and any timestamps
        'product_id' => $this->product_id,
        'rating' => $this->rating,
        'creator_id' => $this->creator_id
      );
      $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // Returns a rating id for a particular user and product
    public static function ratingByUserId($uid, $pid) {
      $query = sprintf("SELECT * from %s WHERE product_id={$pid} AND creator_id={$uid}",
          self::DB_TABLE);
      $db = Db::instance();
      $result = $db->lookup($query);
      if(!mysql_num_rows($result))
          return null;
      else {
        $row = mysql_fetch_assoc($result);
        return $row['id'];
          }
      }

    // Returns the average of the ratings for a particular product
    public static function ratingByProductId($id) {
      $query = sprintf("SELECT * FROM %s WHERE product_id={$id}",
          self::DB_TABLE);
      $db = Db::instance();
      $result = $db->lookup($query);
      if(!mysql_num_rows($result))
          return 0; // returns 0 if no ratings
      else {
          $counter = 0;
          $average = 0;
          while($row = mysql_fetch_assoc($result)) {
              $average = $average + self::loadById($row['id'])->get('rating'); // adds all ratings
              $counter++;
          }
          return round($average/$counter, 2); // returns the average round
      }
    }

    // Adds a rating to the database
    public function addRating($uid, $pid, $rating) {
        $query = sprintf("INSERT INTO %s VALUES (DEFAULT, '{$pid}', '{$rating}', '{$uid}', DEFAULT)",
            self::DB_TABLE);
        $db = Db::instance();
        $db->execute($query);
    }

    // removes a user rating for a particular product
    public function removeRating($uid, $pid) {
      $query = sprintf("DELETE FROM %s WHERE product_id={$pid} AND creator_id={$uid};",
          self::DB_TABLE);
      $db = Db::instance();
      $db->execute($query);
    }
}
