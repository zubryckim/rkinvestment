{$object="Garage"}
{$name2="garażu"}

{assign var="Name" value="{'Dodawanie '}{$name2}"}
{assign var="do" value="{'add'}{$object}"}

{if isset($edit)}
	{assign var="Name" value="{'Edycja'} {$name2}"}
	{assign var="do" value="{'set'}{$object}"}
{/if}

{include file="header.tpl"}


<div class="container-fluid">

    <h5 class="mt-4">{$Name}</h5>

	<form action="index.php?do={$do}" method="post" >

		<div class="bd col-md-6">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inv_id">inwestycja</label>
					<select class="form-control" id="inv_id" name="gar_inv_id">
							{if isset($edit.inv_id)} 
								{$selected=$edit.gar_inv_id}
							{else} 
								$selected=$value.gar_inv_id}
							{/if}
							{html_options options=$inv_lst selected=$selected}
					</select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="gar_surface">powierzchnia m2</label>
					<input required="required" type="search" class="form-control aria-label " name="gar_surface" id="gar_surface" value="{$value.gar_surface}{$edit.gar_surface}" /><p class='text-danger'>{$blad.gar_surface}</p>
				</div>
				<div class="form-group col-md-6">
					<label for="gar_price_total">cena</label>
					<input required="required" type="search" class="form-control aria-label " name="gar_price_total" id="gar_price_total" value="{$value.gar_price_total}{$edit.gar_price_total}" />{$blad.gar_price_total}
				</div>	
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="gar_level">poziom</label>
					<input required="required" type="search" class="form-control aria-label " name="gar_level" id="gar_level" value="{$value.gar_level}{$edit.gar_level}" />{$blad.gar_level}
				</div>

				<div class="form-group col-md-4">
					<label for="gar_no">numer miejsca</label>
					<input type="search" class="form-control aria-label " name="gar_no" id="gar_no" value="{$value.gar_no}{$edit.gar_no}" />{$blad.gar_no}
				</div>
				
				<div class="form-group col-md-4">
					<label for="gar_sto_no">przynależny schowek</label>
					<input type="text" class="form-control aria-label " name="gar_sto_no" id="gar_sto_no" value="{$value.gar_sto_no}{$edit.gar_sto_no}" />{$blad.gar_sch_no}
				</div>
			</div>

			<div>		
				<input type="button" class="btn btn-secondary"  onclick='location.href="?do=garagesList"' value='Anuluj'/>
				<input type="hidden" id="gar_id" name="gar_id"  value="{$edit.gar_id}" />
				<input type="submit" class="btn btn-primary" value="Zapisz"/>	
			</div>
		</div>
	</form>
</div>
{include file="footer.tpl"}