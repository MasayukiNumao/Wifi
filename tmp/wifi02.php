<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Wifi output from sqlite3!</h1>
<?php
try{
  $dbh=new PDO("sqlite:/home/pi/Save/wifi.db");
  $sql='select count(*) from wifilog';
  $data = $dbh->query($sql);
  if(!empty($data)) {
    foreach($data as $value) {
      var_dump($value);
    }
  }
} catch (PDOException $e) {
  echo $e->getMessage();
  die();
}
$dbh=null;
?>
</body>
</html>
