{$Name="Nowa umowa"}
{$do="addAgree"}

{if isset($value)}
	{$bro=$value.agr_bro_id}
	{$agr_cli_id=$value.agr_cli_id}
	{$agr_loc_id=$value.agr_cli_id}
	{$agr_gar_id=$value.agr_cli_id}
	
{elseif isset($edit)}
		{$Name="Edycja umowy"}
		{$do="editAgree"}
		{$bro=$edit.bro_id}
		{assign var="todaysdate" value="{$cYear}{'-'}{$cMonth}{'-'}{$days_date}"}
		{$value.agr_cli_name = "{$edit.cli_name}{' '}{$edit.cli_surname}" }
		{$agr_cli_id=$edit.cli_id}
		{$agr_loc_id=$edit.loc_id}
		{$agr_gar_id=$edit.gar_id}
{/if}
		
{include file="header.tpl"}	

<!-- Modal -->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="exampleModalLabel">Nowy klient</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <div class="modal-body">
			<form action="index.php?" method="post" >
				<div class="bd col-md-12">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="cli_name">imię</label>
							<input required="required" type="search" class="form-control aria-label " name="cli_name" id="cli_name" value="{$value.cli_name}{$edit.cli_name}" />{$blad.cli_name}
						</div>	
						<div class="form-group col-md-6">
							<label for="cli_surname">nazwisko</label>
							<input required="required" type="search" class="form-control aria-label " name="cli_surname" id="cli_surname" value="{$value.cli_surname}{$edit.cli_surname}" />{$blad.cli_surname}
						</div>	
					</div>
					<div class="form-row">
						<div class="form-group col-md-12">
							<label for="cli_street">ulica</label>
							<input required="required" type="search" class="form-control aria-label " name="cli_street" id="cli_street" value="{$value.cli_street}{$edit.cli_street}" />{$blad.cli_street}
						</div>
					</div>	
					
					<div class="form-row">			
						<div class="form-group col-md-3">
							<label for="cli_zip_code">kod pocztowy</label>
							<input required="required" type="search" class="form-control aria-label " name="cli_zip_code" id="cli_zip_code" value="{$value.cli_zip_code}{$edit.cli_zip_code}" />{$blad.cli_zip_code}
						</div>	
						<div class="form-group col-md-9">
							<label for="cli_locallity">miejscowość</label>
							<input required="required" type="search" class="form-control aria-label " name="cli_locallity" id="cli_locallity" value="{$value.cli_locallity}{$edit.cli_locallity}" />{$blad.cli_locallity}
						</div>	
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="cli_phone_no">telefon</label>
							<input required="required" type="search" class="form-control aria-label " name="cli_phone_no" id="cli_phone_no" value="{$value.cli_phone_no}{$edit.cli_phone_no}" />{$blad.cli_phone_no}
						</div>	
						<div class="form-group col-md-6">
							<label for="cli_phone_no2">telefon 2</label>
							<input type="search" class="form-control aria-label " name="cli_phone_no2" id="cli_phone_no2" value="{$value.cli_phone_no2}{$edit.cli_phone_no2}" />{$blad.cli_phone_no2}
						</div>	
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="cli_email">e-mail</label>
							<input type="search" class="form-control aria-label " name="cli_email" id="cli_email" value="{$value.cli_email}{$edit.cli_email}" />{$blad.cli_email}
						</div>	
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="cli_NIP">NIP</label>
							<input type="search" class="form-control aria-label " name="cli_NIP" id="cli_NIP" value="{$value.cli_NIP}{$edit.cli_NIP}" />{$blad.cli_NIP}
						</div>	
					</div>			
					<input type="hidden" id="cli_id" name="cli_id"  value="{$edit.cli_id}" />
				</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button>
        <button type="button" class="btn btn-primary">Zapisz</button>
      </div>

    
	</div>
  </div>
</div>


<div class="container-fluid">

    <h5 class="mt-4">{$Name}</h5>

	<form action="index.php?do={$do}" method="post" class="addForm" >
	
	<!--<legend>Nowa umowa</legend>-->
	
	<div class="bd col-md-6">
	
		<div class="form-row">
			<div class ="form-group col-md-12">
				<label for="agr_cli_name">klient</label>
				<div class="input-group mb-3">
					<input required="required"  type="text" class="form-control" name="agr_cli_name" id="agr_cli_name" value="{$value.agr_cli_name}" placeholder="Wyszukaj..."  />
					<div class="input-group-append">
						<button type="button" class="btn btn-outline-secondary"  data-toggle="modal" data-target="#exampleModal">Nowy klient</button>
					</div>
				</div>
		</div>
			
		</div>				
		<div class="form-row">	
			<div class="form-group col-md-4">
				<label for="agr_inv_id">inwestycja</label>
				<select class="form-control" id="agr_inv_id" name="agr_inv_id">
				{html_options options=$inv_lst selected=$edit.inv_id}
				</select>
			</div>
			<div class="form-group col-md-4">	
				<label for="agr_loc_no">lokal</label>
				<input type="text" class="form-control" name="agr_loc_no" id="agr_loc_no" value="{$value.agr_loc_no}{$edit.loc_no}" placeholder="Wyszukaj..." />{$blad.agr_loc_no}
			</div>
			<div class="form-group col-md-4">			
				<label for="agr_gar_no">garaż</label>
				<input type="text" class="form-control" name="agr_gar_no" id="agr_gar_no" value="{$value.agr_gar_no}{$edit.gar_no}" placeholder="Wyszukaj..." />{$blad.agr_gar_no}
			</div>
		</div>
		
		<div class="form-row">	
			<div class="form-group col-md-4">		
				<label for="agr_no">numer umowy</label>
				<input type="text" class="form-control" name="agr_no" id="agr_no" value="{$value.agr_no}{$edit.agr_no}"/>{$blad.agr_no}
			</div>	
			<div class="form-group col-md-4">		
				<label for="agr_date">data umowy</label>
				<div id="sandbox-container">
					<input type="text" class="form-control datepicker" name="agr_date" id="agr_date" value="{$value.agr_date}{$edit.agr_date}"/>{$blad.agr_date}
				</div>
			</div>				
			<div class="form-group col-md-4">	
				<label for="agr_notarial_act">akt notarialny</label>
				<input type="text" class="form-control" name="agr_notarial_act" id="agr_notarial_act" value="{$value.agr_notarial_act}{$edit.agr_notarial_act}"  />{$blad.agr_notarial_act}
			</div>
		</div>	
			
		<div class="form-row">		
			<div class="form-group col-md-12">	
				<label for="agr_bro_id">broker</label>
				<select class="form-control" id="agr_bro_id" name="agr_bro_id">
				{html_options options=$bro_lst selected=$bro}
				</select>
			</div>
		</div>
		
		<div>		
			<input type="button" class="btn btn-secondary"  onclick='location.href="?do=agreementsList"' value='Anuluj'/>
			<input type="hidden" id="agr_cli_id" name="agr_cli_id"  value="{$agr_cli_id}" />
			<input type="hidden" id="agr_loc_id" name="agr_loc_id"  value="{$agr_loc_id}" />
			<input type="hidden" id="agr_gar_id" name="agr_gar_id"  value="{$agr_gar_id}" />
			<input type="hidden" id="agr_id" name="agr_id"  value="{$edit.agr_id}" />
			<input type="submit" class="btn btn-primary" value="Zapisz"/>	
		</div>
		
	</div>
	{if isset($log)}
		<div class="alert alert-primary" role="alert">{$log}</div>
	{/if}	
	</form>
</div>

{include file="footer.tpl"}