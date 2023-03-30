{$title=RK} 
{$Name="Szczegóły umowy"}
{$target="agreementsList"}
{$object="Agree"}
{$do="detailsAgree"}

{$should=$sum}   

{include file="header.tpl"}
{include file='modal_payment.tpl'}
{include file='modal_scheduler.tpl'}

<div class="container-fluid">

<button type="button" class="btn btn-secondary btn-sm mt-4 " onclick="window.location.href='index.php?do={$target}'" >< Wstecz</button>


<h5 class="mt-4">{$Name}</h5>
	<div class="border {if ($value.agr_status_id==0)} border-primary  {elseif ($value.agr_status_id==1) } border-success  {/if} col-8 p-1" >
	
			<div class="col-md-4 left p-1" >
					<div class="meta-row">
					{foreach from = $clients item = client}
								<div class="meta meta-default" id="client-{$client.cli_id}" title="Klient"><div class="meta-icon"><i class="glyphicon glyphicon-glyphicon-user" data-unicode="e008"></i></div>
								<div class="meta-data"><h5>{$client.cli_name} {$client.cli_surname}</h5><div class="small">tel: {$client.cli_phone_no}{if $client.cli_phone_no2 != ''} / {$client.cli_phone_no2}{/if}</div><span class="small text-muted">Klient</span></div>
								<div style="clear:both"></div></div>
					{/foreach}
					
						<div class="meta meta-default meta-with-icon" title="Uwagi">
								<div class="meta-icon">
									<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> 
								</div>
								<div class="meta-data">
									<h5>{$agreements.agr_comments}</h5>
									<span class="small text-muted">Uwagi</span>
								</div>
								<div style="clear:both"></div>
						</div>
					</div>
			</div>
			<div class="col-md-4 left p-1">
				{if $agreements.agr_booking_no!=''}
				<div class="meta-row">
					<div class="meta meta-default" title="Nr umowy rezerwacyjnej"> <div class="meta-icon"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></div>
                                <div class="meta-data">
                                    <h5>{$agreements.agr_booking_no}</h5>
                                    <div class="small">z dnia {$agreements.agr_booking_date}</div>
                                    <span class="small text-muted">Numer umowy rezerwacyjnej</span>	
                                </div>
								<div style="clear:both"></div>
					</div>
				</div>
				{/if}
				{if $agreements.agr_dev_no!=''}
				<div class="meta-row">
					<div class="meta meta-default" title="Nr umowy deweloperskiej"> <div class="meta-icon"><i class="icon"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></i></div>
                                <div class="meta-data">
                                    <h5>{$agreements.agr_dev_no}</h5>
                                    <div class="small">z dnia {$agreements.agr_dev_date}</div>
                                    <span class="small text-muted">Numer umowy deweloperskiej</span>
                                </div>
								<div style="clear:both"></div>
					</div>
				</div>
				{/if}

				<div class="meta-row">
					<div class="meta meta-default meta-with-icon" title="Wartość">
                                <div class="meta-icon">
                                    <span class="glyphicon glyphicon-piggy-bank" aria-hidden="true"></span> 
                                </div>
                                <div class="meta-data">
                                    <h5>{$sum|number_format:2:".":" "} zł {$sum_price_locals}</h5>
									 <h5>{$agreements.agr_contract_value|number_format:2:".":" "} zł </h5>
                                    <span class="small text-muted">Wartość umowy</span>
                                </div>
								<div style="clear:both"></div>
					</div>
				</div>	
			<!--	<div class="meta-row">
					<div class="meta meta-default meta-with-icon" title="status">
                                <div class="meta-icon">
                                    <span class="glyphicon glyphicon-flag" aria-hidden="true"></span><i class="icon"></i>
                                </div>
                                <div class="meta-data">
                                    <h5>{if ($agreements.agr_status_id==0)} nie rozliczona {elseif ($agreements.agr_status_id==1) } rozliczona {/if}</h5>
                                    <span class="small text-muted">Status umowy</span>
                                </div>
								<div style="clear:both"></div>
					</div>
				</div>
			-->
			</div>
			<div class="col-md-4 left p-1"> 
				<div class="meta-row" id="local">
					{foreach from = $locals item = local} 
						<div class="meta meta-default" id="local-{$local.loc_id}" title="Lokal"><div class="meta-icon"><i class="glyphicon glyphicon-glyphicon-home" data-unicode="e021"></i></div>
						<div class="meta-data"><h5>nr {$local.loc_no} piętro {$local.loc_floor} / liczba pom: {$local.loc_room_qty}</h5><div class="small">powierzchnia: {$local.loc_surface} m2</div><span class="small text-muted">Lokal</span></div>
						<div style="clear:both"></div></div>
						{$sum_price_locals = $sum_price_locals + $local.loc_price_total}
				{/foreach}
				</div>
				<div class="meta-row" id="garage">
					{foreach from = $garages item = garage}							
						<div class="meta meta-default" id="garage-{$garage.gar_id}" title="Garaż"><div class="meta-icon"><i class="fa fa-car"></i></div>
						<div class="meta-data"><h5>numer {$garage.gar_no}, poziom: {$garage.gar_level}</h5><div class="small">powierzchnia: {$garage.gar_surface} m2</div><span class="small text-muted">Garaż</span></div>
						<div style="clear:both"></div></div>
					{/foreach}
				</div>
				<div class="meta-row" id="storage">
					{foreach from = $storages item = storage} 	
							<div class="meta meta-default" id="storage-{$storage.sto_id}" title="Schowek"><div class="meta-icon"><i class="fa fa-archive"></i></div>
							<div class="meta-data"><h5>numer {$storage.sto_no}, poziom {$storage.sto_level} </h5><div class="small">powierzchnia: {$storage.sto_surface} m2</div><span class="small text-muted">Schowek</span></div>
							<div style="clear:both"></div></div>
					{/foreach}
				</div>
				
				
			</div>

			<div style="clear:both"></div>
	</div>	
<br/>

{foreach from = $paylist item = pay key=k }
	{if $pay.pay_agr_id==$agreements.agr_id}
		{$paidIn = $paidIn + $pay.pay_amount} 
	{/if}
{/foreach}

{$should = $sum-$paidIn}

<p>Suma wpłat:<strong> {$paidIn|number_format:2:".":" "} zł</strong></p>
<p>Pozostało do spłacenia: <strong>{$should|number_format:2:".":" "} zł</strong></p>
<script>
	var scheduler_count= []
</script>

{$generatedSchedule}

<!--opłata rezerwacyjna {$sch|print_r} -->
{$pay_rez[0]=0}
{foreach from = $clients item = client key=k }
	{if ($rezFee[$k].pay_amount==0) }
		<button type="button" class="btn btn-secondary mb-2" data-toggle="modal" data-target="#payment_modal" data-cli_id="{$client.cli_id}" data-agr_id="{$agreements.agr_id}" data-todo="pay_rez">
		Opłata rezerwacyjna  - {$client.cli_name} {$client.cli_surname}  </button> 
		
	{else}
		{$pay_rez[$k]=$pay_rez[$k]+$rezFee[$k].pay_amount}
		<p>
			Opłata rezerwacyjna  - <strong>{$client.cli_name} {$client.cli_surname} {$rezFee[$k].pay_amount|number_format:2:".":" "} zł.</strong>
			<button type="button" class="btn btn-default btn-sm mb-1" data-toggle="modal" data-target="#payment_modal" data-todo="pay_rez_edit"
			data-pay_id="{$rezFee[$k].pay_id}" data-pay_invoice_no="{$rezFee[$k].pay_invoice_no}" data-pay_amount="{$rezFee[$k].pay_amount}" data-pay_date="{$rezFee[$k].pay_date}">
			<span class="glyphicon glyphicon-edit"></span> Edytuj</button>
		<p>
	{/if}
{/foreach}


{foreach from = $clients item = client key=k }

{if ($sch[$k].sch_cli_id==$client.cli_id)}
<h5 class="mt-4">Harmonogram spłat : {$client.cli_name} {$client.cli_surname}

	<!--\
	<button type="button" class="btn btn-default btn-sm mb-1" data-toggle="modal" data-target="#modal_scheduler_gen" data-todo="scheduler_edit"
	data-sch_id="{$sch[$k].sch_id}">
	<span class="glyphicon glyphicon-edit"></span> Zmień</button>
	-->
	
</h5>
	<div class="col-8 m-0 p-0">
		<table id="tb_scheduler{$k}" class="table table-sm compact display cell-border tb_scheduler" cellspacing="0" width="100%">
			<thead>
				<tr>
				<th class ="details-control"></th>
				<th class="th-sm">order</th>
				<th class="th-sm">termin</th>
				<th class="th-sm">kwota</th>
				<th class="th-sm">wpłacone</th>
				<th class="th-sm">pozostało</th>
				<th class="th-sm">akcja</th>			
				</tr>
			 </thead>
			 
			 <tbody>
			
			{foreach from = $sch item = scheduler}
				{if $scheduler.sch_cli_id==$client.cli_id}
					{if $scheduler.sch_order==1} 
						{$scheduler.sum_amount=$scheduler.sum_amount+$pay_rez[$k]} 
					{/if}
				<tr>
					<td class="details-control" data-id="{$scheduler.sch_id}" data-name="scheduler[{$k}]"></td>
					<td>{$scheduler.sch_order}</td>
					<td>{$scheduler.sch_date}</td>
					<td>{$scheduler.sch_base_amount|number_format:2:".":" "}</td>
					<td>{$scheduler.sum_amount|number_format:2:".":" "}</td>
					<td>{($scheduler.sch_base_amount-$scheduler.sum_amount)|number_format:2:".":" "}</td>
					<td>
						<div class="btn-group">
						
						<button type="button" class="btn  btn-sm btn-outline-secondary" {if ($scheduler.sch_base_amount-$scheduler.sum_amount<=0)} disabled {/if}
								data-toggle="modal" 
								data-target="#payment_modal"   
								data-sch_id="{$scheduler.sch_id}"
								data-agr_id="{$scheduler.sch_agr_id}"
								data-cli_id="{$scheduler.sch_cli_id}"
								data-todo="pay_sch"
								data-left="{($scheduler.sch_base_amount-$scheduler.sum_amount)|number_format:2:".":" "}">wpłata</button>
						
						  <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle dropdown-toggle-split" 
						  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" {if ($scheduler.sch_base_amount-$scheduler.sum_amount<=0)} .disabled {/if} >
							<span class="sr-only">Toggle Dropdown</span>
						  </button>
							  <div class="dropdown-menu">
								<a class="dropdown-item" 
									data-toggle="modal" 
									data-target="#modal_scheduler_gen" 
									data-sch_id="{$scheduler.sch_id}" 
									data-sch_order="{$scheduler.sch_order}"
									data-sch_date="{$scheduler.sch_date}"
									data-sch_base_amount="{$scheduler.sch_base_amount|number_format:2:".":" "}"
									data-todo="sch_edit"
									>Edytuj</a>
									
								<a class="dropdown-item" data-toggle="modal" data-target="#delete_sched_modal" 
									data-sch_id="{$scheduler.sch_id}" 
									>Usuń</a>
								<a class="dropdown-item" data-toggle="modal" data-target="#modal_scheduler_gen" 
									data-agr_id="{$scheduler.sch_agr_id}" 
									data-cli_id="{$scheduler.sch_cli_id}"
									data-sch_order="{$scheduler.sch_order}"
									data-todo="sch_add"
									>Dodaj nowy termin</a>
							  </div>
						</div>
					</td>
				</tr>
				{$generatedSchedule[$client.cli_id] = 1}
				{/if}
			{/foreach}  
			</tbody>
		</table>	
	</div>

<script>
	scheduler_count.push({$k}) 
</script>
{/if}
{/foreach}

<br/>
{foreach from = $clients item = client key=k }
	{if ($generatedSchedule[$client.cli_id]!=1)}
		<button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#modal_scheduler_gen" data-cli_id="{$client.cli_id}" data-agr_id="{$agreements.agr_id}">
		Utwórz haromonogram dla {$client.cli_name} {$client.cli_surname}</button>
	{/if}
{/foreach}

<br/>
<br/>
<br/>
	
</div>
 
{include file="footer.tpl"}