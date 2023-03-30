<?php    
//$config['host']="serwer2012768.home.pl";
//$config['database']="33017218_rkinvest";
//$config['user']="33017218_rkinvest";
//$config['password']="Mariano121!";

$config['host']="localhost";
$config['database']="rkinvestment";
$config['user']="rkinvest_db";
$config['password']="90uimFG_jh34GT";

$conn1 = new PDO("mysql:host={$config['host']};dbname={$config['database']};", $config['user'], $config['password'], [
		PDO::ATTR_EMULATE_PREPARES => false, 
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    	PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
		PDO::ATTR_PERSISTENT => true
  		]
	);
    
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
?>