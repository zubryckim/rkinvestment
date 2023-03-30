<?php
require 'vendor/smarty-3.1.34/libs/Smarty.class.php';

$smarty = new Smarty();

$smarty = new Smarty;
//$smarty->force_compile = true;
//$smarty->debugging = true;
$smarty->caching = false;
$smarty->cache_lifetime = 120;
$smarty->clearAllCache();
$smarty->clearCompiledTemplate();	

?>