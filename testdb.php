<?php
header('Content-Type: text/plain; charset=utf-8');

$host = 'yamabiko.proxy.rlwy.net';
$port = 43656;
$user = 'root';
$pass = 'RvyyjdRVXfXpaiPoKtnqzznNKDWFJnNZ';
$db   = 'railway';

echo "=== MantisBT Railway DB Connection Test ===\n\n";
echo "Host: $host\n";
echo "Port: $port\n";
echo "User: $user\n";
echo "Database: $db\n\n";

echo "Connecting...\n\n";

$mysqli = @new mysqli($host, $user, $pass, $db, $port);

if ($mysqli->connect_errno) {
    echo "❌ CONNECTION FAILED\n";
    echo "Error code: " . $mysqli->connect_errno . "\n";
    echo "Message: " . $mysqli->connect_error . "\n";
} else {
    echo "✅ SUCCESS! Connected to MySQL.\n";
}
