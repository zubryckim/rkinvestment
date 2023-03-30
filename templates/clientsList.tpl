{$Name="Lista klientów"}
{$target="clientsList"}
{$object="Client"}

{include file="header.tpl"}

<div class="container-fluid">
<div class="row margin">
<section>

<button type="button" class="btn btn-secondary btn-sm float-right" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj klienta</button>

<h5 class="title">{$Name}</h5>

<table id="table" class="table  table-sm table-striped table-hover table-bordered compact " cellspacing="0" width="100%">
	<thead>
		<tr>
		<th class="th-sm">nr</th>
		<th class="th-sm">imię</th>
		<th class="th-sm">nazwisko</th>
		<th class="th-sm">nazwa firmy</th>
		<th class="th-sm">ulica</th>
		<th class="th-sm">kod</th>
		<th class="th-sm">miejscowość</th>
		<th class="th-sm">numer tel</th>
		<th class="th-sm">e-mail</th>
		<th class="th-sm">NIP</th>	
		<th></th>		
		</tr>
	 </thead>
	 <tbody>
	 
	{foreach from = $lst item = lista}
		<tr>
			<td>{$lista.cli_id}</td>
			<td>{$lista.cli_name}</td>
			<td>{$lista.cli_surname}</td>
			<td>{if isset($lista.cli_company)} {$lista.cli_company} {/if}</td>
			<td>{$lista.cli_street}</td>
			<td>{$lista.cli_zip_code}</td>
			<td>{$lista.cli_locallity}</td>
			<td><p><small>{$lista.cli_phone_no}{if $lista.cli_phone_no2 != ''} / {$lista.cli_phone_no2}{/if}</p></small></td>
			<td>{$lista.cli_email}</td>
			<td>{$lista.cli_NIP}</td>
			
			<td><a href="index.php?do=set{$object}&cli_id={$lista.cli_id}" >
			<img class="icon" src="images/edit.png" title="Edytuj" alt="Edytuj" width="16" height="16" /></a>
<!--
			<a href="index.php?do=del{$object}&cli_id={$lista.cli_id}" onclick="return confirm('Czy na pewno chcesz usunac?')">
			<img class="icon" src="images/drop.png" title="Usuń" alt="Usuń" width="16" height="16" /></a>
-->
			</td>
		</tr>

	{/foreach}  
	</tbody>
</table>
<button type="button" class="btn btn-secondary" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj klienta</button>
</section>
</div>
</div>
{include file="footer.tpl"}