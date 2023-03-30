{$Name="Lista użytkowników"}
{$target="usersList"}
{$object="User"}

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
          <th class="th-sm">imie
          </th>
          <th class="th-sm">nazwisko
          </th>
          <th class="th-sm">poziom uprawnień
          </th>
		  <th></th>
		  <th></th>
		  <th></th>
        </tr>
      </thead>
	 
	  <tbody>

	{foreach from = $lista_userow item = lista}
			<tr>
			<td>{$lista.userid}</td>
			<td>{$lista.imie}</td>
			<td>{$lista.nazwisko}</td>
			<td>{if $lista.poziom==1}Użytkownik{elseif $lista.poziom==2}Administrator{/if}
			</td>
			<td><a href="index.php?do=set{$object}&userid={$lista.userid}" >
			<img class="icon" src="images/edit.png" title="Edytuj" alt="Edytuj" width="16" height="16" /></a></td>
			<td><a href="index.php?do=reset&userid={$lista.userid}">
			 <span class="glyphicon glyphicon-lock" style="color:grey" ></span></a></td>
			<td><a href="index.php?do=del{$object}&userid={$lista.userid}" onclick="return confirm('Czy na pewno chcesz usunac?')">
			<img class="icon" src="images/drop.png" title="Usuń" alt="Usuń" width="16" height="16" /></a></td>
			</tr>
	{/foreach}
	
	</tbody>
</table>
<button type="button" class="btn btn-secondary" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj użytkownika</button>
</section>
</div>
</div>
</div>
{include file="footer.tpl"}