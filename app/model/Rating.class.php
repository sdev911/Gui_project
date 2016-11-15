<?php

class Rating extends DbObject {
  const DB_TABLE = 'ratings';

  protected $id;
  protected $product_id;
  protected $rating;
  protected $creator_id;
  protected $creator_username;
  protected $date_created;

  public function __construct($args = array()) {
    $defaultArgs = array(
      'id' => null,
      'product_id' => null,
      'rating' => null,
      'creator_id' => null,
      'creator_username' => null,
      'date_created' => null
    );

    $args += $defaultArgs;

    $this->id = $args['id'];
    $this->product_id = $args['product_id'];
    $this->rating = $args['rating'];
    $this->creator_id = $args['creator_id'];
    $this->creator_username = $args['creator_username'];
    $this->date_created = $args['date_created'];
    }

    public function save() {
      $db = Db::instance();

      $db_properties = array(
        'product_id' => $this->product_id,
        'rating' => $this->rating,
        'creator_id' => $this->creator_id,
        'creator_username' => $this->creator_username
      );

      $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // Returns a numeric rating
    public static function ratingByUserId($uid, $pid) {
      $query = sprintf("SELECT rating from %s WHERE product_id={$pid} AND creator_id={$uid}",
          self::DB_TABLE);
      $db = Db::instance();
      $result = $db->lookup($query);
      if(!mysql_num_rows($result)) {
        return 0;
      }
      else {
        foreach($result as $num) {
          return $num->get('rating');
        }
      }
    }

    // Returns the average of the ratings
    public static function ratingByProductId($id) {
      $query = sprintf("SELECT rating FROM %s WHERE product_id={$id}",
          self::DB_TABLE);
      $db = Db::instance();
      $result = $db->lookup($query);
      $counter = 0;
      $average = 0;
      foreach ($result as $num) {
        $average += $num->get('rating');
        $counter++;
      }
      return $average/$counter;
    }

    // Adds a rating
    public function addRating($uid, $pid, $rating) {
        $this->removeRating($uid, $pid);
        $query = sprintf("INSERT INTO %s VALUES (DEFAULT, '{$pid}', '{$rating}', '{$uid}', DEFAULT)",
            self::DB_TABLE);
        $db = Db::instance();
        $db->execute($query);
    }

    // First checks if the user has already given a rating for the product
    public function removeRating($uid, $pid) {
      $query = sprintf("DELETE FROM %s WHERE product_id={$pid} AND creator_id={$uid};",
          self::DB_TABLE);
      $db = Db::instance();
      $db->execute($query);
    }
}
