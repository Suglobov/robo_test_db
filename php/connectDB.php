<?php
/**
 * Created by PhpStorm.
 * User: suglobov
 * Date: 28.09.18
 * Time: 11:32
 */
$host = '127.0.0.1';
$port = '3306';
$db = 'home';
$user = 'home';
//$user = 'root';
$pass = 'home';
//$pass = '';
$charset = 'utf8';

//$dsn = "mysql:host=$host;port=$port;dbname=$db;charset=$charset";
$dsn = "mysql:host=$host;port=$port;dbname=$db";
$opt = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $opt);
} catch (PDOException $e) {
    die('Подключение не удалось: ' . $e->getMessage());
}

return $pdo;
