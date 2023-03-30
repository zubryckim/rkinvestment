<?php
/**
 * RKinvestment 
 * autor: Mariusz Żubrycki
 *
 */

// Setting
//header('Location: '.$_SERVER['HTTP_REFERER']);

//ini_set('display_errors', 1);


	session_start();
    require_once("class/db.class.php");
	require_once("class/metody.php");
	require_once("config/smarty.php");

	$db = new db($conn1);

	if(!isset($_SESSION['zalogowany']) && $_GET['do'] != 'zaloguj'){ 

		$smarty->assign('logowanie', true);
		$smarty->display('formLogin.tpl');
		exit();
	}


else {

	$invLst=$db->getInvestKombi();
	$broLst=$db->getBrokerKombi();
	$smarty->assign('bro_lst',$broLst);
	$smarty->assign('inv_lst',$invLst);
	
	if (!isset($_SESSION['inv_id'])) {
		$_SESSION['inv_id'] = 1;
		$_SESSION['inv_name']=$invLst[1];
	}
	//ustawnienie inwestycji
	if (isset($_POST['inv_id']))
	{
		$_SESSION['inv_id']=$_POST['inv_id'];
		//print_r($invLst[$_POST['inv_id']]);
		$_SESSION['inv_name']=$invLst[$_POST['inv_id']];
		
	}

	loger(serialize($_GET));

		
	switch($_GET['do']){
	
	//Logowanie uzytkownika
		case 'zaloguj':
			global $klucz;
			$md5pass=md5($_POST['haslo'].$klucz);
			$login=$_POST['login'];
			$result=$db->login($login);
			foreach($result as $row) {
				if ($md5pass==$row[0]){ 
					//echo $row[1];
					$_SESSION['zalogowany']=1;
					$_SESSION['uprawnienia']=$row[1];
					$_SESSION['user']=$login;
					$_SESSION['username']=$row[2]. " ". $row[3];

				}
			}
			if ($_SESSION['zalogowany']==1){
				loger("zalogowany");
				$ll=$db->getAgreements();
				$smarty->assign('lst',$ll);
				$smarty->display('agreementsList.tpl');
			}
			else {
				$smarty->assign('logowanie', false);
				$smarty->display('formLogin.tpl');
			}
			
		break;
				
		case 'usersList':
			$_SESSION['menu']=1;
			//$_SESSION['uprawnienia']=1;			
			$ll=$db->getUsers();
			$smarty->assign('lista_userow',$ll);
			$smarty->display('usersList.tpl');
		break;
		
		case 'addUser':
			if (isset($_POST['userid']) && isset($_POST['imie']) && isset($_POST['nazwisko'])&& isset($_POST['pass'])){
			//if (count($_POST)>0 && $smarty->doValidate()) {
				//echo "success!";
			$value['userid']=$_POST['userid'];
			$value['imie']=$_POST['imie'];
			$value['nazwisko']=$_POST['nazwisko'];
			$value['pass']=$_POST['pass'];
			$value['poziom']=$_POST['poziom'];
						
			//walidacja
				if (strlen($value['userid'])<3){
					$blad['userid']='Podaj użytkownika (min 3 znaki)<br/>';
					$error=true;
					}
				if (strlen($value['nazwisko'])<3){
					$blad['nazwisko']='Podaj nazwisko (min 3 znaki)<br/>';
					$error=true;
					}
				if (strlen($value['imie'])<3){
					$blad['imie']='Podaj imię (min 3 znaki)<br/>';
					$error=true;
					}
				if (strlen($value['pass'])<6){
					$blad['pass']='Podaj hasło (min 6 znaków)<br/>';
					$error=true;
					}
				else $error=false;

			
				if ($error==false){
					$log=$db->addUser($value['userid'], $value['imie'],$value['nazwisko'], $value['pass'], $value['poziom'] );
					if ($log==1062) { 
						$blad['userid']='już istnieje taki użytkownik!<br/>'; 
						$smarty->assign('value',$value);
						$smarty->assign('blad',$blad);
						$smarty->display('setUser.tpl'); 
						}
					else { 	
						$_SESSION['menu']=1;		
						$ll=$db->getUsers();
						$smarty->assign('lista_userow',$ll);
						$smarty->display('usersList.tpl'); 
					}
				}				
				else{ //wyświetlenie komunikatów walidacji
					$smarty->assign('value',$value);
					$smarty->assign('blad',$blad);
					$smarty->display('setUser.tpl');
				}
			
			} else {
				$smarty->display('setUser.tpl');
			}

		break;
		
		case 'setUser':
			if (isset($_POST['userid'])){
				
				$db->setUser( $_POST['imie'],$_POST['nazwisko'],$_POST['poziom'], $_POST['userid'] );
				$ll=$db->getUsers();
				$smarty->assign('lista_userow',$ll);
				$smarty->display('usersList.tpl');
			}		
			
			else {
				$ll=$db->getUsers($_GET['userid'])[0];
				$smarty->assign('edit',$ll);
				//$smarty->assign('pass', md5($ll['haslo'].$klucz));
				$smarty->display('setUser.tpl');
			}
			
		break;
		
		case 'delUser':
			$result=$db->delUser($_GET['userid']);
			if ($result==1) { 
				$ll=$db->getUsers();
				$smarty->assign('lista_userow',$ll);
				$smarty->display('usersList.tpl');
			}
			else {
				$blad['userid']='już istnieje taki użytkownik!<br/>'; 
			}

		break;
		
		case 'reset':
		if (isset($_POST['reset'])){
			$db->reset_pass($_POST['reset'], $_POST['pass']);
			$ll=$db->getUsers();
			$smarty->assign('lista_userow',$ll);
			$smarty->display('usersList.tpl');
			}
		else $smarty->display('resetUser.tpl');
		break;
		
		case 'wyloguj':
		    setcookie(session_name(), '', time()-42000, '/');
			session_unset(); 
			session_destroy();
			$smarty->assign('logowanie', true);
			$smarty->display('formLogin.tpl');
		break;
	

// ************** CLIENTS **********************
	
		case 'clientsList':
			$_SESSION['menu']=4;		
			$ll=$db->getClients();
			$smarty->assign('lst',$ll);		
			$smarty->display('clientsList.tpl');
		
		break;
		case 'addClient':
			if (isset($_POST['cli_name'])){
				//walidacja
				$error=false;
				if (strlen($_POST['cli_name'])<2){
					$blad['cli_name']='Podaj nazwę (min 3 znaki)<br/>';
					$error=true;
					}
				else{
					$db->addClient($_POST);	
					$ll=$db->getClients();
					$smarty->assign('lst',$ll);
					$smarty->display('clientsList.tpl'); 
					}
				//wyświetlenie komunikatów walidacji
				if ($error==true){ 
					$smarty->assign('value',$value);
					$smarty->assign('blad',$blad);
					$smarty->display('setClient.tpl');
				}
			}
			else {
				$man=$db->getManagersKombi();
				$smarty->assign('man',$man);
				$smarty->display('setClient.tpl');
			}
				
		break;

		case 'setClient':		
			if (isset($_POST['cli_id'])){
				$db->setClient( $_POST['cli_id'], $_POST);
				$ll=$db->getClients();
				$smarty->assign('lst',$ll);
				$smarty->display('clientsList.tpl');
				}		
			else {
				$man=$db->getManagersKombi();
				$smarty->assign('man',$man);
				
				$ll=$db->getClients('cli_id='.$_GET['cli_id'].'')[0];
				$smarty->assign('edit',$ll);
				$smarty->display('setClient.tpl');
			}
		break;
		
// ************** AGREEMENTS ********************
		
		case 'agreementsList':
			$_SESSION['menu']=5;		
			$ll=$db->getAgreements();
			$smarty->assign('lst',$ll);
			$smarty->display('agreementsList.tpl');
		
		break;
		
		case 'detailsAgree':
			$_SESSION['menu']=5;
			
			/*
			if (isset($_POST['pay_amount'])){
				
				//$return2=$db->addPayment($_POST['agr_id'],$_POST['sch_id'], deleteFormat($_POST['pay_amount']), $_POST['pay_date'], $_POST['pay_invoice_no'],$_SESSION['user']);
				
								//echo "<br/>".$_POST['pay_amount']."<br/>";
				//echo deleteFormat($_POST['pay_amount'])."<br/>";
												
				if($_POST['should']==$_POST['pay_amount']){
					$status=1;
					$return2=$db->statusAgreement($_POST['agr_id'], $status);
						if ($return2!=1){
							echo $return2;
						}
					header('Location: '.$_SERVER['HTTP_REFERER']);
				}
				
			}
			*/			
			
			detailsAgree:
			
			if (isset($_GET['agr_id']) || isset($_POST['agr_id'])){
				
				if (isset($_GET['agr_id'])) $agr_id = $_GET['agr_id'];
				if (isset($_POST['agr_id'])) $agr_id = $_POST['agr_id'];
				
				$agree=$db->getAgreements($agr_id);
				
				foreach($agree as $i => $cli)
				{
					$client[]= $db->getClients("cli_id=".$cli['cli_id']);
				}
				foreach ($client as $i => $cli)
				{
					$client[$i] = $client[$i][0];
				} 
				$local=$db->getLocals("loc_agr_id=".$agr_id);
				$garage=$db->getGarages("gar_agr_id=".$agr_id);
				$storage=$db->getStorages("sto_agr_id=".$agr_id);
			
				
				
				$smarty->assign('clients', $client);
				$smarty->assign('locals', $local);
				$smarty->assign('garages', $garage);
				$smarty->assign('storages', $storage);
				$smarty->assign('agreements',$agree[0]);
		
				$pay=$db->getPayments("pay_agr_id=".$agr_id);
				$sch=$db->getSchedule("sch_agr_id=".$agr_id);
				$rezervationFee = $db ->getPayRez($agr_id);
				$sum = $db->getSumOfPrices($agr_id);	
				
				$smarty->assign('rezFee',$rezervationFee);
				$smarty->assign('sch',$sch);
				$smarty->assign('sum',$sum);
				$smarty->assign('sch',$sch);
				$smarty->assign('paylist',$pay);
				$smarty->display('detailsAgree.tpl');
				
			}
			
		break;
		
		case 'addAgree':
			$man=$db->getManagersKombi();
			$smarty->assign('man',$man);
			
			if (isset($_POST['add_cli_id'])){
				//print_r($_POST);

				$log=$db->addAgree(
						$_SESSION['inv_id'], $_POST['agr_booking_date'], $_POST['agr_booking_no'], $_POST['agr_booking_deposit'],
						$_POST['agr_dev_date'], $_POST['agr_dev_no'], $_POST['agr_comments'], $_POST['add_cli_id'],$_POST['add_loc_id'], $_POST['add_gar_id'], $_POST['add_sto_id']
						);	
				if ($log==1) { 
						//echo $log;

						$ll=$db->getAgreements();
						$smarty->assign('lst',$ll);
						$smarty->display('agreementsList.tpl'); 
						}
				else { 
						$smarty->assign('value',$value);
						$smarty->assign('log',$log); //TODO:dopisać w formularzu wyświetlanie błędu "Integrity constraint violation: 1062"
						$smarty->display('addAgreement.tpl');
					}
					
				//wyświetlenie komunikatów walidacji				
				if ($error==true){ 
					$smarty->assign('value',$value);
					$smarty->assign('blad',$blad);
					$smarty->display('addAgreement.tpl');
					header('Location: '.$_SERVER['HTTP_REFERER']);
				}
			}
			
			// new Agreement form
			else {
				$client_lst=$db->getClients();
				$local_lst=$db->getLocals('loc_agr_id=0');
				$garage_lst=$db->getGarages('gar_agr_id=0');
				$storage_lst=$db->getStorages('sto_agr_id=0');
				$smarty->assign('garage_lst',$garage_lst);
				$smarty->assign('storage_lst',$storage_lst);
				$smarty->assign('local_lst',$local_lst);
				$smarty->assign('client_lst',$client_lst);
				$smarty->display('addAgreement.tpl');
			}
			
		break;
		
		case 'editAgree':
			
			if (isset($_GET['agr_id'])){
			
				$agr_id=$_GET['agr_id'];
				
				
				//dane umowy
				$agree=$db->getAgreements($agr_id);
				
				foreach($agree as $i => $cli)
				{
					$client[]= $db->getClients("cli_id=".$cli['cli_id']);
				}
				foreach ($client as $i=> $cli)
				{
					$client[$i] = $client[$i][0];
				} 
				
				$local=$db->getLocals("loc_agr_id=".$agr_id);
				$garage=$db->getGarages("gar_agr_id=".$agr_id);
				$storage=$db->getStorages("sto_agr_id=".$agr_id);
				$smarty->assign('clients', $client);
				$smarty->assign('locals', $local);
				$smarty->assign('garages', $garage);
				$smarty->assign('storages', $storage);
				$smarty->assign('edit',$agree[0]);
				
				//echo "<pre>";
				//print_r($edit);
				//print_r($storage);
				//echo "</pre>";
				
				//dane do wyszukiwania
				$client_lst=$db->getClients();
				$local_lst=$db->getLocals('loc_agr_id=0');
				$garage_lst=$db->getGarages('gar_agr_id=0');
				$storage_lst=$db->getStorages('sto_agr_id=0');
				$smarty->assign('garage_lst',$garage_lst);
				$smarty->assign('storage_lst',$storage_lst);
				$smarty->assign('local_lst',$local_lst);
				$smarty->assign('client_lst',$client_lst);		
				
				$smarty->display('addAgreement.tpl'); 
			
			}
			
			//Update change in database
			
			if (isset($_POST['agr_id'])){	
				//echo "<pre>"; print_r($_POST); echo "</pre>";
				$agr_id=$_POST['agr_id'];
				
				//client
				if (isset($_POST['del_cli_id'])){
					$cli_id=$_POST['del_cli_id'];;
					$db->removeClientFromAgree($agr_id,  $cli_id);
				}
				
				if (isset($_POST['add_cli_id'])){
					$cli_id=$_POST['add_cli_id'];
					$db->addClientToAgree($agr_id, $cli_id);
				}
				//
				
				//local
				if (isset($_POST['del_loc_id'])){
					$loc_id=$_POST['del_loc_id'];
					$db->removeFromAgree("locals", $loc_id);
				}
				if (isset($_POST['add_loc_id'])){
					$loc_id=$_POST['add_loc_id'];
					$db->addToAgree($agr_id, "locals", $loc_id);
				}
				//garage
				if (isset($_POST['del_gar_id'])){
					$gar_id=$_POST['del_gar_id'];
					$db->removeFromAgree("garages",  $gar_id);
				}
				if (isset($_POST['add_gar_id'])){
					$gar_id=$_POST['add_gar_id'];
					$db->addToAgree($agr_id, "garages", $gar_id);
				}
				//storage
				if (isset($_POST['del_sto_id'])){
					$sto_id=$_POST['del_sto_id'];
					$db->removeFromAgree("storages",  $sto_id);
				}
				if (isset($_POST['add_sto_id'])){
					$sto_id=$_POST['add_sto_id'];
					$db->addToAgree($agr_id, "storages", $sto_id);
				}	
				
				//update agreement
				//print_r($_POST);
				
				$db->setAgree($_POST);
				
				$db->UpdateSUM();
				$ll=$db->getAgreements();
				$smarty->assign('lst',$ll);
				$smarty->display('agreementsList.tpl');
				
				header('Location: '.$_SERVER['HTTP_REFERER']);
			}
			
		break;
		
		//
		// PAYMENTS
		//
		case 'paymentsList':
			$_SESSION['menu']=5;		
			$ll=$db->getPayments();
			$smarty->assign('lst',$ll);
			$smarty->display('paymentsList.tpl');
		
		break;



// **************** BROKERS **********************

		case 'brokersList':
			$_SESSION['menu']=2;		
			$ll=$db->getBrokers();
			$smarty->assign('lst',$ll);		
			$smarty->display('brokersList.tpl');
		
		break;
		
		case 'setBroker':		
			if (isset($_POST['bro_id'])){
				$db->setBroker($_POST['bro_id'],$_POST['bro_name']);
				$ll=$db->getBrokers();
				$smarty->assign('lst',$ll);
				$smarty->display('brokersList.tpl');
			}	
			else if (isset ($_GET['bro_id'])){
		
				$ll=$db->getBrokers($_GET['bro_id'])[0];
				$smarty->assign('edit',$ll);
				$smarty->display('setBroker.tpl');
			}	
			
		break;
		
		case 'delBroker':
			$db->delBroker($_GET['bro_id']);
			$ll=$db->getbrokers();
			$smarty->assign('lst',$ll);
			$smarty->display('brokersList.tpl');
		break;
		
		case 'addBroker':
			if (isset($_POST['bro_name'])){
			//walidacja
				if (strlen($_POST['bro_name'])<3){
					$blad['bro_name']='Podaj nazwę (min 3 znaki)<br/>';
					$error=true;
					}
				else{
					$db->addBroker($_POST['bro_name']);	
					$ll=$db->getBrokers();
					$smarty->assign('lst',$ll);
					$smarty->display('brokersList.tpl'); 
					}
				//wyświetlenie komunikatów walidacji
				if ($error==true){ 
					$smarty->assign('value',$value);
					$smarty->assign('blad',$blad);
					$smarty->display('setBroker.tpl');
				}
			}
			else {
				$smarty->display('setBroker.tpl');
			}	
		break;
		
		
// **************** MANAGERS **********************

		case 'listManagers':
			$_SESSION['menu']=2;		
			$ll=$db->getManagers();
			$smarty->assign('lst',$ll);		
			$smarty->display('listManagers.tpl');
		
		break;
		
		case 'setManager':		
			if (isset($_POST['man_id'])){
				$db->setManagers($_POST['man_id'],$_POST['man_name']);
				$ll=$db->getManagers();
				$smarty->assign('lst',$ll);
				$smarty->display('listManagers.tpl');
			}	
			else if (isset ($_GET['man_id'])){
		
				$ll=$db->getManagers($_GET['man_id'])[0];
				$smarty->assign('edit',$ll);
				$smarty->display('setManager.tpl');
			}	
			
		break;

		case 'addManager':
		
			if (isset($_POST['man_name'])){
			//walidacja

				if (strlen($_POST['man_name'])<3){
					$blad['man_name']='Podaj nazwę (min 3 znaki)<br/>';
					$error=true;		
					}
				else{
					$db->addManager($_POST['man_name']);	
					$ll=$db->getManagers();
					$smarty->assign('lst',$ll);
					$smarty->display('listManagers.tpl'); 
					}
				//wyświetlenie komunikatów walidacji
				if ($error==true){ 
					$smarty->assign('value',$value);
					$smarty->assign('blad',$blad);
					$smarty->display('setManager.tpl');
				}
			}
			else {
				$smarty->display('setManager.tpl');
			}	
		break;
		
// **************** INVESTMENTS **********************

		case 'investmentsList':
			$_SESSION['menu']=3;		
			$ll=$db->getInvestments();
			$smarty->assign('lst',$ll);		
			$smarty->display('investmentsList.tpl');
		
		break;
		
		case 'addInvestment':
			if (isset($_POST['inv_name'])){
				$db->addInvestment($_POST['inv_name'],$_POST['inv_order']);
				
				$ll=$db->getInvestments();
				$smarty->assign('lst',$ll);		
				$smarty->display('investmentsList.tpl');
			}
			else {
				//wyswietlanie foprmularza 
				$smarty->display('setInvestment.tpl');
			}

		
		break;
		
		case 'setInvestment':		
			if (isset($_POST['inv_id'])){
				$result=$db->setInvestment($_POST['inv_id'], $_POST['inv_name'], $_POST['inv_order']);
				if ($result==1) {
					$ll=$db->getInvestments();
					$smarty->assign('lst',$ll);
					$smarty->display('investmentsList.tpl');
				}
				else {
					$smarty ->assign('error', $result);
					$smarty->display('setInvestment.tpl');
				}
			}		
			else {
				$ll=$db->getInvestments($_GET['inv_id'])[0];
				$smarty->assign('edit',$ll);
				$smarty->display('setInvestment.tpl');
			}
		break;
		
		case 'delInvestment':
			$db->delInvestment($_GET['inv_id']);
			$ll=$db->getInvestments();
			$smarty->assign('lst',$ll);
			$smarty->display('investmentsList.tpl');
		break;
		
		
		

// **************** LOCALS **********************

		case 'localsList':
			$_SESSION['menu']=6;		
			$ll=$db->getLocals();
			$smarty->assign('lst',$ll);		
			$smarty->display('localsList.tpl');
		
		break;

		case 'setLocal':		
			if (isset($_POST['loc_id'])){
				
				$value['loc_room_qty']=$_POST['loc_room_qty'];
				$value['loc_surface']=$_POST['loc_surface'];
				$value['loc_balcony']=$_POST['loc_balcony'];
				$value['loc_garden']=$_POST['loc_garden'];
				$value['loc_price_1m2']=deleteFormat($_POST['loc_price_1m2']);
				$value['loc_price_total']=deleteFormat($_POST['loc_price_total']);
				$value['loc_no']=$_POST['loc_no'];
				$value['loc_floor']=$_POST['loc_floor'];
				$value['loc_inv_id']=$_POST['loc_inv_id'];
				$value['loc_id']=$_POST['loc_id'];
				
				$return=$db->setLocal($value['loc_room_qty'],$value['loc_surface'], $value['loc_balcony'],$value['loc_garden'],$value['loc_price_1m2'],$value['loc_price_total'],$value['loc_no'],$value['loc_floor'],$value['loc_inv_id'],$value['loc_id'] );

				if ($return==1062) { 
						$blad['loc_no']='już istnieje taki numer!<br/>'; 
						$smarty->assign('value',$value);
						$smarty->assign('blad',$blad);
						$smarty->display('setLocal.tpl'); 
						}
				else
				{
					//header('Location: '.$_SERVER['HTTP_REFERER']);
					$db->UpdateSUM();
					$ll=$db->getLocals();
					$smarty->assign('lst',$ll);
					$smarty->display('localsList.tpl');
					
				}

			}		
			else if(isset($_GET['loc_id'])){
				$loc=$db->getLocals('loc_id='.$_GET['loc_id'])[0];
				$smarty->assign('edit',$loc);
				$smarty->display('setLocal.tpl');
			}
			else {
				$ll=$db->getLocals();
				$smarty->assign('lst',$ll);
				$smarty->display('localsList.tpl');
			}
		break;
		
		case 'addLocal':
			$invLst=$db->getInvestKombi();
			$smarty->assign('inv_lst',$invLst);
			
			if (isset($_POST['loc_no'])){
			
				$value['loc_room_qty']=$_POST['loc_room_qty'];
				$value['loc_surface']=$_POST['loc_surface'];
				$value['loc_balcony']=$_POST['loc_balcony'];
				$value['loc_garden']=$_POST['loc_garden'];
				$value['loc_price_1m2']=deleteFormat($_POST['loc_price_1m2']);
				$value['loc_price_total']=deleteFormat($_POST['loc_price_total']);
				$value['loc_no']=$_POST['loc_no'];
				$value['loc_floor']=$_POST['loc_floor'];
				$value['loc_inv_id']=$_POST['loc_inv_id'];
			
				//walidacja
				if (strlen($_POST['loc_no'])<1){
					$blad['loc_no']='Podaj numer lokalu<br/>';
					$error=true;
					}
				else{
					$log=$db->addLocal($value['loc_room_qty'],$value['loc_surface'], $value['loc_balcony'],$value['loc_garden'],$value['loc_price_1m2'],$value['loc_price_total'],$value['loc_no'], $value['loc_floor'], $value['loc_inv_id']);
					if ($log==1062) { 
						$blad['loc_no']='już istnieje taki numer!<br/>'; 
						$smarty->assign('value',$value);
						$smarty->assign('blad',$blad);
						$smarty->display('setLocal.tpl'); 
						}
					else {
						$ll=$db->getLocals();
						$smarty->assign('lst',$ll);
						$smarty->display('localsList.tpl'); 
					}
				}
				//wyświetlenie komunikatów walidacji
				if ($error==true){ 
					$smarty->assign('value',$value);
					$smarty->assign('blad',$blad);
					$smarty->display('setLocal.tpl');
				}
			}
			else {
				$smarty->display('setLocal.tpl');
			}
				
		break;

// **************** GARAGES **********************

		case 'garagesList':
			$_SESSION['menu']=7;		
			$ll=$db->getGarages();
			$smarty->assign('lst',$ll);		
			$smarty->display('garagesList.tpl');
		
		break;

		case 'setGarage':		
			if (isset($_POST['gar_id'])){
			
				$value['gar_surface']=$_POST['gar_surface'];
				$value['gar_price_total']=$_POST['gar_price_total'];
				$value['gar_level']=$_POST['gar_level'];
				$value['gar_no']=$_POST['gar_no'];
				$value['gar_inv_id']=$_POST['gar_inv_id'];
				$value['gar_id']=$_POST['gar_id'];
				$value['gar_sto_no']=$_POST['gar_sto_no'];
				
				$log=$db->setGrage($value['gar_surface'],$value['gar_price_total'], $value['gar_level'],$value['gar_no'],$value['gar_inv_id'], $value['gar_id'], $value['gar_sto_no']);	
				if ($log==1062) { 
						$blad['gar_no']='już istnieje taki numer!<br/>'; 
						$smarty->assign('value',$value);
						$smarty->assign('blad',$blad);
						$smarty->display('setGarage.tpl'); 
						}
				else
				{
					$db->UpdateSUM();
					$ll=$db->getGarages();
					$smarty->assign('lst',$ll);
					$smarty->display('garagesList.tpl');
				}
			}		
			else {
				$ll=$db->getGarages('gar_id='.$_GET['gar_id'])[0];
				$smarty->assign('edit',$ll);
				$smarty->display('setGarage.tpl');
			}
		break;	
		case 'addGarage':
		
			$invLst=$db->getInvestKombi();
			$smarty->assign('inv_lst',$invLst);
			
			if (isset($_POST['gar_no'])){
			
				$value['gar_inv_id']=$_POST['gar_inv_id'];
				$value['inv_name']=$_POST['inv_name'];
				$value['gar_level']=$_POST['gar_level'];
				$value['gar_surface']=$_POST['gar_surface'];
				$value['gar_price_total']=$_POST['gar_price_total'];
				$value['gar_no']=$_POST['gar_no'];
				$value['gar_sto_no']=$_POST['gar_sto_no'];
			
				//walidacja
				if (strlen($value['gar_no'])<1){
					$blad['loc_no']='Podaj numer stanowiska<br/>';
					$error=true;
					}
				else{
					//addGarage($gar_surface,$gar_price_total, $gar_level, $gar_no, $gar_inv_id)
					$log=$db->addGarage($value['gar_surface'],$value['gar_price_total'], $value['gar_level'],$value['gar_no'],$value['gar_inv_id'], $value['gar_sto_no']);	
					if ($log==1062) { 
						$blad['gar_no']='<p class="text-danger">już istnieje taki numer!</p>'; 
						$smarty->assign('value',$value);
						$smarty->assign('blad',$blad);
						$smarty->display('setGarage.tpl'); 
						}
 					else {
						$ll=$db->getGarages();
						$smarty->assign('lst',$ll);
						$smarty->display('garagesList.tpl'); 
						}
					}
				//wyświetlenie komunikatów walidacji
				if ($error==true){ 
					$smarty->assign('value',$value);
					$smarty->assign('blad',$blad);
					$smarty->display('setGarage.tpl');
				}
			}
			else {
				$smarty->display('setGarage.tpl');
			}
				
		break;	
		
		// **************** STORAGES **********************

		case 'storagesList':
			//$_SESSION['menu']=7;		
			$ll=$db->getStorages();
			$smarty->assign('lst',$ll);		
			$smarty->display('storagesList.tpl');
		
		break;
		
		// **************** SATISTIC **********************
		case 'statistic':
			if (isset($_POST['from']) && isset($_POST['to'])) {
				$_SESSION['from']=$_POST['from'];
				$_SESSION['to']=$_POST['to'];
			}
			else {
				$_SESSION['from']=date("Y-m-d");
				$_SESSION['to']=date('Y-m-d',strtotime(date("Y-m-d"). "+14 days"));
			}
			$ll=$db->getRequiredPayments($_SESSION['from'], $_SESSION['to']);
			
			//echo "<pre>";
			//print_r($ll);
			//echo "</pre>";
			
			foreach ($ll as $id=>$ls){
				//echo $ll[$id]['sch_id'];
				$ll[$id]['pay_sum']=$db->getSumPayment($ls['sch_id']);
			}
			
			$smarty->assign('lst',$ll);
			$smarty->display('statistic.tpl');
		break;
		
		
// ************** default ****************		
		default:
			$smarty->display('brak.tpl');
		break;
	}

}
