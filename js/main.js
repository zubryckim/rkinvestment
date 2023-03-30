$(document).ready(function () {

	//start date
	$('#pay_date').val(new Date().toISOString().split('T')[0]);

	
	//$('#pay_amount').mask('# ##0.00', { reverse: true });
	
	/*
	$('#loc_price_total').mask('# ##0.00', { 
		reverse: true,
	});
	*/
	
	$(":input").inputmask();
	//$("#pay_amount").inputmask({"mask": "# ##0.00"});
	
		

	//Ustawienie w sesji nazwy i id investycji 
	$('#set_investition').on('change', function() {
		$.post("index.php", {"inv_id": $('#set_investition').val()});
		$.ajax({
			url: "",
			context: document.body,
			success: function(s,x){
				$(this).html(s);
			}
		});
	});

	//global DataTable
  	$('#table').DataTable( {
			"language": {
				"url": "js/Polish.json"
			},
			"pageLength": 25
	});
	
	var tab_agr = $('#table_agreement').DataTable( {
			"language": {
				"url": "js/Polish.json"
			},
			"pageLength": 25,
			//scrollY: 300,
            //scrollCollapse: false
			dom: 'Bfrtip',
			buttons: [
				{
					text: 'rezerwacyjne',
					//extend: 'colvisGroup',
					//show: [ 0, 1, 2, 3, 4 ],
					//hide: [ 5,6 ],
				
					action: function ( ) {
						var regExSearch = '^[A-Za-z0-9,-_.\s]+$'
						this.column(3).search(regExSearch, true, false).draw()
						this.column(4).search(regExSearch, true, false).draw()
						this.column(5).search('', true, false).draw()
						this.column(6).search('', true, false).draw()
						this.column( 3 ).visible( true )
						this.column( 4 ).visible( true )
						this.column( 5 ).visible( false )
						this.column( 6 ).visible( false )
						
						$(".dt-buttons").find(".xselected").removeClass("xselected");
                        node.addClass("xselected");
					}
				},
				{
					text: 'deweloperskie',
					action: function ( ) {
						var regExSearch = '^[A-Za-z0-9,-_.\s]+$'
						this.column(3).search('', true, false).draw()
						this.column(4).search('', true, false).draw()
						this.column(5).search(regExSearch, true, false).draw()
						this.column(6).search(regExSearch, true, false).draw()
						this.column( 3 ).visible( false )
						this.column( 4 ).visible( false )
						this.column( 5 ).visible( true )
						this.column( 6 ).visible( true )
						
						$(".dt-buttons").find(".xselected").removeClass("xselected");
                        node.addClass("xselected");
					}
				},
				{
					text: 'wszystkie',
					action: function ( ) {
						this.column(3).search('', true, false).draw()
						this.column(4).search('', true, false).draw()
						this.column(5).search('', true, false).draw()
						this.column(6).search('', true, false).draw()						
						this.column( 3 ).visible( true )
						this.column( 4 ).visible( true )
						this.column( 5 ).visible( true )
						this.column( 6 ).visible( true )
						
						$(".dt-buttons").find(".xselected").removeClass("xselected");
                        node.addClass("xselected");
					}
				}
			]
	});
	
	tab_agr.buttons().container()
    .appendTo( $('.col-sm-6:eq(0)', tab_agr.table().container() ) );
	

	
	
	var tab = $('#table_list').DataTable( {
			"language": {
				"url": "js/Polish.json"
			},
			"pageLength": 100,
		    "columnDefs": [
				{   
					"targets": [ 5 ],
					"type": "num-fmt",
					"visible": false 
				}
			],
			//scrollY: 300,
            //scrollCollapse: true,
			
			dom: 'Bfrtip',
			
			buttons: [
				{
					text: 'wolne',
					action: function ( ) {
						this.column(5).search('wolne').draw()
						$(".dt-buttons").find(".xselected").removeClass("xselected");
                        node.addClass("xselected");
					}
				},
				{
				text: 'wszystkie',
					action: function ( ) {
						this.column(5).search('').draw()
						$(".dt-buttons").find(".xselected").removeClass("xselected");
                        node.addClass("xselected");
					}
				},
				{
					extend: 'excel',
					text: 'eksport do excela'
				}
			]
			
	});
	
	
	
	tab.buttons().container()
    .appendTo( $('.col-sm-6:eq(0)', tab.table().container() ) );
	
	var tab_statistic = $('#table_statistic').DataTable( {
			"language": {
				"url": "js/Polish.json"
			},
			"pageLength": 25,
			dom: 'Bfrtip',
			
			drawCallback: function () {
					
					//$('#total').html(tab_statistic.column( 5 ).data().sum());
					
					var api = this.api();
					//var sum = $('#table_statistic').DataTable().column(6).data().sum();      
					$( api.column(5).footer() ).html(
						api.column( 5, {filter:'applied'} ).data().sum()
					);
					$( api.column(6).footer() ).html(
						api.column( 6, {filter:'applied'} ).data().sum()
					);
					//$('#total').html(sum);
			},    
			
			buttons: [
				{
					text: 'zapłacone',
					//extend: 'colvisGroup',
					//show: [ 0, 1, 2, 3, 4 ],
					//hide: [ 5,6 ],
				
					action: function ( ) {
						this.column(6).search('z', true, false).draw()
						$(".dt-buttons").find(".xselected").removeClass("xselected");
                        node.addClass("xselected");
						//$('#total').html(tab_statistic.column( 5 ).data().sum());
					}
				},
				{
					text: 'niezapłacone',
					action: function ( ) {
						var regExSearch = '^[A-Za-z0-9,-_.\s]+$'
						this.column(6).search(regExSearch, true, false).draw()
						$(".dt-buttons").find(".xselected").removeClass("xselected");
                        node.addClass("xselected");
						//$('#total').html(tab_statistic.column( 5 ).data().sum());
					}
				},
				{
					text: 'wszystkie',
					action: function ( ) {
						this.column(6).search('', true, false).draw()
						
						$(".dt-buttons").find(".xselected").removeClass("xselected");
                        node.addClass("xselected");
					}
				}
			]
	});
	
	tab_statistic.buttons().container()
    .appendTo( $('.col-sm-6:eq(0)', tab_statistic.table().container() ) );
	
	 
	
	
	
	//
	//send form rozlicznie wpłay
	/*
	$('#btn_payment').click(function () {

      var pay_date = $('#pay_date').val();
      var pay_amount = $('#pay_amount').val();
	  var pay_invoice_no = $('#pay_invoice_no').val();
	  var agr_id = $('#agr_id').val();

      var data = 'pay_date=' + pay_date + 
				'&pay_amount=' + pay_amount + 
				'&pay_invoice_no='+ pay_invoice_no +
				'&agr_id='+ agr_id;

		//alert(data);
		
      $.ajax({
        type:"GET",
        cache:false,
        url:"ajax.php",
        data:data,    // multiple data sent using ajax
        success: function (html) {
			alert("poszło");
          //$('#add').val('data sent sent');
          //$('#msg').html(html);
        }
		
      });
      return false;
    });
	
	////////////////////////////////////////////////////////////////////////////
	*/

	
	$('#sandbox-container input').datepicker({
        format: "yyyy-mm-dd",
        todayBtn: "linked",
        language: "pl",
        autoclose: true,
        todayHighlight: true,
        toggleActive: true
    });
	
	$('#agr_cli_name').autocomplete({
	  source: function( request, response ) {
	   // Fetch data
	   $.ajax({
		url: "ajax.php",
		type: 'post',
		dataType: "json",
		data: {
		 searchClient: request.term
		},
		success: function( data ) {
			response( data );			
		}
	   });
	  
	  },
	  select: function (event, ui) {
	   // Set selection
	   $('#agr_cli_name').val(ui.item.label); // display the selected text
	   $('#agr_cli_id').val(ui.item.value); // save selected id to input
		return false;
	  },
	  

		
	});
	var agr_cli_name = document.querySelector('#agr_cli_name') !== null;
	if (agr_cli_name) {
		$('#agr_cli_name').autocomplete( "instance" )._renderItem = function( ul, item ) {
		return $( "<li>" )
		  .append( "<div>"+ item.label + "" + item.info + "</div>")
		  .appendTo( ul );
		};
	}
	
	
	$('#agr_loc_no').autocomplete({
	  source: function( request, response ) {
	   // Fetch data
	   $.ajax({
		url: "ajax.php",
		type: 'post',
		dataType: "json",
		data: {
		 searchLocal: request.term,
		 investment: $('#agr_inv_id').val()
		},
		success: function( data ) {
		 response( data );
		}
	   });
	  },
	  
	  select: function (event, ui) {
	   // Set selection
	   $('#agr_loc_no').val(ui.item.label); // display the selected text
	   $('#agr_loc_id').val(ui.item.value); // save selected id to input
	   return false;
		}
		
	});
	
	var agr_loc_no = document.querySelector('#agr_loc_no') !== null;
	if (agr_loc_no) {
			$('#agr_loc_no').autocomplete( "instance" )._renderItem = function( ul, item ) {
			return $( "<li>" )
			  .append( "<div>"+ item.label + item.info + "</div>")
			  .appendTo( ul );
			};
	}
		
	$('#agr_gar_no').autocomplete({
	  source: function( request, response ) {
	   // Fetch data
	   $.ajax({
		url: "ajax.php",
		type: 'post',
		dataType: "json",
		data: {
		 searchGarage: request.term,
		 investment: $('#agr_inv_id').val()
		},
		success: function( data ) {
		 response( data );
		}
	   });
	  },
	  
	  select: function (event, ui) {
	   // Set selection
	   $('#agr_gar_no').val(ui.item.label); // display the selected text
	   $('#agr_gar_id').val(ui.item.value); // save selected id to input
	   return false;
		}
		
	})
	
	$('#agr_inv_id').on('change', function() {
		$("#agr_loc_no").val("");
		$("#agr_loc_id").val("");
		$("#agr_gar_no").val("");
		$("#agr_gar_id").val("");
	});
	
	/*$('.addForm').submit( function(){
		  if ($("#agr_gar_id").val() == "") {
			    event.preventDefault();
				alert("wypełnij pole 'garaż' wybierając wynik z listy podpowiedzi");
				returnToPreviousPage();
		  }
		  if ($("#agr_loc_id").val() == "") {
			    event.preventDefault();
				alert("wypełnij pole 'lokal' wybierając wynik z listy podpowiedzi");
				returnToPreviousPage();
		  }
	});
	*/
	
	$("#btn_generuj").click(function(e) {
      e.preventDefault();
      if  ($("#sch_date_from").val()==""){
		$("#sch_date_from").addClass("is-invalid");
		$("#sch_date_from").removeClass("is-valid");
	  }	  
	  else {
		$("#sch_date_from").addClass("is-valid");
		$("#sch_date_from").removeClass("is-invalid");
		//generuj dane
		alert("generuj");
	  }
    });
	
	
	$('#sch_date_from').on('change', function() {
	  
	  if  ($("#sch_date_from").val()==""){
		$("#sch_date_from").addClass("is-invalid");
		$("#sch_date_from").removeClass("is-valid");
	  }
	  else {
		$("#sch_date_from").addClass("is-valid");
		$("#sch_date_from").removeClass("is-invalid");
	  }
	  
	});
	
	$("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });

});