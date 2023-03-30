{$title=RK}
<!doctype html>
<html>

<head>  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mariusz Żubrycki">

<title>{$title} - {$Name}</title>

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
	  {if isset($smarty.session.uprawnienia)}
	  
		{if $smarty.session.uprawnienia >= 1}
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
		{if $smarty.session.uprawnienia == 2}
		<a href="index.php?do=usersList" class="list-group-item list-group-item-action bg-light border-top">Użytkownicy</a>	
		<a href="index.php?do=paymentsList" class="list-group-item list-group-item-action bg-light">Wpłaty</a>
		<a href="index.php?do=listManagers" class="list-group-item list-group-item-action bg-light">Opiekunowie</a>
		<a href="index.php?do=brokersList" class="list-group-item list-group-item-action bg-light">Pośrednicy</a>
	    {/if}
	
		{else}
			<a href="#" class="list-group-item list-group-item-action bg-light">brak uprawnień</a>
		{/if}
	{/if}

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
				{if isset($smarty.session.uprawnienia)}
					{html_options options=$inv_lst selected=$smarty.session.inv_id}
				{/if}
				</select>
			</li>
			<li class="nav-item">
				<div style="width: 50px" ></div>
			</li>
			
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  {if isset($smarty.session.uprawnienia)}
                {$smarty.session.username}
			  {/if}
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
      </nav>