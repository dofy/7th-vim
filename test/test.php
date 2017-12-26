<?php
/**
 * SevenMVC Lib
 *
 * @Author: Seven Yu <dofyyu@gmail.com>
 * @Version: 2.0.1
 *
 * */

// config
define('DB_HOST', 'YOUR DATABASE HOST'); // default: localhost
define('DB_USER', 'YOUR DATABASE USER');
define('DB_PASS', 'PASSWORD');
define('DB_NAME', 'DATABASE NAME');      // default: test

// project folder
define('USER_CODE_PATH', dirname(__file__) . '/../');

include USER_CODE_PATH . '../src/SevenApplication.php';

// new controller
$app = new SevenApplication();

// run
$app->run();

// code demo
class COMM
{
  static public function gets($key = null, $default = null)
  {
    if($key == null)
    {
      return $_GET;
    }
    else
    {
      if(isset($_GET[$key]))
        return $_GET[$key];
      else
        return $default;
    }
  }
}
?>
