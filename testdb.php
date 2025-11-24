<?php
header('Content-Type: text/plain; charset=utf-8');

$host = 'yamabiko.proxy.rlwy.net';
$port = 43656;
$user = 'root';
$pass = 'RvyyjdRVXfXpaiPoKtnqzznNKDWFJnNZ';
$db   = 'railway';

echo "=== Railway DB Connection Test ===\n\n";

$mysqli = @new mysqli($host, $user, $pass, $db, $port);

if ($mysqli->connect_errno) {
    echo "❌ Connection Failed\n";
    echo $mysqli->connect_errno . " - " . $mysqli->connect_error;
} else {
    echo "✅ SUCCESS: Connected to MySQL\n";
}
