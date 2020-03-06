<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>棒グラフ</title>
<style>
h1 {
color: #696969;
}
</style>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
google.load('visualization', '1', {packages:['corechart']});
google.setOnLoadCallback(drawChart);

// データ読み込み

function drawChart() {
var data = google.visualization.arrayToDataTable([
['日付(月単位)', 'A', 'B', 'C'],
<?php
try{
  $dbh=new PDO("sqlite:/home/pi/Save/wifi.db");
  $sql='select * from wifilog limit 20';
  $data = $dbh->query($sql);
  if(!empty($data)) {
    foreach($data as $value) {
echo '[\''.$value["time"].'\', '.$value["rssi1"].', '.$value["freq"].', '.$value["rate"].']';
    }
    echo ",\n";
  }
} catch (PDOException $e) {
  echo $e->getMessage();
  die();
}
$dbh=null;
?>

?>
]);
var options = {
width:900,
height:600,
chartArea: {
top:80,
left:200
},
fontName: 'メイリオ',
backgroundColor:'#EFF4F5',
isStacked: true,
colors: ['#2E8EF6', '#DA3A29', '#8EC43C'],
bar: {groupWidth: 20},
hAxis:{
title:'日付(月単位)',
titleTextStyle: {
fontName: 'メイリオ',
fontSize: 16,
italic: false,
bold: false,
color: '#696969'
},
textStyle: {
fontSize:12,
color: '#696969',
fontName: 'メイリオ'
},
slantedText: true
},
vAxis:{
title: '合計',
titleTextStyle: {
fontName: 'メイリオ',
fontSize: 16,
italic: false,
bold: false,
color: '#696969'
},
textStyle: {
fontSize:12,
color: '#696969',
fontName: 'メイリオ'
}
},
legend:{
position: 'top',
textStyle:{
fontName: 'メイリオ',
color: '#696969',
fontSize: 16
}
}
};
var chart = new google.visualization.ColumnChart(document.getElementById('graph1'));
chart.draw(data, options);
}
</script>
</head>
<body>
<h1>サンプル棒グラフ</h1>
<div id="graph1"></div>
</body>
</html>
