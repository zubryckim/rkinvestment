{$title=RK} 
{$Name="Zestawienie wymagalnych wpłat w okresie:"}
{*$Name="{$Name}{' - '}{$smarty.session.inv_name}" *}

{$sum=0}
{$suma_wplat=0}

{include file="header.tpl"}
<div class="container-fluid">
<div class="row margin">
<section>
<h5 class="title">{$Name}</h5>
	<p>
		<form action="index.php?do=statistic" id="" method="post" >
		od <input type="date" name="from" value="{$smarty.session.from}"></input>
		do <input type="date" name="to" value="{$smarty.session.to}" ></input> 
		<button type="submit" class="btn btn-primary btn-sm"> 
		<span class="glyphicon glyphicon-search" ></span> Pokaż</button>
		</form> 
	</p>
	
	
	<table id="table_statistic" class="table table-sm table-striped table-hover table-bordered compact" cellspacing="0" width="1000px">
      <thead>
        <tr>
          <th class="th-sm">Rata
          </th>
          <th class="th-sm">Imię
          </th>
          <th class="th-sm">Nazwisko
          </th>
          <th class="th-sm">data wpłaty
          </th>	
		  <th class="th-sm">nr umowy
          </th>
		  <th class="th-sm">kwota
          </th>

          <th class="th-sm text-center" >wpłata
          </th>

        </tr>
      </thead>
	  
	  <tbody>
		{foreach from = $lst item = lista}
		{$sum=$sum+$lista.sch_base_amount}
		
		{if $lista.pay_sum>0}
			{$suma_wplat=$suma_wplat+$lista.pay_sum}
		{/if}
				<tr>
				<td>{$lista.sch_order}</td>
				<td>{$lista.cli_name}</td>
				<td>{$lista.cli_surname}</td>
				<td>{$lista.sch_date}</td>
				<td>{$lista.sch_agr_id}</td>
				<td>{$lista.sch_base_amount|number_format:2:".":" "} zł</td>
				<td>{if $lista.pay_sum>0}{$lista.pay_sum|number_format:2:".":" "} zł{else}0{/if}</td>
				</tr>
		{/foreach}

	 </tbody>
	  <tfoot>
	  		<tr>
			<td>Suma:</td><td></td>
			<td></td><td></td>
			<td></td>
			<td><strong></strong></td>
			<td><strong></strong></td>
			</tr>
	  </tfoot>
	</table>
<h4 id="total"></h4>

</section>
</div>
</div>
{include file="footer.tpl"}