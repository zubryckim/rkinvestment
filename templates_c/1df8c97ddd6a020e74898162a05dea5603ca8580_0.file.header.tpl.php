<?php
/* Smarty version 3.1.34-dev-7, created on 2022-03-07 10:35:11
  from 'C:\inetpub\wwwroot\rkinvestment\templates\header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_6225d1cf25df15_41477768',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1df8c97ddd6a020e74898162a05dea5603ca8580' => 
    array (
      0 => 'C:\\inetpub\\wwwroot\\rkinvestment\\templates\\header.tpl',
      1 => 1608719179,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6225d1cf25df15_41477768 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'C:\\inetpub\\wwwroot\\rkinvestment\\vendor\\smarty-3.1.34\\libs\\plugins\\function.html_options.php','function'=>'smarty_function_html_options',),));
$_smarty_tpl->_assignInScope('title', 'RK');?>
<!doctype html>
<html>

<head>  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mariusz Żubrycki">

<title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
 - <?php echo $_smarty_tpl->tpl_vars['Name']->value;?>
</title>

	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">	
	<!-- glyphicons -->
	<link href="vendor/bootstrap4-glyphicons/css/bootstrap-glyphicons.css" rel="stylesheet">
	<link href="font/fontawesome-free-5.15.1-web/css/all.css" rel="stylesheet">
	
	<!--DataTable CSS -->
	<link href="vendor/dataTables/dataTables.min.css" rel="stylesheet" type="text/css"/>
	
	<!--DatePiker -->
	<link href="vendor/datePicker/bootstrap-datepicker3.css" rel="stylesheet" />
	
	<!--Jquery UI CSS -->
	<link href="vendor/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet">
	<!-- Sitebar CSS -->
	<link href="css/simple-sidebar.css" rel="stylesheet">

	  
	<link rel="shortcut icon" href="images/favicon.ico" />


 </head>
 
<body>
	<div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">
		
		<img src="images/logo.png" width="200px"/>
		
	  </div>
	 
      <div class="list-group list-group-flush"> 
	  <?php if (isset($_SESSION['uprawnienia'])) {?>
	  
		<?php if ($_SESSION['uprawnienia'] >= 1) {?>
        <a href="index.php?do=agreementsList" class="list-group-item list-group-item-action bg-light">
		<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp Umowy</a>	
        <a href="index.php?do=clientsList" class="list-group-item list-group-item-action bg-light">
		<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp Klienci</a>
        <a href="index.php?do=localsList" class="list-group-item list-group-item-action bg-light">
		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp Mieszkania/lokale</a>
		<a href="index.php?do=garagesList" class="list-group-item list-group-item-action bg-light">
		<i class="fa fa-car"></i>&nbsp Garaże</a>
		<a href="index.php?do=storagesList" class="list-group-item list-group-item-action bg-light">
		<i class="fa fa-archive"></i>&nbsp Schowki</a>
        <a href="index.php?do=investmentsList" class="list-group-item list-group-item-action bg-light">
		<i class="fa fa-building"></i>&nbsp Inwestycje</a>
		<a href="index.php?do=statistic" class="list-group-item list-group-item-action bg-light">
		<span class="glyphicon glyphicon-stats" aria-hidden="true"></span>&nbsp Statystyka</a>
		<!--
		<a href="index.php?do=shedules" class="list-group-item list-group-item-action bg-light">Harmonogram spłat</a>
		-->	  
		<?php if ($_SESSION['uprawnienia'] == 2) {?>
		<a href="index.php?do=usersList" class="list-group-item list-group-item-action bg-light border-top">Użytkownicy</a>	
		<a href="index.php?do=paymentsList" class="list-group-item list-group-item-action bg-light">Wpłaty</a>
		<a href="index.php?do=listManagers" class="list-group-item list-group-item-action bg-light">Opiekunowie</a>
		<a href="index.php?do=brokersList" class="list-group-item list-group-item-action bg-light">Pośrednicy</a>
	    <?php }?>
	
		<?php } else { ?>
			<a href="#" class="list-group-item list-group-item-action bg-light">brak uprawnień</a>
		<?php }?>
	<?php }?>

      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-info" id="menu-toggle">Pasek boczny</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
				<label for="set_investition" class="col-sm-4 col-form-label">inwestycja</label>
              <!--<a class="nav-link" href="https://rkinvestment.pl/">strona RK <span class="sr-only">(current)</span></a>-->
            </li>
			<li class="nav-item active">
				<select class="form-control form-control-sm mt-1" id="set_investition" name="set_investition">
				<?php if (isset($_SESSION['uprawnienia'])) {?>
					<?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['inv_lst']->value,'selected'=>$_SESSION['inv_id']),$_smarty_tpl);?>

				<?php }?>
				</select>
			</li>
			<li class="nav-item">
				<div style="width: 50px" ></div>
			</li>
			
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  <?php if (isset($_SESSION['uprawnienia'])) {?>
                <?php echo $_SESSION['username'];?>

			  <?php }?>
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">informacje</a>
				<!--Copyright &copy; 2020 RK Investment | realizacja: Mariusz Żubrycki-->
                <a class="dropdown-item" href="?do=wyloguj" >zmień hasło</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="?do=wyloguj">wyloguj</a>
              </div>
            </li>
          </ul>
        </div>
      </nav><?php }
}
