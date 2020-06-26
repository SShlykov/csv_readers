<?php
  $handle = file('./test.csv');
  $data = [];
  $result = 0;
  foreach($handle as $line){
    $data[] = str_getcsv($line);
  }
  foreach($data as $line){
    $result = $result + $line[0];
  }

  $new_csv = fopen('./test_php.csv', 'w');
  $new_csv_data = array(
    array('result'),
    array($result)
  );

  foreach($new_csv_data as $line){
    fputcsv($new_csv, $line);
  }

  fclose($new_csv);

?>
