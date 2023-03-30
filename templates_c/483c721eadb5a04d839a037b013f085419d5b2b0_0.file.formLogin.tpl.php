<?php
/* Smarty version 3.1.34-dev-7, created on 2022-03-07 10:35:10
  from 'C:\inetpub\wwwroot\rkinvestment\templates\formLogin.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_6225d1cef00740_38595332',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '483c721eadb5a04d839a037b013f085419d5b2b0' => 
    array (
      0 => 'C:\\inetpub\\wwwroot\\rkinvestment\\templates\\formLogin.tpl',
      1 => 1608715578,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:header.tpl' => 1,
    'file:footer.tpl' => 1,
  ),
),false)) {
function content_6225d1cef00740_38595332 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_assignInScope('Name', "Logowanie");?>


<?php $_smarty_tpl->_subTemplateRender("file:header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('title'=>'START','Name'=>'Logowanie użytkownika'), 0, false);
?>

<div class="container-fluid">

   <h5 class="title"><?php echo $_smarty_tpl->tpl_vars['Name']->value;?>
</h5>
   
	<form action="index.php?do=zaloguj" method=post>
		<div class="form-group row margin">
		<fieldset>
			<p>
				<label for="login">użytkownik:</label>
				<input type="text" class="form-control" name="login" id=login value="" />
			</p>
			<p>
				<label for="pass">hasło:</label>
				<input type="password" class="form-control" name="haslo" id=pass" />
			</p>
			<p>
				<?php if ($_smarty_tpl->tpl_vars['logowanie']->value == false) {?> Nieprawidłowa nazwa użytkownika lub hasło!<?php }?>
			</p>
			<p>
				<input type="submit" class="btn btn-primary" value="Zaloguj"></span></td>
			</p>
		</fieldset>
		</div>

	</form>

<?php $_smarty_tpl->_subTemplateRender("file:footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
