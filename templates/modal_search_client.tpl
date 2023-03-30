<!-- Modal CLIENT -->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable" id="modal_search_client" tabindex="1" role="dialog" aria-labelledby="1" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="">Klienci</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  
	  <form action="index.php?" id="form_modal_search_client" method="post" >
	  <div class="modal-body">
		
			<table id="table_search_client" class="table table-sm table-striped table-hover table-bordered compact display table_search" cellspacing="0" width="100%" >
				<thead>
					<tr>
					<th class="th-sm">imię</th>
					<th class="th-sm">nazwisko</th>
					<th class="th-sm">numer tel</th>
					<th class="th-sm">e-mail</th>
					<th class="th-sm">NIP</th>	
					<th class="th-sm"></th>		
					</tr>
				 </thead>
				 <tbody>
		 
				{foreach from = $client_lst item = lista}
					<tr>
						<td>{$lista.cli_name}</td>
						<td>{$lista.cli_surname}</td>
						<td>{$lista.cli_phone_no}{if $lista.cli_phone_no2 != ''} / {$lista.cli_phone_no2}{/if}</td>
						<td>{$lista.cli_email}</td>
						<td>{$lista.cli_NIP}</td>
						<td><button type="button" class="btn btn-outline-secondary btn-sm"
							data-id="{$lista.cli_id}" 
							data-name="{$lista.cli_name} {$lista.cli_surname}" 
							data-phone="{$lista.cli_phone_no}{if $lista.cli_phone_no2 != ''} / {$lista.cli_phone_no2}{/if}">wybierz</button>
						</td>
					</tr>

				{/foreach}  
				</tbody>
			</table>
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button> 
      </div>
	  </form>
    
	</div>
  </div>
</div>