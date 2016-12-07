<?php

define("INCLUDES", "includes/");
define("MODULES", "modules/");

define("CONFIG_FILE","includes/config.inc.php");

function checkConnection()
{
// Create connection
$conn = new mysqli($db_host, $db_user, $db_pass);

// Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
      return FALSE
  } 
  echo "Connected successfully";
  return TRUE


  // Select 1 from table_name will return false if the table does not exist.
  $val = mysql_query('select 1 from `table_name` LIMIT 1');

  if($val !== FALSE)
  {
     //DO SOMETHING! IT EXISTS!
  }
  else
  {
      //I can't find it...
  }

}
?>
