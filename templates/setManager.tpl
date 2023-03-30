{include file="header.tpl"}
	{$do="addManager"}
	{$Name="Dodawanie opiekuna"}
{if isset($value)}
	{$Name="Dodawanie opiekuna"}
	{$do="addManager"}
{elseif isset($edit)}
	{$Name="Edycja opiekuna"}
	{$do="setManager"}
{/if}

<div class="container-fluid">

    <h5 class="mt-4">{$Name}</h5>

	<form action="index.php?do={$do}" method="post" >
		<div class="bd col-md-4">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="bro_name">Nazwa opiekuna</label>
					<input required="required" type="search" class="form-control aria-label " name="man_name" id="man_name" value="{$value.man_name}{$edit.man_name}" />{$blad.man_name}
				</div>	
			</div>
			<div>		
				<input type="button" class="btn btn-secondary"  onclick='location.href="?do=listManagers"' value='Anuluj'/>
				<input type="hidden" id="man_id" name="man_id"  value="{$edit.man_id}" />
				<input type="submit" class="btn btn-primary" value="Zapisz"/>	
			</div>
		</div>
	</form>
	
</div>
	
{include file="footer.tpl"}