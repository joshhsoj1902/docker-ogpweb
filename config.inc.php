<?php
###############################################
# Site configuration
###############################################
$db_host=getenv('MYSQL_IP');
$db_user=getenv('MYSQL_USER');
$db_pass=getenv('MYSQL_PASS');
$db_name=getenv('MYSQL_DBNAME');
$table_prefix=getenv('MYSQL_PREFIX');
$db_type="mysql";
?>

