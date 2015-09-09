<?php
if (isset ($_REQUEST['json'])) {
$decoded = json_decode($_REQUEST['json'], true);
print_r($decoded);

  // $decoded = json_decode  (stripslashes($_REQUEST['json']), TRUE);
  if (is_null  ($decoded)) {
    $response['status'] = array  (
      'type' => 'error',
      'value' => 'Invalid JSON value found',
    );
    $response['request'] = $_REQUEST['json'];
  }
  else {
    $response['status'] = array  (
      'type' => 'message',
      'value' => 'Valid JSON value found',
    );
    //Send the original message back.
    $response['request'] = $decoded;
  }
}
else {
  $response['status'] = array  (
    'type' => 'error',
    'value' => 'No JSON value set',
  );
}
$encoded = json_encode  ($response);
header  ('Content-type: application/json');
exit  ($encoded);

//http ://example.com/json.php?json={"a":1,"b":2,"c":3,"d":4,"e":5} 

//http://eosrei.net/articles/2011/12/basic-json-requestresponse-php
