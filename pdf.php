<?php
/**
 * 
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: Default Header and Footer
 * @author Mariusz Żubrycki
 * @since 2008-03-04
 */

// Include the main TCPDF library (search for installation path).
require_once('vendor/TCPDF-main/tcpdf.php');

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('RKinvestment');
$pdf->SetTitle('Raport klienta');
$pdf->SetSubject('zestawienie płatności');
$pdf->SetKeywords('TCPDF, PDF, z');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING, array(64,64,64), array(0,64,128));
$pdf->setFooterData(array(0,64,0), array(0,64,128));

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/pol.php')) {
    require_once(dirname(__FILE__).'/lang/pol.php');
    $pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('dejavusans', '', 14, '', true);

// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->AddPage();

// set text shadow effect
$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));

// Set some content to print
$html = <<<EOD
 <style>
	body {background-color: powderblue;}
	h1   {color: blue;}
	p    {color: red;}
	table, th, td {
		border: 1px solid black;
		font-size: 10px;
	}
</style>
 
<h5>Lista płatności</h5>

	<table style="width:100%">
      <thead>
        <tr>
          <th>imię
          </th>
          <th>Nazwisko
          </th>
          <th>numer umowy
          </th>
		  <th>data umowy
          </th>
		  <th>data płatności
          </th>
          <th>wysokość wpłaty
          </th>
          <th>akcje
          </th>
        </tr>
      </thead>
	  
	  <tbody>
				<tr>
				<td>5</td>
				<td>Jan</td>
				<td>Testowy</td>
				<td>22222</td>
				<td>2020-07-02</td>
				<td>2020-09-20</td>
				<td>35200</td>
				<td></td>
				</tr>
		</tbody>
	</table>
EOD;

// Print text using writeHTMLCell()
$pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);

// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output('example_001.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+