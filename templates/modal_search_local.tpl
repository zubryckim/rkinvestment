<!-- Modal LOCAL-->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable" id="modal_search_local" tabindex="-1" role="dialog" aria-labelledby="2" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="">Lokale</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <form action="index.php?" id="form_modal_search_local" method="post" >
	  <div class="modal-body">

		<table id="table_search_local" class="table table-sm table-striped table-hover table-bordered compact table_search" cellspacing="0" width="100%">
			  <thead>
				<tr>
				  <th class="th-sm">numer
				  </th>
				  <th class="th-sm">piętro
				  </th>
				  <th class="th-sm">ilość pokoi
				  </th>
				  <th class="th-sm">pow m2
				  </th>
				  <th class="th-sm">balkon
				  </th>
				  <th class="th-sm">ogród
				  </th>
				  <th class="th-sm">cena za m2
				  </th>
				  <th class="th-sm">cena za całość
				  </th>	  
				  <th class="th-sm"></th>	 
				</tr>
			</thead>
			<tbody>
				{foreach from = $local_lst item = lista}
						<tr>
							<td>{$lista.loc_no}</td>
							<td>{$lista.loc_floor}</td>
							<td>{$lista.loc_room_qty}</td>
							<td>{$lista.loc_surface} m2</td>
							<td>{$lista.loc_balcony} m2</td>
							{if $lista.loc_garden==0}
								<td>-</td>
							{else}
								<td>{$lista.loc_garden} m2</td>
							{/if}
							<td>{$lista.loc_price_1m2|number_format:2:".":" "} zł</td>
							<td>{$lista.loc_price_total|number_format:2:".":" "} zł</td>
							
							<td><button type="button" class="btn btn-outline-secondary btn-sm"
								data-id="{$lista.loc_id}" 
								data-name="Lokal nr {$lista.loc_no} piętro {$lista.loc_floor} / liczba pomieszczeń: {$lista.loc_room_qty}" 
								data-details="powierzchnia: {$lista.loc_surface} m2">wybierz</button>
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