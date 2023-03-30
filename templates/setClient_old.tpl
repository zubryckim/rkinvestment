{$do="addClient"}

{if isset($value)}
	{$Name="Dodawanie klienta"}
	{$do="addClient"}
{elseif isset($edit)}
	{$Name="Edycja klienta"}
	{$do="setClient"}
{/if}




{include file="header.tpl"}
<h5 class="title">{$Name}</h5>

<form action="index.php?do=editClient" method="post">
<table class="ewTable"><tr class="ewTableHeader">
{foreach from = $lst item = value}
	<td valign="top">imię</td><td><input type=text name="cli_name" value="{$value.cli_name}">{$blad.cli_name}</td></tr><tr>
	<td valign="top">nazwisko</td><td><input type=text name="cli_surname" value="{$value.cli_surname}">{$blad.cli_surname}</td></tr><tr>	
	<td valign="top">ulica</td><td><input type=text name="cli_street" value="{$value.cli_street}">{$blad.cli_street}</td></tr><tr>
 	<td valign="top">kod pocztowy</td><td><input type=text name="cli_zip_code" value="{$value.cli_zip_code}">{$blad.cli_zip_code}</td></tr><tr>
	<td valign="top">miejscowość</td><td><input type=text name="cli_locallity" value="{$value.cli_locallity}">{$blad.cli_locallity}</td></tr><tr>
	<td valign="top">telefon</td><td><input type=text name="cli_phone_no" value="{$value.cli_phone_no}">{$blad.cli_phone_no}</td></tr><tr>
	<td valign="top">telefon 2</td><td><input type=text name="cli_phone_no2" value="{$value.cli_phone_no2}">{$blad.cli_phone_no2}</td></tr><tr>
	<td valign="top">e-mail</td><td><input type=text name="cli_email" value="{$value.cli_email}">{$blad.cli_email}</td></tr><tr>
	<td valign="top">NIP</td><td><input type=text name="cli_NIP" value="{$value.cli_NIP}">{$blad.cli_NIP}</td></tr><tr>
	<td>
{/foreach}
		</td></tr>
	<tr>
	<td valign="top" colspan="3">
	<input type="hidden" name="cli_id" value="{$value.cli_id}">
	<input type="button" class="button" onclick='location.href="?do=clientsList"' value='Anuluj'/>
	<input type="submit" value="Zapisz"> 
 	</tr>

</table>

	
</form>

{include file="footer.tpl"}