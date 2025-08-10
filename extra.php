<!-- FILE: contact.php -->
<?php
// contact.php - minimal safe contact handler
// Save this file to a PHP-enabled server. It will append messages to messages.csv

function safe_post($key){
    return isset($_POST[$key]) ? trim(strip_tags($_POST[$key])) : '';
}

$name = safe_post('name');
$email = safe_post('email');
$message = safe_post('message');

if(!$name || !$email || !$message){
    http_response_code(400);
    echo 'Missing fields';
    exit;
}

// Basic validation
if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
    http_response_code(400);
    echo 'Invalid email';
    exit;
}

// Append to CSV (ensure directory is writable)
$line = [date('c'), $name, $email, str_replace(["\r","\n"],' ',$message)];
$fp = fopen(__DIR__ . '/messages.csv', 'a');
if($fp){
    fputcsv($fp, $line);
    fclose($fp);
    // optionally send an email if server supports mail()
    // mail('your-email@example.com','Portfolio contact: '.$name, $message, "From: $email\r\n");
    echo 'OK';
    header('Location: ' . (isset($_SERVER['HTTP_REFERER'])?$_SERVER['HTTP_REFERER']:'#') . '?sent=1');
    exit;
}

http_response_code(500);
echo 'Failed to save message';
exit;
?>
<!-- FILE: script.js -->
document.addEventListener('DOMContentLoaded', function() {