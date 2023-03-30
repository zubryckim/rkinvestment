{$Name="Lista schowków"}
{$Name="{$Name}{' - '}{$smarty.session.inv_name}"}
{$target="storagesList"}
{$object="Storage"}

{include file="header.tpl"}
<div class="container-fluid">
<div class="row margin" width="100%">
<section>
<button type="button" class="btn btn-secondary btn-sm float-right" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj schowek</button>

<h5 class="title">{$Name}</h5>

<table id="table_list" class="table table-sm table-striped table-hover table-bordered compact" cellspacing="0" width="800px">
    <thead>
        <tr>
          <!--<th class="th-sm">lp
          </th>
          <th class="th-sm">inwestycja
          </th>-->
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
		  <th class="th-sm">nr umowy
          </th>
		  <th class="th-sm">przynależne miejsce
          </th>
		  <th></th>
        </tr>
    </thead>
	<tbody>
		{foreach from = $lst item = lista}
			<tr {if $lista.sto_agr_id!=0} class="selected" {/if}>
				<!--<td>{$lista.gar_id}</td>
				<td>{$lista.inv_name}</td>-->
				<td>{$lista.sto_no}</td>
				<td>{$lista.sto_level}</td>
				<td>{$lista.sto_surface}</td>
				<td>{$lista.sto_price}</td>
				<td>{$lista.sto_price_total}</td>
				<td>{if $lista.sto_agr_id==0}wolne{/if}</td>
				<td>{if $lista.sto_gar_no!=0}{$lista.sto_gar_no}{/if}</td>
				<td>
					<a href="index.php?do=set{$object}&gar_id={$lista.gar_id}" >
					<img class="icon" src="images/edit.png" title="Edytuj" alt="Edytuj" width="16" height="16" /></a>
				</td>
				<!--
				<td><a href="index.php?do=del{$object}&agr_id={$lista.gar_id}" onclick="return confirm('Czy na pewno chcesz usunać?')">
				<img class="icon" src="images/drop.png" title="Usuń" alt="Usuń" width="16" height="16" /></a></td>
				-->
			</tr>
		{/foreach}	
	</tbody>
</table>
<button type="button" class="btn btn-secondary" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj schowek</button>
</section>
</div>
</div>
{include file="footer.tpl"}