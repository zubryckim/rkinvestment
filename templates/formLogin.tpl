{$Name="Logowanie"}

{* formLogin.tpl *}

{include file="header.tpl" title=START Name='Logowanie użytkownika'}

<div class="container-fluid">

   <h5 class="title">{$Name}</h5>
   
	<form action="index.php?do=zaloguj" method=post>
		<div class="form-group row margin">
		<fieldset>
			<p>
				<label for="login">użytkownik:</label>
				<input type="text" class="form-control" name="login" id=login value="" />
			</p>
			<p>
				<label for="pass">hasło:</label>
				<input type="password" class="form-control" name="haslo" id=pass" />
			</p>
			<p>
				{if $logowanie==false} Nieprawidłowa nazwa użytkownika lub hasło!{/if}
			</p>
			<p>
				<input type="submit" class="btn btn-primary" value="Zaloguj"></span></td>
			</p>
		</fieldset>
		</div>

	</form>

{include file="footer.tpl"}