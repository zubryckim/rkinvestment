<!-- Modal form_scheduler_modal-->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable" id="modal_scheduler" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="">Wpłata</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button> 
      </div>
	  <form action="index.php" id="form_scheduler_modal" method="post" >
	  <div class="modal-body">
			
				<div class="col-md-12">
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="pay_date">data</label>
							<input required="required" type="search" class="form-control aria-label " name="pay_date" id="pay_date" value="{$value.pay_date}{$edit.pay_date}" />
						</div>	
						<div class="form-group col-md-4">
							<label for="pay_amount">kwota właty</label>
							<input required="required" type="search" class="form-control aria-label " name="pay_amount" id="pay_amount" value="" />
						</div>	
						<div class="form-group col-md-4">
							<label for="pay_invoice_no">numer faktury</label>
							<input required="required" type="search" class="form-control aria-label " name="pay_invoice_no" id="pay_invoice_no" value="" />
						</div>
					</div>
					<input type="hidden" name="cli_id"  value="{$value.cli_id}" />
					<input type="hidden" name="sch_id"  value="{$value.sch_id}" />
					<input type="hidden" name="agr_id"  value="{$value.agr_id}" />
					<input type="hidden" id="user" name="user"  value="{$smarty.session.user}" />
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
<!--_-->
<!-- Modal form_sched_gen_modal-->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable" id="modal_scheduler_gen" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="title_modal_scheduler_gen">Tworzenie harmonogramu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <form action="index.php" id="form_sched_gen_modal" method="post" >
	  <div class="modal-body" id="sched_gen_modal_body">
			

					<div class="form-row rata" id="form_row_sched_gen_modal-1">
						<div class="form-group col-md-2">
							 <label class="sr-only" for="sch_order_modal">numer raty</label>
							<input type="text" class="form-control-plaintext text-right sch_order" name="scheduler[0][sch_order]" id="sch_order_modal" value="rata nr 1">
						</div>	
						<div class="form-group col-md-4">
							<label class="sr-only" for="sch_date_modal">data</label>
								<input type="date" class="form-control datepicker " name="scheduler[0][sch_date]" id="sch_date_modal" value="" required>
								<div class="invalid-feedback">{$blad.pay_date}</div>
						</div>	
						<div class="form-group col-md-4">
							<label for="sch_amount_modal" class="sr-only">kwota</label>
							<input type="text" class="form-control kwota" placeholder="kwota" name="scheduler[0][sch_amount]" id="sch_amount_modal"required>
						</div>
						<div class="form-group col-md-2">
							<button type="button" class="btn btn-outline-secondary" data-id="1" data-target="add">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							</button>	
							<span data-id="1"></span>
						</div>
					</div>
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button>
		<input type="hidden" name="cli_id" value="">
		<input type="hidden" name="agr_id" value="">
		<input type="hidden" name="todo"  value="add_sch" />
		<button type="submit" class="btn btn-primary">Zapisz</button>    
      </div>
	  </form>
    
	</div>
  </div>
</div>
<!--_-->
<!-- Modal form_delete_sched_modal-->
<div class="modal fade bs-modal-lg draggable-modal ui-draggable" id="delete_sched_modal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header ui-draggable-handle">
        <h5 class="modal-title" id="title_form_delete_sched_modal">Usuwanie terminu z harmonogramu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <form action="index.php" id="form_delete_sched_modal" method="post" >
	  <div class="modal-body" id="sched_gen_modal_body">
			
			<div class="alert alert-danger" role="alert">
				Czy chcesz usunąć ten termin z harmonogramu?! 
			</div>
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Nie</button>
		<input type="hidden" name="todo"  value="del_sch" />
		<button type="submit" class="btn btn-primary">Tak</button>    
      </div>
	  </form>
    
	</div>
  </div>
</div>
