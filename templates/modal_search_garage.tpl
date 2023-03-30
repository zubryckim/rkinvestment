<!-- Modal GARAGE-->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable" id="modal_search_garage" tabindex="-1" role="dialog" aria-labelledby="3" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="">Garaże/miejsca postojowe</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <form action="index.php?" id="form_modal_search_garage" method="post" >
	  <div class="modal-body">
			
			<table id="table_search_garage" class="table table-sm table-striped table-hover table-bordered compact table_search" cellspacing="0" width="100%">
				<thead>
					<tr>
					  <th class="th-sm">numer
					  </th>
					  <th class="th-sm">poziom
					  </th>
					  <th class="th-sm">powierzchnia
					  </th>
					  <th class="th-sm">suma
					  </th>
					  <th class="th-sm">przynależny schowek
					  </th>
					  <th></th>
					</tr>
				</thead>
				<tbody>
					{foreach from = $garage_lst item = lista}
						<tr {if $lista.gar_sto_no!=0} class="linked" {/if}>
							<td>{$lista.gar_no}</td>
							<td>{$lista.gar_level}</td>
							<td>{$lista.gar_surface}</td>
							<td>{$lista.gar_price_total}</td>
							<td>{if $lista.gar_sto_no!=0}{$lista.gar_sto_no}{/if}</td>
							<td><button type="button" class="btn btn-outline-secondary btn-sm"
								data-id="{$lista.gar_id}" 
								data-name="numer {$lista.gar_no}, poziom: {$lista.gar_level}" 
								data-details="powierzchnia: {$lista.gar_surface} m2">wybierz</button>
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