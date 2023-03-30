<!-- Modal FORM-->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable-handle" id="payment_modal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="title_payment_modal">Rejestracja wpłaty</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span> 
        </button>
      </div>
	  <form action="index.php" id="form_payment_modal" method="post" >
	  <div class="modal-body">
			
				<div class="col-md-12">
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="pay_date_payment">data</label>
							<input required="required" type="date" class="form-control aria-label " name="pay_date" id="pay_date_payment" value="" />
						</div>	
						<div class="form-group col-md-4">
							<label for="pay_amount_payment">kwota właty</label>
							<input required="required" type="text" class="form-control aria-label kwota" name="pay_amount" id="pay_amount_payment" value="" />
						</div>	
						<div class="form-group col-md-4">
							<label for="pay_invoice_no_payment">numer faktury</label>
							<input type="text" class="form-control aria-label " name="pay_invoice_no" id="pay_invoice_no_payment" value="" />
						</div>
					</div>
					<input type="hidden" name="cli_id"  value="" />
					<input type="hidden" name="sch_id"  value="" />
					<input type="hidden" name="agr_id"  value="" />
					<input type="hidden" name="pay_id"  value="" />
					<input type="hidden" name="todo"  value="" />
					<input type="hidden" name="user"  value="{$smarty.session.user}" />
				</div>
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button>
		<button type="submit" class="btn btn-primary">Zapisz</button>    
      </div>
	  </form>
    
	</div>
  </div>
</div>