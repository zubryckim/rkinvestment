$(document).ready(function () {
	
	function setMask(){
		$('.kwota').inputmask('999 999.99', { numericInput: true, rightAlign: true, keepStatic: true, greedy: false  });
	};
	setMask()
	
	
	$('#modal_scheduler_gen').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget)
	  var cli_id = button.data('cli_id')
	  var agr_id = button.data('agr_id')
	  var sch_order = button.data('sch_order')
	  var sch_id = button.data('sch_id')
	  var todo = button.data('todo')
	  var modal = $(this)
	  
	  if (todo=='sch_edit') {
	  
		 modal.find("input[name='todo']").val('edit_sch')
		 
		 var sch_date = button.data('sch_date')
		 var sch_base_amount = button.data('sch_base_amount')
		 $('#sch_amount_modal').val(sch_base_amount)
		 $('#sch_order_modal').val('rata nr '+ sch_order)
		 $('#sch_date_modal').val(sch_date)
		 $('button[data-id]').remove()
		 $('#title_modal_scheduler_gen').html('Edycja harmonogramu')
		 $('<input>').attr({type: 'hidden', name: 'sch_id', value: sch_id} ).appendTo('#form_sched_gen_modal');
	  }
	 
      if (todo=='sch_add') {
	  
		modal.find("input[name='todo']").val('add_sch')
		
		sch_order = sch_order + 1
		$('button[data-id]').remove()
		$('#sch_order_modal').val('rata nr '+ sch_order)
		$('#title_modal_scheduler_gen').html('Dodawanie harmonogramu')
	  
	  }
  
	  modal.find("input[name='cli_id']").val(cli_id)
	  modal.find("input[name='agr_id']").val(agr_id)
	
	});
	
	$('#delete_sched_modal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget)
		var sch_id = button.data('sch_id')
		$('<input>').attr({type: 'hidden', name: 'sch_id', value: sch_id} ).appendTo('#form_delete_sched_modal');
	});


	$('button[data-id]').on('click', 'button', function() {
		var id = parseInt($(this).attr("data-id"))
		var target= $(this).attr("data-target")
		id_new = id+1
		
		if (target==="add") {
			var html = '<div class="form-row rata" id="form_row_sched_gen_modal-'+id_new+'">'
				html += '<div class="form-group col-md-2">'
				html += '<label class="sr-only" for="sch_order">numer raty</label>'
				html += '<input type="text" readonly class="form-control-plaintext text-right sch_order" name="scheduler['+id+'][sch_order]" value="rata nr '+id_new+'"></div>'
				html += '<div class="form-group col-md-4">'
				html += '<label class="sr-only" for="sch_date">data</label>'
				html += '<input type="date" class="form-control" name="scheduler['+id+'][sch_date]" value="" required/>'
				html += '<div class="invalid-feedback">{$blad.pay_date}</div></div>'
				html += '<div class="form-group col-md-4">'				
				html += '<label for="sch_amount" class="sr-only">kwota</label>'			
				html += '<input type="test" class="form-control kwota" placeholder="kwota" name="scheduler['+id+'][sch_amount]"></div>'				
				html += '<div class="form-group col-md-2">'						
				html += '<button type="button" class="btn btn-outline-secondary mr-1" data-id="'+id_new+'" data-target="add" ><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></button>'
				html +='<span data-id='+id_new+'></span>'				
				html += '<button type="button" class="btn btn-outline-danger" data-id="'+id_new+'" data-target="remove" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>'
				html += '</div></div>'									
			$('#sched_gen_modal_body').append(html)
			
			removeButton = '<button type="button" class="btn btn-outline-danger" data-id="'+id+'" data-target="remove" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>'
			//if(id>1) $(this).replaceWith(removeButton) 
			//else 
			//$(this).hide()
			$(this).remove()
		}
		
		if (target==="remove") {
			
			//console.log($( ".sch_order" ).length + " = " + id)
			if (2 === $( ".sch_order" ).length) {
				addButton= '<button type="button" class="btn btn-outline-secondary mr-1" data-id="1" data-target="add" ><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></button>'	
				$( "span[data-id='1']").before(addButton)
			}
			
			else if (id === $( ".sch_order" ).length){
				
				var id_before = id-1
				addButton= '<button type="button" class="btn btn-outline-secondary mr-1" data-id="'+id_before+'" data-target="add" ><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></button>'
				$( "span[data-id='"+id_before+"']").before(addButton)
			}
			
			$('#form_row_sched_gen_modal-'+id+'').remove()	
		}
		
		//przenumerowanie
		var i=1
		$( ".sch_order" ).each(function( index ) {
			$( this ).val("rata nr "+i)
			i=i+1
		});
		setMask()
					
	});
	
	
	//przekazanie zmiennych do okna modalnego payment_modal
	//
	$('#payment_modal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var lefttopay = button.data('left') // Extract info from data-* attributes
	  var sch_id = button.data('sch_id')
	  var agr_id = button.data('agr_id')
	  var cli_id = button.data('cli_id')
	  var pay_id = button.data('pay_id')
	  
	  var pay_invoice_no = button.data('pay_invoice_no')
	  var pay_amount = button.data('pay_amount')
	  var pay_date = button.data('pay_date')
	  var todo = button.data('todo')
	  
	  
	  var modal = $(this)
	  
	  modal.find('#title_payment_modal').html("Rejestracja wpłaty")	
	  modal.find('#pay_amount_payment').val(lefttopay)
  	  modal.find('#pay_invoice_no_payment').val()
	  modal.find('#pay_date_payment').val()
	  
	  if (todo=='pay_edit'){
		modal.find('#pay_amount_payment').val(pay_amount)
		modal.find('#pay_invoice_no_payment').val(pay_invoice_no)
		modal.find('#pay_date_payment').val(pay_date)
		modal.find("input[name='pay_id']").val(pay_id)
		modal.find('#title_payment_modal').html("Edycja wpłaty")
	  }
	  if (todo=='pay_rez'){
		modal.find('#title_payment_modal').html("Rejestracja opłaty rezerwacyjnej")
	  }
	  if (todo=='pay_rez_edit'){
	  	modal.find('#pay_amount_payment').val(pay_amount)
		modal.find('#pay_invoice_no_payment').val(pay_invoice_no)
		modal.find('#pay_date_payment').val(pay_date)
		modal.find("input[name='pay_id']").val(pay_id)
		modal.find('#title_payment_modal').html("Edycja wpłaty rezerwacyjnej")
	  }
	  modal.find("input[name='sch_id']").val(sch_id)
	  modal.find("input[name='agr_id']").val(agr_id)
	  modal.find("input[name='cli_id']").val(cli_id)
	  modal.find("input[name='todo']").val(todo)
	});
	
	//DRAGGABLE modal
	$("#payment_modal").draggable({
		handle: ".modal-header"
	});
	
	//wysłanie danych do zapisu 
	//zapisanie płatności
	$('#form_payment_modal').on('submit', function(e){
        e.preventDefault();
        $.ajax({
            url: 'ajax.php', 
            type: 'POST', //or POST
            data: $('#form_payment_modal').serialize(),
			dataType : "json",
            success: function(data){
				if (data.result==1) {
					$('#payment_modal').modal('toggle');
					location.reload();
				}
				else alert (data.result);
            },
		    error: function(data) 
			{
                alert('poś poszło nie tak!#form_payment_modal' + data);
			}
        });
		
    });
	
	//zapisanie harmonogramu
	$('#form_sched_gen_modal').on('submit', function(e){
        e.preventDefault();
        $.ajax({
            url: 'ajax.php', 
            type: 'POST', //or POST
            data: $('#form_sched_gen_modal').serialize(),
			dataType : "json",
            success: function(data){
				if (data.result==1) {
					$('#modal_scheduler_gen').modal('toggle');
					location.reload();
				}
				else alert (JSON.stringify(data));
            },
		    error: function(data) 
			{
				//console.log("data:"+ JSON.stringify(data))
                alert('poś poszło nie tak! form_sched_gen_modal');
			}
        });
		
    });
	
	//usuwanie harmonogramu
	$('#form_delete_sched_modal').on('submit', function(e){
        e.preventDefault();
        $.ajax({
            url: 'ajax.php', 
            type: 'POST', //or POST
            data: $('#form_delete_sched_modal').serialize(),
			dataType : "json",
            success: function(data){
				if (data.result==1) {
					$('#form_delete_sched_modal').modal('toggle');
					location.reload();
				}
				else alert (JSON.stringify(data));
            },
		    error: function(data) 
			{
				//console.log("data:"+ JSON.stringify(data))
                alert('poś poszło nie tak! form_delete_sched_modal');
			}
        });
		
    });
	
	
	
	/////////////////////////////////////////
	// Show details in table tb_scheduler 
	//
	//
	//declare table
	if (typeof(scheduler_count)!='undefined'){
		var scheduler =[0]
		for (var key in scheduler_count) {
			scheduler[key] = $('#tb_scheduler'+key+'').DataTable( {
					"language": {
					"url": "js/Polish.json"
					} ,
					"paging":   false,
					"ordering": false,
					"info":     false,
					"searching": false		
			} );
		}
	}
	
	$('.tb_scheduler tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr')
		var tablename = $(this).attr('data-name')
		var table = eval(tablename)
        var row = table.row( tr );
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
			//alert($(this).attr("data-id"));
			//get from database and return to format
			var id= $(this).attr("data-id");
			$.ajax({
				url: "ajax.php",
				type: 'post',
				dataType: "html",
				data: {
				 getDetails: id
				},
				success: function( text ) {
					row.child(text).show();			
				}
			});
			tr.addClass('shown');
        }
		
    } );
	
	//////////////////////////////////////////

	$('#tb_payments').DataTable( {
			"language": {
				"url": "js/Polish.json"
			} ,
			"paging":   false,
			"ordering": false,
			"info":     false,
			"searching": false
	});
	
	$("#btn_payment").click(function() {
		$("#paymentReg").submit();
	});  
	


});