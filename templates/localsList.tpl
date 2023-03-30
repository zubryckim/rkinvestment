{$Name="Lista lokali"}
{$Name="{$Name}{' - '}{$smarty.session.inv_name}"}
{$target="localsList"}
{$object="Local"}

{include file="header.tpl"}

<div class="container-fluid">
<div class="row margin">
<section>
<button type="button" class="btn btn-secondary btn-sm float-right" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj lokal</button>

<h5 class="title">{$Name}</h5>

    <table id="table_list" class="table table-sm table-striped table-hover table-bordered compact" cellspacing="0" width="800px">
      <thead>
        <tr>
         <!-- <th class="th-sm">id
          </th>-->
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
		  <th class="th-sm">nr umowy
          </th>	
		  <th class="th-sm">ogród
          </th>
		  <th class="th-sm">cena za m2
          </th>
		  <th class="th-sm">cena za całość
          </th>	  
 
		  <th></th>
        </tr>
    </thead>
	<tbody>
		{foreach from = $lst item = lista}
				<tr {if $lista.loc_agr_id!=0} class="selected"{/if}> 
					<!--<td>{$lista.loc_id}</td>-->
					<td>{$lista.loc_no}</td>
					<td>{$lista.loc_floor}</td>
					<td>{$lista.loc_room_qty}</td>
					<td>{$lista.loc_surface} m2</td>
					<td>{$lista.loc_balcony} m2</td>
					<td>{if $lista.loc_agr_id==0}wolne{/if}</td>
					{if $lista.loc_garden==0}
						<td>-</td>
					{else}
						<td>{$lista.loc_garden} m2</td>
					{/if}
					<td>{$lista.loc_price_1m2|number_format:2:".":" "} zł</td>
					<td>{$lista.loc_price_total|number_format:2:".":" "} zł</td>
					
					
					<td><a href="index.php?do=set{$object}&loc_id={$lista.loc_id}" >
					<img class="icon" src="images/edit.png" title="Edytuj" alt="Edytuj" width="16" height="16" /></a></td>
					<!--<td><a href="index.php?do=del{$object}&loc_id={$lista.loc_id}" onclick="return confirm('Czy na pewno chcesz usunać?')">
					<img class="icon" src="images/drop.png" title="Usuń" alt="Usuń" width="16" height="16" /></a></td>
					-->
				</tr>
		{/foreach}
	</tbody>
		
</table>
<button type="button" class="btn btn-secondary" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj lokal</button>
</section>
</div>
</div>
{include file="footer.tpl"}