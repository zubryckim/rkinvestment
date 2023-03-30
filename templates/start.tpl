{config_load file="../config/conf.conf" section="setup"}
{include file="header.tpl" title=START Name='zaczynamy!'}

Poprawne zalogowanie: 

{$smarty.session.user}

start.tpl

{include file="footer.tpl"}
