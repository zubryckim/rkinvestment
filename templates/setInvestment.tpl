{$Name="Dodawanie inwestycji"}	
{$do="addInvestment"}

{if isset($value)}
	{$do="addInvestment"}
{elseif isset($edit)}
	{$Name="Edycja inwestycji"}
	{$do="setInvestment"}
{/if}

{include file="header.tpl"}
<div class="container-fluid">

    <h5 class="mt-4">{$Name}</h5>

	<form action="index.php?do={$do}" method="post" >
		<div class="bd col-md-4">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inv_name">Nazwa inwestycji</label>
					<input required="required" type="search" class="form-control aria-label " name="inv_name" id="inv_name" value="{$value.inv_name}{$edit.inv_name}" />{$blad.inv_name}
				</div>	
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inv_order">kolejność wyświetlania</label>
					<input required="required" type="search" class="form-control aria-label " name="inv_order" id="inv_order" value="{$value.inv_order}{$edit.inv_order}" />{$blad.inv_order}
				</div>	
			</div>
			<div>		
				<input type="button" class="btn btn-secondary"  onclick='location.href="?do=investmentsList"' value='Anuluj'/>
				<input type="hidden" id="inv_id" name="inv_id"  value="{$edit.inv_id}" />
				<input type="submit" class="btn btn-primary" value="Zapisz"/>	
			</div>
		</div>
	</form>
	
</div>
	
{include file="footer.tpl"}