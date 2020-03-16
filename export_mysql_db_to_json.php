<?php
// Coded by Babak Bandpey :-)
// Free usage.
// No license

try{
    $connect = mysqli_connect("localhost", "root", "", "seasony");

    $sql = "show tables";

    $result = mysqli_query($connect, $sql);

    $tables = array();

    while($row = mysqli_fetch_assoc($result))
    {
        $tables[] = $row;
    }

    $tables_data = [];

    foreach ($tables as $table ) {
        $sql = "select * from {$table['Tables_in_seasony']}";

        $data = [];

        $result = mysqli_query($connect, $sql);

        while($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }

        $tables_data[$table['Tables_in_seasony']] = $data;
    }

    print(json_encode($tables_data));
}catch (Exception $exception) {
    print_r($exception);
}
