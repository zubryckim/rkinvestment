{include file="header.tpl"}
	{$do="addBroker"}

{if isset($value)}
	{$Name="Dodawanie pośrednika"}
	{$do="addBroker"}
{elseif isset($edit)}
	{$Name="Edycja pośrednika"}
	{$do="setBroker"}
{/if}

<div class="container-fluid">

    <h5 class="mt-4">{$Name}</h5>

	<form action="index.php?do={$do}" method="post" >
		<div class="bd col-md-4">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="bro_name">Nazwa pośrednika</label>
					<input required="required" type="search" class="form-control aria-label " name="bro_name" id="bro_name" value="{$value.bro_name}{$edit.bro_name}" />{$blad.bro_name}
				</div>	
			</div>
			<div>		
				<input type="button" class="btn btn-secondary"  onclick='location.href="?do=brokersList"' value='Anuluj'/>
				<input type="hidden" id="bro_id" name="bro_id"  value="{$edit.bro_id}" />
				<input type="submit" class="btn btn-primary" value="Zapisz"/>	
			</div>
		</div>
	</form>
	
</div>
	
{include file="footer.tpl"}