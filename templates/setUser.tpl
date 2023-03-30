{$do="addUser"}
{$Name="Dodawanie użytkownika"}

{if isset($value)}
	{$Name="Dodawanie użytkownika"}
	{$do="addUser"}
{elseif isset($edit)}
	{$Name="Edycja użytkownika"}
	{$do="setUser"}
{/if}

{include file="header.tpl"}

<div class="container-fluid">

    <h5 class="mt-4">{$Name}</h5>

	<form action="index.php?do={$do}" method="post" >
		<div class="bd col-md-4">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="userid">użytkownik</label>
					<input required="required" type="search" {if isset($edit)} disabled {/if} class="form-control aria-label " name="userid" id="userid" value="{$value.userid}{$edit.userid}" />{$blad.userid}
				</div>	
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="imie">imie</label>
					<input required="required" type="search" class="form-control aria-label " name="imie" id="imie" value="{$value.imie}{$edit.imie}" />{$blad.imie}
				</div>	
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="nazwisko">nazwisko</label>
					<input required="required" type="search" class="form-control aria-label " name="nazwisko" id="nazwisko" value="{$value.nazwisko}{$edit.nazwisko}" />{$blad.nazwisko}
				</div>	
			</div>
			{if !isset($smarty.get.userid)}
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="pass">hasło</label>
					<input required="required" type="password" class="form-control aria-label " name="pass" id="pass" value="{$pass}" />{$blad.pass}
				</div>	
			</div>
			{/if}
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="bro_name">poziom uprawnień</label>
					<select class="form-control aria-label " name="poziom" id="poziom">
						<option value="1" {if $edit.poziom==1} selected {/if} >Użytkownik</option>
			`			<option value="2" {if $edit.poziom==2} selected {/if}>Administrator</option>
					</select>
				</div>	
			</div>
			<div>		
				<input type="button" class="btn btn-secondary"  onclick='location.href="?do=usersList"' value='Anuluj'/>
				{if isset($edit)}<input type="hidden" id="userid" name="userid"  value="{$edit.userid}" />{/if}
				<input type="submit" class="btn btn-primary" value="Zapisz"/>	
			</div>
		</div>
	</form>
	
</div>

{include file="footer.tpl"}