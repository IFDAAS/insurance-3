<style>
div#cmd_micro{
	background-image: url(<?=Yii::app()->request->getBaseUrl(true)?>/images/spacer.png) !important;
}
table.tblMainMenu tr td.active{
	background-image:url(<?=Yii::app()->request->getBaseUrl(true)?>/images/ie/tab_bg.gif) !important;
}
table.tblMainMenu 
	tr td.active 
		> div:first-child{
	background-image:url(<?=Yii::app()->request->getBaseUrl(true)?>/images/ie/tab_bg_right.gif) !important;
	background-position:top right;
	background-repeat:no-repeat !important;
}
div#bottom_menu 
	table.tblMainMenu tr td.active{
	background-image:url(<?=Yii::app()->request->getBaseUrl(true)?>/images/ie/tab_bg_grey.gif) !important;
}
div#bottom_menu 
	table.tblMainMenu 
	tr td.active 
		div{
	background-image:url(<?=Yii::app()->request->getBaseUrl(true)?>/images/ie/tab_bg_right_grey.gif) !important;
	background-position:top right;
	background-repeat:no-repeat !important;
}
#shadowLeft{
	background-image:url(<?=Yii::app()->request->getBaseUrl(true)?>/images/ie/body_shadow_left.png) !important;
}
#shadowRight{
	background-image:url(<?=Yii::app()->request->getBaseUrl(true)?>/images/ie/body_shadow_right.png) !important;
}
</style>
<? 	require_once dirname(__FILE__).'/header.php'; // for fun, yeah...
	$mode=(isset($_GET['mode']))? $_GET['mode']:false;?>
<body>
<? // in default.php: <div align="left" class="container" id="page">// если пытались подать на печать:
if ($mode=='save'||$mode=='print'){	?>
<link href="<?=Yii::app()->request->getBaseUrl(true)?>/css/print_blank.css" rel="stylesheet" type="text/css">
<style>
div#page.container{
	/*float: left;*/
	max-width:700px; 
	padding-right:100px;
	padding-top:0;
	width:700px;
}
ul li{
	display:block;
	list-style: circle !important;
}
</style>
<?	
	require_once Yii::getPathOfAlias('webroot').'/protected/views/layouts/save_and_print.php';

}else{ // не пытались?>
    <div id="fit_height">
<table id="main_content" cellspacing="0">
  <tr id="hatBlock">
    <td id="shadowLeft" rowspan="4" valign="top">&nbsp;</td>
    <td valign="top" width="1020" height="128" bgcolor="#FFFFFF">
        <table class="noPadding" id="hat" cellspacing="0">
          <tr>
            <td style="padding-left:21px;">
            <div style="position:relative;">
                <div id="main_submenu" align="right"><?
            		setHTML::buildMainMenu($this,-2);
                ?></div>
            </div>
	<?  setHTML::buildLogosBlock();?></td>
            <td style="padding-right:25px;">
	<?	setHTML::buildContactsAndSearchBlock();?>
            </td>
          </tr>
        </table>
		
        
    </td>
    <td id="shadowRight" rowspan="4" valign="top">&nbsp;</td>
  </tr>
  <tr id="trMenuPlace">
    <td id="menuPlace">
    	<div id="mainmenu" align="left" style="position:relative;">
<?	setHTML::buildMainMenu($this); // главное меню?>
		</div>
<?	setHTML::buildDropDownMenu();?>
</td>
  </tr>
  <tr valign="top" id="trContentPlace">
    <td><?
		setHTML::buildBreadCrumbs();
		// view / setHTML::setPageData()
    	echo $content;
	?></td>
  </tr>
  <tr>
    <td><?
	$arrSecondLayout=Data::detectLayoutType();
	if($arrSecondLayout):
		require_once Yii::getPathOfAlias('webroot').'/protected/components/submodules/banners3.php';
	endif;
    setHTML::buildFooterBlock($tp);
	?></td>
  </tr>
</table>
	</div>
<? //</div>?>
<script type="text/javascript" src="<?=Yii::app()->request->baseUrl?>/js/drop_down_menu_ie.js"></script>
<?
}?>
<script type="text/javascript" src="<?=Yii::app()->request->baseUrl?>/js/old_ie.js"></script>