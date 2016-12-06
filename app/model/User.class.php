<?php

class User extends DbObject {
    // name of database table
    const DB_TABLE = 'user';

    // database fields
    protected $id;
    protected $username;
    protected $password;
    protected $first_name;
    protected $last_name;
    protected $email;
    protected $user_type;
    protected $bio;
    protected $gender;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'username' => '',
            'password' => '',
            'email' => null,
            'first_name' => null,
            'last_name' => null,
            'user_type' => null,
            'creation_date' => null,
            '$bio' => null,
            '$gender' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->username = $args['username'];
        $this->password = $args['password'];
        $this->email = $args['email'];
        $this->first_name = $args['first_name'];
        $this->last_name = $args['last_name'];
        $this->user_type = $args['user_type'];
        $this->bio = $args['bio'];
        $this->creation_date = $args['creation_date'];
        $this->gender = $args['gender'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'username' => $this->username,
            'password' => $this->password,
            'email' => $this->email,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'user_type' => $this->user_type,
            'bio' => $this->bio,
            'creation_date' => $this->creation_date,
            'gender' => $this->gender
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load user by username
    public static function loadByUsername($username=null) {
        if($username === null)
            return null;

        $query = sprintf(" SELECT id FROM %s WHERE username = '%s' ",
            self::DB_TABLE,
            $username
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $row = mysql_fetch_assoc($result);
            $obj = self::loadById($row['id']);
            return ($obj);
        }
    }

    public static function getAllUsers($limit=null) {
        $query = sprintf(" SELECT id FROM %s ORDER BY creation_date DESC ",
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

    public function addUser($username, $password, $first_name, $last_name, $email){
      echo $username,"<br>", $password, "<br>",$first_name, "<br>",$last_name, "<br>",$email, "<br>";
      /**$query = sprintf("INSERT INTO %s (`title`, `description`, `price`, `sizes`, `image_url`)
                         VALUES (%s, %s, %s, %s, %s);",
                         (string)self::DB_TABLE, $title, $desc, $sizes, $price, $img
                       );**/
      $query = "INSERT INTO user VALUES (DEFAULT, '$first_name', '$last_name', '$username', '$password', '$email', 0, DEFAULT, DEFAULT, DEFAULT)";
      $db = Db::instance();
      $db->execute($query);
    
    
}
