{$Name="Lista opiekunów"}
{$object="Manager"}

{include file="header.tpl"}

<div class="container-fluid">
<div class="row margin">
<section>

<h5 class="title">{$Name}</h5>

	<table id="table" class="table table-sm compact display" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th class="th-sm">id
          </th>
          <th class="th-sm">Nazwa
          </th>
          <th class="th-sm text-center" >akcje
          </th>
        </tr>
      </thead>
	  
	  <tbody>
		{foreach from = $lst item = lista}
				<tr>
					<td>{$lista.man_id}</td>
					<td>{$lista.man_name}</td>
					<td class="text-center">
						<a href="index.php?do=setManager&man_id={$lista.man_id}" >
						<img class="icon" src="images/edit.png" title="Edytuj" alt="Edytuj" width="16" height="16" /></a>
					</td>
				</tr>
		{/foreach}
	 </tbody>
	</table> 
<button type="button" class="btn btn-secondary" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj opiekuna</button>
</section>
</div>
</div>

{include file="footer.tpl"}