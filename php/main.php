<?php
/**
 * Created by PhpStorm.
 * User: suglobov
 * Date: 28.09.18
 * Time: 11:39
 */
$pdo = require_once 'connectDB.php';
require_once '../vendor/autoload.php';

$faker = Faker\Factory::create();

$testDataUsers = function ($write = true) use ($pdo, $faker) {
    $testData = [];
    $testData_maxLength = 50;
    for ($i = 0; $i < $testData_maxLength; $i++) {
        $rd = $faker->dateTimeThisYear();
        $lvd = $faker->dateTimeBetween($rd);
        $tmp = [
            'login'             => $faker->name,
            //            'password'          => password_hash($faker->text, PASSWORD_DEFAULT),
            'password'          => $faker->text,
            'registration_date' => $rd->format("Y-m-d H:i:s"),
            'last_visit_date'   => $lvd->format("Y-m-d H:i:s"),
            'experience'        => $faker->numberBetween(0, 314286147123290000),
            'rating_ball'       => $faker->numberBetween(0, 1000),
        ];
        $testData[] = $tmp;
    }
//    echo print_r($testData, 1) . PHP_EOL;
    if (!$write) {
        return;
    }
    $sql = 'INSERT INTO `users` (login, password, registration_date, last_visit_date, rating_ball, experience)
            VALUE (:login, :password, :registration_date, :last_visit_date, :rating_ball, :experience)';
    $stm = $pdo->prepare($sql);
    foreach ($testData as $k => $v) {
//        echo print_r($v, 1) . PHP_EOL;
        $stm->execute($v);
    }
};
$testDataUsersLevels = function () use ($pdo, $faker) {
    $testData = [];
    $testData_maxLength = 100;
    $testData[] = ['level' => 1, 'experience' => 0];
    $tmpExp = 100;
    for ($i = 2; $i <= $testData_maxLength; $i++) {
        $tmp = [
            'level'      => $i,
            'experience' => $tmpExp,
        ];
        $tmpExp = round($tmpExp * 0.5) + $tmpExp;
        $testData[] = $tmp;
    }
    //    foreach ($testData as $k => $v) {
    //        echo $v['level'] . ': ' . print_r($v['experience'], 1) . PHP_EOL;
    //    }
    $sql = 'INSERT INTO `users_levels` (level, experience)
                VALUE (:level, :experience)';
    $stm = $pdo->prepare($sql);
    foreach ($testData as $k => $v) {
        $stm->execute($v);
    }
};
$testDataCharacters = function () use ($pdo, $faker) {
    $testData = [];
    $testData_maxLength = 15;
    for ($i = 0; $i < $testData_maxLength; $i++) {
        $tmp = [
            'name'           => $faker->name,
            'fk_first_line'  => 1,
            'fk_second_line' => $faker->numberBetween(2, 4),
        ];
        $testData[] = $tmp;
    }
    //    echo print_r($testData, 1) . PHP_EOL;
    $sql = 'INSERT INTO `characters` (name, fk_first_line, fk_second_line)
                VALUE (:name, :fk_first_line, :fk_second_line)';
    $stm = $pdo->prepare($sql);
    foreach ($testData as $k => $v) {
        echo print_r($v, 1) . PHP_EOL;
        $stm->execute($v);
    }
};
$testDataCharactersLevels = function () use ($pdo, $faker) {
    $testData = [];
    $testData_maxLength = 30;
    $testData[] = ['level' => 1, 'experience' => 0];
    $tmpExp = 500;
    for ($i = 2; $i <= $testData_maxLength; $i++) {
        $tmp = [
            'level'      => $i,
            'experience' => $tmpExp,
        ];
        $tmpExp = round($tmpExp * 0.5) + $tmpExp;
        $testData[] = $tmp;
    }
    foreach ($testData as $k => $v) {
        echo $v['level'] . ': ' . print_r($v['experience'], 1) . PHP_EOL;
    }
    $sql = 'INSERT INTO `characters_levels` (level, experience)
                    VALUE (:level, :experience)';
    $stm = $pdo->prepare($sql);
    foreach ($testData as $k => $v) {
        $stm->execute($v);
    }
};


//$testDataUsers();
//$testDataUsersLevels();
//$testDataCharactersLevels();
//$testDataCharacters();
