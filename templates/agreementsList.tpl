{$title=RK} 
{$Name="Lista umów"}
{$Name="{$Name}{' - '}{$smarty.session.inv_name}"}
{$target="agreementsList"}
{$object="Agree"}
    

{include file="header.tpl"}
<div class="container-fluid">
<div class="row margin">
<section>
<button type="button" class="btn btn-secondary btn-sm float-right" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj umowę</button>



<h5 class="title">{$Name}
</h5>

	<table id="table_agreement" class="table table-sm table-striped table-hover table-bordered compact" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th class="th-sm">Nr
          </th>
          <th class="th-sm">Imię
          </th>
          <th class="th-sm">Nazwisko
          </th>
          <th class="th-sm">Nr umowy rez
          </th>
		  <th class="th-sm">Data umowy rez
          </th>
		  <th class="th-sm">Nr umowy dev
          </th>
          <th class="th-sm">Data umowy dev
          </th>
		  <th class="th-sm">Uwagi
          </th>
          <th class="th-sm text-center" >
          </th>
		  <th class="th-sm text-center" >
          </th>
        </tr>
      </thead>
	  
	  <tbody>
		{foreach from = $lst item = lista}
				<tr {if ($lista.agr_status_id==1)}class="table-success"{/if}>
				<td>{$lista.agr_id}</td>
				<td>{$lista.cli_name}</td>
				<td>{$lista.cli_surname}</td>
				<td>{$lista.agr_booking_no}</td>
				<td>{if $lista.agr_booking_date!='0000-00-00'}{$lista.agr_booking_date}{/if}</td>
				<td>{$lista.agr_dev_no}</td>
				<td>{if $lista.agr_dev_date!='0000-00-00'}{$lista.agr_dev_date}{/if}</td>
				<td>{$lista.agr_comments}</td>
				<td>	
					<button alt="Szczegóły" type="button" class="btn btn-default btn-sm" onclick="window.location.href='index.php?do=details{$object}&agr_id={$lista.agr_id}'">
					   <span class="glyphicon glyphicon-resize-full" ></span>
					</button>
				</td>
				<td>				
					<a href="index.php?do=edit{$object}&agr_id={$lista.agr_id}" >
					<img class="icon" src="images/edit.png" title="Edytuj" alt="Edytuj" width="16" height="16" /></a>
					<!--		
					<a href="index.php?do=del{$object}&agr_id={$lista.agr_id}" onclick="return confirm('Czy na pewno chcesz usunać?')">
					<img class="icon" src="images/drop.png" title="Usuń" alt="Usuń" width="16" height="16" /></a>-->
				</td>
				</tr>
		{/foreach}
	 </tbody>
	</table>

</section>
</div>
</div>
{include file="footer.tpl"}