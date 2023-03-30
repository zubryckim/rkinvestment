<!-- Modal FORM-->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable-handle" id="modal_new_client" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="title_payment_modal">Nowy klient</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span> 
        </button>
      </div>
	  <form action="index.php" id="form_modal_new_client" method="post" >
	  <div class="modal-body">
		
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
				<div class="form-group col-md-6">
					<label for="cli_manager">opiekun</label>
						<select class="form-control aria-label" id="cli_manager" name="cli_manager">
						{html_options options=$man selected=$edit.cli_man_id}
						</select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="cli_NIP">NIP</label>
					<input type="search" class="form-control aria-label " name="cli_NIP" id="cli_NIP" value="{$value.cli_NIP}{$edit.cli_NIP}" />{$blad.cli_NIP}
				</div>	
			</div>	
				<input type="hidden" name="todo"  value="newClient" />			
		</div>
      </div>
	  
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button>
		<button type="submit" class="btn btn-primary">Zapisz</button>    
      </div>
	  
	  </form>
    
	</div>
  </div>
</div>