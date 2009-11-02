<?
//personal variables
include('/home/net/www_users/monteiro/vars.php');

//page-specific variables
$page_title = "ISyE at Georgia Tech - $name";
$meta_description = "Information relating to the activities of $name";
$meta_keywords = "$name, research, research labs, research centers, research groups, Georgia Tech, ISyE, engineering, industrial, logistics, optimization, manufacturing, warehousing, distribution";

//links to include html header and footer content
$page_header= "/www/htdocs/internet/includes/page_header.php"; 
$page_footer= "/www/htdocs/internet/includes/page_footer.php";
$page_bg_color = "#003366";
$page_logo = "img src='/images/isye_logo.gif' width=300 height=75 alt='ISyE Logo'";
$title_bg = "/images/bluedkbluetile.gif";
$title_bg_color = "#006699";
$main_title = "<img src='$directory_path"."$username"."_header.gif' width=400 height=35 alt='$name'>";
$main_menu = "isyeinternet/menus/main_menu.php";
$left_menu = "/www/htdocs/users/$username/menus/left_menu.php";
$footer_menu = "isyeinternet/menus/footer_menu.php";
$resource_menu = "/www/htdocs/users/$username/menus/resources.php";

//which stylesheet to use
$page_css= "<script language=\"javascript\" src=\"/library/browser2.js\"></script>";

//start html
include($page_header);
?>
<p>
<!-- BODY OF PAGE GOES HERE -->
<br>
<h3>COURSES</h3>
<p><a href="isye4231/index.php">ISyE 4231 (Engineering Optimization)</a></p>
<p><a href="isye6661/index.php">ISyE 6661 (Optimization I)</a></p>
<?php
//HTML FOOTER CONTENT
include($page_footer);
?>
