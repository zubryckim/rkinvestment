<?php

global $klucz;
$klucz="hjk34";

$_SESSION['ip']=GetClientIP();


function deleteFormat($value){
		$value =  str_replace(' ', '', $value);
		$value =  str_replace(',', '.', $value);
		$value =  str_replace('_', '', $value);
		//$value =  str_replace(',', '.', $value); //add for modal_scheduler
		//echo $value;
		return $value;
}
	
// *** LOGI ***
function loger($krok){
	$log="logs/rkinvest_".date('Y-m-d').".log";
	$fp = fopen($log, "a");
	fputs($fp, date('Y-m-d - H:i').';');	
	
	if (isset($_SESSION['user'])) {
		fputs($fp, 'user:'. $_SESSION['user'].';');
	}
	fputs($fp, $_SESSION['ip']."; krok:".$krok."\x0d");
	fclose($fp);
}


function GetClientIP()
{
    $ip = 0;
    if( ! empty( $_SERVER[ 'HTTP_CLIENT_IP' ] ) )
    {
        $ip = $_SERVER[ 'HTTP_CLIENT_IP' ];
    }
    if( ! empty( $_SERVER[ 'HTTP_X_FORWARDED_FOR' ] ) )
    {
        $ipList = explode( ", ", $_SERVER[ 'HTTP_X_FORWARDED_FOR' ] );
        if( $ip )
        {
            array_unshift( $ipList, $ip );
            $ip = 0;
        }
        foreach( $ipList as $v )
        {
           if( ! strstr( "^(192.168|172.16|10|224|240|127|0.", $v ) )
            {
                return $v;
            }
        }
    }
    return $ip ? $ip : $_SERVER[ 'REMOTE_ADDR' ];
}

?>