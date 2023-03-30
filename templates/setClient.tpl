{$do="addClient"}
{$Name="Dodawanie klienta"}

{if isset($value)}
	{$Name="Dodawanie klienta"}
	{$do="addClient"}
{elseif isset($edit)}
	{$Name="Edycja klienta"}
	{$do="setClient"}
{/if}

{include file="header.tpl"}

<div class="container-fluid">

    <h5 class="mt-4">{$Name}</h5>

	<form action="index.php?do={$do}" method="post" >
		<div class="bd col-md-6">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="cli_name">imię</label>
					<input required="required" type="search" class="form-control aria-label " name="cli_name" id="cli_name" value="{$value.cli_name}{$edit.cli_name}" />{$blad.cli_name}
				</div>	
				<div class="form-group col-md-6">
					<label for="cli_surname">nazwisko</label>
					<input required="required" type="search" class="form-control aria-label " name="cli_surname" id="cli_surname" value="{$value.cli_surname}{$edit.cli_surname}" />{$blad.cli_surname}
				</div>	
			</div>
			<div class="form-row">
			
				<div class="form-group col-md-6">
					<label for="cli_PESEL">PESEL</label>
					<input  type="search" class="form-control aria-label " name="cli_PESEL" id="cli_PESEL" value="{$value.cli_PESEL}{$edit.cli_PESEL}" />{$blad.cli_PESEL}
				</div>				
				<div class="form-group col-md-6">
					<label for="cli_obywatelstwo">obywatelstwo</label>
					<input  type="search" class="form-control aria-label " name="cli_obywatelstwo" id="cli_obywatelstwo" value="{$value.cli_obywatelstwo}{$edit.cli_obywatelstwo}" />{$blad.cli_obywatelstwo}
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="cli_imiona_rodzicow">imiona rodzicow</label>
					<input  type="search" class="form-control aria-label " name="cli_imiona_rodzicow" id="cli_imiona_rodzicow" value="{$value.cli_imiona_rodzicow}{$edit.cli_imiona_rodzicow}" />{$blad.cli_imiona_rodzicow}
				</div>
				<div class="form-group col-md-4">
					<label for="cli_stan_cywilny">stan cywilny</label>
					<input type="search" class="form-control aria-label " name="cli_stan_cywilny" id="cli_stan_cywilny" value="{$value.cli_stan_cywilny}{$edit.cli_stan_cywilny}" />{$blad.cli_stan_cywilny}
				</div>
				<div class="form-group col-md-4">
					<label for="cli_ustroj_majatkowy">ustroj majatkowy</label>
					<input type="search" class="form-control aria-label " name="cli_ustroj_majatkowy" id="cli_ustroj_majatkowy" value="{$value.cli_ustroj_majatkowy}{$edit.cli_ustroj_majatkowy}" />{$blad.cli_ustroj_majatkowy}
				</div>
			</div>
			
			<hr class="featurette-divider">
			
			<div class="form-row">
				<div class="form-group col-sm-4">
					<label for="cli_rodzaj_dowodu">rodzaj dowodu tożsamości</label>
					<select class="form-control aria-label" name="cli_rodzaj_dowodu" id="cli_rodzaj_dowodu" value="{$edit.cli_rodzaj_dowodu}">
						<option>...</option>
						<option {if  $edit.cli_rodzaj_dowodu=='dowód osobisty'}selected{/if} >dowód osobisty</option>
						<option {if  $edit.cli_rodzaj_dowodu=='paszport'}selected{/if}>paszport</option>
						<option {if  $edit.cli_rodzaj_dowodu=='karta pobytu'}selected{/if}>karta pobytu</option>
					</select>
					<!--
					<input  type="search" class="form-control aria-label " name="cli_rodzaj_dowodu" id="cli_rodzaj_dowodu" value="{$value.cli_rodzaj_dowodu}{$edit.cli_rodzaj_dowodu}" />{$blad.cli_rodzaj_dowodu}
					-->
				</div>	
				<div class="form-group col-md-4">
					<label for="cli_nr_dowodu">nr dowodu</label>
					<input  type="search" class="form-control aria-label " name="cli_nr_dowodu" id="cli_nr_dowodu" value="{$value.cli_nr_dowodu}{$edit.cli_nr_dowodu}" />{$blad.cli_nr_dowodu}
				</div>	
				<div class="form-group col-md-4">
					<label for="cli_data_waznosci_dowodu">data ważnosci dowodu</label>
					<input type="date" class="form-control aria-label " name="cli_data_waznosci_dowodu" id="cli_data_waznosci_dowodu" value="{$value.cli_data_waznosci_dowodu}{$edit.cli_data_waznosci_dowodu}" />{$blad.cli_data_waznosci_dowodu}
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="cli_street">adres (ulica, nr domu, nr mieszkania)</label>
					<input required="required" type="search" class="form-control aria-label " name="cli_street" id="cli_street" value="{$value.cli_street}{$edit.cli_street}" />{$blad.cli_street}
				</div>
			</div>	
			
			<div class="form-row">	
				<div class="form-group col-md-3">
					<label for="cli_zip_code">kod pocztowy</label>
					<input required="required" type="search" class="form-control aria-label " name="cli_zip_code" id="cli_zip_code" value="{$value.cli_zip_code}{$edit.cli_zip_code}" />{$blad.cli_zip_code}
				</div>	
				<div class="form-group col-md-9">
					<label for="cli_locallity">miejscowość</label>
					<input required="required" type="search" class="form-control aria-label " name="cli_locallity" id="cli_locallity" value="{$value.cli_locallity}{$edit.cli_locallity}" />{$blad.cli_locallity}
				</div>	
			</div>
			
			<hr class="featurette-divider"></hr>
			
			<div class="form-row">	
				<div class="form-group col-md-12">
					<label for="cli_adres_kor">adres korespondencyjny (ulica, nr domu, nr mieszkania)</label>
					<input  type="search" class="form-control aria-label " name="cli_adres_kor" id="cli_adres_kor" value="{$value.cli_adres_kor}{$edit.cli_adres_kor}" />{$blad.cli_adres_kor}
				</div>	
			</div>
			
			<div class="form-row">	
				<div class="form-group col-md-3">
					<label for="cli_zip_code_kor">kod pocztowy</label>
					<input type="search" class="form-control aria-label " name="cli_zip_code_kor" id="cli_zip_code_kor" value="{$value.cli_zip_code_kor}{$edit.cli_zip_code_kor}" />{$blad.cli_zip_code_kor}
				</div>	
				<div class="form-group col-md-9">
					<label for="cli_locallity_kor">miejscowość</label>
					<input  type="search" class="form-control aria-label " name="cli_locallity_kor" id="cli_locallity_kor" value="{$value.cli_locallity_kor}{$edit.cli_locallity_kor}" />{$blad.cli_locallity_kor}
				</div>	
			</div>
			
			</hr>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="cli_phone_no">telefon</label>
					<input type="search" class="form-control aria-label " name="cli_phone_no" id="cli_phone_no" value="{$value.cli_phone_no}{$edit.cli_phone_no}" />{$blad.cli_phone_no}
				</div>	
				<div class="form-group col-md-6">
					<label for="cli_phone_no2">telefon 2</label>
					<input type="search" class="form-control aria-label " name="cli_phone_no2" id="cli_phone_no2" value="{$value.cli_phone_no2}{$edit.cli_phone_no2}" />{$blad.cli_phone_no2}
				</div>	
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="cli_nazwa_banku">nazwa banku</label>
					<input  type="search" class="form-control aria-label " name="cli_nazwa_banku" id="cli_nazwa_banku" value="{$value.cli_nazwa_banku}{$edit.cli_nazwa_banku}" />{$blad.cli_nazwa_banku}
				</div>
				<div class="form-group col-md-6">
					<label for="cli_nr_konta_bankowego">nr konta bankowego</label>
					<input  type="search" class="form-control aria-label " name="cli_nr_konta_bankowego" id="cli_nr_konta_bankowego" value="{$value.cli_nr_konta_bankowego}{$edit.cli_nr_konta_bankowego}" />{$blad.cli_nr_konta_bankowego}
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="cli_email">e-mail</label>
					<input type="search" class="form-control aria-label " name="cli_email" id="cli_email" value="{$value.cli_email}{$edit.cli_email}" />{$blad.cli_email}
				</div>	
				<div class="form-group col-md-6">
					<label for="cli_manager">opiekun</label>
						<select class="form-control aria-label" id="cli_manager" name="cli_manager">
						{html_options options=$man selected=$edit.cli_man_id}
						</select>
				</div>
			</div>
			
			<!-- klient instytucjonalny -->
			<div class="form-row">
				<div class="form-group col-md-12">
					<button class="btn btn-light btn-sm  float-right" type="button" data-toggle="collapse" data-target="#multiCollapse" aria-expanded="false">
					dane osoby prawnej <span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
					</button>
				</div>
			</div>

			<div class="collapse multi-collapse" id="multiCollapse">
				
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="cli_op_nazwa">nazwa firmy</label>
						<input type="search" class="form-control aria-label " name="cli_op_nazwa" id="cli_op_nazwa" value="{$value.cli_op_nazwa}{$edit.cli_op_nazwa}" />{$blad.cli_op_nazwa}
					</div>	
				</div>
				
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="cli_op_NIP">NIP</label>
						<input type="search" class="form-control aria-label " name="cli_op_NIP" id="cli_op_NIP" value="{$value.cli_op_NIP}{$edit.cli_op_NIP}" />{$blad.cli_op_NIP}
					</div>	
					<div class="form-group col-md-6">
						<label for="cli_op_forma">forma prawna</label>
						<input type="search" class="form-control aria-label " name="cli_op_forma" id="cli_op_forma" value="{$value.cli_op_forma}{$edit.cli_op_forma}" />{$blad.cli_op_forma}
					</div>	
				</div>		
				
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="cli_op_KRS">KRS</label>
						<input type="search" class="form-control aria-label " name="cli_op_KRS" id="cli_op_KRS" value="{$value.cli_op_KRS}{$edit.cli_op_KRS}" />{$blad.cli_op_KRS}
					</div>	
					<div class="form-group col-md-6">
						<label for="cli_op_REGON">REGON</label>
						<input type="search" class="form-control aria-label " name="cli_op_REGON" id="cli_op_REGON" value="{$value.cli_op_REGON}{$edit.cli_op_REGON}" />{$blad.cli_op_REGON}
					</div>	
				</div>	
				
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="cli_op_adres">adres (ulica, nr domu, nr mieszkania)</label>
						<input type="search" class="form-control aria-label " name="cli_op_adres" id="cli_op_adres" value="{$value.cli_op_adres}{$edit.cli_op_adres}" />{$blad.cli_op_adres}
					</div>	
					<div class="form-group col-md-2">
						<label for="cli_op_kod">kod pocztowy</label>
						<input type="search" class="form-control aria-label " name="cli_op_kod" id="cli_op_kod" value="{$value.cli_op_kod}{$edit.cli_op_kod}" />{$blad.cli_op_kod}
					</div>
					<div class="form-group col-md-4">
						<label for="cli_op_miasto">miejscowość</label>
						<input type="search" class="form-control aria-label " name="cli_op_miasto" id="cli_op_miasto" value="{$value.cli_op_miasto}{$edit.cli_op_miasto}" />{$blad.cli_op_miasto}
					</div>	
				</div>
				
				<div class="form-row">
	
					<div class="form-group col-md-4">
						<label for="cli_op_phone">nr telefonu</label>
						<input type="search" class="form-control aria-label " name="cli_op_phone" id="cli_op_phone" value="{$value.cli_op_phone}{$edit.cli_op_phone}" />{$blad.cli_op_phone}
					</div>	
					<div class="form-group col-md-4">
						<label for="cli_op_email">e-mail</label>
						<input type="search" class="form-control aria-label " name="cli_op_email" id="cli_op_email" value="{$value.cli_op_email}{$edit.cli_op_email}" />{$blad.cli_op_email}
					</div>	
				</div>
			
			
			</div>	
			
			<!--	-->			
			
			
			<div>		
				<input type="button" class="btn btn-secondary"  onclick='location.href="?do=clientsList"' value='Anuluj'/>
				<input type="hidden" id="cli_id" name="cli_id"  value="{$edit.cli_id}" />
				<input type="submit" class="btn btn-primary" value="Zapisz"/>	
			</div>
		</div>
	</form>
	
</div>


{include file="footer.tpl"}