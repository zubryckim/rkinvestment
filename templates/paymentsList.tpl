{$title=RK} 
{$Name="Lista płatności"}
{$target="paymentsList"}
{$object="Payment"}
    

{include file="header.tpl"}
<div class="container-fluid">
<div class="row margin">
<section>

	<h5>{$Name}</h5>

	<table id="table" class="table table-sm compact display" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th class="th-sm">id
          </th>
          <th class="th-sm">imię
          </th>
          <th class="th-sm">Nazwisko
          </th>
          <th class="th-sm">numer umowy
          </th>
		  <th class="th-sm">data umowy
          </th>
		  <th class="th-sm">data płatności
          </th>
          <th class="th-sm">wysokość wpłaty
          </th>
          <th class="th-sm text-center" >akcje
          </th>
        </tr>
      </thead>
	  
	  <tbody>
		{foreach from = $lst item = lista}
				<tr>
				<td>{$lista.agr_id}</td>
				<td>{$lista.cli_name}</td>
				<td>{$lista.cli_surname}</td>
				<td>{$lista.agr_no}</td>
				<td>{$lista.agr_date}</td>
				<td>{$lista.pay_date}</td>
				<td>{$lista.pay_amount}</td>
				<td>	
					<button type="button" class="btn btn-default btn-sm" onclick=="window.location.href='index.php?do=details{$object}&agr_id={$lista.agr_id}'">
					   <span class="glyphicon glyphicon-resize-full" ></span> Szczegóły
					</button>
				</td>
				</tr>
		{/foreach}
	 </tbody>
	</table>
<!--
<button type="button" class="btn btn-secondary" onclick="window.location.href='index.php?do=add{$object}'" >Dodaj...</button>
-->
</section>
</div>
</div>
{include file="footer.tpl"}