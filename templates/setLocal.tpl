{$do="addLocal"}
{$Name="Dodawanie lokalu"}

{if isset($value)}
	{$Name="Dodawanie lokalu"}
	{$do="addLocal"}
{elseif isset($edit)}
	{$Name="Edycja lokalu"}
	{$do="setLocal"}
{/if}
{include file="header.tpl"}


<div class="container-fluid">

    <h5 class="mt-4">{$Name}</h5>

	<form action="index.php?do={$do}" method="post" >

		<div class="bd col-md-6">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="inv_id">inwestycja</label>
					<select class="form-control" id="inv_id" name="loc_inv_id">
							{html_options options=$inv_lst selected=$edit.loc_inv_id}
					</select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="loc_no">numer lokalu</label>
					<input required="required" type="search" class="form-control aria-label " name="loc_no" id="loc_no" value="{$value.loc_no}{$edit.loc_no}" /><p class='text-danger'>{$blad.loc_no}</p>
				</div>
				<div class="form-group col-md-4">
					<label for="loc_floor">piętro</label>
					<input required="required" type="search" class="form-control aria-label " name="loc_floor" id="loc_floor" value="{$value.loc_floor}{$edit.loc_floor}" />{$blad.loc_floor}
				</div>	
				<div class="form-group col-md-4">
					<label for="loc_room_qty">ilość pokoi</label>
					<input required="required" type="search" class="form-control aria-label " name="loc_room_qty" id="loc_room_qty" value="{$value.loc_room_qty}{$edit.loc_room_qty}" />{$blad.loc_room_qty}
				</div>	
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="loc_surface">powierzchnia m2</label>
					<input required="required" type="search" class="form-control aria-label " name="loc_surface" id="loc_surface" value="{$value.loc_surface}{$edit.loc_surface}" />{$blad.loc_surface}
				</div>

				<div class="form-group col-md-4">
					<label for="loc_balcony">balkon m2</label>
					<input type="search" class="form-control aria-label " name="loc_balcony" id="loc_balcony" value="{$value.loc_balcony}{$edit.loc_balcony}" />{$blad.loc_balcony}
				</div>

				<div class="form-group col-md-4">
					<label for="loc_garden">ogród m2</label>
					<input type="search" class="form-control aria-label " name="loc_garden" id="loc_garden" value="{$value.loc_garden}{$edit.loc_garden}" />{$blad.loc_garden}
				</div>
			</div>			
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="loc_price_1m2">cena za 1m2</label>
					<input required="required" type="search" class="form-control aria-label " name="loc_price_1m2" id="loc_price_1m2" value="{$value.loc_price_1m2}{$edit.loc_price_1m2}" />{$blad.loc_price_1m2}
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="loc_price_total">cena za całość</label>
					<input required="required" type="search" class="form-control aria-label " name="loc_price_total" id="loc_price_total" value="{$value.loc_price_total}{$edit.loc_price_total}" />{$blad.loc_price_total}
				</div>
			</div>

			<div>		
				<input type="button" class="btn btn-secondary"  onclick='location.href="?do=localsList"' value='Anuluj'/>
				<input type="hidden" id="loc_id" name="loc_id"  value="{$edit.loc_id}" />
				<input type="submit" class="btn btn-primary" value="Zapisz"/>	
			</div>
		</div>
	</form>
</div>
{include file="footer.tpl"}