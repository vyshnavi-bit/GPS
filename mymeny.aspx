﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mymeny.aspx.cs" Inherits="mymeny" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
    @import url(http://fonts.googleapis.com/css?family=Open+Sans:300&subset=latin,greek-ext,cyrillic-ext,greek,vietnamese,cyrillic,latin-ext);
/* Browser Resetter */
body,div,span,p,a,img,h1,h2,h3,h4,h5,h6,ul,ol,li,blockquote,input{margin:0;padding:0;border:0;outline:0;}
ul,li,ol{list-style:none;}
a{outline: none; text-decoration:none;}

/* General body layout */
body{
  font-family: Open Sans,Helvetica,Arial,sans-serif;
  font-size:13px;
  font-weight: normal;
  background-color:#232629;
}

#top-wrap{
  width:100%;
  float:left;  
}
#bodywrap{
	width:100%;
	float:left;
	padding:50px 0 0 0;
	background-color:#f3f3f3;
	overflow:hidden;
}

/* Layout styles */
#header-wrap{
  width: 100%;
  float:left;
  background-color: #232629;
  position:relative;
  z-index:9999;  
}


#header{
  max-width:970px;
  width: 100%;
  height:72px;
  float: none;
  margin:0 auto;
  position: relative;
}

h1{
  display: block;
  float:left;
  margin:18px 0 0 0;
}

/* stylin navigation content */
ul.nav{
  min-width: 573px;
  float:right;
  display:block;
  margin:22px 0 0 0;
}
ul.nav li{
  float: left;
  width:auto;
}
ul.nav li a{
  float:left;
  font-size: 12px;
  color:#fff;
  text-align:center;
  padding:0px 16px;
  line-height:25px;
}

ul.nav li a:hover, ul.nav li a.active{
  float:left;
  color:#232629;
  padding:0 16px 0 0px;
  background: url(images/nav-right.png) no-repeat right;
}
ul.nav li a:hover span, ul.nav li a.active span{
  display:block;
  float:left;
  color:#232629;
  height:29px;
  padding:0 0px 0 16px;
  background: url(images/nav-left.png) no-repeat left;
}

/* stylin banner content */
.banner-wrap{
	width:100%;
	height:auto;
	float:left;
	background: url(images/banner_bg.png) repeat-x;
	clear:both;
	margin: 0 auto;	
}
.banner-inner{
	height:auto;
	background:url(images/banner-grad.png) no-repeat 50px 0;
}
.banner{
	max-width:970px;
	width:100%;
	display:block;
	float:none;
	margin:0 auto;
}
#menus{
	float:right;
	margin:0;
	max-width:550px;
	width:100%;	
}
.banner-twit img{
	float:left;
	margin:0 0 0 0;
}
.leftContent{
	width:390px;
	float:left;
	margin:15px 0 0 0;
	padding-bottom:20px;
}
.leftContent h2{
	width:100%;
	float:left;
	font-size:32px;
	color:#fff;
	padding-bottom:25px;
	padding-top:15px;
	text-transform:uppercase;
	text-shadow: 2px 2px 3px #016137;
}
.image {padding: 0px; float:none;}
.leftContent p{
	width:100%;
	float:left;
	font-size:21px;
	color:#fff;
	line-height:30px;
	padding-bottom:35px;
}
.m-info{
	width:173px;
	height:46px;
	float:left;
	font-size:18px;
	font-weight:bold;
	color:#fff;
	text-shadow: 1px 1px 1px #d3ceaa;
	text-align:center;
	line-height:44px;
	background:url(images/m-info_btn.png) no-repeat;
}
.m-info1{
	width:173px;
	height:46px;
	float:left;
	font-size:18px;
	font-weight:bold;
	color:#fff;
	text-shadow: 1px 1px 1px #d3ceaa;
	text-align:center;
	line-height:44px;
	background:url(images/m-info_btn1.png) no-repeat;
}

/* Looped slider content */
.container { width:100%;max-width:970px; height:auto; overflow:hidden; position:relative;  margin:0 auto;}
.slides { position:relative; top:0; left:0; }
ul.pagination { list-style:none; padding:0; margin:0; position: relative; top:-18px; left:190px; background:url(images/pagination.jpg) no-repeat; width:79px;
height:18px; float:left;}
ul.pagination li  { float:left; width:9px; height:9px; float:left; background:#fff; margin:5px 0px 0 6px;}
ul.pagination li a {  background:url(images/slide-visited.png) no-repeat; display:block; width:9px; height:9px; float:left font-size:0px; }
ul.pagination li.active a { background:url(images/hover-active.png) no-repeat;}


/* stylin main body content */
#content-wrap{
  clear:both;
  max-width:970px;
  width:100%;
  float:none;
  margin:0 auto;
}

/* stylin leftPan content */
.leftPan{
	width:65%;
	display:block;
	float:left;
	margin-right:60px;
}

/* universal rules for content inside leftPan */
.leftPan h3{
	width:100%;
	float:left;
	font-size:18px;
	line-height: 21px;
	color:#232629;
	padding-bottom:26px;
}
.leftPan p{
	width:100%;
	float:left;
	font-size:13px;
	color:#727272;
	line-height:21px;
	text-align:justify;
	padding-bottom:23px;
}
.leftPan a.more{
	width:59px;
	height:14px;
	float:left;
	font-size:11px;
	color:#fff;
	font-weight:normal;
	text-align:center;
	background: #00b987 url(images/read-more.jpg) no-repeat;
}


/* stylin innerLeft column inside leftPan */
.leftPan .innerLeft{
	width:30%;
	float:left;
	margin-right:69px;
}
.leftPan .innerLeft p{
	width:100%;
	float:left;
}

/* stylin inner Right content */
.leftPan .innerRight{
	width:55%;
	display:block;
	float:left;
}
.innerRight img{
	float:left;
	margin:0 0 0 0;
	width: 64px;
	height: 64px;
}
.leftPan a{
	color:#5faceb; 
	border-width: 0 0 1px 0; 
	border-style: dotted; 
	border-color: #5faceb;
	}
.leftPan a:hover{
  color:#5faceb; 
  border-width: 0 0 1px 0; 
  border-style: dotted; 
  border-color: #727272;
	}	
.innerRight ul, .innerRight li{
	width:100%;
	display:block;
	float:left;
}
.innerRight ul li{
	padding-bottom:12px;
}
.leftPan .innerRight ul li p{
	width:75%;
	text-align:left;
	float:right;
	padding:0px;
	line-height: 18px;
}

/* stylin rightPan content */
.rightPan{
	width:25%;
	float:right;
}
.rightPan h3{
	font-size:18px;
	color:#232629;
	padding-bottom:28px;
}
.rightPan a.more{
	font-size:11px;
	color:#fff;
	width:59px;
	height:14px;
	text-align:center;
	float:left;
	background:url(images/read-more.jpg) no-repeat;
}

.rightPan .right{float:none;} 
.rightPan ul{
	width:277px;
	float:left;
	display:block;
}
.rightPan ul li{
	width:100%;
	float:left;
	padding-bottom:18px;
}
.rightPan ul li p{
	width:277px;
	float:left;
	font-size:13px;
	color:#727272;
	line-height:21px;
	padding-bottom:5px;
}
.rightPan ul li img{
	text-align: center;
	float:none;
}

/* stylin bottom-wrap */
.botomwrap{
	width:970px;
	float:left;
	margin:40px 0 46px 0;
}
.botomLeft{
	width:625px;
	float:left;
	margin-right:60px;
}
.botomLeft h4{
	width:100%;
	float:left;
	font-size:18px;
	color:#232629;
	padding-bottom:12px;
}
.leftPan h4{
	width:100%;
	float:left;
	font-size:15px;
	color:#232629;
	padding-bottom:12px;
}
.botomLeft h5{
	width:100%;
	float:left;
	font-size:14px;
	color:#333;
	padding-bottom:12px;
}
.botomLeft blockquote{
	width:618px;
	float:left;
	font-size:12px;
	color:#727272;
	line-height:21px;
	padding:15px 0 26px 0;
	background:url(images/quot-watermark.png) no-repeat top left;
}
.botomLeft p.signature{
	clear:left;
	float:left;
	font-size:12px;
	color:#5d5d5d;
	font-weight:bold;
}

/* stylin rightside content */
.botomRight{
	width:277px;
	display:block;
	float:left;
}
.botomRight h4{
	width:100%;
	float:left;
	font-size:18px;
	color:#232629;
	padding-bottom:26px;
}
.botomRight p.qcontact{
	width:233px;
	float:left;
	font-size:12px;
	color:#727272;
	line-height:21px;
}
p.qcontact a{
	font-size:12px;
	color:#727272;
	text-decoration:underline;
}
p.qcontact a:hover{
	font-size:12px;
	color:#727272;
	text-decoration:none;
}
.qcontact a{float:none;}	
	

/* stylin footer content */
#footer-wrap{
  clear:both;
  width:100%;
  float:left;
  background-color:#232629;
}

#footer{
  max-width:970px;
  width:100%;
  height:200px;
  float:none;
  margin:0 auto;
  position:relative;
}

#footer p.copyright{
	min-width:120px;
	float:left;
	font-size:11px;
	color:#727272;
	line-height:21px;
	margin:55px 0 0 0;
}
/* stylin signature content */
p.sign{
	clear:left;
	width:180px;
	float:left;
	margin:7px 47px 0 0;
	font-size:11px;
	color:#727272;
	font-style:italic;
	font-weight:bold;
}
p.sign a{
	font-size:11px;
	color:#727272;
	font-style:italic;
	text-decoration:underline;
}
p.sign a:hover{
	text-decoration:none;
}
/* stylin footer navigation content */
ul.footNav{
	clear:left;
	min-width:260px;
	float:left;
}
ul.footNav li{
	float:left;
	color:#727272;
	line-height:21px;
}
ul.footNav li a{
	float:left;
	padding:0px 4px;
	font-size:11px;
	color:#727272;
}

/* stylin footer logo */
div.footLogo{
	width:237px;
	height:auto;
	float:right;
	position:relative;
	top:0px;
	right:70px;
	background:url(images/gradient_footer.png) no-repeat left center;
}
div.footLogo img{
	margin:0 0 0 30px;
}

/* ####################################
######## Stylin Inner pages ###########
#################################### */
div.clear{
	clear:both;
	width:100%;
	height:40px;
	float:left;
}

/* contact us page */
.leftPan img.map{
	margin-bottom:28px;
}
.rightPan p{
	font-size:13px;
	color:#727272;
	line-height:21px;
	width:100%;
	float:left;	
}

/* stylin blog page content */
 ul.blog{
	display:block;
	width:100%;
	float:left;
}
 ul.blog li{
	width:100%;
	float:left;
	display:block;
	padding-bottom:30px;
}
 ul.blog li h4{
	font-size:21px;
	color:#494949;
	line-height:21px;
	padding:0px 0px 10px 0;
}
 ul.blog li img{
	margin:10px 9px 10px 0;
}
 ul.blog li p a{
	font-size:12px;
	color:#727272;
	text-decoration:underline;
}
 ul.blog li p a:hover{
	text-decoration:none;
}
 ul.blog li p.date, ul.blog li p.post, ul.blog li p.comments{
	padding:0 0 9px 0;
}
 ul.blog li p.date a{
	 text-decoration:none;
	 border-bottom:1px dashed #454545;
 }
 
 /* stylin sitemap content */
ul.sitemap, ul.sitemap li{
	clear:both;
	width:120px;
	float:left;
	display:block;
}
ul.sitemap li a{
	font-size:12px;
	line-height:19px;
	color:#00b987;
	float:left;
}
ul.sitemap li a:hover{
	color:#454545;
}

.menu_templ {
	position: relative;
	top: 40px;
  max-width: 600px;
  width:100%;
  height: 300px;
  background-color: #999999;
  z-index:1000;
	}

#form .label {
    color:#727272;
    width:100px;
    display:block;
    float:left;
    line-height:24px;
}
#form .input_text {
    padding:5px;
    border:1px solid #bbb;
    -moz-border-radius:5px;
    width:300px;
}
#form div div { margin:10px 0 10px 0; }
#form .esubmit {
    position:relative;
    padding:5px;
    background:#eee;
    color:#333;
    -moz-border-radius:5px;
    border:1px solid #bbb;
    left:290px;
}
*+html #form .esubmit { left:313px; }
.notice { color:red; }
.rightPan ul#rq li { padding-bottom:10px; }
ul#rq p { display:none; color:#727272; }
.rightPan ul#rq a {
    color:#727272;
    font-size:13px;
    font-weight:bold;
    padding-bottom:1px;
    float:none;
    width:auto;
    background:none;
    line-height:22px;
}
ul#rq small { color:#727272; display:block; }
ul#rq a:hover { color:#b02d15; border-bottom:1px dotted #5faceb; color:#5faceb; padding-bottom:0; }
.rightPan ul#rq p a { display:inline; color:#727272; font-weight:normal; }
.rightPan ul#rq p a:hover { border:0; padding-bottom:1px; }
.rightPan .faq-h3 a {
    color:#232629;
    font-size:18px;
    font-weight:bold;
    padding-bottom:0;
    float:none;
    width:auto;
    background:none;
    line-height:21px;
}

#paypal li a  { width:220px; }
#paypal .price  {
    padding-right:75px;
    background:url(images/paypal.png) no-repeat right 2px;
}
#more-options-button {
    font-size:11px;
    color:#727272;
    padding:0 0 20px 20px;
    margin-top:-15px;
}
#more-options-button a { font-size:13px; }
#more-options {
    display:none;
    height:170px;
    margin-top:-20px;
}


/* respond */
input.respond{
	display:none;
}
div.respond{
	margin:10px auto;
	width:300px;
	height:80px;
	text-align:center;
	/*font-style:italic;*/
	font-size:13px;
}
div.respond label{
	width:33%;
	display:block;
	float:left;
	text-align:center;
}
div.respond label img{
	cursor:pointer;
}

/* tool tip for logo */
.leftPan p.ttip, .ttip {
height: 1px;
overflow: hidden;
position: absolute;
width: 1px;
}

#respond_ipad:checked ~ #content-wrap{/* css3 selector */
	max-width: 600px;
}
#respond_iphone:checked ~ #content-wrap{
	max-width: 360px;
}
/*#respond_iphone:checked ~ .leftPan #headerdemo, #respond_iphone:checked ~ .leftPan #work-list{
	display:none;
}*/
#flags{
margin: 0 auto;
max-width: 970px;
float: none;
position: relative;
padding: 10px 5px 0 0;
}

#flags a{
margin-left: 10px;
}

#main-menu{
height:50px;
position:relative;
top:17px;
margin:0 5px 0 211px;
}


.demo{
width: 33%;
height:210px;
position: relative;
float: left;
padding: 0 0 50px 0;
}

.demo-more{
    background: url("images/read-more.jpg") repeat-x scroll 0 0 transparent;
    color: #FFFFFF;
    float: left;
    font-size: 11px;
    height: 14px;
    text-align: center;
    width: auto;
}

.demo img{
opacity: 0.75;
}

.demo img:hover{
opacity: 1;
}

@media (max-width: 960px) {
	#menus{
	display:none;
	}	
}
@media (min-width: 766px) and (max-width: 970px) {
	#main-menu{
	margin:50px 5px 0 0;
	}
	
	#header{
	height: 175px;
	}
	
	.rightPan{
	display:none;
	}

	.leftPan{
	width: 100%;
	}
	.leftPan .innerLeft{
	width:40%;
	}	
	.leftPan .innerRight{
	width:50%;
	}	
}

@media (min-width: 480px) and (max-width: 766px) {
	#main-menu{
	margin:50px 5px 0 0;
	}
	
	#header{
	height: 200px;
	}
	
	.rightPan{
	display:none;
	}

	.leftPan{
	width: 100%;
	}
	
	.leftPan .innerLeft{
	width:100%;
	}	
	
	.leftPan .innerRight{
	width:100%;
	}
	
	.leftPan .innerRight ul li p{
	width: 85%;
	}	
	
	.demo{
	width: 50%;
	}

}

@media (min-width: 360px) and (max-width: 479px) {
	#top-wrap{
	float:none;
	}
	#main-menu{
	margin:50px 5px 0 0;
	}
	
	#header{
	height: 250px;
	}
	.rightPan{
	display:none;
	}

	.leftPan{
	width: 100%;
	}	
	
	.leftPan .innerLeft{
	width:100%;
	}	
	.leftPan .innerRight{
	width:100%;
	}
	.leftPan .innerRight ul li p{
	width: 80%;
	}	
	.demo{
	width: 100%;
	}
	
}
@media (max-width: 359px) {
	#top-wrap{
	float:none;
	}
	
	#main-menu{
	margin:50px 5px 0 0;
	}
	
	#header{
	height: 300px;
	}
	
	.leftContent{
	width: 360px;
	}
	
	.leftContent p{
	width: 330px;
	}

	.leftContent h2{
	width: 330px;
	}	
	
	.rightPan{
	display:none;
	}

	.leftPan{
	width: 100%;
	}	
	
	.leftPan .innerLeft{
	width:100%;
	}	
	.leftPan .innerRight{
	width:100%;
	}
	.leftPan .innerRight ul li p{
	width: 80%;
	}	
	.demo{
	width: 100%;
	}
	
}
    
    
    @import 'http://fonts.googleapis.com/css?family=Open+Sans:300&subset=latin,greek-ext,cyrillic-ext,greek,vietnamese,cyrillic,latin-ext';
ul#css3menu_dm{
	margin:0;list-style:none;padding:0px;background-color:transparent;border-width:0;border-style:none;border-color:;border-radius:0px;font-size:0;z-index:999;position:relative;display:inline-block;zoom:1;
	*display:inline;}
ul#css3menu_dm li{
	display:block;white-space:nowrap;font-size:0;float:left;}
* html ul#css3menu_dm li a{
	display:inline-block;}
ul#css3menu_dm>li{
	margin:0 0 0 6px;}
ul#css3menu_dm a:active, ul#css3menu_dm a:focus{
	outline-style:none;}
ul#css3menu_dm a{
	display:block;vertical-align:middle;text-align:left;text-decoration:none;font:16px Open Sans,Arial,sans-serif;color:#FFFFFF;cursor:pointer;padding:8px;background-color:;background-repeat:repeat;background-position:0 0;border-width:0px;border-style:none;border-color:;}
ul#css3menu_dm li:hover>a,ul#css3menu_dm li a.pressed{
	border-style:none;color:#FFFFFF;background-position:0 100%;text-decoration:none;}
ul#css3menu_dm img{
	border:none;vertical-align:middle;margin-right:8px;}
ul#css3menu_dm li.topmenu>a{
	-moz-box-shadow:0 -1px #5FACEB, 0 3px 0 #2a74b1,0 4px 4px #333333;-webkit-box-shadow:0 -1px #5FACEB, 0 3px 0 #2a74b1,0 4px 4px #333333;box-shadow:0 -1px #5FACEB, 0 3px 0 #2a74b1,0 4px 4px #333333;background-color:#5FACEB;background-image:-o-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13)); background-image:-moz-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13));   background-image:linear-gradient(180deg,rgba(44,160,202,0),rgba(0,0,0,0.13));  background-image:-webkit-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13));border-width:0 0 2px 0;border-style:solid;border-color:#5396cd;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#002CA0CA,endColorstr=#20000000)}
ul#css3menu_dm li.topmenu:hover>a,ul#css3menu_dm li.topmenu a.pressed{
	-moz-box-shadow:0 2px 0 #5FACEB,0 3px 0 #2a74b1,0 1px 0 #5396cf,0 5px 3px #333333;-webkit-box-shadow:0 2px 0 #5FACEB,0 3px 0 #2a74b1,0 1px 0 #5396cf,0 5px 3px #333333;box-shadow:0 2px 0 #5FACEB,0 3px 0 #2a74b1,0 1px 0 #5396cf,0 5px 3px #333333;background-color:#5FACEB;background-image:-o-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0)); background-image:-moz-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0));   background-image:linear-gradient(180deg,rgba(0,0,0,0.13),rgba(44,160,202,0));  background-image:-webkit-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0));border-width:2px 0 0 0;border-style:solid;border-color:#5396cf;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#20000000,endColorstr=#002CA0CA)}
ul#css3menu_dm li.topfirst>a{
	-moz-box-shadow:0 -1px #4ACF00, 0 3px 0 #297300,0 4px 4px #333333;-webkit-box-shadow:0 -1px #4ACF00, 0 3px 0 #297300,0 4px 4px #333333;box-shadow:0 -1px #4ACF00, 0 3px 0 #297300,0 4px 4px #333333;background-color:#4ACF00;background-image:-o-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13)); background-image:-moz-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13));   background-image:linear-gradient(180deg,rgba(44,160,202,0),rgba(0,0,0,0.13));  background-image:-webkit-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13));border-width:0 0 2px 0;border-style:solid;border-color:#41b000;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#002CA0CA,endColorstr=#20000000)}
ul#css3menu_dm li.topfirst:hover>a,ul#css3menu_dm li.topmenu a.pressed{
	-moz-box-shadow:0 2px 0 #4ACF00,0 3px 0 #297300,0 1px 0 #5396cf,0 5px 3px #333333;-webkit-box-shadow:0 2px 0 #4ACF00,0 3px 0 #297300,0 1px 0 #5396cf,0 5px 3px #333333;box-shadow:0 2px 0 #4ACF00,0 3px 0 #297300,0 1px 0 #5396cf,0 5px 3px #333333;background-color:#4ACF00;background-image:-o-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0)); background-image:-moz-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0));   background-image:linear-gradient(180deg,rgba(0,0,0,0.13),rgba(44,160,202,0));  background-image:-webkit-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0));border-width:2px 0 0 0;border-style:solid;border-color:#3fab00;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#20000000,endColorstr=#002CA0CA)}

	
ul#css3menu_dd{
	margin:0;list-style:none;padding:0px;background-color:transparent;border-width:0;border-style:none;border-color:;border-radius:0px;font-size:0;z-index:999;position:relative;display:inline-block;zoom:1;
	*display:inline;}
ul#css3menu_dd li{
	display:block;white-space:nowrap;font-size:0;float:left;}
* html ul#css3menu_dd li a{
	display:inline-block;}
ul#css3menu_dd>li{
	margin:0 0 0 6px;}
ul#css3menu_dd a:active, ul#css3menu_dd a:focus{
	outline-style:none;}
ul#css3menu_dd a{
	display:block;vertical-align:middle;text-align:left;text-decoration:none;font:14px Open Sans,Arial,sans-serif;color:#FFFFFF;cursor:pointer;padding:8px;background-color:;background-repeat:repeat;background-position:0 0;border-width:0px;border-style:none;border-color:;margin:10px 0;}
ul#css3menu_dd li:hover>a,ul#css3menu_dd li a.pressed{
	border-style:none;color:#FFFFFF;background-position:0 100%;text-decoration:none;}
ul#css3menu_dd img{
	border:none;vertical-align:middle;margin-right:8px;}
ul#css3menu_dd li.topmenu>a{
	text-align: center;-moz-box-shadow:0 -1px #5FACEB, 0 3px 0 #2a74b1,0 6px 4px #999999;-webkit-box-shadow:0 -1px #5FACEB, 0 3px 0 #2a74b1,0 6px 4px #999999;box-shadow:0 -1px #5FACEB, 0 3px 0 #2a74b1,0 6px 4px #999999;background-color:#5FACEB;background-image:-o-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13)); background-image:-moz-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13));   background-image:linear-gradient(180deg,rgba(44,160,202,0),rgba(0,0,0,0.13));  background-image:-webkit-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13));border-width:0 0 2px 0;border-style:solid;border-color:#5396cd;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#002CA0CA,endColorstr=#20000000)}
ul#css3menu_dd li.topmenu:hover>a,ul#css3menu_dd li.topmenu a.pressed{
	-moz-box-shadow:0 2px 0 #5FACEB,0 3px 0 #2a74b1,0 1px 0 #5396cf,0 5px 3px #999999;-webkit-box-shadow:0 2px 0 #5FACEB,0 3px 0 #2a74b1,0 1px 0 #5396cf,0 5px 3px #999999;box-shadow:0 2px 0 #5FACEB,0 3px 0 #2a74b1,0 1px 0 #5396cf,0 5px 3px #999999;background-color:#5FACEB;background-image:-o-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0)); background-image:-moz-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0));   background-image:linear-gradient(180deg,rgba(0,0,0,0.13),rgba(44,160,202,0));  background-image:-webkit-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0));border-width:2px 0 0 0;border-style:solid;border-color:#5396cf;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#20000000,endColorstr=#002CA0CA)}
ul#css3menu_dd li.topfirst>a{
	text-align: center;-moz-box-shadow:0 -1px #4ACF00, 0 3px 0 #297300,0 6px 4px #999999;-webkit-box-shadow:0 -1px #4ACF00, 0 3px 0 #297300,0 6px 4px #999999;box-shadow:0 -1px #4ACF00, 0 3px 0 #297300,0 6px 4px #999999;background-color:#4ACF00;background-image:-o-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13)); background-image:-moz-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13));   background-image:linear-gradient(180deg,rgba(44,160,202,0),rgba(0,0,0,0.13));  background-image:-webkit-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.13));border-width:0 0 2px 0;border-style:solid;border-color:#41b000;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#002CA0CA,endColorstr=#20000000)}
ul#css3menu_dd li.topfirst:hover>a,ul#css3menu_dd li.topmenu a.pressed{
	-moz-box-shadow:0 2px 0 #4ACF00,0 3px 0 #297300,0 1px 0 #5396cf,0 5px 3px #999999;-webkit-box-shadow:0 2px 0 #4ACF00,0 3px 0 #297300,0 1px 0 #5396cf,0 5px 3px #999999;box-shadow:0 2px 0 #4ACF00,0 3px 0 #297300,0 1px 0 #5396cf,0 5px 3px #999999;background-color:#4ACF00;background-image:-o-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0)); background-image:-moz-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0));   background-image:linear-gradient(180deg,rgba(0,0,0,0.13),rgba(44,160,202,0));  background-image:-webkit-linear-gradient(-90deg,rgba(0,0,0,0.13),rgba(44,160,202,0));border-width:2px 0 0 0;border-style:solid;border-color:#3fab00;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#20000000,endColorstr=#002CA0CA)}
ul#css3menu_dd li.topfirst > a > span, ul#css3menu_dd li.topmenu> a > span{
    font-size: 18px;
    font-weight: bold;
    line-height: 26px;
}
ul#css3menu_dd li.topmenu > a > em {
    color: #E68B00;
    font-size: 18px;
    font-weight: bold;
}	


@import 'http://fonts.googleapis.com/css?family=Open+Sans:300&subset=latin,greek-ext,cyrillic-ext,greek,vietnamese,cyrillic,latin-ext';
ul#css3menu_top,ul#css3menu_top ul{
	margin:0;list-style:none;padding:0;}
ul#css3menu_top,ul#css3menu_top .submenu{
	background-color:#FFFFFF;border-width:1px;border-style:solid;border-color:#b2b2b4;-moz-border-radius:5px 5px 0 0;-webkit-border-radius:5px 5px 0 0;border-radius:5px 5px 0 0;}
ul#css3menu_top .submenu{
	display:none;position:absolute;left:-1px;top:100%;float:left;z-index:2;background-color:#FFFFFF;background-image:-o-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.1)); background-image:-moz-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.1));   background-image:linear-gradient(180deg,rgba(44,160,202,0),rgba(0,0,0,0.1));  background-image:-webkit-linear-gradient(-90deg,rgba(44,160,202,0),rgba(0,0,0,0.1));border-width:1px;border-radius:0px 0px 4px 4px;-moz-border-radius:0px 0px 4px 4px;-webkit-border-radius:0px;-webkit-border-bottom-right-radius:4px;-webkit-border-bottom-left-radius:4px;border-style:solid;border-color:#FFFFFF #bfc1c2 #bfc1c2 #bfc1c2;-moz-box-shadow:0 5px 5px rgba(20, 20, 25, 0.2), 0 0 0 1px #FFFFFF inset;-webkit-box-shadow:0 5px 5px rgba(20, 20, 25, 0.2), 0 0 0 1px #FFFFFF inset;box-shadow:0 5px 5px rgba(20, 20, 25, 0.2), 0 0 0 1px #FFFFFF inset;padding:5px;}
ul#css3menu_top li:hover>*{
	display:block;}
ul#css3menu_top li{
	position:relative;display:block;white-space:nowrap;font-size:0;float:left;}
ul#css3menu_top li:hover{
	z-index:1;}
ul#css3menu_top{
	font-size:0;width:100%;z-index:999;position:relative;display:inline-block;zoom:1;padding:0 0%;margin:0 0%;-moz-box-shadow:0 2px 0 #bfc1c2;-webkit-box-shadow:0 2px 0 #bfc1c2;box-shadow:0 2px 0 #bfc1c2;
	*display:inline;*padding-right:0.91%;}
ul#css3menu_top .column{
	float:left;}
* html ul#css3menu_top li a{
	display:inline-block;}
ul#css3menu_top>li{
	margin:0;width:16%;}
ul#css3menu_top li.toplast{
	width:20%;}
body:first-of-type ul#css3menu_top{
	display:inline-table;border-spacing:0px 0;}
body:first-of-type ul#css3menu_top>li{
	display:table-cell;float:none;}
ul#css3menu_top a:active, ul#css3menu_top a:focus{
	outline-style:none;}
ul#css3menu_top a{
	display:block;vertical-align:middle;text-align:left;text-decoration:none;font:14px Open Sans,Helvetica Neue,Helvetica,Arial,sans-serif;color:#727272;cursor:pointer;padding:13px 15px;background-color:;background-image:-o-linear-gradient(-90deg,rgba(255,255,255,0),rgba(85,85,85,0.13)); background-image:-moz-linear-gradient(-90deg,rgba(255,255,255,0),rgba(85,85,85,0.13));   background-image:linear-gradient(180deg,rgba(255,255,255,0),rgba(85,85,85,0.13));  background-image:-webkit-linear-gradient(-90deg,rgba(255,255,255,0),rgba(85,85,85,0.13));background-repeat:repeat;background-position:0 0;border-width:0px;border-style:none;border-color:;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#00FFFFFF,endColorstr=#21555555)}
ul#css3menu_top ul li{
	float:none;margin:0;}
ul#css3menu_top ul a{
	text-align:left;padding:5px;-moz-box-shadow:none;-webkit-box-shadow:none;box-shadow:none;background-color:none;background-image:none;border-width:0;border-style:none;border-radius:6px;-moz-border-radius:6px;-webkit-border-radius:6px;color:#727272;text-decoration:none;}
ul#css3menu_top li:hover>a,ul#css3menu_top li a.pressed{
	border-style:none;color:#727272;background-image:-o-linear-gradient(-90deg,rgba(85,85,85,0.13),rgba(255,255,255,0)); background-image:-moz-linear-gradient(-90deg,rgba(85,85,85,0.13),rgba(255,255,255,0));   background-image:linear-gradient(180deg,rgba(85,85,85,0.13),rgba(255,255,255,0));  background-image:-webkit-linear-gradient(-90deg,rgba(85,85,85,0.13),rgba(255,255,255,0));background-position:0 100%;text-decoration:none;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#21555555,endColorstr=#00FFFFFF)}
ul#css3menu_top img{
	border:none;vertical-align:middle;margin-right:13px;}
ul#css3menu_top ul li:hover>a,ul#css3menu_top ul li a.pressed{
	-moz-box-shadow:0 1px 0 #5682a5;-webkit-box-shadow:0 1px 0 #5682a5;box-shadow:0 1px 0 #5682a5;background-color:#5faceb;background-image:-o-linear-gradient(-90deg,rgba(255,255,255,0),rgba(85,85,85,0.13)); background-image:-moz-linear-gradient(-90deg,rgba(255,255,255,0),rgba(85,85,85,0.13));   background-image:linear-gradient(180deg,rgba(255,255,255,0),rgba(85,85,85,0.13));  background-image:-webkit-linear-gradient(-90deg,rgba(255,255,255,0),rgba(85,85,85,0.13));border-style:none;color:#FFFFFF;text-decoration:none;filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr=#00FFFFFF,endColorstr=#21555555)}
ul#css3menu_top li.topfirst>a{
	-moz-box-shadow:0 0 0 1px #FFFFFF inset;-webkit-box-shadow:0 0 0 1px #FFFFFF inset;box-shadow:0 0 0 1px #FFFFFF inset;background-color:#FFFFFF;border-width:0 1px 0 0;border-style:solid;border-color:#bfc1c2;border-radius:5px 0 0 0;-moz-border-radius:5px 0 0 0;-webkit-border-radius:5px;-webkit-border-top-right-radius:0;-webkit-border-bottom-right-radius:0;-webkit-border-bottom-left-radius:0;text-shadow:0 1px 0 #FFFFFF;}
ul#css3menu_top li.topfirst:hover>a,ul#css3menu_top li.topfirst a.pressed{
	-moz-box-shadow:0 4px 6px -2px rgba(0,20,50, 0.26) inset;-webkit-box-shadow:0 4px 6px -2px rgba(0,20,50, 0.26) inset;box-shadow:0 4px 6px -2px rgba(0,20,50, 0.26) inset;background-color:#FFFFFF;border-style:solid;border-color:#bfc1c2;text-shadow:0 1px 0 #FFFFFF;}
ul#css3menu_top li.topmenu>a{
	-moz-box-shadow:0 0 0 1px #FFFFFF inset;-webkit-box-shadow:0 0 0 1px #FFFFFF inset;box-shadow:0 0 0 1px #FFFFFF inset;background-color:#FFFFFF;border-width:0 1px 0 0;border-style:solid;border-color:#bfc1c2;text-shadow:0 1px 0 #FFFFFF;}
ul#css3menu_top li.topmenu:hover>a,ul#css3menu_top li.topmenu a.pressed{
	-moz-box-shadow:0 4px 6px -2px rgba(0,20,50, 0.26) inset;-webkit-box-shadow:0 4px 6px -2px rgba(0,20,50, 0.26) inset;box-shadow:0 4px 6px -2px rgba(0,20,50, 0.26) inset;background-color:#FFFFFF;border-style:solid;border-color:#bfc1c2;text-shadow:0 1px 0 #FFFFFF;}
ul#css3menu_top li.toplast>a{
	-moz-box-shadow:0 0 0 1px #FFFFFF inset;-webkit-box-shadow:0 0 0 1px #FFFFFF inset;box-shadow:0 0 0 1px #FFFFFF inset;background-color:#FFFFFF;border-width:0px;border-style:solid;border-color:#bfc1c2;border-radius:0 5px 0 0;-moz-border-radius:0 5px 0 0;-webkit-border-radius:0;-webkit-border-top-right-radius:5px;text-shadow:0 1px 0 #FFFFFF;}
ul#css3menu_top li.toplast:hover>a,ul#css3menu_top li.toplast a.pressed{
	-moz-box-shadow:0 4px 6px -2px rgba(0,20,50, 0.26) inset;-webkit-box-shadow:0 4px 6px -2px rgba(0,20,50, 0.26) inset;box-shadow:0 4px 6px -2px rgba(0,20,50, 0.26) inset;background-color:#FFFFFF;border-style:solid;border-color:#bfc1c2;text-shadow:0 1px 0 #FFFFFF;}
ul#css3menu_top>li:nth-child(2){width:19%}ul#css3menu_top>li:nth-child(3){width:19%}ul#css3menu_top>li:nth-child(4){width:14%}ul#css3menu_top>li:nth-child(5){width:17%}ul#css3menu_top>li:nth-child(6){width:15%}
@-moz-document url-prefix(){body:first-of-type ul#css3menu_top{display:inline-block} body:first-of-type ul#css3menu_top>li{display:block;float:left !important;}}
@media only screen and (max-width:656px),only screen and (max-device-width:656px){
ul#css3menu_top>li:nth-child(1){width:31%}ul#css3menu_top>li:nth-child(2){width:35%}ul#css3menu_top>li:nth-child(3){width:34%}ul#css3menu_top>li:nth-child(4){width:30%}ul#css3menu_top>li:nth-child(5){width:37%}ul#css3menu_top>li:nth-child(6){width:33%}body:first-of-type ul#css3menu_top{display:inline-block} body:first-of-type ul#css3menu_top>li{display:block;float:left !important;}}
@media only screen and (max-width:354px),only screen and (max-device-width:354px){
ul#css3menu_top>li:nth-child(1){width:47%}ul#css3menu_top>li:nth-child(2){width:53%}ul#css3menu_top>li:nth-child(3){width:37%}ul#css3menu_top>li:nth-child(4){width:28%}ul#css3menu_top>li:nth-child(5){width:35%}ul#css3menu_top>li:nth-child(6){width:100%}}
@media only screen and (max-width:327px),only screen and (max-device-width:327px){
ul#css3menu_top>li:nth-child(1){width:47%}ul#css3menu_top>li:nth-child(2){width:53%}ul#css3menu_top>li:nth-child(3){width:57%}ul#css3menu_top>li:nth-child(4){width:43%}ul#css3menu_top>li:nth-child(5){width:54%}ul#css3menu_top>li:nth-child(6){width:46%}}
@media only screen and (max-width:232px),only screen and (max-device-width:232px){
ul#css3menu_top>li:nth-child(1){width:47%}ul#css3menu_top>li:nth-child(2){width:53%}ul#css3menu_top>li:nth-child(3){width:100%}ul#css3menu_top>li:nth-child(4){width:45%}ul#css3menu_top>li:nth-child(5){width:55%}ul#css3menu_top>li:nth-child(6){width:100%}}

    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="header-wrap">
        <div id="header">
            <h1>
                <a href="index.html">
                    <img src="images/logo.png" alt="logo" height="46" width="190"></a></h1>
            <!-- logo here -->
            <em style="display: none; top: 100px;" class="ttip">CSS3Menu</em><!--tool tip for logo-->
            <div id="main-menu">
                <ul id="css3menu_top" class="topmenu">
                    <li class="topfirst"><a href="/index.html#overview" style="height: 24px; line-height: 24px;">
                        <img src="/images/menu_files1/home.png" alt="">LiveView</a></li>
                    <li class="topmenu"><a href="/index.html#new" style="height: 24px; line-height: 24px;">
                        <img src="/images/menu_files1/curriculum.png" alt="">DashBoard</a></li>
                    <li class="topmenu"><a href="/#" style="height: 24px; line-height: 24px;"><span>
                        <img src="/images/menu_files1/gear.png" alt="">Manage</span></a>
                        <div class="submenu">
                            <div class="column">
                                <ul>
                                    <li><a href="/index.html#help">
                                        <img src="/images/menu_files1/pencil.png" alt="">My location</a></li>
                                    <li><a href="/css-menu-video-tutorials.html">
                                        <img src="/images/menu_files1/monitor.png" alt="">Remorks</a></li>
                                    <li><a href="/faq.html">
                                        <img src="/images/menu_files1/hammer.png" alt="">POI Management</a></li>
                                    <li><a href="/license.html">
                                        <img src="/images/menu_files1/certificate.png" alt="">Vehicle Master</a></li>
                                    <li><a href="http://css3menu.com/rq/">
                                        <img src="/images/menu_files1/help.png" alt="">Vehicle Manage</a></li>

                                         <li><a href="/index.html#help">
                                        <img src="/images/menu_files1/pencil.png" alt="">Login Master</a></li>
                                    <li><a href="/css-menu-video-tutorials.html">
                                        <img src="/images/menu_files1/monitor.png" alt="">Route Management</a></li>
                                    <li><a href="/faq.html">
                                        <img src="/images/menu_files1/hammer.png" alt="">Time Scheduler</a></li>
                                    <li><a href="/license.html">
                                        <img src="/images/menu_files1/certificate.png" alt="">User Emails</a></li>
                                    <li><a href="http://css3menu.com/rq/">
                                        <img src="/images/menu_files1/help.png" alt="">SMS</a></li>


                                            <li><a href="/index.html#help">
                                        <img src="/images/menu_files1/pencil.png" alt="">Alerts</a></li>
                                    <li><a href="/css-menu-video-tutorials.html">
                                        <img src="/images/menu_files1/monitor.png" alt="">Trip Assignment</a></li>
                                    <li><a href="/faq.html">
                                        <img src="/images/menu_files1/hammer.png" alt="">Change Password</a></li>
                                    <li><a href="/license.html">
                                        <img src="/images/menu_files1/certificate.png" alt="">Get Direction</a></li>
                                    <li><a href="http://css3menu.com/rq/">
                                        <img src="/images/menu_files1/help.png" alt="">Employee Master</a></li>





                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="topmenu"><a href="/#" style="height: 24px; line-height: 24px;"><span>
                        <img src="/images/menu_files1/star.png" alt="">Reports</span></a>
                        <div class="submenu" style="width: 337px;">
                            <div class="column" style="width: 45%">
                                <ul>
                                    <li><a href="/boundary-dark-green.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">General Report</a></li>
                                    <li><a href="/sparkle-brown-vertical.html">
                                        <img src="/images/menu_files1/checkmark1.png" alt="">OverSpeed Report</a></li>
                                    <li><a href="/volume-light-red.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">Daily Report</a></li>
                                    <li><a href="/gleam-dark-blue.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">Stopage Report</a></li>
                                    <li><a href="/sublime-tan.html">
                                        <img src="/images/menu_files1/checkmark1.png" alt="">UnAuthorized Report</a></li>
                                    <li><a href="/blurring-blue-vertical.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">Location HaltingHours Report</a></li>
                                         <li><a href="/smoke-brown.html">
                                        <img src="/images/menu_files1/checkmark1.png" alt="">Vehicle Master Report</a></li>
                                          <li><a href="/metropolitan-dark-lilac.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">Vehicle Manage Report</a></li>
                                         <li><a href="/marker-dark-yellow.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">Location to Location Report</a></li>
                                   
                                  
                                    <li><a href="/fair-grey-rtl.html">
                                        <img src="/images/menu_files1/checkmark9.png" alt="">Status Report</a></li>
                                    <li><a href="/responsive.html">
                                        <img src="/images/menu_files1/checkmark10.png" alt="">Vehicle Remarks Report</a></li>
                                    <li><a href="/demo.html">
                                        <img src="/images/menu_files1/checkmark11.png" alt="">Generate Bills</a></li>
                                         <li><a href="/smoke-brown.html">
                                        <img src="/images/menu_files1/checkmark1.png" alt="">Billing Report</a></li>
                                           <li><a href="/smoke-brown.html">
                                        <img src="/images/menu_files1/checkmark1.png" alt="">Replay Routes</a></li>
                                          <li><a href="/metropolitan-dark-lilac.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">EmptyKMS Report</a></li>
                                </ul>
                            </div>
                           <%-- <div class="column" style="width: 55%">
                                <ul>
                                   
                                </ul>
                            </div>--%>
                        </div>
                    </li>
                    <li class="topmenu"><a href="/license.html" style="height: 24px; line-height: 24px;">
                        <img src="/images/menu_files1/diskette.png" alt="">Tools</a>
                        <div class="submenu" style="width: 337px;">
                            <div class="column" style="width: 45%">
                                <ul>
                                    <li><a href="/boundary-dark-green.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">Shift Change</a></li>
                                    <li><a href="/sparkle-brown-vertical.html">
                                        <img src="/images/menu_files1/checkmark1.png" alt="">Shift Change Report</a></li>
                                    <li><a href="/volume-light-red.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">Get Nearest Vehicle</a></li>
                                    <li><a href="/gleam-dark-blue.html">
                                        <img src="/images/menu_files1/checkmark.png" alt="">Notifications</a></li>
                                    <li><a href="/sublime-tan.html">
                                        <img src="/images/menu_files1/checkmark1.png" alt="">Vehicle Remorks</a></li>
                                </ul>
                            </div>
                         
                        </div>
                        
                        
                        </li>

                    <li class="toplast"><a href="/index.html#contacts" style="height: 24px; line-height: 24px;">
                        <img src="/images/menu_files1/front_desk.png" alt="">LogOut</a></li>
                </ul>
                <p class="_css3m" style="display: none">
                    <a href="http://css3menu.com/">CSS Dropdown Menus Css3Menu.com</a></p>
                <!--end of navigation-->
            </div>
        </div>
    </div>
    </form>
</body>
</html>
