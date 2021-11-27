<?php
// If request method is post, then get passcode and put it in a file named passcode.txt
// then redirect to main html page
if ($_SERVER['REQUEST_METHOD'] == 'POST'){
    $passcode = $_POST['passcode'];
    $file = fopen('passcode.txt', 'w');
    fwrite($file, $passcode);
    header('Location: ./index.html');
}
header('Location: ./index.html');