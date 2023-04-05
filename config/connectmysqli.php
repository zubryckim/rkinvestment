<?php    

$config['host']="localhost";
$config['database']="rkinvestment";
$config['user']="rkinvest_db";
$config['password']="???????????";


$conn1 = mysqli_connect($config['host'], $config['user'], $config['password'], $config['database']);
    
    if($conn1 === false)
    {
        if( ($errors = sqlsrv_errors() ) != null) 
        {
            foreach( $errors as $error ) 
            {
                echo "SQLSTATE: ".$error['SQLSTATE']."<br />";
                echo "code: ".$error['code']."<br />";
                echo "message: ".$error['message']."<br />";
            }
        }
    }
