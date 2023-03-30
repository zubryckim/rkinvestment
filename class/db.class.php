<?php

require_once("config/connect.php");
require_once("metody.php");

class DB
{
    var $conn1;
	var $MYSQL_DUPLICATE_CODES=array(1062,23000);
	
    function __construct($conn1)
    {	
		$MYSQL_DUPLICATE_CODES=array(1062,23000);
		$this->MDC = $MYSQL_DUPLICATE_CODES;
        $this->conn1 = $conn1;
	
    }

	function login($username)
	{
		$sql = "SELECT password, poziom_dostepu, imie, nazwisko FROM user WHERE `userid`='".$username."'";
		$result= $this->conn1->query($sql,PDO::FETCH_NUM);
		//$result= $this->conn1->query($sql,PDO::FETCH_ASSOC);
		if (isset($result))
            return $result;
        else return -1;		
	}

	function getUsers()
	{
		if ($_SESSION['uprawnienia']==2){
	
			$sql=("SELECT * FROM  `user` ");
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{
					$sql.=" where userid='$wartosc'";
					}
				}
		
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD listaUserow()".mysql_error());
			$lista = array();
			
			while ($row= $result->fetch() ) {
				$lista[] = array(
					'userid' => $row['userid'],
					'imie' => $row['imie'],
					'nazwisko' => $row['nazwisko'],
					'pass' => $row['password'],
					'poziom'=> $row['poziom_dostepu']
				);
			}
		return $lista;		
		}
		else echo "brak uprawnień";
	}
	
	function addUser($userid,$imie,$nazwisko,$pass, $poziom)
	{
		if ($_SESSION['uprawnienia']==2){
			
			$MYSQL_DUPLICATE_CODES=array(1062,23000);
			$md5pass=md5($pass.$klucz);
			
			try {
				$statement = $this->conn1->prepare("INSERT INTO user(userid ,imie, nazwisko, password, poziom_dostepu) VALUES(?,?,?,?,?)");
				$statement->execute(array($userid, $imie, $nazwisko, $md5pass, $poziom));
			} 
			catch(PDOException $e) {
			   if (in_array($e->getCode(),$MYSQL_DUPLICATE_CODES)) {
					return 1062;
			   } 
			   else {
					return $e->getMessage();
			   }
			}
		}
		else echo "brak uprawnień";
	}
	
	
	function delUser($id){
		
		if ($_SESSION['uprawnienia']==2){
		
		try {
			$sql="DELETE FROM user WHERE `userid`=?";
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($id));
			return 1;
		}
		catch(PDOException $e) {
				return $e->getMessage();
		   }
		
		}
		else echo "brak uprawnień";
	}
	
	function setUser($imie,$nazwisko,$poziom,$userid)
	{
		if ($_SESSION['uprawnienia']==2){
			$sql="UPDATE user SET `imie`=?, `nazwisko`=?, `poziom_dostepu`=? WHERE `userid`=?";
			
			try{
				$statement = $this->conn1->prepare($sql);
				$statement->execute(array($imie, $nazwisko, $poziom, $userid));
			}
			catch(PDOException $e) {
				//return $e->getMessage();
			}
		}
		else echo "brak uprawnień";
	}
	
	function reset_pass($username, $new_pass){
		if ($_SESSION['uprawnienia']==2){
			global $klucz;
			$md5pass=md5($new_pass.$klucz);
			$sql="UPDATE user SET `password`='$md5pass' WHERE `userid`='$username'";
			
			try{
				$result =$this->conn1->query($sql);
				//echo $result->rowCount() . " records UPDATED successfully";
			}
			catch(PDOException $e) {
				return $e->getMessage();
			}
		}
		else echo "brak uprawnień";
	}

//************** CLIENT ***************************

	//do wyszukiwania 
	function searchClient($like)
	{
		$sql=("SELECT * FROM  `clients` where cli_name like '%$like%' or cli_surname like '%$like%'");
		$result = $this->conn1->query($sql);
		while($row = $result->fetch() ){
			$response[] = array(
			"value"=>$row['cli_id'],
			"label"=>$row['cli_name']." ".$row['cli_surname'],
			"info"=>" | ".$row['cli_locallity']." | ".$row['cli_email']
			);
		}
		return $response;
	}

	function getClients()
	{

			$sql=("SELECT * FROM `clients`");
			//join managers on managers.man_cli_id = clients.cli_id ");
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{
					$sql.=" where $wartosc";
					}
				}
			//echo $sql;
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD getClients()".mysql_error());
			$lista = array();
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			
		return $lista;	
	}
	
	function addClient($post)
	{
	    try {
			
			print_r($post);
			
			$statement = $this->conn1->prepare("INSERT INTO 
				clients(
					cli_name, cli_surname, cli_street, cli_zip_code, cli_locallity, cli_phone_no, cli_phone_no2,cli_email, cli_man_id,
					cli_PESEL,cli_obywatelstwo, cli_imiona_rodzicow, cli_stan_cywilny,cli_ustroj_majatkowy,cli_nazwa_banku,cli_nr_konta_bankowego,cli_adres_kor,cli_zip_code_kor, cli_locallity_kor, cli_rodzaj_dowodu,
					cli_nr_dowodu,cli_data_waznosci_dowodu,cli_op_nazwa,cli_op_forma,cli_op_NIP,cli_op_KRS,cli_op_REGON,cli_op_adres,cli_op_miasto,cli_op_kod,cli_op_phone,cli_op_email
					) 
				VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			$statement->execute(array(
				$post['cli_name'],$post['cli_surname'],$post['cli_street'],$post['cli_zip_code'],$post['cli_locallity'],$post['cli_phone_no'],$post['cli_phone_no2'],$post['cli_email'],$post['cli_manager'],
				$post['cli_PESEL'],$post['cli_obywatelstwo'],$post['cli_imiona_rodzicow'],$post['cli_stan_cywilny'],$post['cli_ustroj_majatkowy'],$post['cli_nazwa_banku'],$post['cli_nr_konta_bankowego'],$post['cli_adres_kor'],$post['cli_zip_code_kor'],$post['cli_locallity_kor'],$post['cli_rodzaj_dowodu'],
				$post['cli_nr_dowodu'],$post['cli_data_waznosci_dowodu'],$post['cli_op_nazwa'],$post['cli_op_forma'],$post['cli_op_NIP'],$post['cli_op_KRS'],$post['cli_op_REGON'],$post['cli_op_adres'],$post['cli_op_miasto'],$post['cli_op_kod'],$post['cli_op_phone'],$post['cli_op_email']
			)
			
			);
			
			$cli_id = $this->conn1->lastInsertId();
			echo $cli_id;
			return $cli_id;
		} 
		catch(PDOException $e) {
				echo $e->getMessage();
				return $e->getMessage();
		}
		
	}
	
	function setClient($cli_id, $post)
	{
		//print_r($post);
		
		$sql="UPDATE clients SET 
					`cli_name`=?, 
					`cli_surname`=?,
					`cli_street`=?,
					`cli_zip_code`=?,
					`cli_locallity`=?,
					`cli_phone_no`=?,
					`cli_phone_no2`=?,
					`cli_email`=?,
					`cli_man_id`=?,
					`cli_PESEL`=?,
					`cli_obywatelstwo`=?, 
					`cli_imiona_rodzicow`=?, 
					`cli_stan_cywilny`=?,
					`cli_ustroj_majatkowy`=?,
					`cli_nazwa_banku`=?,`cli_nr_konta_bankowego`=?,
					`cli_adres_kor`=?,`cli_zip_code_kor`=?, `cli_locallity_kor`=?,`cli_rodzaj_dowodu`=?,`cli_nr_dowodu`=?,`cli_data_waznosci_dowodu`=?,
					`cli_op_nazwa`=?,`cli_op_forma`=?,`cli_op_NIP`=?,`cli_op_KRS`=?,`cli_op_REGON`=?,`cli_op_adres`=?,`cli_op_miasto`=?,`cli_op_kod`=?,`cli_op_phone`=?,`cli_op_email`=?

				WHERE `cli_id`=?";
		try{
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array(
				$post['cli_name'],$post['cli_surname'],$post['cli_street'],$post['cli_zip_code'],$post['cli_locallity'],$post['cli_phone_no'],$post['cli_phone_no2'],$post['cli_email'],$post['cli_manager'],
				$post['cli_PESEL'],$post['cli_obywatelstwo'],$post['cli_imiona_rodzicow'],$post['cli_stan_cywilny'],$post['cli_ustroj_majatkowy'],$post['cli_nazwa_banku'],$post['cli_nr_konta_bankowego'],$post['cli_adres_kor'],$post['cli_zip_code_kor'],$post['cli_locallity_kor'],$post['cli_rodzaj_dowodu'],
				$post['cli_nr_dowodu'],$post['cli_data_waznosci_dowodu'],$post['cli_op_nazwa'],$post['cli_op_forma'],$post['cli_op_NIP'],$post['cli_op_KRS'],$post['cli_op_REGON'],$post['cli_op_adres'],$post['cli_op_miasto'],$post['cli_op_kod'],$post['cli_op_phone'],$post['cli_op_email'],
				
				$cli_id )
			);
			
		}
		catch(PDOException $e) {
			echo $e->getMessage();
		}		
	}
	
	
// **************** AGREMENTS *****************
	
	function getAgreements()
	{
			$sql=("SELECT * FROM `agreements` 
					LEFT JOIN lnk_cli_agr on lnk_cli_agr.lnk_agr_id=agreements.agr_id
					JOIN clients on clients.cli_id=lnk_cli_agr.lnk_cli_id
					JOIN investments on investments.inv_id=agreements.agr_inv_id
					LEFT JOIN brokers on brokers.bro_id=agreements.agr_bro_id
					WHERE agreements.agr_inv_id=".$_SESSION['inv_id']."");
					
			$parametry = func_get_args();
			
			if (func_num_args()>0) {
				foreach($parametry as $id => $wartosc)
					{
					$sql.=" and agreements.agr_id='$wartosc'";
					
					}
				}
			
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD getAgreements()".mysql_error());
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			/*
			if (func_num_args()>0) {
				return $lista[0];				
			}
			else {return $lista;}
			*/
			return $lista;
			
	}
	
	// zmienia status Umowy
	// agrumenty $agr_id - id umowy
	// $status:	0 -  nie rozliczona
	//			1 -  rozliczona	
	//
	function statusAgreement($agr_id, $status){
	
		$sql="UPDATE agreements SET `agr_status_id`=? WHERE `agr_id`=?";
		try{
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($status, $agr_id));
			return 1;
		}
		catch(PDOException $e) {
			echo $e->getMessage();
			return $e->getMessage();
		}	
	
	
	}
	
	
	function addAgree($agr_inv_id, $agr_booking_date, $agr_booking_no, $agr_booking_deposit,$agr_dev_date, $agr_dev_no, $agr_comments, $agr_cli_id, $agr_loc_id, $agr_gar_id, $agr_sto_id)
	{	
		$this->conn1->beginTransaction();
		
		try {
		
			$sql_1="INSERT INTO agreements (`agr_inv_id`,`agr_booking_date`,`agr_booking_no`,`agr_booking_deposit`, `agr_dev_date`, `agr_dev_no`, `agr_comments` ) VALUES(?,?,?,?,?,?,?)";
			$stmt = $this->conn1->prepare($sql_1);
			$stmt->execute(array($agr_inv_id, $agr_booking_date, $agr_booking_no, $agr_booking_deposit, $agr_dev_date, $agr_dev_no, $agr_comments));
			
			//save agr_id
			//$astmt->$this->conn1->execute("SET @agr_id = LAST_INSERT_ID()");
			$agr_id = $this->conn1->lastInsertId();
			//insert clients
			//add link client-agreement in table lnk_cli_agr
			$stmt = $this->conn1->prepare("INSERT INTO lnk_cli_agr (`lnk_cli_id`, `lnk_agr_id`) VALUES (?,?)");
			foreach ($agr_cli_id as $cli_id){
				$stmt->execute(array($cli_id, $agr_id));
			}

			//update locals
			if (isset($agr_loc_id)){
				$stmt = $this->conn1->prepare("UPDATE locals SET `loc_agr_id`=? WHERE `loc_id`=?");
				foreach ($agr_loc_id as $loc_id){
					$stmt->execute(array($agr_id, $loc_id));
				}
			}
			//update garages
			if (isset($agr_gar_id)){
				$stmt = $this->conn1->prepare("UPDATE garages SET `gar_agr_id`=? WHERE `gar_id`=?"); 
				foreach ($agr_gar_id as $gar_id){
					$stmt->execute(array($agr_id, $gar_id));
				}
			}
			//update storages
			if (isset($agr_sto_id)){
				$stmt = $this->conn1->prepare("UPDATE storages SET `sto_agr_id`=? WHERE `sto_id`=?");
				foreach ($agr_sto_id as $sto_id){
					$stmt->execute(array($agr_id, $sto_id));
				}
			}
			
			$this->conn1->commit();
			return 1;
		}
		
		catch(PDOException $e) {
			$this->conn1->rollback();
			return $e->getMessage();
		}
	
	}
	
	function setAgree($post)
	{
		//echo $post['agr_comments'];
		
		$sql="UPDATE agreements SET 
					`agr_booking_date`=?,
					`agr_booking_no`=?,
					`agr_dev_date`=?,
					`agr_dev_no`=?,
					`agr_comments`=?
				WHERE `agr_id`=?";
		try{
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($post['agr_booking_date'],$post['agr_booking_no'],$post['agr_dev_date'],$post['agr_dev_no'], $post['agr_comments'], $post['agr_id'] ));
		}
		catch(PDOException $e) {
			echo $e->getMessage();
		}		
	}
// **************** INVESTMENTS *****************	

	function getInvestments()
	{
			$sql=("SELECT * FROM  `investments` ");
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{
					$sql.=" where inv_id='$wartosc'";
					}
				}
					
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD getInvestments()".mysql_error());
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			
			return $lista;	
	}
	
	function addInvestment($name, $order)
	{
	    try {
			$statement = $this->conn1->prepare("INSERT INTO investments(inv_name, inv_order) VALUES(?,?)");
			$statement->execute(array($name, $order));
		} 
		catch(PDOException $e) {
				echo $e->getMessage();
		}
	}
	
	function setInvestment($id,$name,$order)
	{
		$sql="UPDATE investments SET `inv_name`=?, `inv_order`=? WHERE `inv_id`=?";
		try{
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($name,$order,$id ));
			return 1;
		}
		catch(PDOException $e) {
			return $e->getMessage();
		}		
	}
		
	function delInvestment($id){
		if ($_SESSION['uprawnienia']==2){
		
		try {
			$sql="DELETE FROM investments WHERE `inv_id`=?";
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($id));
		}
		catch(PDOException $e) {
				return $e->getMessage();
		   }
		
		}
	}
	
// *** funkcja dla pola kombi (zwraca inny format)*******
	function getInvestKombi()
	{

			$sql=("SELECT inv_id, inv_name FROM  `investments` ");
	
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD getInvest()".mysql_error());
			$lista = array();
			while ($row = $result->fetch() ) {
				$lista[$row['inv_id']]=$row['inv_name'];
			}
			
			return $lista;	
	}
	

// **************** BROKERS *****************

// *** funkcja dla pola kombi (zwraca inny format)*******
	
	function getBrokerKombi()
	{

			$sql=("SELECT bro_id, bro_name FROM  `brokers` ");
			$result = $this->conn1->query($sql);
			if ($result === false) die("BŁĄD getBrpokerKombi()".mysql_error());
			$lista = array();
			//ustawienie pierwszej pustej wartości dla pola kombi select 
			$lista[0]='...';
			
			while ($row = $result->fetch() ) {
				$lista[$row['bro_id']]=$row['bro_name'];
			}
			return $lista;	
	}

	function getBrokers(){

			$sql=("SELECT * FROM  `brokers` ");
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{
					$sql.=" where bro_id='$wartosc'";
					}
				}
			
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD getBrokers()".mysql_error());
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			return $lista;	
	}
	
	function addBroker($name)
	{
	    try {
			
			$statement = $this->conn1->prepare("INSERT INTO brokers(bro_name) VALUES(?)");
			$statement->execute(array($name));
		} 
		catch(PDOException $e) {
				echo $e->getMessage();
		}
	}
	
	function setBroker($id,$name)
	{
		$sql="UPDATE brokers SET `bro_name`=? WHERE `bro_id`=?";
		try{
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($name,$id ));
		}
		catch(PDOException $e) {
			echo $e->getMessage();
		}		
	}
	
	function delBroker($id){
		if ($_SESSION['uprawnienia']==2){
		
		try {
			$sql="DELETE FROM brokers WHERE `bro_id`=?";
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($id));
		}
		catch(PDOException $e) {
				return $e->getMessage();
		   }
		
		}
	}
	
// **************** MANAGERS *****************

	function getManagersKombi()
	{

			$sql=("SELECT man_id, man_name FROM  `managers` ");
			$result = $this->conn1->query($sql);
			if ($result === false) die("BŁĄD getBrpokerKombi()".mysql_error());
			$lista = array();
			//ustawienie pierwszej pustej wartości dla pola kombi select 
			$lista[0]='...';
			
			while ($row = $result->fetch() ) {
				$lista[$row['man_id']]=$row['man_name'];
			}
			return $lista;	
	}
	
	
	function getManagers()
	{
			$sql=("SELECT * FROM `managers`");
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{
					$sql.=" where man_id='$wartosc'";
					}
				}
			//echo $sql;
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD getClients()".mysql_error());
			$lista = array();
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			return $lista;		
	}
	
	function addManager($name)
	{
	    try {
			
			$statement = $this->conn1->prepare("INSERT INTO managers(man_name) VALUES(?)");
			$statement->execute(array($name));
		} 
		catch(PDOException $e) {
				echo $e->getMessage();
		}
	}
	
	function setManagers($id,$name)
	{
		$sql="UPDATE managers SET `man_name`=? WHERE `man_id`=?";
		try{
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($name,$id ));
		}
		catch(PDOException $e) {
			echo $e->getMessage();
		}		
	}
	
	
	
//*********** LOCALS ****************************

	function searchLocal($like, $investment)
	{
		//$sql=("SELECT * FROM `locals` LEFT JOIN lnk_agr_loc ON lnk_agr_loc.lnk_loc_id=locals.loc_id) as test where lnk_loc_id is null and loc_inv_id='$investment' and loc_no like '%$like%'");
		//$sql="SELECT * FROM `locals` WHERE loc_agr_id=0 AND loc_inv_id='$investment' and loc_no like '%$like%'";
		$sql="SELECT * FROM `locals` 

					AND loc_no like '%$like%'
					";
		$result = $this->conn1->query($sql);
		while($row = $result->fetch() ){
			$response[] = array(
			"value"=>$row['loc_id'],
			"label"=>$row['loc_no'],
			"info"=>" | ".$row['loc_room_qty']." pokoi" 
			);
		}
		return $response;
	}
	
	function getLocals()
	{
			$sql=("SELECT locals.*, investments.inv_name  FROM `locals` 
			JOIN investments on investments.inv_id=locals.loc_inv_id 
			LEFT JOIN clients ON clients.cli_id=locals.loc_cli_id 
			LEFT JOIN agreements ON agreements.agr_id=locals.loc_agr_id 
			WHERE locals.loc_inv_id=".$_SESSION['inv_id']."");
			
			//$filtr="WHERE investments.inv_id=$_SESSION['inv_id']";
			
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{					
					$pos = strpos('=', $wartosc);
						if ($pos == false){
							$sql.=" and $wartosc";
						}
						
					}
				}
			//echo $sql;
			
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD getLocals()".mysql_error());
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			return $lista;	
	}

	function addLocal($loc_room_qty,$loc_surface, $loc_balcony, $loc_garden, $loc_price_1m2, $loc_price_total, $loc_no, $loc_floor, $loc_inv_id)
	{
		$MYSQL_DUPLICATE_CODES=array(1062,23000);
		
		$statement = $this->conn1->prepare("INSERT INTO locals
				(loc_room_qty,loc_surface, loc_balcony, loc_garden, loc_price_1m2, loc_price_total, loc_no, loc_floor, loc_inv_id) 
				VALUES(?,?,?,?,?,?,?,?,?)");
		try {

				$statement->execute(array($loc_room_qty,$loc_surface, $loc_balcony, $loc_garden, $loc_price_1m2, $loc_price_total, $loc_no, $loc_floor, $loc_inv_id));
			} 
			
		catch(PDOException $e) {

		   if (in_array($e->getCode(),$MYSQL_DUPLICATE_CODES)) {
				return 1062;
				//$e->getCode();
		   } 
		   else {
				return $e->getMessage();
		   }
		   
		}
	}
		
	function setLocal($loc_room_qty, $loc_surface, $loc_balcony, $loc_garden, $loc_price_1m2, $loc_price_total, $loc_no, $loc_floor, $loc_inv_id, $loc_id)
	{
		$MYSQL_DUPLICATE_CODES=array(1062,23000);
		
		$sql="UPDATE locals SET `loc_room_qty`=?,`loc_surface`=?,`loc_balcony`=?,`loc_garden`=?,`loc_price_1m2`=?,`loc_price_total`=?,`loc_no`=?, `loc_floor`=?,`loc_inv_id`=?	WHERE `loc_id`=?";
		
		try{
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($loc_room_qty,$loc_surface, $loc_balcony, $loc_garden, $loc_price_1m2, $loc_price_total, $loc_no, $loc_floor, $loc_inv_id, $loc_id));
		}
		catch(PDOException $e) {
			//echo $e->getMessage();
		   if (in_array($e->getCode(),$MYSQL_DUPLICATE_CODES)) {
				return 1062;
		   } 
		   else {
				return $e->getMessage();
		   }
		}	
	}
// *********** GARAGES *******************

	function searchGarage($like, $investment)
	{
		$sql=("SELECT * FROM(SELECT * FROM `garages` LEFT JOIN lnk_agr_gar ON lnk_agr_gar.lnk_agr_gar_id=garages.gar_id) as test where lnk_agr_gar_id is null and gar_inv_id='$investment' and gar_no like '%$like%'");
		$result = $this->conn1->query($sql);
		while($row = $result->fetch() ){
			$response[] = array(
			"value"=>$row['gar_id'],
			"label"=>$row['gar_no']." | ".$row['gar_level']." poziom" 
			//"info"=>$row['gar_level']." poziom" 
			);
		}
		return $response;
	}
	
	function getGarages()
	{
			$sql=("SELECT garages.*, investments.* FROM `garages` join investments on investments.inv_id=garages.gar_inv_id
					WHERE garages.gar_inv_id=".$_SESSION['inv_id']."");
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{
					$sql.=" and $wartosc";
					}
				}
				
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD getGarages()".mysql_error());
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			return $lista;	
	}
	
	function addGarage($gar_surface,$gar_price_total, $gar_level, $gar_no, $gar_inv_id, $gar_sto_no)
	{
		$MYSQL_DUPLICATE_CODES=array(1062,23000);
		try {
			$statement = $this->conn1->prepare("INSERT INTO garages
			(gar_surface,gar_price_total, gar_level, gar_no, gar_inv_id, gar_sto_no) 
			VALUES(?,?,?,?,?,?)");
			$statement->execute(array($gar_surface,$gar_price_total, $gar_level, $gar_no, $gar_inv_id, $gar_sto_no));
		} 
		catch(PDOException $e) {
		   if (in_array($e->getCode(),$MYSQL_DUPLICATE_CODES)) {
				return 1062;
		   } 
		   else {
				return $e->getMessage();
		   }
		}
	}

	function setGrage($gar_surface,$gar_price_total, $gar_level, $gar_no, $gar_inv_id, $gar_id, $gar_sto_no)
	{
		$MYSQL_DUPLICATE_CODES=array(1062,23000);
		
		$sql="UPDATE garages SET `gar_surface`=?,`gar_price_total`=?,`gar_level`=?,`gar_no`=?,`gar_inv_id`=?, `gar_sto_no`=? WHERE `gar_id`=?";
		
		try{
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($gar_surface,$gar_price_total, $gar_level, $gar_no, $gar_inv_id, $gar_sto_no, $gar_id));
		}
		catch(PDOException $e) {
			//echo $e->getMessage();
		   if (in_array($e->getCode(),$MYSQL_DUPLICATE_CODES)) {
				return 1062;
		   } 
		   else {
				return $e->getMessage();
		   }
		}	
	}
	
	
	
	//PAYMENTS
	
	function addPayment($pay_agr_id, $pay_sch_id, $pay_cli_id, $pay_amount, $pay_date, $pay_invoice_no, $pay_usr_id, $type)
	{
		$MYSQL_DUPLICATE_CODES=array(1062,23000);
		
		//echo $pay_amount;
		
		try {
			$statement = $this->conn1->prepare("INSERT INTO payments
			(pay_agr_id, pay_sch_id, pay_cli_id, pay_amount, pay_date, pay_invoice_no, pay_usr_id, pay_type) 
			VALUES(?,?,?,?,?,?,?,?)");
			$statement->execute(array($pay_agr_id, $pay_sch_id, $pay_cli_id, $pay_amount, $pay_date, $pay_invoice_no, $pay_usr_id, $type));
			return 1;
		} 
		catch(PDOException $e) {
		   if (in_array($e->getCode(),$MYSQL_DUPLICATE_CODES)) {
				return array($pay_agr_id, $pay_sch_id, $pay_cli_id, $pay_amount, $pay_date, $pay_invoice_no, $pay_usr_id, $type);
		   } 
		   else {
				return $e->getMessage();
		   }
		}
	}
	
	function setPayment($pay_id, $pay_amount, $pay_date, $pay_invoice_no, $pay_usr_id)
	{
		$MYSQL_DUPLICATE_CODES=array(1062,23000);

		$sql="UPDATE `payments` SET `pay_amount`=?,`pay_date`=?,`pay_invoice_no`=?,`pay_usr_id`=? WHERE `pay_id`=?";
		
		loger("sql $pay_amount, $pay_date, $pay_invoice_no, $pay_usr_id, $pay_id");
		
		try{
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($pay_amount, $pay_date, $pay_invoice_no, $pay_usr_id, $pay_id));
			return 1;
		}
		catch(PDOException $e) {
			//echo $e->getMessage();
		   if (in_array($e->getCode(),$MYSQL_DUPLICATE_CODES)) {
				return 1062;
		   } 
		   else {
				loger("setPayment():".$e->getMessage());
				return $e->getMessage();
		   }
		}	
	}
	
		
	function getPayments()
	{
			$sql_1=("set @lp=0;");
			$sql_2=("SELECT *, @lp:=@lp+1 AS nr FROM `payments` 
					join agreements on agreements.agr_id=payments.pay_agr_id 
					join user on user.userid=payments.pay_usr_id");
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{
					$sql_2.=" where $wartosc";
					}
				}
			$sql_2.= " order by pay_id asc";
			//echo $sql;
			
			$this->conn1->query($sql_1);
			$result = $this->conn1->query($sql_2);

			if ($result === false) die("BŁĄD getGarages()".mysql_error());
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			return $lista;	
	}
	
	function getPayRez($agr_id)
	{
			$sql=("SELECT * FROM `payments` WHERE pay_agr_id =$agr_id and pay_type=1");
			$sql.= " order by pay_id asc";
			
			$result = $this->conn1->query($sql);
			
			if ($result === false) die("BŁĄD getPayRez()".mysql_error());
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			return $lista;	
	}
	
	
	
	
//SCHEDULER
	function addScheduler($post) {
		
		loger("addScheduler()");
		
		$MYSQL_DUPLICATE_CODES=array(1062,23000);
		
		$sch_agr_id=$post['agr_id'];
		$sch_cli_id=$post['cli_id'];
		/*
		echo "<pre>";
		print_r($post);
		echo "</pre>";
		*/

		try {
			$statement = $this->conn1->prepare("INSERT INTO scheduled_payments (sch_agr_id, sch_cli_id, sch_order, sch_date, sch_base_amount) VALUES(?,?,?,?,?)");
			foreach ($post['scheduler'] as $i => $id){
				//echo $i;
				$order = trim(substr($id['sch_order'],8,10));
				//loger("$sch_agr_id, $sch_cli_id, $order");
				$statement->execute(array($sch_agr_id, $sch_cli_id, $order, $id['sch_date'], deleteFormat($id['sch_amount'])));
			}
			return 1;
		} 
		catch(PDOException $e) {
		   if (in_array($e->getCode(),$MYSQL_DUPLICATE_CODES)) {
				return 1062;
				loger("PDOException");
		   } 
		   else {
				loger("PDOException else");
				return $e->getMessage();
		   }
		}
		
		
	}
	function updateScheduler($post) {
	
		$sql="UPDATE scheduled_payments 
			SET `sch_date`=?, `sch_base_amount`=? WHERE `sch_id`=? ";
	
		$sch_id=$post['sch_id'];
		$sch_date=$post['scheduler'][0]['sch_date'];
		$sch_amount=deleteFormat($post['scheduler'][0]['sch_amount']);
		//loger("$sch_id, $sch_date, $sch_amount");
		try {
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($sch_date, $sch_amount, $sch_id));
			return 1;
		}
		catch(PDOException $e) {
				return $e->getMessage();
	    }
	
	}
	
	function deleteScheduler($sch_id) {
	
		$sql="DELETE FROM scheduled_payments WHERE `sch_id`=? ";
		//loger($sql);
		
		try {
			$statement = $this->conn1->prepare($sql);
			$statement->execute(array($sch_id));
			return 1;
		}
		catch(PDOException $e) {
				return $e->getMessage();
	    }
	
	}
	
	
	function getSchedule()
	{
			//$sql_1=("set @lp=0;");
			$sql_2=("SELECT scheduled_payments.* FROM scheduled_payments");
					
			$sql_2=("SELECT scheduled_payments.*, sum(payments.pay_amount) as sum_amount FROM scheduled_payments 
			LEFT JOIN payments on payments.pay_sch_id=scheduled_payments.sch_id");
		
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{
					$sql_2.=" where $wartosc ";
					}
				}
			$sql_2.=" group by scheduled_payments.sch_id";
			
			echo $sql;
			
			//$this->conn1->query($sql_1);
			$result = $this->conn1->query($sql_2);

			if ($result === false) die("BŁĄD getGarages()".mysql_error());
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			return $lista;	
	}
	
	//
	
	function getStorages()
	{
			$sql=("SELECT storages.*, investments.* FROM `storages` join investments on investments.inv_id=storages.sto_inv_id 
					WHERE storages.sto_inv_id=".$_SESSION['inv_id']."");
			$parametry = func_get_args();
			
			if (isset($parametry)) {
				foreach($parametry as $id => $wartosc)
					{
					$sql.=" and $wartosc";
					}
				}
			//echo $sql;
			$result = $this->conn1->query($sql);

			if ($result === false) die("BŁĄD getStroager()".mysql_error());
			
			$lista = $result->fetchAll(PDO::FETCH_ASSOC);
			return $lista;	
	}
	
	
	/////////////////////////////////////////////////////////////////////////
	//	add or del Object to Agreement 
	/////////////////////////////////////////////////////////////////////////

	function removeFromAgree($object, $obj_id)
	{
		$pref = substr( $object, 0, 3);
		
		$sql="UPDATE `".$object."` SET `".$pref."_agr_id`=null WHERE `".$pref."_id`=? ";

		try {
			$statement = $this->conn1->prepare($sql);
			foreach ($obj_id as $id){
				$statement->execute(array($id));
			}
			
		}
		catch(PDOException $e) {
				return $e->getMessage();
	    }
	}
	
	function addToAgree($agr_id, $object, $obj_id)
	{
		$pref = substr( $object, 0, 3);
		
		$sql="UPDATE `".$object."` SET `".$pref."_agr_id`=? WHERE `".$pref."_id`=? ";

		try {
			$statement = $this->conn1->prepare($sql);
			foreach ($obj_id as $id){
				//echo $agr_id.";".$id."</br>";
				$statement->execute(array($agr_id, $id ));
			}
		}
		catch(PDOException $e) {
				return $e->getMessage();
	    }
	}
	
	//add or remove CLIENTS 	
	function removeClientFromAgree($agr_id,  $cli_id)
	{
		$sql="DELETE FROM lnk_cli_agr WHERE `lnk_agr_id`=? and `lnk_cli_id`=? ";

		try {
			$statement = $this->conn1->prepare($sql);
			foreach ($cli_id as $id){
				$statement->execute(array($agr_id, $id));
			}
		}
		catch(PDOException $e) {
				return $e->getMessage();
	    }
	}
		
	function addClientToAgree($agr_id,  $cli_id)
	{
		$sql="INSERT INTO lnk_cli_agr (`lnk_agr_id`, `lnk_cli_id` ) VALUE(?,?)";

		try {
			$statement = $this->conn1->prepare($sql);
			foreach ($cli_id as $id){
				$statement->execute(array($agr_id, $id));
			}
		}
		catch(PDOException $e) {
				return $e->getMessage();
	    }
	}
	
	function UpdateSUM(){
		$sql="CALL `UpdateSUM`()";
		try {
			$statement = $this->conn1->prepare($sql);
			$statement->execute();
		}
		catch(PDOException $e) {
				return $e->getMessage();
	    }
	}
	
	function getSumOfPrices($agr_id) {
		
		$sql_loc= "SELECT sum(loc_price_total) as sum_loc FROM `locals` WHERE loc_agr_id =?";
		$sql_gar= "SELECT sum(gar_price_total) as sum_gar FROM `garages` WHERE gar_agr_id =?";
		$sql_sto= "SELECT sum(sto_price_total) as sum_sto FROM `storages` WHERE sto_agr_id =?";
		
		$loc = $this->conn1->prepare($sql_loc);
		$loc->execute(array($agr_id));
		$sum_loc=$loc->fetchColumn();
		
		$gar = $this->conn1->prepare($sql_gar);
		$gar->execute(array($agr_id));
		$sum_gar=$gar->fetchColumn();
		
		$sto = $this->conn1->prepare($sql_sto);
		$sto->execute(array($agr_id));
		$sum_sto=$sto->fetchColumn();
		
		$sum_all=$sum_loc+$sum_gar+$sum_sto;
		
		return $sum_all;
		
	}
	
	function getRequiredPayments($from, $to) {
		
		$sql="	
			SELECT *, '' as pay_sum FROM `scheduled_payments` 
			JOIN clients on clients.cli_id=scheduled_payments.sch_cli_id 
			WHERE `sch_settled`= 0
			AND sch_date BETWEEN ? AND ?
			";
		
		//echo ("$sql, $from, $to");
		
		$statement = $this->conn1->prepare($sql);
		$statement->execute(array($from, $to));
		$result=$statement->fetchAll(PDO::FETCH_ASSOC);
		
		return $result;

	}
	function getSumPayment($sch_id)
	{
		$sql="SELECT sum(`pay_amount`) FROM `payments` where `pay_sch_id` =?";
		
		$statement = $this->conn1->prepare($sql);
		$statement->execute(array($sch_id));
		$result=$statement->fetchColumn();
		
		return $result;
	
	}
	
//
 	
}

  ?>