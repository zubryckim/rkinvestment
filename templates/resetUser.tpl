{$do='reset'}
{$Name='Zmiana hasła'}
{include file="header.tpl"}

<div class="container-fluid">

    <h5 class="mt-4">{$Name}: </h5> 
	<h6>Użytkownik: {$smarty.get.userid}</h6>

	<form action="index.php?do={$do}" method="post" >
		<div class="bd col-md-4">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="pass">Podaj nowe hasło: {$blad.pass}</label>
					<input required="required" type="search" class="form-control aria-label " name="pass" id="pass" value="{$value.pass}{$edit.pass}" />{$blad.pass}
				</div>	
			</div>

			
			<div>		
				<input type="button" class="btn btn-secondary"  onclick='location.href="?do=usersList"' value='Anuluj'/>
				<input type="hidden" id="reset" name="reset"  value="{$smarty.get.userid}" />
				<input type="submit" class="btn btn-primary" value="Zapisz"/>	
			</div>
		</div>
	</form>
</div>


{include file="footer.tpl"}