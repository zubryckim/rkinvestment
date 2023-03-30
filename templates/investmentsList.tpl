{$Name="Lista inwestycji"}
{$target="investmentsList"}
{$object="Investment"}

{include file="header.tpl"}

<div class="container-fluid">
<div class="row margin">
<section>

<h5 class="title">{$Name}</h5>

    <table id="table" class="table table-sm compact display" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th class="th-sm">numer
          </th>
          <th class="th-sm">nazwa
          </th>
          <th class="th-sm">kolejność
          </th>
		  <th></th>
		  <th></th>
        </tr>
      </thead>
	 
	  <tbody>
		{foreach from = $lst item = lista}
				<tr>
				<td>{$lista.inv_id}</td>
				<td>{$lista.inv_name}</td>
				<td>{$lista.inv_order}</td>
				
				<td><a href="index.php?do=setInvestment&inv_id={$lista.inv_id}" >
				<img class="icon" src="images/edit.png" title="Edytuj" alt="Edytuj" width="16" height="16" /></a></td>
				<td><a href="index.php?do=delInvestment&inv_id={$lista.inv_id}" onclick="return confirm('Czy na pewno chcesz usunać?')">
				<img class="icon" src="images/drop.png" title="Usuń" alt="Usuń" width="16" height="16" /></a></td>
				</tr>
		{/foreach}
	  </tbody>
	</table>
<button type="button" class="btn btn-secondary" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj inwestycję</button>

</section>
</div>
</div>
{include file="footer.tpl"}