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
            //            'rating_ball'       => $faker->numberBetween(0, 1000),
        ];
        $testData[] = $tmp;
    }
    //    echo print_r($testData, 1) . PHP_EOL;
    if (!$write) {
        return;
    }
    $sql = 'INSERT INTO `users` (login, password, registration_date, last_visit_date, experience)
            VALUE (:login, :password, :registration_date, :last_visit_date, :experience)';
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
$testDataRating = function () use ($pdo, $faker) {
    $testData = [];
    $testData_maxLength = 5000;
    for ($i = 0; $i <= $testData_maxLength; $i++) {
        $tmp = [
            'fk_user'       => $faker->numberBetween(1, 50),
            'ball'          => $faker->numberBetween(10, 100),
            'ball_datetime' => $faker->dateTimeThisYear()->format("Y-m-d H:i:s"),
            'fk_message'    => 1,
        ];
        $testData[] = $tmp;
    }
    //    echo print_r($testData, 1) . PHP_EOL;
    $sql = 'INSERT INTO `ratings_balls` (fk_user, ball, ball_datetime, fk_message)
                    VALUE (:fk_user, :ball, :ball_datetime, :fk_message)';
    $stm = $pdo->prepare($sql);
    foreach ($testData as $k => $v) {
        $stm->execute($v);
    }
};
$testDataUserChar = function () use ($pdo, $faker) {
    $testData = [];
    $testData_maxLength = 100;
    for ($i = 0; $i <= $testData_maxLength; $i++) {
        $tmp = [
            'fk_user'      => $faker->numberBetween(1, 50),
            'fk_character' => $faker->numberBetween(1, 15),
        ];
        $testData[] = $tmp;
    }
    echo print_r($testData, 1) . PHP_EOL;
    $sql = 'INSERT INTO `users_has_characters` (fk_user, fk_character)
                        VALUE (:fk_user, :fk_character)';
    $stm = $pdo->prepare($sql);
    foreach ($testData as $k => $v) {
        $stm->execute($v);
    }
};
$testDataMatches = function () use ($pdo, $faker) {
    $testData = [];
    $testData_maxLength = 10000;
    for ($i = 0; $i < $testData_maxLength; $i++) {
        $dStart = $faker->dateTimeThisYear()->format("Y-m-d H:i:s");
        $dFinish = $faker->dateTimeInInterval($dStart, '+30 minutes')->format("Y-m-d H:i:s");
        $tmp = [
            'fk_status'              => $faker->numberBetween(1, 2),
            'datetime_start'         => $dStart,
            'datetime_finish'        => $dFinish,
            'fk_team_1_us_has_cha_1' => $faker->randomElement([29, 66]),
            'fk_team_1_us_has_cha_2' => $faker->randomElement([25]),
            'fk_team_1_us_has_cha_3' => $faker->randomElement([8, 35, 83]),
            'fk_team_2_us_has_cha_1' => $faker->randomElement([63, 75]),
            'fk_team_2_us_has_cha_2' => $faker->randomElement([64, 73]),
            'fk_team_2_us_has_cha_3' => $faker->randomElement([89]),

        ];
        $testData[] = $tmp;
    }
    //    echo print_r($testData, 1) . PHP_EOL;
    $sql = 'INSERT INTO `matches` (
              fk_status,
              datetime_start,
              datetime_finish,
              fk_team_1_us_has_cha_1,
              fk_team_1_us_has_cha_2,
              fk_team_1_us_has_cha_3,
              fk_team_2_us_has_cha_1,
              fk_team_2_us_has_cha_2,
              fk_team_2_us_has_cha_3
            )
            VALUE (
              :fk_status,
              :datetime_start,
              :datetime_finish,
              :fk_team_1_us_has_cha_1,
              :fk_team_1_us_has_cha_2,
              :fk_team_1_us_has_cha_3,
              :fk_team_2_us_has_cha_1,
              :fk_team_2_us_has_cha_2,
              :fk_team_2_us_has_cha_3
            )';
    $stm = $pdo->prepare($sql);
    foreach ($testData as $k => $v) {
        $stm->execute($v);
    }
};
$testDataMatchesLogs = function () use ($pdo, $faker) {
    $testData = [];
    $testData_maxLength = 101;
    for ($i = 1; $i < $testData_maxLength; $i++) {
        $dStart = $faker->dateTimeThisYear()->format("Y-m-d H:i:s");
        //        $dFinish = $faker->dateTimeInInterval($dStart, '+30 minutes')->format("Y-m-d H:i:s");
        for ($j = 0; $j < 5; $j++) {
            $tmp = [
                'fk_match'       => $i,
                'fk_user_char' => $faker->numberBetween(1, 101),
                'datetime_event' => $faker->dateTimeThisYear()->format("Y-m-d H:i:s"),
                'fk_event'       => $faker->randomElement([1, 4]),
            ];
            $testData[] = $tmp;
        }
    }
    //    echo print_r($testData, 1) . PHP_EOL;
    //    return;
    $sql = 'INSERT INTO `matches_logs` (
                  fk_match,
                  fk_user_char,
                  datetime_event,
                  fk_event
                )
                VALUE (
                  :fk_match,
                  :fk_user_char,
                  :datetime_event,
                  :fk_event
                )';
    $stm = $pdo->prepare($sql);
    foreach ($testData as $k => $v) {
        $stm->execute($v);
    }
};
$testDataMatchesParty = function () use ($pdo, $faker) {
    $testData = [];
    $testData_maxLength = 101;
    for ($i = 1; $i < $testData_maxLength; $i++) {
        $tmp = [
            'fk_match'     => $i,
            'team'         => 1,
            'fk_user_char' => $faker->randomElement([29, 66]),
        ];
        $testData[] = $tmp;
        $tmp = [
            'fk_match'     => $i,
            'team'         => 1,
            'fk_user_char' => $faker->randomElement([25]),
        ];
        $testData[] = $tmp;
        $tmp = [
            'fk_match'     => $i,
            'team'         => 1,
            'fk_user_char' => $faker->randomElement([8, 35, 83]),
        ];
        $testData[] = $tmp;
        $tmp = [
            'fk_match'     => $i,
            'team'         => 2,
            'fk_user_char' => $faker->randomElement([63, 75]),
        ];
        $testData[] = $tmp;
        $tmp = [
            'fk_match'     => $i,
            'team'         => 2,
            'fk_user_char' => $faker->randomElement([64, 73]),
        ];
        $testData[] = $tmp;
        $tmp = [
            'fk_match'     => $i,
            'team'         => 2,
            'fk_user_char' => $faker->randomElement([89]),
        ];
        $testData[] = $tmp;
    }
    //    echo print_r($testData, 1) . PHP_EOL;
    $sql = 'INSERT INTO `matches_party` (
                  fk_match,
                  team,
                  fk_user_char
                )
                VALUE (
                  :fk_match,
                  :team,
                  :fk_user_char
                )';
    $stm = $pdo->prepare($sql);
    foreach ($testData as $k => $v) {
        $stm->execute($v);
    }
};
//$testDataUsers();
//$testDataUsersLevels();
//$testDataCharactersLevels();
//$testDataCharacters();
//$testDataRating();
//$testDataUserChar();
//$testDataMatches();
//$testDataMatchesParty();
//$testDataMatchesLogs();
