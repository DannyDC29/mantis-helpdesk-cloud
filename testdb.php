<?php
// testdb.php - prueba de conexión a MySQL (intenta interno y público)
// Coloca este archivo en la raíz del proyecto (se copiará a /var/www/html).

header('Content-Type: text/plain; charset=utf-8');

function try_conn($host, $port, $user, $pass, $db) {
    $result = [
        'host' => $host,
        'port' => $port,
        'user' => $user,
        'db' => $db,
        'success' => false,
        'error' => null,
        'errno' => null,
    ];

    // Intentamos con mysqli y timeout
    $timeout = 5;
    ini_set('default_socket_timeout', $timeout);

    // Build host:port for mysqli_connect
    $host_port = $host . ':' . $port;

    // Intento de conexión
    $conn = @mysqli_init();
    if (!$conn) {
        $result['error'] = "mysqli_init failed";
        return $result;
    }
    mysqli_options($conn, MYSQLI_OPT_CONNECT_TIMEOUT, $timeout);

    if (@mysqli_real_connect($conn, $host, (int)$port, $user, $pass, $db)) {
        $result['success'] = true;
        $result['server_info'] = mysqli_get_server_info($conn);
        mysqli_close($conn);
    } else {
        $result['errno'] = mysqli_connect_errno();
        $result['error'] = mysqli_connect_error();
    }
    return $result;
}

// Valores desde variables de entorno si están definidas
$env = function($k, $d=null){ $v = getenv($k); return ($v === false) ? $d : $v; };

// Valores que uses en Railway — ajusta si quieres
$internal_host = $env('MYSQLHOST', $env('DB_HOST', 'mysql.railway.internal'));
$internal_port = $env('MYSQLPORT', $env('DB_PORT', '3306'));

$public_url = $env('MYSQL_PUBLIC_URL', '');
$public_host = '';
$public_port = '';
if ($public_url) {
    // parse mysql://user:pass@host:port/db
    $u = parse_url($public_url);
    if ($u !== false) {
        $public_host = isset($u['host']) ? $u['host'] : '';
        $public_port = isset($u['port']) ? $u['port'] : '';
    }
}
if ($public_host === '') {
    $public_host = $env('PUBLIC_MYSQL_HOST', 'yamabiko.proxy.rlwy.net');
    $public_port = $public_port ?: $env('PUBLIC_MYSQL_PORT', '43656');
}

// credenciales
$user = $env('MYSQLUSER', $env('DB_USER', 'root'));
$pass = $env('MYSQLPASSWORD', $env('DB_PASSWORD', ''));
$db   = $env('MYSQLDATABASE', $env('DB_NAME', 'railway'));

// Mostramos variables (no la contraseña completa por seguridad)
echo "ENV values read in the container (blank = not set):\n";
echo "MYSQLHOST = " . ($internal_host?:'<empty>') . "\n";
echo "MYSQLPORT = " . ($internal_port?:'<empty>') . "\n";
echo "MYSQL_PUBLIC_URL = " . ($public_url?:'<empty>') . "\n";
echo "Derived PUBLIC_HOST = " . ($public_host?:'<empty>') . "\n";
echo "Derived PUBLIC_PORT = " . ($public_port?:'<empty>') . "\n";
echo "MYSQLUSER = " . ($user?:'<empty>') . "\n";
echo "MYSQLDATABASE = " . ($db?:'<empty>') . "\n\n";

echo "Attempting connections (timeout 5s)...\n\n";

// 1) intento con host interno
$r1 = try_conn($internal_host, $internal_port, $user, $pass, $db);
echo "INTERNAL HOST ATTEMPT:\n";
print_r($r1);
echo "\n\n";

// 2) intento con host público
$r2 = try_conn($public_host, $public_port, $user, $pass, $db);
echo "PUBLIC HOST ATTEMPT:\n";
print_r($r2);
echo "\n\n";

// 3) intento con explicit ip resolution check (gethostbyname)
echo "DNS resolution checks:\n";
echo "gethostbyname(internal) => " . @gethostbyname($internal_host) . "\n";
echo "gethostbyname(public) => " . @gethostbyname($public_host) . "\n";
echo "\nDone.\n";
