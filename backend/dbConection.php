<?php

function createConnection ( $host, $port, $dbname, $user, $password ) {
    return new PDO(
        "pgsql:host={$host};port={$port};dbname={$dbname}",
        $user
        $password
    );
}
?>