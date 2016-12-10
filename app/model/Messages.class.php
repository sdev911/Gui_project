<?php

class Messages extends DbObject {
  // name of database table
  const DB_TABLE = 'messages';

  // database fields
  protected $id;
  protected $sender_id;
  protected $receiver_id;
  protected $sender_user;
  protected $receiver_user;
  protected $message;
  protected $date_created;

  // constructor
  public function __construct($args = array()) {
    $defaultArgs = array(
      'id' => null,
      'sender_id' => null,
      'receiver_id' => null,
      'sender_user' => null,
      'receiver_user' => null,
      'message' => null,
      'date_created' => null
    );

    $args += $defaultArgs;

    $this->id = $args['id'];
    $this->sender_id = $args['sender_id'];
    $this->receiver_id = $args['receiver_id'];
    $this->sender_user = $args['sender_user'];
    $this->receiver_user = $args['receiver_user'];
    $this->message = $args['message'];
    $this->date_created = $args['date_created'];
  }

  // save changes to object
  public function save() {
    $db = Db::instance();
    $db_properties = array(
      'sender_id' => $this->sender_id,
      'receiver_id' => $this->receiver_id,
      'sender_user' => $this->sender_user,
      'receiver_user' => $this->receiver_user,
      'message' => $this->message,
    );
    $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
  }

  // Get the messages between two users
  public static function getMessages($idOfSender, $userOfReceiver) {
    $idOfReceiver = User::loadByUsername($userOfReceiver)->('id'); // Get idOfReceiver
    echo $idOfReceiver;
    $query = sprintf(" SELECT id FROM messages WHERE (receiver_id=%d AND sender_id=%d)
      OR (receiver_id=%d AND sender_id=%d) ORDER BY date_created DESC",
      $idOfReceiver, $idOfSender, $idOfSender, $idOfReceiver);
    $db = Db::instance();
    $result = $db->lookup($query);
    echo $result;
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

  // Send message
  public static function addMessage($idOfSender, $userOfReceiver, $text) {
    $idOfReceiver = User::loadByUsername($userOfReceiver)->('id'); // Get idOfReceiver
    $userOfSender = User::loadById($idOfSender)->get('username'); // Get userOfSender
    $query = "INSERT INTO messages VALUES (DEFAULT, '$idOfSender', '$idOfReceiver', '$userOfSender', '$userOfReceiver','$text', DEFAULT)";
    $db = Db::instance();
    $db->execute($query);
  }

  // Load object by ID. Not needed in current implementation of site
  public static function loadById($id) {
    $db = Db::instance();
    $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
    return $obj;
  }
}
