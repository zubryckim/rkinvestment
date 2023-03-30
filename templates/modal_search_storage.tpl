<!-- Modal STORAGE-->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable" id="modal_search_storage" tabindex="-1" role="dialog" aria-labelledby="4" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="">Schowki/piwnice</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <form action="index.php?" id="modal_search_storage" method="post" >
	  <div class="modal-body">
			
			<table id="table_search_storage" class="table table-sm table-striped table-hover table-bordered compact table_search" cellspacing="0" width="100%">
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
					  <th class="th-sm">przynależne miejsce
					  </th>
					  <th></th>
					</tr>
				</thead> 
				<tbody>
					{foreach from = $storage_lst item = lista}
					<tr {if $lista.sto_gar_no!=0} class="linked" {/if}>
							<td>{$lista.sto_no}</td>
							<td>{$lista.sto_level}</td>
							<td>{$lista.sto_surface}</td>
							<td>{$lista.sto_price_total}</td>
							<td>{$lista.sto_gar_no}</td>
							<td><button type="button" class="btn btn-outline-secondary btn-sm"  
								data-id="{$lista.sto_id}" 
								data-name="numer {$lista.sto_no}, poziom {$lista.sto_level}" 
								data-details="powierzchnia: {$lista.sto_surface} m2">wybierz</button>
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