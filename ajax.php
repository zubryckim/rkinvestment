<?php

//HTML result
require_once("class/db.class.php");

if(isset($_POST['getDetails']) && $_POST['getDetails']>0){


	$db = new db($conn1);
	$result=$db->getPayments("pay_sch_id=".$_POST['getDetails']);
	
	$html = '<table class="" cellspacing="0" border="0" width="100%">
			<thead>
			<tr>
			<th class="th-sm">data</th>
			<th class="th-sm">kwota wpłaty</th>
			<th class="th-sm">nr faktury</th>
			<th class="th-sm">zarejestrowane przez</th>
			<th></th>
			</tr></thead>
			<tbody>';
	//print_r($result);
			
	foreach($result as $key => $value)
	{
			//$sch_id=$value['pay_sch_id'];
			//$sch_agr_id=$value['pay_agr_id'];
			//$sch_cli_id=$value['pay_cli_id'];
			$pay_date=$value['pay_date'];
			$pay_invoice_no=$value['pay_invoice_no'];
			$pay_usr_id=$value['pay_usr_id'];
			$pay_id=$value['pay_id'];
			$amount=number_format($value['pay_amount'], 2, '.', ' ');
			
			$html.= "<tr>";
			$html.= "<td>$pay_date</td>";
			$html.= "<td>$amount</td>";
			$html.= "<td>$pay_invoice_no</td>";
			$html.= "<td>$pay_usr_id</td>";
			$html.= '<td><button type="button" class="btn btn-default btn-sm" 
								data-toggle="modal" 
								data-target="#payment_modal"  
								data-todo="pay_edit" 								
								data-pay_id="'.$pay_id.'"
								data-pay_invoice_no="'.$pay_invoice_no.'"
								data-pay_amount="'.$amount.'"
								data-pay_date="'.$pay_date.'"
								><span class="glyphicon glyphicon-edit" ></span> Edytuj</button></td>';
			$html.= "</tr>"; 
	}
	
	$html.="</tbody></table>";
	echo $html;
}

//JSON result
else {
	header('Content-type: application/json');

	//addPayment
	if ( isset($_POST['todo'])){
		require_once("class/metody.php");
		$db = new db($conn1);
		//add Rezervation fee
		if( $_POST['todo']=='pay_rez'){ 
			$result=$db->addPayment($_POST['agr_id'],$_POST['sch_id'],$_POST['cli_id'],deleteFormat($_POST['pay_amount']), $_POST['pay_date'], $_POST['pay_invoice_no'], $_POST['user'], 1);
			if ($result==1) echo json_encode(array("result"=>"1"));
			//else echo json_encode(array("result"=>"$result"));
			//else echo json_encode(array($result));
		}
		
		//add payment of schedule
		if( $_POST['todo']=='pay_sch' ) {
			$result=$db->addPayment($_POST['agr_id'],$_POST['sch_id'],$_POST['cli_id'],deleteFormat($_POST['pay_amount']), $_POST['pay_date'], $_POST['pay_invoice_no'], $_POST['user'],2);
			if ($result==1) echo json_encode(array("result"=>"1"));
			//else echo json_encode(array("result"=>"$result"));
			else echo json_encode(array($result));
		}	
		
		//edit payment of schedule
		if( $_POST['todo']=='pay_edit' || $_POST['todo']=='pay_rez_edit' ) {
		
			//echo json_encode(array("result"=>"edit"));	
			$result=$db->setPayment($_POST['pay_id'], deleteFormat($_POST['pay_amount']), $_POST['pay_date'], $_POST['pay_invoice_no'], $_POST['user']);
			if ($result==1) echo json_encode(array("result"=>"1"));
			else echo json_encode(array("result"=>"błąd sql"));
			//echo json_encode(array($result));
		}	

		//addScheduler
		if( $_POST['todo']=='add_sch' ){ 
			$result=$db->addScheduler($_POST);
			if ($result==1) echo json_encode(array("result"=>"1"));
			//else echo json_encode(array("result"=>"$result"));
			else echo json_encode(array($result));
		}
		
		//editScheduler
		if( $_POST['todo']=='edit_sch' ){ 
			$result=$db->updateScheduler($_POST);
			if ($result==1) echo json_encode(array("result"=>"1"));
			//else echo json_encode(array("result"=>"$result"));
			else echo json_encode(array($result));
		}
		//deleteScheduler
		if( $_POST['todo']=='del_sch' ){ 
			$result=$db->deleteScheduler($_POST['sch_id']);
			if ($result==1) echo json_encode(array("result"=>"1"));
			//else echo json_encode(array("result"=>"$result"));
			else echo json_encode(array($result));
		}
		
		//newClient
		if( $_POST['todo']=='newClient' ){
			$result=$db->addClient($_POST['cli_name'],$_POST['cli_surname'], $_POST['cli_street'],$_POST['cli_zip_code'],
						$_POST['cli_locallity'],$_POST['cli_phone_no'],$_POST['cli_phone_no2'],$_POST['cli_email'],
						$_POST['cli_NIP']
						);
			$name=$_POST['cli_name']." ".$_POST['cli_surname'];
			$phone="tel.".$_POST['cli_phone_no'];
			if (strlen($_POST['cli_phone_no2'])>0) $phone.=" / ".$_POST['cli_phone_no2'];
			
			echo json_encode(array("result"=>$result,"name"=>$name, "phone"=>$phone));
			//echo json_encode(array("result"=>"dodajemy klienta"));
		}
	
	}
		
	
	//searchClient
	if(isset($_POST['searchClient'])){
		$db = new db($conn1);
		$result=$db->searchClient($_POST['searchClient']);
		echo json_encode($result);
	}
	//searchLocal
	if(isset($_POST['searchLocal'])){
		$db = new db($conn1);
		$result=$db->searchLocal($_POST['searchLocal'], $_POST['investment']);
		echo json_encode($result);
	}
	//searchGarage
	if(isset($_POST['searchGarage'])){
		$db = new db($conn1);
		$result=$db->searchGarage($_POST['searchGarage'], $_POST['investment']);
		echo json_encode($result);
	}
}
