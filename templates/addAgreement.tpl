{$Name="Nowa umowa"}
{$do="addAgree"}
{$target="agreementsList"}

{$classButton_Block='class="btn btn-secondary btn-sm btn-block rounded-0 mt-0"'}
{$classButton='class="btn btn-outline-secondary mt-2"'}
	{$client_class=$classButton}
	{$locals_class=$classButton}
	{$garages_class=$classButton}
	{$storages_class=$classButton}


{if isset($value)}
	
{elseif isset($edit)}
		{$Name="Edycja umowy"}
		{$do="editAgree"}		

		
		{if $clients|@count >0}
			{$client_class=$classButton_Block}
		{else}
			{$client_class=$classButton}
		{/if}
		
		{if $locals|@count >0}
			{$locals_class=$classButton_Block}
		{else}
			{$locals_class=$classButton}
		{/if}
		
		{if $garages|@count >0}
			{$garages_class=$classButton_Block}
		{else}
			{$garages_class=$classButton}
		{/if}
		
		{if $storages|@count >0}
			{$storages_class=$classButton_Block}
		{else}
			{$storages_class=$classButton}
		{/if}
{else}
	
{/if}


{include file="header.tpl"}	
{include file='modal_new_client.tpl'}
{include file='modal_search_client.tpl'}
{include file='modal_search_local.tpl'}
{include file='modal_search_garage.tpl'}
{include file='modal_search_storage.tpl'}



<div class="container-fluid">

<button type="button" class="btn btn-secondary btn-sm mt-4 " onclick="window.location.href='index.php?do={$target}'" >< Wstecz</button>

    <h5 class="mt-4">{$Name}</h5>

	<form action="index.php?do={$do}" method="post" class="addForm" id="addAgreement" >
	
	<div class="bd col-md-6">
	
		
	<!--
		<div class="form-row">	
			<div class="form-group col-md-4">
			<div class="form-check">
			  <input class="form-check-input" type="radio" name="checkAgreement" id="checkAgreement1" value="1" checked>
			  <label class="form-check-label" for="checkAgreement1">
				Umowa rezerwacyjna
			  </label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="radio" name="checkAgreement" id="checkAgreement2" value="2">
			  <label class="form-check-label" for="checkAgreement2">
				Umowa deweloperska
			  </label>
			</div>
			</div>
		</div>
	-->	
		<div class="form-row" id="rez_agr">
			<div class="form-group col-md-4">		
				<label for="agr_booking_date">data umowy rezerwacyjnej</label>
				<div id="sandbox-container">
					<input type="text" class="form-control datepicker" name="agr_booking_date" id="agr_booking_date"  autocomplete="off" value="{$value.agr_booking_date}{$edit.agr_booking_date}"/>{$blad.agr_booking_date}
				</div>
			</div>	
			<div class="form-group col-md-4">		
					<label for="agr_booking_no">numer umowy rezerwacyjnej</label>
					<input type="text" class="form-control" name="agr_booking_no" id="agr_booking_no" autocomplete="off" value="{$value.agr_booking_no}{$edit.agr_booking_no}" />{$blad.agr_booking_no}
			</div>
			<!--
				<div class="form-group col-md-4">		
						<label for="agr_booking_deposit">wpłata rezerwacyjna</label>
						<input type="text" class="form-control" name="agr_booking_deposit" id="agr_booking_deposit" value="{$value.agr_booking_deposit}{$edit.agr_booking_deposit}"
						data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'digits': 2, 'digitsOptional': false, 'suffix': ' zł', 'placeholder': '0'" />
				</div>
			-->
			
		</div>	

		<div class="form-row" id="dev_agr"> <!--style="display:none">-->
			<div class="form-group col-md-4">		
				<label for="agr_dev_date">data umowy deweloperskiej</label>
				<div id="sandbox-container">
					<input type="text" class="form-control datepicker" name="agr_dev_date" id="agr_dev_date" autocomplete="off" value="{$value.agr_dev_date}{$edit.agr_dev_date}"/>{$blad.agr_dev_date}
				</div>
			</div>	
			<div class="form-group col-md-4">		
					<label for="agr_dev_no">numer umowy deweloperskiej</label>
					<input type="text" class="form-control" name="agr_dev_no" id="agr_dev_no" autocomplete="off" value="{$value.agr_dev_no}{$edit.agr_dev_no}"/>{$blad.agr_dev_no}
			</div>	
		</div>	

		<div class="form-row" >
			<div class="form-group col-md-8">
				<label for="agr_comments">uwagi</label>
				<textarea class="form-control" id="agr_comments" name="agr_comments" rows="3" autocomplete="off" >{$value.agr_comments}{$edit.agr_comments}</textarea>
			</div>
		</div>
		
		<div class="meta-row" id="client">
		{foreach from = $clients item = client}
					<div class="meta meta-default" id="client-{$client.cli_id}" title="Klient"><div class="meta-icon"><i class="glyphicon glyphicon-glyphicon-user" data-unicode="e008"></i></div>
					<div class="meta-data"><h5>{$client.cli_name} {$client.cli_surname}</h5><div class="small">tel: {$client.cli_phone_no}{if $client.cli_phone_no2 != ''} / {$client.cli_phone_no2}{/if}</div><span class="small text-muted">Klient</span></div>
					<button type="button" data-id="{$client.cli_id}" data-target="client"  data-action="del" class="close" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
					<div style="clear:both"></div></div>
		{/foreach}
		</div>
		
		<div class="meta-row">
			<div class="form-group col-md-12 p-0 m-0">
					<button type="button"  {$client_class} data-toggle="modal" data-target="#modal_search_client" id="btn-addClient" >
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>klient</button>
					<button type="button"  {$client_class} data-toggle="modal" data-target="#modal_new_client" id="btn-newClient" >
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>nowy klient</button>
			</div>
		</div>		
		
		<div class="meta-row" id="local">
			{foreach from = $locals item = local} 
					<div class="meta meta-default" id="local-{$local.loc_id}" title="Local"><div class="meta-icon"><i class="glyphicon glyphicon-glyphicon-home" data-unicode="e021"></i></div>
					<div class="meta-data"><h5>Lokal nr {$local.loc_no} piętro {$local.loc_floor} / liczba pomieszczeń: {$local.loc_room_qty}</h5><div class="small">powierzchnia: {$local.loc_surface} m2</div><span class="small text-muted">Lokal</span></div>
					<button type="button" data-id="{$local.loc_id}" data-target="local"  data-action="del" class="close" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
					<div style="clear:both"></div></div>
			{/foreach}
		</div>
		
		<div class="form-group col-md-12 p-0 m-0">
			<div class="meta-row">
				<button type="button" {$locals_class} data-toggle="modal" data-target="#modal_search_local" id="btn-addLocal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>lokal</button>
			</div>	
		</div>
		
		<div class="meta-row" id="garage">
			{foreach from = $garages item = garage}							
				<div class="meta meta-default" id="garage-{$garage.gar_id}" title="Garage"><div class="meta-icon"><i class="fa fa-car"></i></div>
				<div class="meta-data"><h5>numer {$garage.gar_no}, poziom: {$garage.gar_level}</h5><div class="small">powierzchnia: {$garage.gar_surface} m2</div><span class="small text-muted">Garaż</span></div>
				<button type="button" data-id="{$garage.gar_id}" data-target="garage"  data-action="del" class="close" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
				<div style="clear:both"></div></div>
			{/foreach}
		</div>

		<div class="form-group col-md-12 p-0 m-0">
			<div class="meta-row">
				<button type="button" {$garages_class} data-toggle="modal" data-target="#modal_search_garage" id="btn-addGarage">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>garaż</button>
			</div>
		</div>
		
		<div class="meta-row" id="storage">
			{foreach from = $storages item = storage} 	
					<div class="meta meta-default" id="storage-{$storage.sto_id}" title="Storage"><div class="meta-icon"><i class="fa fa-archive"></i></div>
					<div class="meta-data"><h5>numer {$storage.sto_no}, poziom {$storage.sto_level} </h5><div class="small">powierzchnia: {$storage.sto_surface} m2</div><span class="small text-muted">Garaż</span></div>
					<button type="button" data-id="{$storage.sto_id}" data-target="storage" data-action="del" class="close" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
					<div style="clear:both"></div></div>
			{/foreach}
		</div>

		<div class="form-group col-md-12 p-0 m-0">
			<div class="meta-row">
				<button type="button" {$storages_class}  data-toggle="modal" data-target="#modal_search_storage" id="btn-addStorage">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>schowek</button>
			</div>	
		</div>
		<div class="meta-row mt-3 mb-3">
			<div class="pull-right ">		
				<input type="button" class="btn btn-secondary"  onclick='location.href="?do=agreementsList"' value='Anuluj'/>
				{if isset($edit)} <input type="hidden" name="agr_id" value="{$edit.agr_id}">{/if}
				<input type="submit" class="btn btn-primary" value="Zapisz"/>	
			</div>
		</div>
	
	{if isset($log)}
		<div class="alert alert-primary" role="alert">{$log}</div>
	{/if}
	
	</div>	
	<div class="col-md-6" style="height:50px" ></div>
	</form>
</div>

{include file="footer.tpl"}