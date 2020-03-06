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
<?php passthru("/home/pi/Save/sqlite_wifi.sh"); ?>
</body>
</html>
