$(document).ready(function () {
	
	
	//$('#agr_booking_date').val(new Date().toISOString().split('T')[0]);
	
	$('#agr_booking_deposit').val('16000');	
	

	/* wybór rodzaju umowy
	$('.form-check-input').click(function(){
		toggleCheck();
	});
	
	function toggleCheck(){
		
		if ($('#dev_agr').is(':hidden')) {
			$('#dev_agr').show();
			$('#rez_agr').hide();
			$('#agr_booking_no').removeAttr('required', true);
			$('#agr_dev_no').prop('required', true);
			$('#agr_dev_date').val(new Date().toISOString().split('T')[0]);
			$('#agr_booking_date').val("");
		}
		else {
			$('#dev_agr').hide();
			$('#rez_agr').show();
			$('#agr_booking_no').prop('required', true)
			$('#agr_dev_no').removeAttr('required', true);
			$('#agr_booking_date').val(new Date().toISOString().split('T')[0]);
			$('#agr_dev_date').val("");
		}
		
	}
	*/
	
	$('.table_search').DataTable( {
			"language": {
				"url": "js/Polish.json"
			},
			ordering:  false,
            pageLength: 25,
            autoWidth: false,
            scrollY: 300,
            scrollCollapse: true,
			destroy: true
	});
	
	$(".draggable-modal").draggable({
		handle: ".modal-header"
	}); 
	
	$('.draggable-modal').on('shown.bs.modal', function (e) {
		$.fn.dataTable
        .tables( { visible: true, api: true } )
        .columns.adjust();
	});
	
	

	//*******************************************
	// add CLIENT to FORM					  ***
	//	
	//*******************************************
	//*** generate and add client to input    ***
	//
	
	// Function clientShow()
	function clientShow(id, name, phone){
		
		var thesame=false;
		var html = '<div class="meta meta-default" id="client-'+ id +'" title="Klient"><div class="meta-icon"><i class="glyphicon glyphicon-glyphicon-user" data-unicode="e008"></i></div>'
					html = html + '<div class="meta-data"><h5>' + name + '</h5><div class="small">tel:' + phone + '</div><span class="small text-muted">Klient</span></div>';
					html = html + '<button type="button" data-id="' +id + '" data-target="client" class="close" aria-label="Close" ><span aria-hidden="true">&times;</span></button>';
					html = html + '<div style="clear:both"></div></div>';
		
		var add_ob = $.map($("input[name='add_cli_id[]']"), 
			e=>e['value']);
		var del_ob = $.map($("input[name='del_cli_id[]']"), 
			e=>e['value']);
	
		//check add_ob
		if (add_ob.length!=0) {	
			for (var i = 0; i <add_ob.length; i++) {
				var inp=add_ob[i];
				if (id === inp ){ 				
					thesame=true;
					console.log("the same");
				}
			}
			if (thesame==false) {
				if ( $('#client-'+id+'').val()!=='') {
					$('#client').append(html);
					$('#btn-addClient, #btn-newClient').removeClass('btn-outline-secondary mt-2')
					$('#btn-addClient, #btn-newClient').addClass('btn-secondary btn-sm btn-block rounded-0 mt-0')
					$('<input>').attr({type: 'hidden', name: 'add_cli_id[]', value: id} ).appendTo('#addAgreement');	
				}
				
			}
		}
		else {
			if ( $('#client-'+id+'').val()!=='') {
				$('#client').append(html);
				$('#btn-addClient, #btn-newClient').removeClass('btn-outline-secondary mt-2')
				$('#btn-addClient, #btn-newClient').addClass('btn-secondary btn-sm btn-block rounded-0 mt-0')
				$('<input>').attr({type: 'hidden', name: 'add_cli_id[]', value: id} ).appendTo('#addAgreement');	
			}
			
		}
		
		//check del_ob
		if (del_ob.length!=0) {
						
			for (var i = 0; i <del_ob.length; i++) {
				var inp=del_ob[i];
				if (id === inp){ 				
					$('input[name="del_cli_id[]"]').val(id).remove();
				}
			}
		}
	};
	
	// End Function clientShow()
	
	
	//Search Client
	$('#table_search_client').on('click', 'button', function () {
		var id= $(this).attr("data-id");
		var name= $(this).attr("data-name");
		var phone= $(this).attr("data-phone");
		
		clientShow(id, name, phone);
				
		$('#modal_search_client').modal('toggle');
	
	});
	
	// New Client

	$('#form_modal_new_client').on('submit', function(e){
		//alert ("start");
        e.preventDefault();
        $.ajax({
            url: 'ajax.php', 
            type: 'POST', //or POST
            data: $('#form_modal_new_client').serialize(),
			dataType : "json",
            success: function(data){
				if (isFinite(data.result)) {
					
					//add to form
					clientShow(data.result, data.name, data.phone);
					$('#modal_new_client').find('form')[0].reset();
					$('#modal_new_client').modal('toggle');

				}
				else alert ("else: "+ JSON.stringify(data.result));
            },
		    error: function(data) 
			{
				//console.log("data:"+ JSON.stringify(data))
                alert('poś poszło nie tak! form_modal_new_client' + JSON.stringify(data));
			}
        });
		
    });
	
	
	//*******************************************
	// add GARAGE to FORM					  ***
	//	
	//*******************************************
	//*** generate and add garage to input    ***
	//
	$('#table_search_garage').on('click', 'button', function () {
		var id= $(this).attr("data-id");
		var name= $(this).attr("data-name");
		var details= $(this).attr("data-details");
		var thesame=false;
		var html = '<div class="meta meta-default" id="garage-'+ id +'" title="Garaż"><div class="meta-icon"><i class="fa fa-car"></i></div>'
					html = html + '<div class="meta-data"><h5>' + name + '</h5><div class="small">' + details + '</div><span class="small text-muted">Garaż</span></div>';
					html = html + '<button type="button" data-id="' +id + '" data-target="garage" class="close" aria-label="Close" ><span aria-hidden="true">&times;</span></button>';
					html = html + '<div style="clear:both"></div></div>';

		var add_ob = $.map($("input[name='add_gar_id[]']"), 
			e=>e['value']);
		var del_ob = $.map($("input[name='del_gar_id[]']"), 
			e=>e['value']);

		if (add_ob.length!=0) {	
		
			for (var i = 0; i <add_ob.length; i++) {
				var inp=add_ob[i];
				
				if (id ==inp){ 				
					thesame=true;
				}
			}
			if ( $('#garage-'+id+'').val()!=='') {
				if (thesame==false) {
					$('#garage').append(html);	
					$('#btn-addGarage').removeClass('btn-outline-secondary mt-2')
					$('#btn-addGarage').addClass('btn-secondary btn-sm btn-block rounded-0 mt-0')
					$('<input>').attr({type: 'hidden', name: 'add_gar_id[]', value: id} ).appendTo('#addAgreement');
				}
			}
		}
		else {
			if ( $('#garage-'+id+'').val()!=='') {
				$('#garage').append(html);
				$('#btn-addGarage').removeClass('btn-outline-secondary mt-2')
				$('#btn-addGarage').addClass('btn-secondary btn-sm btn-block rounded-0 mt-0')
				$('<input>').attr({type: 'hidden', name: 'add_gar_id[]', value: id} ).appendTo('#addAgreement');
			}
		}
		
		//check del_ob
		if (del_ob.length!=0) {
			for (var i = 0; i <del_ob.length; i++) {
				var inp=del_ob[i];
				if (id === inp){ 
					$('input[name="del_gar_id[]"]').val(id).remove();
				}
			}
		}
		$('#modal_search_garage').modal('toggle');
	
	});
	
	//*******************************************
	// add STORAGE to FORM					  ***
	//	
	//*******************************************
	//*** generate and add storage to input    ***
	//
	$('#table_search_storage').on('click', 'button', function () {
		var id= $(this).attr("data-id");
		var name= $(this).attr("data-name");
		var details= $(this).attr("data-details");
		var thesame=false;
		var html = '<div class="meta meta-default" id="storage-'+ id +'" title="Schowek"><div class="meta-icon"><i class="fa fa-archive"></i></div>'
					html = html + '<div class="meta-data"><h5>' + name + '</h5><div class="small">' + details + '</div><span class="small text-muted">Garaż</span></div>';
					html = html + '<button type="button" data-id="' +id + '" data-target="storage" class="close" aria-label="Close" ><span aria-hidden="true">&times;</span></button>';
					html = html + '<div style="clear:both"></div></div>';


		var add_ob = $.map($("input[name='add_sto_id[]']"), 
			e=>e['value']);
		var del_ob = $.map($("input[name='del_sto_id[]']"), 
			e=>e['value']);
			
		if (add_ob.length!=0) {	
		
			for (var i = 0; i <add_ob.length; i++) {
				var inp=add_ob[i];
				
				if (id ==inp){ 				
					thesame=true;
				}
			}
			if ( $('#storage-'+id+'').val()!=='') {
				if (thesame==false) {
					$('#storage').append(html);
					$('#btn-addStorage').removeClass('btn-outline-secondary mt-2')
					$('#btn-addStorage').addClass('btn-secondary btn-sm btn-block rounded-0 mt-0')					
					$('<input>').attr({type: 'hidden', name: 'add_sto_id[]', value: id} ).appendTo('#addAgreement');
				}
			}
			
		}
		else {
			if ( $('#storage-'+id+'').val()!=='') {
				$('#storage').append(html);
				$('#btn-addStorage').removeClass('btn-outline-secondary mt-2')
				$('#btn-addStorage').addClass('btn-secondary btn-sm btn-block rounded-0 mt-0')				
				$('<input>').attr({type: 'hidden', name: 'add_sto_id[]', value: id} ).appendTo('#addAgreement');
			}
		}
		
		//check del_ob
		if (del_ob.length!=0) {
						
			for (var i = 0; i <del_ob.length; i++) {
				var inp=del_ob[i];
				if (id === inp){ 
					$('input[name="del_sto_id[]"]').val(id).remove();
				}
			}
		}
		
		$('#modal_search_storage').modal('toggle');
	
	});
	
	//*******************************************
	// add LOCAL to FORM #addAgreement		  ***
	//	
	//*******************************************
	//*** generate and add local to input    ***
	//
	$('#table_search_local').on('click', 'button', function () {
		var id= $(this).attr("data-id");
		var name= $(this).attr("data-name");
		var details= $(this).attr("data-details");
		var thesame=false;
		var html = '<div class="meta meta-default" id="local-'+ id +'" title="Lokal"><div class="meta-icon"><i class="glyphicon glyphicon-glyphicon-home" data-unicode="e021"></i></div>'
					html = html + '<div class="meta-data"><h5>' + name + '</h5><div class="small">' + details + '</div><span class="small text-muted">Lokal</span></div>';
					html = html + '<button type="button" data-id="' +id + '" data-target="local" class="close" aria-label="Close" ><span aria-hidden="true">&times;</span></button>';
					html = html + '<div style="clear:both"></div></div>';

		var add_ob = $.map($("input[name='add_loc_id[]']"), 
			e=>e['value']);
		var del_ob = $.map($("input[name='del_loc_id[]']"), 
			e=>e['value']);

		if (add_ob.length!=0) {	
		
			for (var i = 0; i <add_ob.length; i++) {
				var inp=add_ob[i];
				if (id ==inp){ 				
					thesame=true;
				}
			}

			if ( $('#local-'+id+'').val()!=='') {
				if (thesame==false) {
					$('#local').append(html);
					$('#btn-addLocal').removeClass('btn-outline-secondary mt-2')
					$('#btn-addLocal').addClass('btn-secondary btn-sm btn-block rounded-0 mt-0')					
					$('<input>').attr({type: 'hidden', name: 'add_loc_id[]', value: id} ).appendTo('#addAgreement');
				}
			}
		}
		else {
			if ( $('#local-'+id+'').val()!=='') {
				$('#local').append(html);
					$('#btn-addLocal').removeClass('btn-outline-secondary mt-2')
					$('#btn-addLocal').addClass('btn-secondary btn-sm btn-block rounded-0 mt-0')				
				$('<input>').attr({type: 'hidden', name: 'add_loc_id[]', value: id} ).appendTo('#addAgreement');
			}
		}
		
		//check del_ob
		if (del_ob.length!=0) {
						
			for (var i = 0; i <del_ob.length; i++) {
				var inp=del_ob[i];
				if (id === inp){ 
					$('input[name="del_loc_id[]"]').val(id).remove();
				}
			}
		}
		
		$('#modal_search_local').modal('toggle');
	
	});
	

	//***********************************************
	//*** delete object from FORM addAgreement    ***
	//
	
	$('#addAgreement').on('click', 'button.close', function () {
		var id = $(this).attr("data-id");
		var target = $(this).attr("data-target");
		var action = $(this).attr("data-action");
		
		$("#"+target+"-"+id).remove();
		
		if (target =='client'){
			
			if ($("div[title='Klient']").length==0){ 
				$('#btn-addClient, #btn-newClient').removeClass('btn-secondary btn-sm btn-block rounded-0 mt-0')
				$('#btn-addClient, #btn-newClient').addClass('btn-outline-secondary mt-2')
			}
			
			if (action =='del'){
				$('<input>').attr({type: 'hidden', name: 'del_cli_id[]', value: id} ).appendTo('#addAgreement');
			}
			else {
				$('input[name="agr_cli_id[]"]').each(function () {
					if ($(this).val() === id) {
						$(this).remove();
					}
				}).get();
			}
		}
		
		if (target =='local'){
			
			if ($("div[title='Lokal']").length==0){ 
				$('#btn-addLocal').removeClass('btn-secondary btn-sm btn-block rounded-0 mt-0')
				$('#btn-addLocal').addClass('btn-outline-secondary mt-2')
			}
			
			if (action =='del'){
				$('<input>').attr({type: 'hidden', name: 'del_loc_id[]', value: id} ).appendTo('#addAgreement');
			}
			
			else {
				$("input[name='add_loc_id[]']").each(function () {
					if ($(this).val() === id) {
						$(this).remove();
					}
				});
			}
		}
		
		if (target =='garage'){
			
			if ($("div[title='Garaż']").length==0){ 
				$('#btn-addGarage').removeClass('btn-secondary btn-sm btn-block rounded-0 mt-0')
				$('#btn-addGarage').addClass('btn-outline-secondary mt-2')
			}
			if (action =='del'){
				$('<input>').attr({type: 'hidden', name: 'del_gar_id[]', value: id} ).appendTo('#addAgreement');
			}
			else {
			 $('input[name="agr_gar_id[]"]').each(function () {
				if ($(this).val() === id) {
					$(this).remove();
				}
			}).get();
			}
		}
		
		if (target =='storage'){
			
			if ($("div[title='Schowek']").length==0){ 
				$('#btn-addStorage').removeClass('btn-secondary btn-sm btn-block rounded-0 mt-0')
				$('#btn-addStorage').addClass('btn-outline-secondary mt-2')
			}
			if (action =='del'){
				$('<input>').attr({type: 'hidden', name: 'del_sto_id[]', value: id} ).appendTo('#addAgreement');
			}
			else {
			 $('input[name="agr_sto_id[]"]').each(function () {
				if ($(this).val() === id) {
					$(this).remove();
				}
			}).get();
			}
		}
		
		
				
	});
	
	//
	//*******************************************


});