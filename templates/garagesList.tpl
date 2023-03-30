{$Name="Lista garaży"}
{$Name="{$Name}{' - '}{$smarty.session.inv_name}"}
{$target="garagesList"}
{$object="Garage"}

{include file="header.tpl"}
<div class="container-fluid">
<div class="row margin">
<section>
<button type="button" class="btn btn-secondary btn-sm float-right" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj garaż</button>

<h5 class="title">{$Name}</h5>
<table id="table_list" class="table table-sm table-striped table-hover table-bordered compact" cellspacing="0" width="800px">
    <thead>
        <tr>
          <th class="th-sm">numer
          </th>
          <th class="th-sm">poziom
          </th>
          <th class="th-sm">powierzchnia
          </th>
		  <th class="th-sm">cena za m2
          </th>
          <th class="th-sm">suma
          </th>
		  <th></th> 
		  <th class="th-sm">przynależny schowek
          </th>
		  <th></th>
        </tr>
    </thead>
	<tbody>
		{foreach from = $lst item = lista}
			<tr {if $lista.gar_agr_id!=0} class="selected" {/if}>
				<td>{$lista.gar_no}</td>
				<td>{$lista.gar_level}</td>
				<td>{$lista.gar_surface}</td>
				<td>{if isset($lista.gar_price)}{$lista.gar_price}{/if}</td>
				<td>{$lista.gar_price_total}</td>
				<td>{if $lista.gar_agr_id==0}wolne{/if}</td>
				<td>{if $lista.gar_sto_no!=0}{$lista.gar_sto_no}{/if}</td>
				<td>
					<a href="index.php?do=set{$object}&gar_id={$lista.gar_id}" >
					<img class="icon" src="images/edit.png" title="Edytuj" alt="Edytuj" width="16" height="16" /></a>
				</td>
				<!--<a href="index.php?do=del{$object}&agr_id={$lista.gar_id}" onclick="return confirm('Czy na pewno chcesz usunać?')">
				<img class="icon" src="images/drop.png" title="Usuń" alt="Usuń" width="16" height="16" /></a></td>
				-->
			</tr>
		{/foreach}	
	</tbody>
</table>
<button type="button" class="btn btn-secondary" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj garaż</button>
</section>
</div>
</div>
{include file="footer.tpl"}