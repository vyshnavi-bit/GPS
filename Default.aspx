﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="DropDownCheckList" Namespace="UNLV.IAP.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="js/JTemplate.js?v=1502" type="text/javascript"></script>
    
    <script src="Newjs/markerclusterer_GZ.js?v=1502" type="text/javascript"></script>
    <%--<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"> </script>  --%> 
    <link href="http://182.18.162.51/HRMSapp/CSS/jquery-ui-1.10.3.custom.css?v=1502" rel="stylesheet" type="text/css" />
    <script src="DropDownCheckList.js?v=1502" type="text/javascript"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js?v=1502" type="text/javascript"></script>
    <script src="Newjs/markerclusterer.js" type="text/javascript"></script>
  <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbt9z3InHbzrV66t1eSZB5TnlJ2HQ-Uc8&v=3.exp&sensor=false"></script>--%>
   <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyDGYPgYpwZ4ZQCLCAujetDwArlVBC_S9TI&sensor=false" type="text/jscript"></script>
    <script src="Newjs/infobox.js?v=1502" type="text/javascript"></script>
    <script src="js/jquery.blockUI.js?v=1502" type="text/javascript"></script>
    <script src="js/jquery.json-2.4.js?v=1502" type="text/javascript"></script>
    
    <style type="text/css">
        html, body
        {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        .bpmouseover
        {
            height: 430px;
            width: 250px;
            display: none;
            position: absolute;
            z-index: 99999;
            padding: 10px 5px 5px 15px;
            background-color: #fffffc;
            border: 1px solid #c0c0c0;
            border-radius: 3px 3px 3px 3px;
            box-shadow: 3px 3px 3px rgba(0,0,0,0.3);
            font-family: Verdana;
            font-size: 12px;
            opacity: 1.0;
        }
        
        .googleMapcls
        {
            width: 100%;
            height: 650px;
            position: relative;
            overflow: hidden;
        }
        
        .inner
        {
            width: 372px;
            position: absolute;
            left: 0px;
            bottom: 0px;
            color: Black;
            z-index: 99900;
            height: 100%;
            top: -2px;
            opacity: 0.9;
            
        }
        .togglediv
        {
            position: absolute;
            width: 330px;
            color: Black; /*z-index: 99900;*/
            border: 2px solid #d5d5d5;
           /* background-color: #2c4b6b;*/
            background-color: #f9fafc;
            opacity: 1.9;
            cursor: pointer;
            top: 69px;
            bottom: 0px;
            left: 0px;
            opacity: 1.9;
        }
        
        .btnShowcls
        {
            display: inline-block;
            min-width: 54px;
            border: 1px solid #dcdcdc;
            border: 1px solid rgba(0,0,0,0.1);
            text-align: center;
            color: #444;
            font-size: 12px;
            font-weight: bold;
            height: 27px;
            padding: 0 8px;
            line-height: 27px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            -webkit-transition: all 0.218s;
            -moz-transition: all 0.218s;
            -o-transition: all 0.218s;
            transition: all 0.218s;
            background-color: #f5f5f5;
            background-image: -webkit-gradient(linear,left top,left bottom,from(#f5f5f5),to(#f1f1f1));
            background-image: -webkit-linear-gradient(top,#f5f5f5,#f1f1f1);
        }
        .btnShowcls:hover
        {
            cursor: pointer;
            -moz-box-shadow: 0px 0px 10px 0px #e0e0e0;
            -webkit-box-shadow: 0px 0px 10px 0px #e0e0e0;
            box-shadow: 0px 0px 10px 0px #e0e0e0;
        }
        div#mapcontent
        {
            right: 0;
            bottom: 0;
            left: 0px;
            top: 91px;
            overflow: hidden;
            position: absolute;
        }
        .tabclass
        {
            display: inline;
            background: #f4f4f4;
            color: rgb(243, 12, 12);
            border: 1px solid gray;
            font-size: 12px;
            margin-right: 4px;
            text-align: center;
            cursor: pointer;
            padding-left: 4px;
            padding-right: 4px;
            font-weight: bold;
        }
        .elemstyle
        {
            direction: ltr;
            overflow: hidden;
            text-align: center;
            position: relative;
            color: rgb(0, 0, 0);
            font-family: Arial, sans-serif;
            -webkit-user-select: none;
            font-size: 13px;
            background-color: rgb(255, 255, 255);
            padding: 1px 6px;
            border: 1px solid rgb(113, 123, 135);
            -webkit-box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px;
            box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px;
            font-weight: bold;
            min-width: 29px;
            background-position: initial initial;
            background-repeat: initial initial;
        }
        #progressbar1 .ui-progressbar-value
        {
            background-color: #00a65a;
        }
        #progressbar2 .ui-progressbar-value
        {
            background-color: #00a65a;
        }
        #progressbar3 .ui-progressbar-value
        {
            background-color: #00a65a;
        }
        #progressbar4 .ui-progressbar-value
        {
            background-color: #00a65a;
        }
        
        .progress-label
        {
            position: absolute;
            left: 50%;
            top: 4px;
            font-weight: bold;
            text-shadow: 1px 1px 0 #fff;
        }
        .pickupclass
        {
            height: 100%;
            width: 100%;
            display: none;
            position: absolute;
            z-index: 99999;
            padding: 10px 5px 5px 15px;
            background-color: #FFFFFF;
            border: 1px solid Gray;
            top: 230px;
            left: 100px;
            position: absolute;
            border-radius: 3px 3px 3px 3px;
            box-shadow: 3px 3px 3px rgba(0,0,0,0.3);
            font-family: Verdana;
            font-size: 12px;
            opacity: 1.0;
        }
    </style>
    <%--////////////...Multiple maps.................//////////////--%>
    <script type="text/javascript">
        $(function () {
            $('#divclose').click(function () {
                $('#divmap').css('display', 'none');
                $(parent).append(child);
                MultipleMapClick();
            });
            //            articlegrid();
            //            articlegrid2();
            //loaddetretrive();
        });
        var child;
        var parent;
        function divOver(id) {
            $('#divmap').css('display', 'block');
            parent = document.getElementById(id);
            child = parent.firstElementChild;
            var dd = child.id;
            $('#divmap').append(child);
            MultipleMapClick();
        }

        function divOut(id, width, height) {
            document.getElementById(id).style.height = height;
            document.getElementById(id).style.width = width;
            document.getElementById(id).style.zIndex = "0";
            document.getElementById(id).style.position = "inherit";
            document.getElementById(id).style.background = "0";
            document.getElementById(id).style.left = "0";
            document.getElementById(id).style.top = "0";
            //            document.getElementById(id).style.textAlign = "inherit";
            //            document.getElementById(id).style.paddingLeft = "0";
        }
    </script>
    <script type="text/javascript">
        var MapType = "1";
        function Maptypechange() {
            $('#divmap').css('display', 'none');
            MapType = document.getElementById('ddlmaptype').value;
            if (MapType == "1" || MapType == "Select") {
                SingleMapClick();
            }
            else {
                MultipleMapClick();
            }
        }
        var ViewType = 'SingleView';
        var map1;
        var map2;
        var map3;
        var map4;
        var map5;
        var map6;
        var map7;
        var map8;
        var map9;
        var map10;
        var map11;
        var map12;
        var map13;
        var map14;
        var map15;
        var map16;
        var map17;
        var map18;
        var map19;
        var map20;
        function MapviewClick() {
            myVar = setInterval(function () { liveupdate() }, 20000);
            $('#divmaptypes').css('display', 'block');
            if (MapType == "1" || MapType == "Select") {
                SingleMapClick();
            }
            else {
                MultipleMapClick();
            }
        }
        function MultipleMapClick() {
            $('#divmaptypes').css('display', 'block');
            if (isplantview) {
                $('#divtoggle').css('display', 'none');
            }
            else {
                $('#divtoggle').css('display', 'block');
            }
            ViewType = 'MultipleView';
            $('#mapcontent').css('display', 'block');
            if (MapType == "4") {
                $('#mapcontent').removeTemplate();
                $('#mapcontent').setTemplateURL('MultipleMaps.htm');
                $('#mapcontent').processTemplate();
            }
            else if (MapType == "8") {
                $('#mapcontent').removeTemplate();
                $('#mapcontent').setTemplateURL('Multimap8.htm');
                $('#mapcontent').processTemplate();
            }
            else if (MapType == "12") {
                $('#mapcontent').removeTemplate();
                $('#mapcontent').setTemplateURL('Multimap12.htm');
                $('#mapcontent').processTemplate();
            }
            else if (MapType == "16") {
                $('#mapcontent').removeTemplate();
                $('#mapcontent').setTemplateURL('Multimap16.htm');
                $('#mapcontent').processTemplate();
            }
            else if (MapType == "20") {
                $('#mapcontent').removeTemplate();
                $('#mapcontent').setTemplateURL('Multimap20.htm');
                $('#mapcontent').processTemplate();
            }
            var mapOptions = {
                center: new google.maps.LatLng(17.497535, 78.408622),
                zoom: 14,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var mapProp1 = {
                center: new google.maps.LatLng(17.497535, 78.408622),
                zoom: 10,
                panControl: true,
                panControlOptions: {
                    position: google.maps.ControlPosition.RIGHT_TOP
                },
                zoomControl: true,
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.SMALL,
                    position: google.maps.ControlPosition.RIGHT_TOP
                },
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            map1 = new google.maps.Map(document.getElementById("googleMap1"), mapProp1);


            //            markerClusterer = new MarkerClusterer(map1);
            map2 = new google.maps.Map(document.getElementById("googleMap2"), mapProp1);
            //            markerClusterer = new MarkerClusterer(map2);
            map3 = new google.maps.Map(document.getElementById("googleMap3"), mapProp1);
            //            markerClusterer = new MarkerClusterer(map3);
            map4 = new google.maps.Map(document.getElementById("googleMap4"), mapProp1);
            //            markerClusterer = new MarkerClusterer(map4);
            if (MapType == "8" || MapType == "12" || MapType == "16" || MapType == "20") {
                map5 = new google.maps.Map(document.getElementById("googleMap5"), mapProp1);
                map6 = new google.maps.Map(document.getElementById("googleMap6"), mapProp1);
                map7 = new google.maps.Map(document.getElementById("googleMap7"), mapProp1);
                map8 = new google.maps.Map(document.getElementById("googleMap8"), mapProp1);
            }
            if (MapType == "12" || MapType == "16" || MapType == "20") {
                map9 = new google.maps.Map(document.getElementById("googleMap9"), mapProp1);
                map10 = new google.maps.Map(document.getElementById("googleMap10"), mapProp1);
                map11 = new google.maps.Map(document.getElementById("googleMap11"), mapProp1);
                map12 = new google.maps.Map(document.getElementById("googleMap12"), mapProp1);
            }
            if (MapType == "16" || MapType == "20") {
                map13 = new google.maps.Map(document.getElementById("googleMap13"), mapProp1);
                map14 = new google.maps.Map(document.getElementById("googleMap14"), mapProp1);
                map15 = new google.maps.Map(document.getElementById("googleMap15"), mapProp1);
                map16 = new google.maps.Map(document.getElementById("googleMap16"), mapProp1);
            }
            if (MapType == "20") {
                map17 = new google.maps.Map(document.getElementById("googleMap17"), mapProp1);
                map18 = new google.maps.Map(document.getElementById("googleMap18"), mapProp1);
                map19 = new google.maps.Map(document.getElementById("googleMap19"), mapProp1);
                map20 = new google.maps.Map(document.getElementById("googleMap20"), mapProp1);
            }
            google.maps.event.addDomListener(window, 'load', initialize);
            Multipleview();
            update();
           
        }
        var listcontrols1 = [];
        function HomeControl1(Mapdiv1, map1, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv1.style.padding = '5px 1px 0px 0px';
            var controlUI1 = document.createElement('div');
            controlUI1.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI1.style.border = '1px solid rgb(113, 123, 135)';
            controlUI1.style.cursor = 'pointer';
            controlUI1.style.textAlign = 'center';
            controlUI1.style.width = '330px';
            controlUI1.title = vehicleno;
            controlUI1.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            controlUI1.id = 'divmap1';
            Mapdiv1.appendChild(controlUI1);
            var controlText1 = document.createElement('div');
            controlText1.style.fontFamily = 'Arial,sans-serif';
            controlText1.style.fontSize = '12px';
            controlText1.style.paddingLeft = '4px';
            controlText1.style.paddingRight = '4px';
            controlText1.style.height = '20px';
            controlText1.style.paddingTop = '1px';
            controlText1.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlUI1.appendChild(controlText1);
            listcontrols1.push({ controlUI1: controlUI1 });
        }
        var listcontrols2 = [];
        function HomeControl2(Mapdiv2, map2, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv2.style.padding = '5px 1px 0px 0px';
            var controlUI2 = document.createElement('div');
            controlUI2.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI2.style.border = '1px solid rgb(113, 123, 135)';
            controlUI2.style.cursor = 'pointer';
            controlUI2.style.textAlign = 'center';
            controlUI2.style.width = '330px';
            controlUI2.title = vehicleno;
            controlUI2.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            controlUI2.id = 'divmap2';
            Mapdiv2.appendChild(controlUI2);
            var controlText2 = document.createElement('div');
            controlText2.style.fontFamily = 'Arial,sans-serif';
            controlText2.style.fontSize = '12px';
            controlText2.style.paddingLeft = '4px';
            controlText2.style.paddingRight = '4px';
            controlText2.style.height = '20px';
            controlText2.style.paddingTop = '1px';
            controlText2.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlUI2.appendChild(controlText2);
            listcontrols2.push({ controlUI2: controlUI2 });
        }
        var listcontrols3 = [];
        function HomeControl3(Mapdiv3, map3, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv3.style.padding = '5px 1px 0px 0px';
            var controlUI3 = document.createElement('div');
            controlUI3.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI3.style.border = '1px solid rgb(113, 123, 135)';
            controlUI3.style.cursor = 'pointer';
            controlUI3.style.textAlign = 'center';
            controlUI3.style.width = '330px';
            controlUI3.title = vehicleno;
            controlUI3.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            controlUI3.id = 'divmap3';
            Mapdiv3.appendChild(controlUI3);
            var controlText3 = document.createElement('div');
            controlText3.style.fontFamily = 'Arial,sans-serif';
            controlText3.style.fontSize = '12px';
            controlText3.style.paddingLeft = '4px';
            controlText3.style.paddingRight = '4px';
            controlText3.style.height = '20px';
            controlText3.style.paddingTop = '1px';
            controlText3.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlUI3.appendChild(controlText3);
            listcontrols3.push({ controlUI3: controlUI3 });
        }
        var listcontrols4 = [];
        function HomeControl4(Mapdiv4, map4, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv4.style.padding = '5px 1px 0px 0px';
            var controlUI4 = document.createElement('div');
            controlUI4.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI4.style.border = '1px solid rgb(113, 123, 135)';
            controlUI4.style.cursor = 'pointer';
            controlUI4.style.textAlign = 'center';
            controlUI4.style.width = '330px';
            controlUI4.title = vehicleno;
            controlUI4.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv4.appendChild(controlUI4);
            var controlText4 = document.createElement('div');
            controlText4.style.fontFamily = 'Arial,sans-serif';
            controlText4.style.fontSize = '12px';
            controlText4.style.paddingLeft = '4px';
            controlText4.style.paddingRight = '4px';
            controlText4.style.height = '20px';
            controlText4.style.paddingTop = '1px';
            controlText4.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText4.id = 'divmap4';
            controlUI4.appendChild(controlText4);
            listcontrols4.push({ controlUI4: controlUI4 });
        }
        function HomeControl5(Mapdiv5, map5, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv5.style.padding = '5px 1px 0px 0px';
            var controlUI5 = document.createElement('div');
            controlUI5.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI5.style.border = '1px solid rgb(113, 123, 135)';
            controlUI5.style.cursor = 'pointer';
            controlUI5.style.textAlign = 'center';
            controlUI5.style.width = '330px';
            controlUI5.title = vehicleno;
            controlUI5.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv5.appendChild(controlUI5);
            var controlText5 = document.createElement('div');
            controlText5.style.fontFamily = 'Arial,sans-serif';
            controlText5.style.fontSize = '12px';
            controlText5.style.paddingLeft = '4px';
            controlText5.style.paddingRight = '4px';
            controlText5.style.height = '20px';
            controlText5.style.paddingTop = '1px';
            controlText5.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText5.id = 'divmap5';
            controlUI5.appendChild(controlText5);
        }
        function HomeControl6(Mapdiv6, map6, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv6.style.padding = '5px 1px 0px 0px';
            var controlUI6 = document.createElement('div');
            controlUI6.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI6.style.border = '1px solid rgb(113, 123, 135)';
            controlUI6.style.cursor = 'pointer';
            controlUI6.style.textAlign = 'center';
            controlUI6.style.width = '330px';
            controlUI6.title = vehicleno;
            controlUI6.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv6.appendChild(controlUI6);
            var controlText6 = document.createElement('div');
            controlText6.style.fontFamily = 'Arial,sans-serif';
            controlText6.style.fontSize = '12px';
            controlText6.style.paddingLeft = '4px';
            controlText6.style.paddingRight = '4px';
            controlText6.style.height = '20px';
            controlText6.style.paddingTop = '1px';
            controlText6.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText6.id = 'divmap6';
            controlUI6.appendChild(controlText6);
        }
        function HomeControl7(Mapdiv7, map7, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv7.style.padding = '5px 1px 0px 0px';
            var controlUI7 = document.createElement('div');
            controlUI7.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI7.style.border = '1px solid rgb(113, 123, 135)';
            controlUI7.style.cursor = 'pointer';
            controlUI7.style.textAlign = 'center';
            controlUI7.style.width = '330px';
            controlUI7.title = vehicleno;
            controlUI7.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv7.appendChild(controlUI7);
            var controlText7 = document.createElement('div');
            controlText7.style.fontFamily = 'Arial,sans-serif';
            controlText7.style.fontSize = '12px';
            controlText7.style.paddingLeft = '4px';
            controlText7.style.paddingRight = '4px';
            controlText7.style.height = '20px';
            controlText7.style.paddingTop = '1px';
            controlText7.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText7.id = 'divmap7';
            controlUI7.appendChild(controlText7);
        }
        function HomeControl8(Mapdiv8, map8, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv8.style.padding = '5px 1px 0px 0px';
            var controlUI8 = document.createElement('div');
            controlUI8.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI8.style.border = '1px solid rgb(113, 123, 135)';
            controlUI8.style.cursor = 'pointer';
            controlUI8.style.textAlign = 'center';
            controlUI8.style.width = '330px';
            controlUI8.title = vehicleno;
            controlUI8.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv8.appendChild(controlUI8);
            var controlText8 = document.createElement('div');
            controlText8.style.fontFamily = 'Arial,sans-serif';
            controlText8.style.fontSize = '12px';
            controlText8.style.paddingLeft = '4px';
            controlText8.style.paddingRight = '4px';
            controlText8.style.height = '20px';
            controlText8.style.paddingTop = '1px';
            controlText8.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText8.id = 'divmap8';
            controlUI8.appendChild(controlText8);
        }
        function HomeControl9(Mapdiv9, map9, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv9.style.padding = '5px 1px 0px 0px';
            var controlUI9 = document.createElement('div');
            controlUI9.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI9.style.border = '1px solid rgb(113, 123, 135)';
            controlUI9.style.cursor = 'pointer';
            controlUI9.style.textAlign = 'center';
            controlUI9.style.width = '330px';
            controlUI9.title = vehicleno;
            controlUI9.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv9.appendChild(controlUI9);
            var controlText9 = document.createElement('div');
            controlText9.style.fontFamily = 'Arial,sans-serif';
            controlText9.style.fontSize = '12px';
            controlText9.style.paddingLeft = '4px';
            controlText9.style.paddingRight = '4px';
            controlText9.style.height = '20px';
            controlText9.style.paddingTop = '1px';
            controlText9.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText9.id = 'divmap9';
            controlUI9.appendChild(controlText9);
        }
        function HomeControl10(Mapdiv10, map10, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv10.style.padding = '5px 1px 0px 0px';
            var controlUI10 = document.createElement('div');
            controlUI10.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI10.style.border = '1px solid rgb(113, 123, 135)';
            controlUI10.style.cursor = 'pointer';
            controlUI10.style.textAlign = 'center';
            controlUI10.style.width = '330px';
            controlUI10.title = vehicleno;
            controlUI10.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv10.appendChild(controlUI10);
            var controlText10 = document.createElement('div');
            controlText10.style.fontFamily = 'Arial,sans-serif';
            controlText10.style.fontSize = '12px';
            controlText10.style.paddingLeft = '4px';
            controlText10.style.paddingRight = '4px';
            controlText10.style.height = '20px';
            controlText10.style.paddingTop = '1px';
            controlText10.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText10.id = 'divmap10';
            controlUI10.appendChild(controlText10);
        }
        function HomeControl11(Mapdiv11, map11, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv11.style.padding = '5px 1px 0px 0px';
            var controlUI11 = document.createElement('div');
            controlUI11.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI11.style.border = '1px solid rgb(113, 123, 135)';
            controlUI11.style.cursor = 'pointer';
            controlUI11.style.textAlign = 'center';
            controlUI11.style.width = '330px';
            controlUI11.title = vehicleno;
            controlUI11.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv11.appendChild(controlUI11);
            var controlText11 = document.createElement('div');
            controlText11.style.fontFamily = 'Arial,sans-serif';
            controlText11.style.fontSize = '12px';
            controlText11.style.paddingLeft = '4px';
            controlText11.style.paddingRight = '4px';
            controlText11.style.height = '20px';
            controlText11.style.paddingTop = '1px';
            controlText11.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText11.id = 'divmap11';
            controlUI11.appendChild(controlText11);
        }
        function HomeControl12(Mapdiv12, map12, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv12.style.padding = '5px 1px 0px 0px';
            var controlUI12 = document.createElement('div');
            controlUI12.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI12.style.border = '1px solid rgb(113, 123, 135)';
            controlUI12.style.cursor = 'pointer';
            controlUI12.style.textAlign = 'center';
            controlUI12.style.width = '330px';
            controlUI12.title = vehicleno;
            controlUI12.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv12.appendChild(controlUI12);
            var controlText12 = document.createElement('div');
            controlText12.style.fontFamily = 'Arial,sans-serif';
            controlText12.style.fontSize = '12px';
            controlText12.style.paddingLeft = '4px';
            controlText12.style.paddingRight = '4px';
            controlText12.style.height = '20px';
            controlText12.style.paddingTop = '1px';
            controlText12.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText12.id = 'divmap12';
            controlUI12.appendChild(controlText12);
        }
        function HomeControl13(Mapdiv13, map13, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv13.style.padding = '5px 1px 0px 0px';
            var controlUI13 = document.createElement('div');
            controlUI13.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI13.style.border = '1px solid rgb(113, 123, 135)';
            controlUI13.style.cursor = 'pointer';
            controlUI13.style.textAlign = 'center';
            controlUI13.style.width = '330px';
            controlUI13.title = vehicleno;
            controlUI13.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv13.appendChild(controlUI13);
            var controlText13 = document.createElement('div');
            controlText13.style.fontFamily = 'Arial,sans-serif';
            controlText13.style.fontSize = '12px';
            controlText13.style.paddingLeft = '4px';
            controlText13.style.paddingRight = '4px';
            controlText13.style.height = '20px';
            controlText13.style.paddingTop = '1px';
            controlText13.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText13.id = 'divmap13';
            controlUI13.appendChild(controlText13);
        }
        function HomeControl14(Mapdiv14, map14, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv14.style.padding = '5px 1px 0px 0px';
            var controlUI14 = document.createElement('div');
            controlUI14.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI14.style.border = '1px solid rgb(113, 123, 135)';
            controlUI14.style.cursor = 'pointer';
            controlUI14.style.textAlign = 'center';
            controlUI14.style.width = '330px';
            controlUI14.title = vehicleno;
            controlUI14.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv14.appendChild(controlUI14);
            var controlText14 = document.createElement('div');
            controlText14.style.fontFamily = 'Arial,sans-serif';
            controlText14.style.fontSize = '12px';
            controlText14.style.paddingLeft = '4px';
            controlText14.style.paddingRight = '4px';
            controlText14.style.height = '20px';
            controlText14.style.paddingTop = '1px';
            controlText14.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText14.id = 'divmap14';
            controlUI14.appendChild(controlText14);
        }
        function HomeControl15(Mapdiv15, map15, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv15.style.padding = '5px 1px 0px 0px';
            var controlUI15 = document.createElement('div');
            controlUI15.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI15.style.border = '1px solid rgb(113, 123, 135)';
            controlUI15.style.cursor = 'pointer';
            controlUI15.style.textAlign = 'center';
            controlUI15.style.width = '330px';
            controlUI15.title = vehicleno;
            controlUI15.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv15.appendChild(controlUI15);
            var controlText15 = document.createElement('div');
            controlText15.style.fontFamily = 'Arial,sans-serif';
            controlText15.style.fontSize = '12px';
            controlText15.style.paddingLeft = '4px';
            controlText15.style.paddingRight = '4px';
            controlText15.style.height = '20px';
            controlText15.style.paddingTop = '1px';
            controlText15.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText15.id = 'divmap15';
            controlUI15.appendChild(controlText15);
        }
        function HomeControl16(Mapdiv16, map16, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv16.style.padding = '5px 1px 0px 0px';
            var controlUI16 = document.createElement('div');
            controlUI16.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI16.style.border = '1px solid rgb(113, 123, 135)';
            controlUI16.style.cursor = 'pointer';
            controlUI16.style.textAlign = 'center';
            controlUI16.style.width = '330px';
            controlUI16.title = vehicleno;
            controlUI16.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv16.appendChild(controlUI16);
            var controlText16 = document.createElement('div');
            controlText16.style.fontFamily = 'Arial,sans-serif';
            controlText16.style.fontSize = '12px';
            controlText16.style.paddingLeft = '4px';
            controlText16.style.paddingRight = '4px';
            controlText16.style.height = '20px';
            controlText16.style.paddingTop = '1px';
            controlText16.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText16.id = 'divmap16';
            controlUI16.appendChild(controlText16);
        }
        function HomeControl17(Mapdiv17, map17, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv17.style.padding = '5px 1px 0px 0px';
            var controlUI17 = document.createElement('div');
            controlUI17.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI17.style.border = '1px solid rgb(113, 123, 135)';
            controlUI17.style.cursor = 'pointer';
            controlUI17.style.textAlign = 'center';
            controlUI17.style.width = '330px';
            controlUI17.title = vehicleno;
            controlUI17.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv17.appendChild(controlUI17);
            var controlText17 = document.createElement('div');
            controlText17.style.fontFamily = 'Arial,sans-serif';
            controlText17.style.fontSize = '12px';
            controlText17.style.paddingLeft = '4px';
            controlText17.style.paddingRight = '4px';
            controlText17.style.height = '20px';
            controlText17.style.paddingTop = '1px';
            controlText17.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText17.id = 'divmap17';
            controlUI17.appendChild(controlText17);
        }
        function HomeControl18(Mapdiv18, map18, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv18.style.padding = '5px 1px 0px 0px';
            var controlUI18 = document.createElement('div');
            controlUI18.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI18.style.border = '1px solid rgb(113, 123, 135)';
            controlUI18.style.cursor = 'pointer';
            controlUI18.style.textAlign = 'center';
            controlUI18.style.width = '330px';
            controlUI18.title = vehicleno;
            controlUI18.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv18.appendChild(controlUI18);
            var controlText18 = document.createElement('div');
            controlText18.style.fontFamily = 'Arial,sans-serif';
            controlText18.style.fontSize = '12px';
            controlText18.style.paddingLeft = '4px';
            controlText18.style.paddingRight = '4px';
            controlText18.style.height = '20px';
            controlText18.style.paddingTop = '1px';
            controlText18.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText18.id = 'divmap18';
            controlUI18.appendChild(controlText18);
        }
        function HomeControl19(Mapdiv19, map19, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv19.style.padding = '5px 1px 0px 0px';
            var controlUI19 = document.createElement('div');
            controlUI19.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI19.style.border = '1px solid rgb(113, 123, 135)';
            controlUI19.style.cursor = 'pointer';
            controlUI19.style.textAlign = 'center';
            controlUI19.style.width = '330px';
            controlUI19.title = vehicleno;
            controlUI19.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv19.appendChild(controlUI19);
            var controlText19 = document.createElement('div');
            controlText19.style.fontFamily = 'Arial,sans-serif';
            controlText19.style.fontSize = '12px';
            controlText19.style.paddingLeft = '4px';
            controlText19.style.paddingRight = '4px';
            controlText19.style.height = '20px';
            controlText19.style.paddingTop = '1px';
            controlText19.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText19.id = 'divmap19';
            controlUI19.appendChild(controlText19);
        }
        function HomeControl20(Mapdiv20, map20, vehicleno, RouteName, stpdtimestamp) {
            Mapdiv20.style.padding = '5px 1px 0px 0px';
            var controlUI20 = document.createElement('div');
            controlUI20.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI20.style.border = '1px solid rgb(113, 123, 135)';
            controlUI20.style.cursor = 'pointer';
            controlUI20.style.textAlign = 'center';
            controlUI20.style.width = '330px';
            controlUI20.title = vehicleno;
            controlUI20.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            Mapdiv20.appendChild(controlUI20);
            var controlText20 = document.createElement('div');
            controlText20.style.fontFamily = 'Arial,sans-serif';
            controlText20.style.fontSize = '12px';
            controlText20.style.paddingLeft = '4px';
            controlText20.style.paddingRight = '4px';
            controlText20.style.height = '20px';
            controlText20.style.paddingTop = '1px';
            controlText20.innerHTML = '<b ><span style="font-size:16px;color:Green;">' + stpdtimestamp + "-" + '</span><b>' + vehicleno + "-" + '<span style="font-size:14px;color:Red;">' + RouteName + '</span><b>';
            controlText20.id = 'divmap20';
            controlUI20.appendChild(controlText20);
        }
        var Gridbind;

        function SingleMapClick() {
            $('#divtoggle').css('display', 'block');
            ViewType = 'SingleView';
            $('#mapcontent').removeTemplate();
            $("#mapcontent").setTemplateURL('Map.htm');
            $('#mapcontent').processTemplate();
            initialize();
            update();
            //            google.maps.event.addDomListener(window, 'load', initialize);
        }
        var Tripdata;
        function bindVehicles(data) {
            Tripdata = data;
        }
        var MsgData;
        function TripviewClick() {
            clearInterval(myVar);
            $('#divmaptypes').css('display', 'none');
            $('#divtoggle').css('display', 'none');
            ViewType = 'Tripview';
            var data = { 'op': 'GetTripdata', plant: 'ALL' };
            var s = function (msg) {
                if (msg) {
                    BindtoTripview(msg);
                    MsgData = msg;
                    for (var i = 0; i < msg.length; i++) {
                        fillgrid(msg[i].SubTriplist, i);
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
                // $('#BookingDetails').html(x);
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        var TabCount = 1;
        function TripTabs() {
            var parent = document.getElementById("divTabs");
            //            TabCount = Math.ceil(VehicleCount / 4);
            var child = document.getElementById("ull");
            if (child != null) {
                parent.removeChild(child);
            }
            var ul = document.createElement('ul');
            ul.id = 'ull';
            for (var i = 0; i < TabCount; i++) {
                var li = document.createElement('li');
                li.innerHTML = (i + 1).toString();
                li.className = 'tabclass';
                ul.appendChild(li);
            }
            parent.appendChild(ul);
            TabclassClick();
        }
        var selectedplant = "";
        function refreshclick() {
            selectedtab = 1;
            var plantsno = document.getElementById('ddl_plants');
            selectedplant = plantsno.value;
            if (selectedplant == "ALL") {
                alert("Please select plant.");
                return;
            }
            var data = { 'op': 'GetTripdata', plant: selectedplant };
            var s = function (msg) {
                if (msg) {
                    BindtoTripview(msg);
                    MsgData = msg;
                    for (var i = 0; i < msg.length; i++) {
                        fillgrid(msg[i].SubTriplist, i);
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
                // $('#BookingDetails').html(x);
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function fillgrid(MsgData, i) {
            if (i >= startcount && i < EndCount) {
                if (i % 4 == 0) {
                    if (MsgData != null) {
                        var table = document.getElementById("Table1");
                        if (!table.tHead) {
                            var header = table.createTHead();
                            var rowx = header.insertRow(0);
                            var cell1 = rowx.insertCell(0);
                            var cell2 = rowx.insertCell(0);
                            var cell3 = rowx.insertCell(0);
                            cell3.innerHTML = "<b>Sno</b>";
                            cell2.innerHTML = "<b>Location Name</b>";
                            cell1.innerHTML = "<b>Enter Time</b>";
                        }
                        var completedcount1 = 0;
                        for (var j = MsgData.length; j--; ) {
                            if (document.getElementById('txtVehicleNo1').innerHTML == MsgData[j].VehicleNo) {
                                var row = table.insertRow(1);
                                var cell1 = row.insertCell(0);
                                var cell2 = row.insertCell(1);
                                var cell3 = row.insertCell(2);
                                cell1.innerHTML = j + 1;
                                cell2.innerHTML = MsgData[j].LocationName;
                                cell3.innerHTML = MsgData[j].EnterTime;
                                if (MsgData[j].EnterTime != null && MsgData[j].EnterTime != "") {
                                    row.style.backgroundColor = "#FFFFCC";
                                    completedcount1++;
                                }
                            }
                        }
                        var percentage1 = Math.round((completedcount1 / MsgData.length) * 100);
                        $("#progressbar1").progressbar({
                            value: percentage1
                        });
                        $("#progressbar1_lbl").text(completedcount1 + ' / ' + MsgData.length);
                    }
                }
                if (i % 4 == 1) {
                    if (MsgData != null) {
                        var table2 = document.getElementById("Table2");
                        if (!table2.tHead) {
                            var header = table2.createTHead();
                            var rowx = header.insertRow(0);
                            var cell1 = rowx.insertCell(0);
                            var cell2 = rowx.insertCell(0);
                            var cell3 = rowx.insertCell(0);
                            cell3.innerHTML = "<b>Sno</b>";
                            cell2.innerHTML = "<b>Location Name</b>";
                            cell1.innerHTML = "<b>Enter Time</b>";
                        }
                        var completedcount2 = 0;
                        for (var j = MsgData.length; j--; ) {
                            if (document.getElementById('txtVehicleNo2').innerHTML == MsgData[j].VehicleNo) {
                                var row2 = table2.insertRow(1);
                                var cell1 = row2.insertCell(0);
                                var cell2 = row2.insertCell(1);
                                var cell3 = row2.insertCell(2);
                                cell1.innerHTML = j + 1;
                                cell2.innerHTML = MsgData[j].LocationName;
                                cell3.innerHTML = MsgData[j].EnterTime;
                                if (MsgData[j].EnterTime != null && MsgData[j].EnterTime != "") {
                                    row2.style.backgroundColor = "#FFFFCC";
                                    completedcount2++;
                                }
                            }
                        }
                        var percentage2 = Math.round((completedcount2 / MsgData.length) * 100);
                        $("#progressbar2").progressbar({
                            value: percentage2
                        });
                        $("#progressbar2_lbl").text(completedcount2 + ' / ' + MsgData.length);
                    }
                }
                if (i % 4 == 2) {
                    if (VehicleCount >= 3) {
                        if (MsgData != null) {
                            var table3 = document.getElementById("Table3");
                            if (!table3.tHead) {
                                var header = table3.createTHead();
                                var rowx = header.insertRow(0);
                                var cell1 = rowx.insertCell(0);
                                var cell2 = rowx.insertCell(0);
                                var cell3 = rowx.insertCell(0);
                                cell3.innerHTML = "<b>Sno</b>";
                                cell2.innerHTML = "<b>Location Name</b>";
                                cell1.innerHTML = "<b>Enter Time</b>";
                            }
                            var completedcount = 0;
                            for (var j = MsgData.length; j--; ) {
                                if (document.getElementById('txtVehicleNo3').innerHTML == MsgData[j].VehicleNo) {
                                    var row2 = table3.insertRow(1);
                                    var cell1 = row2.insertCell(0);
                                    var cell2 = row2.insertCell(1);
                                    var cell3 = row2.insertCell(2);
                                    cell1.innerHTML = j + 1;
                                    cell2.innerHTML = MsgData[j].LocationName;
                                    cell3.innerHTML = MsgData[j].EnterTime;
                                    if (MsgData[j].EnterTime != null && MsgData[j].EnterTime != "") {
                                        row2.style.backgroundColor = "#FFFFCC";
                                        completedcount++;
                                    }
                                }
                            }
                            var percentage = Math.round((completedcount / MsgData.length) * 100);
                            $("#progressbar3").progressbar({
                                value: percentage
                            });
                            $("#progressbar3_lbl").text(completedcount + ' / ' + MsgData.length);

                        }
                    }
                }
                if (i % 4 == 3) {
                    if (VehicleCount >= 4) {
                        if (MsgData != null) {
                            var table4 = document.getElementById("Table4");
                            if (!table4.tHead) {
                                var header = table4.createTHead();
                                var rowx = header.insertRow(0);
                                var cell1 = rowx.insertCell(0);
                                var cell2 = rowx.insertCell(0);
                                var cell3 = rowx.insertCell(0);
                                cell3.innerHTML = "<b>Sno</b>";
                                cell2.innerHTML = "<b>Location Name</b>";
                                cell1.innerHTML = "<b>Enter Time</b>";
                            }
                            var completedcount = 0;
                            for (var j = MsgData.length; j--; ) {
                                if (document.getElementById('txtVehicleNo4').innerHTML == MsgData[j].VehicleNo) {
                                    var row2 = table4.insertRow(1);
                                    var cell1 = row2.insertCell(0);
                                    var cell2 = row2.insertCell(1);
                                    var cell3 = row2.insertCell(2);
                                    cell1.innerHTML = j + 1;
                                    cell2.innerHTML = MsgData[j].LocationName;
                                    cell3.innerHTML = MsgData[j].EnterTime;
                                    if (MsgData[j].EnterTime != null && MsgData[j].EnterTime != "") {
                                        row2.style.backgroundColor = "#FFFFCC";
                                        completedcount++;
                                    }
                                }
                            }
                            var percentage = Math.round((completedcount / MsgData.length) * 100);
                            $("#progressbar4").progressbar({
                                value: percentage
                            });

                            $("#progressbar4_lbl").text(completedcount + ' / ' + MsgData.length);

                        }
                    }
                }
            }
        }

        var isplantview = false;
        function PlantviewClick() {
            var pantviewchk = document.getElementById('ckb_plantview');
            if (pantviewchk.checked) {
                isplantview = true;
            }
            else {
                isplantview = false;
            }

            if (Locationsdata.length > 0) {
            }
            else {
                var data = { 'op': 'ShowMyLocations' };
                var s = function (msg) {
                    if (msg) {
                        Bindlocations(msg);
                    }
                    else {
                    }
                };
                var e = function (x, h, e) {
                    // $('#BookingDetails').html(x);
                };
                callHandler(data, s, e);
            }
            Maptypechange();
        }

        var VehicleCount = 0;
        var startcount = 0;
        var EndCount = 0;
        var VCount = [];

        var VehicleNo1 = "";
        var VehicleNo2 = "";
        var VehicleNo3 = "";
        var VehicleNo4 = "";
        function BindtoTripview(databind) {
            Gridbind = databind;
            $('#mapcontent').css('display', 'block');
            $('#mapcontent').removeTemplate();
            $('#mapcontent').setTemplateURL('tripview.htm');
            $('#mapcontent').processTemplate(databind);
            //              if (count>= startcount && count< EndCount) {
            VCount = [];
            for (var i = 0; i < databind.length; i++) {
                VCount.push(databind[i].VehicleNo);
                if (databind[i].allplants != null) {
                    var select = document.getElementById('ddl_plants');
                    var opt = document.createElement('option');
                    opt.value = "ALL";
                    opt.innerHTML = "ALL";
                    select.appendChild(opt);
                    for (var j = 0; j <= databind[i].allplants.length; j++) {
                        var opt = document.createElement('option');
                        if (databind[i].allplants[j] != null) {
                            opt.value = databind[i].allplants[j].plantsno;
                            opt.innerHTML = databind[i].allplants[j].plantname;
                            select.appendChild(opt);
                        }
                    }
                }
            }
            var dd = document.getElementById('ddl_plants');
            for (var i = 0; i < dd.options.length; i++) {
                if (dd.options[i].value === selectedplant) {
                    dd.selectedIndex = i;
                    break;
                }
            }

            VehicleCount = VCount.length;
            if (TabCount == 0) {
                TabCount = 1;
            }

            TabCount = Math.ceil(VehicleCount / 4);
            startcount = (selectedtab - 1) * 4;
            EndCount = selectedtab * 4;
            TripTabs();

            for (var i = startcount; i < EndCount; i++) {
                if (i % 4 == 0) {
                    if (typeof databind[i] === "undefined") {
                    }
                    else {
                        document.getElementById('txtTripNo1').innerHTML = databind[i].TripName;
                        document.getElementById('txtVehicleNo1').innerHTML = databind[i].VehicleNo;
                        document.getElementById('txtRouteName1').innerHTML = databind[i].RouteName;
                        VCount.push(databind[i].VehicleNo);
                        VehicleNo1 = databind[i].VehicleNo;
                        document.getElementById('txtStartTime1').innerHTML = databind[i].Assigndate;
                    }
                }
                if (i % 4 == 1) {
                    if (typeof databind[i] === "undefined") {
                    }
                    else {
                        document.getElementById('txtTripNo2').innerHTML = databind[i].TripName;
                        document.getElementById('txtVehicleNo2').innerHTML = databind[i].VehicleNo;
                        VehicleNo2 = databind[i].VehicleNo;
                        document.getElementById('txtRouteName2').innerHTML = databind[i].RouteName;
                        document.getElementById('txtStartTime2').innerHTML = databind[i].Assigndate;
                    }
                }
                if (i % 4 == 2) {
                    if (VehicleCount >= 3) {
                        if (typeof databind[i] === "undefined") {
                        }
                        else {
                            document.getElementById('txtTripNo3').innerHTML = databind[i].TripName;
                            document.getElementById('txtVehicleNo3').innerHTML = databind[i].VehicleNo;
                            VehicleNo3 = databind[i].VehicleNo;
                            document.getElementById('txtRouteName3').innerHTML = databind[i].RouteName;
                            document.getElementById('txtStartTime3').innerHTML = databind[i].Assigndate;
                        }
                    }
                }
                if (i % 4 == 3) {
                    if (VehicleCount >= 4) {
                        if (typeof databind[i] === "undefined") {
                        }
                        else {
                            document.getElementById('txtTripNo4').innerHTML = databind[i].TripName;
                            document.getElementById('txtVehicleNo4').innerHTML = databind[i].VehicleNo;
                            VehicleNo4 = databind[i].VehicleNo;
                            document.getElementById('txtRouteName4').innerHTML = databind[i].RouteName;
                            document.getElementById('txtStartTime4').innerHTML = databind[i].Assigndate;
                        }
                    }
                }
            }
            VehicleCount = VCount.length;
            $('.tabclass').css('background-color', '#f4f4f4');
            $('.tabclass').each(function (i, data) {
                if (data.innerHTML == selectedtab) {
                    $(this).css('background-color', 'yellow');
                }
            });
        }
        var TabCount = 1;
        function Multipleview() {
        }
    </script>
    <script type="text/javascript">
        var selectedtab = 1;
        function TabclassClick() {
            $('.tabclass').click(function () {
                var clickedtab = $(this).text();
                var count1 = parseInt(clickedtab);
                selectedtab = clickedtab;
                update();
                if (ViewType == "Tripview") {
                    BindtoTripview(MsgData);
                    for (var i = 0; i < MsgData.length; i++) {
                        fillgrid(MsgData[i].SubTriplist, i);
                    }
                }
                $('.tabclass').css('background-color', '#f4f4f4');
                $('.tabclass').each(function (i, data) {
                    if (data.innerHTML == selectedtab) {
                        $(this).css('background-color', 'yellow');
                    }
                });
            });
        }
    </script>
    <script type="text/javascript">
        var VehicleCount = 0;
        function onallcheck(id) {
            checkedvehicles = [];
            for (var vehicledata in livedata) {
                var vehicleno = livedata[vehicledata].vehiclenum;
                var vehicle = $("#" + vehicleno + "");
                if (id.checked == true) {
                    if (typeof vehicle[0] === "undefined") {
                    }
                    else {
                        vehicle[0].checked = true;
                        checkedvehicles.push(vehicleno);
                    }
                }
                else {
                    if (typeof vehicle[0] === "undefined") {
                    }
                    else {
                        vehicle[0].checked = false;
                    }
                }
            }
            VehicleCount = checkedvehicles.length;
            if (ViewType == "MultipleView") {
                Multipleview();
            }
            //            alert(VehicleCount);
            closeinfowindow();
            update();
            var latlngbounds = new google.maps.LatLngBounds();
            if (latlng_pos.length > 1) {
                for (var i = 0; i < latlng_pos.length; i++) {
                    latlngbounds.extend(latlng_pos[i]);
                }
                map.fitBounds(latlngbounds);
            }
            else if (latlng_pos.length == 1) {
                for (var i = 0; i < latlng_pos.length; i++) {
                    latlngbounds.extend(latlng_pos[i]);
                }
                map.fitBounds(latlngbounds);
                map.setZoom(12);
            }
            else {
                map.setCenter(new google.maps.LatLng(17.497535, 78.408622));
                map.setZoom(6);
            }
            deletelocationOverlays();
            if (!showlocations) {
                if (Locationsdata.length > 0) {
                    for (var vehicledata in Locationsdata) {
                        var myCenter = new google.maps.LatLng(Locationsdata[vehicledata].latitude, Locationsdata[vehicledata].longitude);
                        placeMarkerlocations(myCenter, Locationsdata[vehicledata].BranchName, Locationsdata[vehicledata].Image, Locationsdata[vehicledata].Decription, Locationsdata[vehicledata].isplant, Locationsdata[vehicledata].radius, Locationsdata[vehicledata].vehno);
                    }
                }
                else {
                    var data = { 'op': 'ShowMyLocations' };
                    var s = function (msg) {
                        if (msg) {
                            Bindlocations(msg);
                        }
                        else {
                        }
                    };
                    var e = function (x, h, e) {
                    };
                    callHandler(data, s, e);
                }
            }
        }

        var map;
        var clusteredview = true;
        var showlocations = true;
        var Locationsdata = new Array();
        var myCenter = new google.maps.LatLng(17.497535, 78.408622);
        // Add a Home control that returns the user to London
        function HomeControl(controlDiv, map) {
            controlDiv.style.padding = '5px 1px 0px 0px';
            var controlUI = document.createElement('div');
            controlUI.style.backgroundColor = 'rgb(255, 255, 255)';
            controlUI.style.border = '1px solid rgb(113, 123, 135)';
            controlUI.style.cursor = 'pointer';
            controlUI.style.textAlign = 'center';
            controlUI.style.width = '120px';
            controlUI.title = 'NonClustered View';
            controlUI.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            controlDiv.appendChild(controlUI);
            var controlText = document.createElement('div');
            controlText.style.fontFamily = 'Arial,sans-serif';
            controlText.style.fontSize = '12px';
            controlText.style.paddingLeft = '4px';
            controlText.style.paddingRight = '4px';
            controlText.style.height = '20px';
            controlText.style.paddingTop = '1px';
            controlText.innerHTML = '<b>NonClustered View<b>'
            controlUI.appendChild(controlText);

            // Setup click-event listener: simply set the map to London
            google.maps.event.addDomListener(controlUI, 'click', function () {
                if (clusteredview) {
                    clusteredview = false;
                    update();
                    closeinfowindow();
                    controlText.innerHTML = '<b>Clustered View<b>'
                    controlUI.title = 'Clustered View';
                }
                else {
                    clusteredview = true;
                    controlUI.title = 'NonClustered View';
                    controlText.innerHTML = '<b>NonClustered View<b>'
                    closeinfowindow();
                    update();
                }
            });
        }

        // Add a Locations control that returns the user to London
        function LocationsControl(locationcontrolDiv, map) {
            //            var locationcontrolUI1 = document.createElement('div');
            //            locationcontrolUI1.style.backgroundColor = 'rgb(255, 255, 255)';
            //            locationcontrolUI1.style.border = '1px solid rgb(113, 123, 135)';
            //            locationcontrolUI1.style.cursor = 'pointer';
            //            locationcontrolUI1.style.textAlign = 'center';
            //            locationcontrolUI1.style.width = '110px';
            //            locationcontrolUI1.title = 'Show Locations';
            //            locationcontrolUI1.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            //            locationcontrolDiv.appendChild(locationcontrolUI1);
            //            var locationcontrolText1 = document.createElement('div');
            //            locationcontrolText1.style.fontFamily = 'Arial,sans-serif';
            //            locationcontrolText1.style.fontSize = '12px';
            //            locationcontrolText1.style.paddingLeft = '4px';
            //            locationcontrolText1.style.paddingRight = '4px';
            //            locationcontrolText1.style.height = '20px';
            //            locationcontrolText1.style.paddingTop = '1px';
            //            locationcontrolText1.innerHTML = '<b>Show Locations<b>'
            //            locationcontrolUI1.appendChild(locationcontrolText1);


            locationcontrolDiv.style.padding = '5px 0px 0px 0px';
            var locationcontrolUI = document.createElement('div');
            locationcontrolUI.style.backgroundColor = 'rgb(255, 255, 255)';
            locationcontrolUI.style.border = '1px solid rgb(113, 123, 135)';
            locationcontrolUI.style.cursor = 'pointer';
            locationcontrolUI.style.textAlign = 'center';
            locationcontrolUI.style.width = '110px';
            locationcontrolUI.title = 'Show Locations';
            locationcontrolUI.style.boxShadow = "rgba(0, 0, 0, 0.4) 0px 2px 4px";
            locationcontrolDiv.appendChild(locationcontrolUI);
            var locationcontrolText = document.createElement('div');
            locationcontrolText.style.fontFamily = 'Arial,sans-serif';
            locationcontrolText.style.fontSize = '12px';
            locationcontrolText.style.paddingLeft = '4px';
            locationcontrolText.style.paddingRight = '4px';
            locationcontrolText.style.height = '20px';
            locationcontrolText.style.paddingTop = '1px';
            locationcontrolText.innerHTML = '<b>Show Locations<b>'
            locationcontrolUI.appendChild(locationcontrolText);

            // Setup click-event listener: simply set the map to London
            google.maps.event.addDomListener(locationcontrolUI, 'click', function () {
                if (showlocations) {
                    showlocations = false;
                    locationcontrolText.innerHTML = '<b>Hide Locations<b>'
                    locationcontrolUI.title = "Hide Locations";
                    if (Locationsdata.length > 0) {
                        for (var vehicledata in Locationsdata) {
                            var myCenter = new google.maps.LatLng(Locationsdata[vehicledata].latitude, Locationsdata[vehicledata].longitude);
                            placeMarkerlocations(myCenter, Locationsdata[vehicledata].BranchName, Locationsdata[vehicledata].Image, Locationsdata[vehicledata].Decription, Locationsdata[vehicledata].isplant, Locationsdata[vehicledata].radius, Locationsdata[vehicledata].vehno);
                        }
                        $(this).val("Hide Locations");
                    }
                    else {
                        var data = { 'op': 'ShowMyLocations' };
                        var s = function (msg) {
                            if (msg) {
                                Bindlocations(msg);
                            }
                            else {
                            }
                        };
                        var e = function (x, h, e) {
                            // $('#BookingDetails').html(x);
                        };
                        callHandler(data, s, e);
                        $(this).val("Hide Locations");
                    }
                }
                else {
                    showlocations = true;
                    locationcontrolText.innerHTML = '<b>Show Locations<b>'
                    locationcontrolUI.title = "Show Locations";
                    deletelocationOverlays();
                }
            });
        }
        var plants = [];
        var loginplants = [];
        function Bindlocations(data) {
            Locationsdata = data;
            for (var vehicledata in data) {
                if (!isplantview) {
                    var myCenter = new google.maps.LatLng(data[vehicledata].latitude, data[vehicledata].longitude);
                    placeMarkerlocations(myCenter, data[vehicledata].BranchName, data[vehicledata].Image, data[vehicledata].Decription, data[vehicledata].isplant, data[vehicledata].radius, data[vehicledata].vehno);
                }
                if (data[vehicledata].isplant == "True") {
                    plants.push({ BranchName: data[vehicledata].BranchName, latitude: data[vehicledata].latitude, longitude: data[vehicledata].longitude, Image: data[vehicledata].Image, Decription: data[vehicledata].Decription });
                }
            }

        }
        function initialize() {
            ViewType = 'SingleView';
            var mapProp = {
                center: myCenter,
                zoom: 5,
                //                mapTypeControlOptions: {
                //                    position: google.maps.ControlPosition.TOP_CENTER
                //                },
                panControl: true,
                panControlOptions: {
                    position: google.maps.ControlPosition.RIGHT_TOP
                },
                zoomControl: true,
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.LARGE,
                    position: google.maps.ControlPosition.RIGHT_TOP
                },
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
            markerClusterer = new MarkerClusterer(map);

            var homeControlDiv = document.createElement('div');
            var homeControl = new HomeControl(homeControlDiv, map);
            map.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv);

            var locationControlDiv = document.createElement('div');
            var locationControl = new LocationsControl(locationControlDiv, map);
            map.controls[google.maps.ControlPosition.TOP_RIGHT].push(locationControlDiv);
        }
        google.maps.event.addDomListener(window, 'load', initialize);
        // Deletes all markers in the array by removing references to them.
        function deleteOverlays() {
            clearOverlays();
            closeinfowindow();
            markersArray = [];
            if (typeof markerClusterer === "undefined") {
            }
            else {
                markerClusterer.clearMarkers();
            }
        }

        // Sets the map on all markers in the array.
        function setAllMap(map) {
            for (var i = 0; i < markersArray.length; i++) {
                markersArray[i].setMap(map);
            }
        }

        // Removes the overlays from the map, but keeps them in the array.
        function clearOverlays() {
            setAllMap(null);
        }

        // Deletes all markers in the array by removing references to them.
        function deletelocationOverlays() {
            locationclearOverlays();
            LocationsArray = [];
        }

        // Sets the map on all markers in the array.
        function locationsetAllMap(map) {
            for (var i = 0; i < LocationsArray.length; i++) {
                LocationsArray[i].setMap(map);
            }
        }

        // Removes the overlays from the map, but keeps them in the array.
        function locationclearOverlays() {
            locationsetAllMap(null);
        }

        google.maps.event.addDomListener(window, 'load', initialize);


    </script>
    <script type="text/javascript">
        var myVar;
        $(function () {
            var data = { 'op': 'ShowMyLocations' };
            var s = function (msg) {
                if (msg) {
                    Locationsdata = msg;
                }
                else {
                }
            };
            var e = function (x, h, e) {
                // $('#BookingDetails').html(x);
            };
            callHandler(data, s, e);
            myVar = setInterval(function () { liveupdate() }, 20000);
        });
    </script>
    <script type="text/javascript">
        var ServerDate;
        $(function () {
            var Username = '<%= Session["field1"] %>';
            var plant = '<%= Session["preselectedplant"] %>';
            var data = { 'op': 'InitilizeVehicles', 'Username': Username };
            var s = function (msg) {
                if (msg) {
                    BindResults(msg);
                    DDCL_CheckboxClick(plant);
                }
                else {
                }
            };
            var e = function (x, h, e) {
                // $('#BookingDetails').html(x);
            };
            callHandler(data, s, e);
        });

        function callHandler(d, s, e) {
            $.ajax({
                url: 'Bus.axd',
                data: d,
                type: 'GET',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                async: true,
                cache: true,
                success: s,
                error: e
            });
        }
        var vehiclesdata;
        var vehicletypes = [];
        function BindResults(data) {
            vehicletypes = data;
            var vehiclenos = new Array();
            vehiclesdata = data;
            vehiclesdata = data;
            var vehkeys = Object.keys(vehiclesdata);
            vehkeys.forEach(function (veh) {
                vehiclenos.push({ vehicleno: vehiclesdata[veh].vehicleno, Routename: vehiclesdata[veh].Routename });
            });
        }

        function liveupdate() {
            var Username = '<%= Session["field1"] %>';
            var data = { 'op': 'LiveUpdate', Username: Username };
            var s = function (msg) {
                if (msg) {
                    var date = msg.ServerDt.split(" ")[0];
                    var datevalues = new Array();
                    var timevalues = new Array();
                    if (date == "0") {
                    }
                    else {
                        var time = msg.ServerDt.split(" ")[1];
                        datevalues = date.split('/');
                        timevalues = time.split(':');
                    }
                    ServerDate = new Date(datevalues[2], datevalues[1] - 1, datevalues[0], timevalues[0], timevalues[1], timevalues[2]);
                    BindUpdate(msg.vehiclesupdatelist, ServerDate);
                }
                else {
                }
            };
            var e = function (x, h, e) {
                // $('#BookingDetails').html(x);
            };
            $(document).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }

        var livedata = null;
        function BindUpdate(data, ServerDt) {
            if (ViewType == "Tripview") {
                bindVehicles(data);
            }
            if (ViewType == "MultipleView") {
                var bottomCenterControls;
                if (MapType == "20") {
                    bottomCenterControls = map20.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map19.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map18.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map17.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });
                }
                if (MapType == "16" || MapType == "20") {
                    bottomCenterControls = map16.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map15.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map14.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map13.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });
                }
                if (MapType == "12" || MapType == "16" || MapType == "20") {
                    bottomCenterControls = map12.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map11.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map10.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map9.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });
                }
                if (MapType == "8" || MapType == "12" || MapType == "16" || MapType == "20") {
                    bottomCenterControls = map8.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map7.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map6.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map5.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });
                }
                bottomCenterControls = map4.controls[google.maps.ControlPosition.TOP_RIGHT];
                bottomCenterControls.forEach(function (element, index) {
                    bottomCenterControls.removeAt(index);
                });

                bottomCenterControls = map3.controls[google.maps.ControlPosition.TOP_RIGHT];
                bottomCenterControls.forEach(function (element, index) {
                    bottomCenterControls.removeAt(index);
                });

                bottomCenterControls = map2.controls[google.maps.ControlPosition.TOP_RIGHT];
                bottomCenterControls.forEach(function (element, index) {
                    bottomCenterControls.removeAt(index);
                });

                bottomCenterControls = map1.controls[google.maps.ControlPosition.TOP_RIGHT];
                bottomCenterControls.forEach(function (element, index) {
                    bottomCenterControls.removeAt(index);
                });
            }
            livedata = data;
            var j = 0;
            latlng_pos = [];
            var vehiclenos = new Array();
            if (ViewStatus == true) {
                drawpoly();
            }
            deleteOverlays();

            if (isplantview) {
                for (var plantdata in plants) {
                    var myCenter = new google.maps.LatLng(plants[plantdata].latitude, plants[plantdata].longitude);
                    var mapscnt = parseInt(MapType);
                    var plantscnt = parseInt(plantdata);
                    if (mapscnt > plantscnt) {
                        PlantPlaceMarker(myCenter, plants[plantdata].BranchName, plants[plantdata].Decription, plantdata);
                    }
                    for (var vehicledata in data) {
                        var vehicleno = data[vehicledata].vehiclenum;
                        var vehicle = $("#" + vehicleno + "");
                        var mainpower = data[vehicledata].mainpower;
                        var latitude = data[vehicledata].latitude;
                        var longitude = data[vehicledata].longitude;
                        var angle = data[vehicledata].direction;
                        var updatedata = data[vehicledata].Datetime;
                        var ignation = data[vehicledata].Ignation;
                        var acstatus = data[vehicledata].ACStatus;
                        var speed = data[vehicledata].Speed;
                        // var fuel = data[vehicledata].dieselvalue;
                        var odometervalue = data[vehicledata].odometervalue;
                        var gps = data[vehicledata].GPSSignal;
                        var geofence = data[vehicledata].Geofence;
                        //                        var todaymileage = data[vehicledata].todaymileage;
                        var dieselstring = data[vehicledata].dieselvalue;
                        var fulltankval = data[vehicledata].fulltankval;
                        var DriverName = livedata[vehicledata].DriverName;
                        var CompanyID = livedata[vehicledata].CompanyID;
                        var MobileNo = livedata[vehicledata].MobileNo;
                        var RouteName = livedata[vehicledata].RouteName;
                        var make = livedata[vehicledata].make;
                        var model = livedata[vehicledata].model;
                        var capacity = livedata[vehicledata].capacity;
                        if (mainpower == "ON") {
                            var mainpowericon = vehicle.closest('tr').find('#imgpower');
                            mainpowericon.attr("src", "LiveIcons/Green%20Power.png");
                            mainpowericon.attr('title', 'Power On');
                        }
                        else {
                            var mainpowericon = vehicle.closest('tr').find('#imgpower');
                            mainpowericon.attr("src", "LiveIcons/Red%20Power.png");
                            mainpowericon.attr('title', 'Power Off');
                        }
                        if (gps == "V") {
                            var mainpowericon = vehicle.closest('tr').find('#imggps');
                            mainpowericon.attr("src", "LiveIcons/GPSV.png");
                            mainpowericon.attr('title', 'GPS Void');
                        }
                        else {
                            var mainpowericon = vehicle.closest('tr').find('#imggps');
                            mainpowericon.attr("src", "LiveIcons/gpsA.png");
                            mainpowericon.attr('title', 'GPS Active');
                        }
                        if (acstatus == "ON") {
                            var mainpowericon = vehicle.closest('tr').find('#imgac');
                            mainpowericon.attr("src", "LiveIcons/ACOn.png");
                            mainpowericon.attr('title', 'AC On');
                        }
                        else {
                            var mainpowericon = vehicle.closest('tr').find('#imgac');
                            mainpowericon.attr("src", "LiveIcons/ACOff.png");
                            mainpowericon.attr('title', 'AC Off');
                        }
                        if (ignation == "ON") {
                            var mainpowericon = vehicle.closest('tr').find('#imgignation');
                            mainpowericon.attr("src", "LiveIcons/bullet_green.png");
                            mainpowericon.attr('title', 'Ignation On');
                        }
                        else {
                            var mainpowericon = vehicle.closest('tr').find('#imgignation');
                            mainpowericon.attr("src", "LiveIcons/bullet_red.png");
                            mainpowericon.attr('title', 'Ignation Off');
                        }
                        if (speed > 0) {
                            var mainpowericon = vehicle.closest('tr').find('#imgspeed');
                            mainpowericon.attr("src", "LiveIcons/State1.png");
                            mainpowericon.attr('title', "Speed : " + speed + " Kms/Hr");
                        }
                        else {
                            var mainpowericon = vehicle.closest('tr').find('#imgspeed');
                            mainpowericon.attr("src", "LiveIcons/State3.png");
                            mainpowericon.attr('title', "Speed : " + speed + " Kms/Hr");
                        }
                        if (dieselstring < (fulltankval / 4)) {
                            var imgfuelicon = vehicle.closest('tr').find('#imgfuel');
                            imgfuelicon.attr("src", "LiveIcons/actuality4.png");
                            imgfuelicon.attr('title', "Fuel : " + dieselstring + " Ltrs");
                        }
                        else if (dieselstring < (fulltankval / 3)) {
                            var imgfuelicon = vehicle.closest('tr').find('#imgfuel');
                            imgfuelicon.attr("src", "LiveIcons/actuality3.png");
                            imgfuelicon.attr('title', "Fuel : " + dieselstring + " Ltrs");

                        }
                        else if (dieselstring < (fulltankval / 2)) {
                            var imgfuelicon = vehicle.closest('tr').find('#imgfuel');
                            imgfuelicon.attr("src", "LiveIcons/actuality2.png");
                            imgfuelicon.attr('title', "Fuel : " + dieselstring + " Ltrs");

                        }
                        else {
                            var imgfuelicon = vehicle.closest('tr').find('#imgfuel');
                            imgfuelicon.attr("src", "LiveIcons/actuality1.png");
                            imgfuelicon.attr('title', "Fuel Not Calibrated");
                        }
                        var todaydate;
                        try {
                            var date = updatedata.split(" ")[0];
                            var datevalues = new Array();
                            var timevalues = new Array();
                            if (date == "0") {
                            }
                            else {
                                var time = updatedata.split(" ")[1];
                                datevalues = date.split('/');
                                timevalues = time.split(':');
                            }

                            var updatetime = new Date(datevalues[2], datevalues[1] - 1, datevalues[0], timevalues[0], timevalues[1], timevalues[2]);
                            todaydate = ServerDt;
                            var _MS_PER_DAY = 86400000;
                            var _MS_PER_aaa = 3600000;
                            var _MS_PER_sss = 60000;
                            var _MS_PER_ddd = 1000;
                            var days = Math.floor((todaydate - updatetime) / _MS_PER_DAY);
                            var hours = Math.floor((todaydate - updatetime) / _MS_PER_aaa);
                            if (hours > 24) {
                                hours = hours % 24;
                            }
                            var min = Math.floor((todaydate - updatetime) / _MS_PER_sss);
                            if (min > 60) {
                                min = min % 60;
                            }
                            var sec = Math.floor((todaydate - updatetime) / _MS_PER_ddd);
                            if (sec > 60) {
                                sec = sec % 60;
                            }
                            var timestamp;
                            if (days >= 1) {
                                var updateicon = vehicle.closest('tr').find('#imgdata');
                                updateicon.attr("src", "LiveIcons/nodataavail.png");
                                updateicon.attr('title', "There was no Update form " + days + " days " + hours + " Hrs " + min + " Min");
                                timestamp = "No Update form " + days + " days " + hours + " Hrs " + min + " Min";
                            }
                            else if (hours > 1) {
                                var updateicon = vehicle.closest('tr').find('#imgdata');
                                updateicon.attr("src", "LiveIcons/MoreDelay.png");
                                updateicon.attr('title', "There was no Update form " + hours + " Hrs " + min + " Min");
                                timestamp = "No Update form " + hours + " Hrs " + min + " Min";
                            }
                            else if (min < 10) {
                                var updateicon = vehicle.closest('tr').find('#imgdata');
                                updateicon.attr("src", "LiveIcons/nodelay.png");
                                updateicon.attr('title', min + " Min " + sec + " Sec Back ");
                                timestamp = min + " Min " + sec + " Sec Back Update";
                            }
                            else if (days < 1) {
                                var updateicon = vehicle.closest('tr').find('#imgdata');
                                updateicon.attr("src", "LiveIcons/halfdelay.png");
                                updateicon.attr('title', "No Update form " + hours + " Hrs " + min + " Min");
                                timestamp = "There is no Update form " + hours + " Hrs " + min + " Min";
                            }

                        }
                        catch (Error) {
                        }

                        var stpdtimestamp = "0 Min";
                        var stoppeddate = data[vehicledata].stoppedfor;
                        if (speed == 0 && stoppeddate != "") {
                            try {
                                var stpddate = stoppeddate.split(" ")[0];
                                var stpdtime = stoppeddate.split(" ")[1];
                                var stpddatevalues = new Array();
                                var stpdtimevalues = new Array();
                                stpddatevalues = stpddate.split('/');
                                stpdtimevalues = stpdtime.split(':');
                                var stpdupdatetime = new Date(stpddatevalues[2], stpddatevalues[1] - 1, stpddatevalues[0], stpdtimevalues[0], stpdtimevalues[1], stpdtimevalues[2]);
                                var _MS_PER_DAY = 86400000;
                                var _MS_PER_aaa = 3600000;
                                var _MS_PER_sss = 60000;
                                var _MS_PER_ddd = 1000;
                                var days = Math.floor((updatetime - stpdupdatetime) / _MS_PER_DAY);
                                var hours = Math.floor((updatetime - stpdupdatetime) / _MS_PER_aaa);
                                if (hours > 24) {
                                    hours = hours % 24;
                                }
                                var min = Math.floor((updatetime - stpdupdatetime) / _MS_PER_sss);
                                if (min > 60) {
                                    min = min % 60;
                                }
                                var sec = Math.floor((updatetime - stpdupdatetime) / _MS_PER_ddd);
                                if (sec > 60) {
                                    sec = sec % 60;
                                }
                                if (days >= 1) {
                                    stpdtimestamp = days + " days " + hours + " Hrs " + min + " Min";
                                }
                                else if (hours > 1) {
                                    stpdtimestamp = hours + " Hrs " + min + " Min";
                                }
                                else if (min < 10) {
                                    stpdtimestamp = min + " Min " + sec + " Sec";
                                }
                                else if (days < 1) {
                                    stpdtimestamp = hours + " Hrs " + min + " Min";
                                }
                            }
                            catch (Error) {
                            }
                        }

                        var mapscnt = parseInt(MapType);
                        var plantscnt = parseInt(plantdata);
                        if (mapscnt > plantscnt) {
                            if (livedata[vehicledata].PlantName == plants[plantdata].BranchName) {
                                myCenter = new google.maps.LatLng(livedata[vehicledata].latitude, livedata[vehicledata].longitude);
                                var iconsrc;
                                var VehicleType = "Car";
                                for (var vehicletype in vehicletypes) {
                                    if (vehicletypes[vehicletype].vehicleno == vehicleno) {
                                        VehicleType = vehicletypes[vehicletype].vehicletype;
                                    }
                                }
                                if (typeof VehicleType === "undefined") {
                                    VehicleType = "Car";
                                }
                                if (VehicleType == 'Escavator') {
                                    iconsrc = "VehicleTypes/" + VehicleType + ".png";
                                }
                                else
                                    if (VehicleType == "Roller") {
                                        if (speed == 0) {
                                            VehicleType = "red" + VehicleType;
                                            iconsrc = "VehicleTypes/" + VehicleType + ".png";
                                        }
                                        else {
                                            VehicleType = "green" + VehicleType;
                                            iconsrc = "VehicleTypes/" + VehicleType + ".png";
                                        }
                                    }
                                    else {
                                        if (VehicleType == "") {
                                            VehicleType = "Car";
                                        }
                                        if (speed == 0) {
                                            if (VehicleType == "Truck") {
                                                VehicleType = "Tanker";
                                                VehicleType = "red" + VehicleType;
                                            }
                                            else {
                                                VehicleType = "red" + VehicleType;
                                            }
                                            //                                iconsrc = "VehicleTypes/" + VehicleType + ".png";
                                        }
                                        else {
                                            if (VehicleType == "Truck") {
                                                VehicleType = "Tanker";
                                                VehicleType = "green" + VehicleType;
                                            }
                                            else {
                                                VehicleType = "green" + VehicleType;
                                            }

                                        }
                                        if (angle >= 0 && angle < 22.5) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "4.png";
                                        }
                                        else if (angle >= 22.5 && angle < 45) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "5.png";
                                        }
                                        else if (angle >= 45 && angle < 67.5) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "6.png";
                                        }
                                        else if (angle >= 67.5 && angle < 90) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "7.png";
                                        }
                                        else if (angle >= 90 && angle < 112.5) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "8.png";
                                        }
                                        else if (angle >= 112.5 && angle < 135) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "9.png";
                                        }
                                        else if (angle >= 135 && angle < 157.5) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "10.png";
                                        }
                                        else if (angle >= 157.5 && angle < 180) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "11.png";
                                        }
                                        else if (angle >= 180 && angle < 202.5) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "12.png";
                                        }
                                        else if (angle >= 202.5 && angle < 225) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "13.png";
                                        }
                                        else if (angle >= 225 && angle < 247.5) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "14.png";
                                        }
                                        else if (angle >= 247.5 && angle < 270) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "15.png";
                                        }
                                        else if (angle >= 270 && angle < 292.5) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "16.png";
                                        }
                                        else if (angle >= 292.5 && angle < 315) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "1.png";
                                        }
                                        else if (angle >= 315 && angle < 360) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "2.png";
                                        }
                                        else if (angle >= 360) {
                                            iconsrc = "VehicleTypes/" + VehicleType + "3.png";
                                        }
                                        //                            }
                                    }
                                MultiPlantsMarker(myCenter, iconsrc, vehicleno, make, model, capacity, speed, timestamp, odometervalue, plantdata, DriverName, RouteName, MobileNo, stpdtimestamp);
                                latlng_pos[j] = new google.maps.LatLng(livedata[vehicledata].latitude, livedata[vehicledata].longitude);
                                j++;
                            }
                        }
                    }
                }
            }
            else {
                for (var vehicledata in data) {
                    var vehicleno = data[vehicledata].vehiclenum;
                    var vehicle = $("#" + vehicleno + "");
                    var mainpower = data[vehicledata].mainpower;
                    var latitude = data[vehicledata].latitude;
                    var longitude = data[vehicledata].longitude;
                    var angle = data[vehicledata].direction;
                    var updatedata = data[vehicledata].Datetime;
                    var ignation = data[vehicledata].Ignation;
                    var acstatus = data[vehicledata].ACStatus;
                    var speed = data[vehicledata].Speed;
                    // var fuel = data[vehicledata].dieselvalue;
                    var odometervalue = data[vehicledata].odometervalue;
                    var gps = data[vehicledata].GPSSignal;
                    var geofence = data[vehicledata].Geofence;
                    //                    var todaymileage = data[vehicledata].todaymileage;
                    var dieselstring = data[vehicledata].dieselvalue;
                    var fulltankval = data[vehicledata].fulltankval;
                    var DriverName = livedata[vehicledata].DriverName;
                    var CompanyID = livedata[vehicledata].CompanyID;
                    var MobileNo = livedata[vehicledata].MobileNo;
                    var RouteName = livedata[vehicledata].RouteName;
                    var make = livedata[vehicledata].make;
                    var model = livedata[vehicledata].model;
                    var capacity = livedata[vehicledata].capacity;
                    if (mainpower == "ON") {
                        var mainpowericon = vehicle.closest('tr').find('#imgpower');
                        mainpowericon.attr("src", "LiveIcons/Green%20Power.png");
                        mainpowericon.attr('title', 'Power On');
                    }
                    else {
                        var mainpowericon = vehicle.closest('tr').find('#imgpower');
                        mainpowericon.attr("src", "LiveIcons/Red%20Power.png");
                        mainpowericon.attr('title', 'Power Off');
                    }
                    if (gps == "V") {
                        var mainpowericon = vehicle.closest('tr').find('#imggps');
                        mainpowericon.attr("src", "LiveIcons/GPSV.png");
                        mainpowericon.attr('title', 'GPS Void');
                    }
                    else {
                        var mainpowericon = vehicle.closest('tr').find('#imggps');
                        mainpowericon.attr("src", "LiveIcons/gpsA.png");
                        mainpowericon.attr('title', 'GPS Active');
                    }
                    if (acstatus == "ON") {
                        var mainpowericon = vehicle.closest('tr').find('#imgac');
                        mainpowericon.attr("src", "LiveIcons/ACOn.png");
                        mainpowericon.attr('title', 'AC On');
                    }
                    else {
                        var mainpowericon = vehicle.closest('tr').find('#imgac');
                        mainpowericon.attr("src", "LiveIcons/ACOff.png");
                        mainpowericon.attr('title', 'AC Off');
                    }
                    if (ignation == "ON") {
                        var mainpowericon = vehicle.closest('tr').find('#imgignation');
                        mainpowericon.attr("src", "LiveIcons/bullet_green.png");
                        mainpowericon.attr('title', 'Ignation On');
                    }
                    else {
                        var mainpowericon = vehicle.closest('tr').find('#imgignation');
                        mainpowericon.attr("src", "LiveIcons/bullet_red.png");
                        mainpowericon.attr('title', 'Ignation Off');
                    }
                    if (speed > 0) {
                        var mainpowericon = vehicle.closest('tr').find('#imgspeed');
                        mainpowericon.attr("src", "LiveIcons/State1.png");
                        mainpowericon.attr('title', "Speed : " + speed + " Kms/Hr");
                    }
                    else {
                        var mainpowericon = vehicle.closest('tr').find('#imgspeed');
                        mainpowericon.attr("src", "LiveIcons/State3.png");
                        mainpowericon.attr('title', "Speed : " + speed + " Kms/Hr");
                    }
                    if (dieselstring < (fulltankval / 4)) {
                        var imgfuelicon = vehicle.closest('tr').find('#imgfuel');
                        imgfuelicon.attr("src", "LiveIcons/actuality4.png");
                        imgfuelicon.attr('title', "Fuel : " + dieselstring + " Ltrs");
                    }
                    else if (dieselstring < (fulltankval / 3)) {
                        var imgfuelicon = vehicle.closest('tr').find('#imgfuel');
                        imgfuelicon.attr("src", "LiveIcons/actuality3.png");
                        imgfuelicon.attr('title', "Fuel : " + dieselstring + " Ltrs");

                    }
                    else if (dieselstring < (fulltankval / 2)) {
                        var imgfuelicon = vehicle.closest('tr').find('#imgfuel');
                        imgfuelicon.attr("src", "LiveIcons/actuality2.png");
                        imgfuelicon.attr('title', "Fuel : " + dieselstring + " Ltrs");

                    }
                    else {
                        var imgfuelicon = vehicle.closest('tr').find('#imgfuel');
                        imgfuelicon.attr("src", "LiveIcons/actuality1.png");
                        imgfuelicon.attr('title', "Fuel Not Calibrated");
                    }
                    try {
                        var date = updatedata.split(" ")[0];
                        var datevalues = new Array();
                        var timevalues = new Array();
                        if (date == "0") {
                        }
                        else {
                            var time = updatedata.split(" ")[1];
                            datevalues = date.split('/');
                            timevalues = time.split(':');
                        }

                        var updatetime = new Date(datevalues[2], datevalues[1] - 1, datevalues[0], timevalues[0], timevalues[1], timevalues[2]);
                        var todaydate = ServerDt;
                        var _MS_PER_DAY = 86400000;
                        var _MS_PER_aaa = 3600000;
                        var _MS_PER_sss = 60000;
                        var _MS_PER_ddd = 1000;
                        var days = Math.floor((todaydate - updatetime) / _MS_PER_DAY);
                        var hours = Math.floor((todaydate - updatetime) / _MS_PER_aaa);
                        if (hours > 24) {
                            hours = hours % 24;
                        }
                        var min = Math.floor((todaydate - updatetime) / _MS_PER_sss);
                        if (min > 60) {
                            min = min % 60;
                        }
                        var sec = Math.floor((todaydate - updatetime) / _MS_PER_ddd);
                        if (sec > 60) {
                            sec = sec % 60;
                        }
                        var timestamp;
                        if (days >= 1) {
                            var updateicon = vehicle.closest('tr').find('#imgdata');
                            updateicon.attr("src", "LiveIcons/nodataavail.png");
                            updateicon.attr('title', "There was no Update form " + days + " days " + hours + " Hrs " + min + " Min\n" + updatetime);
                            timestamp = "No Update form " + days + " days " + hours + " Hrs " + min + " Min";
                        }
                        else if (hours > 1) {
                            var updateicon = vehicle.closest('tr').find('#imgdata');
                            updateicon.attr("src", "LiveIcons/MoreDelay.png");
                            updateicon.attr('title', "There was no Update form " + hours + " Hrs " + min + " Min\n" + updatetime);
                            timestamp = "No Update form " + hours + " Hrs " + min + " Min";
                        }
                        else if (min < 10) {
                            var updateicon = vehicle.closest('tr').find('#imgdata');
                            updateicon.attr("src", "LiveIcons/nodelay.png");
                            updateicon.attr('title', min + " Min " + sec + " Sec Back \n" + updatetime);
                            timestamp = min + " Min " + sec + " Sec Back Update";
                        }
                        else if (days < 1) {
                            var updateicon = vehicle.closest('tr').find('#imgdata');
                            updateicon.attr("src", "LiveIcons/halfdelay.png");
                            updateicon.attr('title', "No Update form " + hours + " Hrs " + min + " Min\n" + updatetime);
                            timestamp = "There is no Update form " + hours + " Hrs " + min + " Min";
                        }

                    }
                    catch (Error) {
                    }
                    var stpdtimestamp = "0 Min";
                    var stoppeddate = data[vehicledata].stoppedfor;
                    if (speed == 0 && stoppeddate != "") {
                        try {
                            var stpddate = stoppeddate.split(" ")[0];
                            var stpdtime = stoppeddate.split(" ")[1];
                            var stpddatevalues = new Array();
                            var stpdtimevalues = new Array();
                            stpddatevalues = stpddate.split('/');
                            stpdtimevalues = stpdtime.split(':');
                            var stpdupdatetime = new Date(stpddatevalues[2], stpddatevalues[1] - 1, stpddatevalues[0], stpdtimevalues[0], stpdtimevalues[1], stpdtimevalues[2]);
                            var _MS_PER_DAY = 86400000;
                            var _MS_PER_aaa = 3600000;
                            var _MS_PER_sss = 60000;
                            var _MS_PER_ddd = 1000;
                            var days = Math.floor((updatetime - stpdupdatetime) / _MS_PER_DAY);
                            var hours = Math.floor((updatetime - stpdupdatetime) / _MS_PER_aaa);
                            if (hours > 24) {
                                hours = hours % 24;
                            }
                            var min = Math.floor((updatetime - stpdupdatetime) / _MS_PER_sss);
                            if (min > 60) {
                                min = min % 60;
                            }
                            var sec = Math.floor((updatetime - stpdupdatetime) / _MS_PER_ddd);
                            if (sec > 60) {
                                sec = sec % 60;
                            }
                            if (days >= 1) {
                                stpdtimestamp = days + " days " + hours + " Hrs " + min + " Min";
                            }
                            else if (hours > 1) {
                                stpdtimestamp = hours + " Hrs " + min + " Min";
                            }
                            else if (min < 10) {
                                stpdtimestamp = min + " Min " + sec + " Sec";
                            }
                            else if (days < 1) {
                                stpdtimestamp = hours + " Hrs " + min + " Min";
                            }
                        }
                        catch (Error) {
                        }
                    }
                    var count = checkedvehicles.indexOf(vehicleno);
                    if (count > -1) {
                        if (ViewType == "MultipleView") {
                            if (TabCount == 0) {
                                TabCount = 1;
                            }
                            if (MapType == "4") {
                                var startcount = (TabCount - 1) * 4;
                                var EndCount = TabCount * 4;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                            if (MapType == "8") {
                                var startcount = (TabCount - 1) * 8;
                                var EndCount = TabCount * 8;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                            if (MapType == "12") {
                                var startcount = (TabCount - 1) * 12;
                                var EndCount = TabCount * 12;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                            if (MapType == "16") {
                                var startcount = (TabCount - 1) * 16;
                                var EndCount = TabCount * 16;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                            if (MapType == "20") {
                                var startcount = (TabCount - 1) * 20;
                                var EndCount = TabCount * 20;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                        }
                        else {
                        }
                        var VehicleType = "Car";
                        var myCenter = new google.maps.LatLng(livedata[vehicledata].latitude, livedata[vehicledata].longitude);
                        var iconsrc;
                        for (var vehicletype in vehicletypes) {
                            if (vehicletypes[vehicletype].vehicleno == vehicleno) {
                                var VehicleType = vehicletypes[vehicletype].vehicletype;
                            }
                        }
                        if (typeof VehicleType === "undefined") {
                            VehicleType = "Car";
                        }
                        if (VehicleType == 'Escavator') {
                            iconsrc = "VehicleTypes/" + VehicleType + ".png";
                        }
                        else
                            if (VehicleType == "Roller") {
                                if (speed == 0) {
                                    VehicleType = "red" + VehicleType;
                                    iconsrc = "VehicleTypes/" + VehicleType + ".png";
                                }
                                else {
                                    VehicleType = "green" + VehicleType;
                                    iconsrc = "VehicleTypes/" + VehicleType + ".png";
                                }
                            }
                            else {
                                if (VehicleType == "") {
                                    VehicleType = "Car";
                                }
                                if (speed == 0) {
                                    if (VehicleType == "Truck") {
                                        VehicleType = "Tanker";
                                        VehicleType = "red" + VehicleType;
                                    }
                                    else {
                                        VehicleType = "red" + VehicleType;
                                    }
                                    //                                iconsrc = "VehicleTypes/" + VehicleType + ".png";
                                }
                                else {
                                    if (VehicleType == "Truck") {
                                        VehicleType = "Tanker";
                                        VehicleType = "green" + VehicleType;
                                    }
                                    else {
                                        VehicleType = "green" + VehicleType;
                                    }

                                }
                                if (angle >= 0 && angle < 22.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "4.png";
                                }
                                else if (angle >= 22.5 && angle < 45) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "5.png";
                                }
                                else if (angle >= 45 && angle < 67.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "6.png";
                                }
                                else if (angle >= 67.5 && angle < 90) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "7.png";
                                }
                                else if (angle >= 90 && angle < 112.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "8.png";
                                }
                                else if (angle >= 112.5 && angle < 135) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "9.png";
                                }
                                else if (angle >= 135 && angle < 157.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "10.png";
                                }
                                else if (angle >= 157.5 && angle < 180) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "11.png";
                                }
                                else if (angle >= 180 && angle < 202.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "12.png";
                                }
                                else if (angle >= 202.5 && angle < 225) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "13.png";
                                }
                                else if (angle >= 225 && angle < 247.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "14.png";
                                }
                                else if (angle >= 247.5 && angle < 270) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "15.png";
                                }
                                else if (angle >= 270 && angle < 292.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "16.png";
                                }
                                else if (angle >= 292.5 && angle < 315) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "1.png";
                                }
                                else if (angle >= 315 && angle < 360) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "2.png";
                                }
                                else if (angle >= 360) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "3.png";
                                }
                                //                            }
                            }
                        if (ViewType == "MultipleView") {
                            MultimapPlaceMarker(myCenter, iconsrc, vehicleno, make, model, capacity, speed, timestamp, count, DriverName, RouteName, MobileNo, stpdtimestamp);
                        }
                        else {
                            placeMarker(myCenter, iconsrc, vehicleno, make, model, capacity, speed, timestamp, DriverName, RouteName, MobileNo, stpdtimestamp);
                        }
                        latlng_pos[j] = new google.maps.LatLng(livedata[vehicledata].latitude, livedata[vehicledata].longitude);
                        j++;
                    }
                }
            }
            var $rows = $('#VehiclesTable tr');
            $('#txt_searchvehicleno').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return ! ~text.indexOf(val);
                }).hide();
            });
        }
    </script>
    <script type="text/javascript">
        var markersArray = [];
        var checkedvehicles = [];
        var latlng_pos = [];
        var infoWindow = new google.maps.InfoWindow();
        var markerCluster;
        function oncheck(id, onckvehicleid) {
            closeinfowindow();
            for (var i = checkedvehicles.length - 1; i >= 0; i--) {
                if (checkedvehicles[i] === onckvehicleid) {
                    checkedvehicles.splice(i, 1);
                }
            }
            if (id.checked == true) {
                checkedvehicles.push(onckvehicleid);
            }
            VehicleCount = checkedvehicles.length;
            if (ViewType == "MultipleView") {
                Multipleview();
            }
            update();
            deletelocationOverlays();
            if (!showlocations) {
                if (Locationsdata.length > 0) {
                    for (var vehicledata in Locationsdata) {
                        var myCenter = new google.maps.LatLng(Locationsdata[vehicledata].latitude, Locationsdata[vehicledata].longitude);
                        placeMarkerlocations(myCenter, Locationsdata[vehicledata].BranchName, Locationsdata[vehicledata].Image, Locationsdata[vehicledata].Decription, Locationsdata[vehicledata].isplant, Locationsdata[vehicledata].radius, Locationsdata[vehicledata].vehno);
                    }
                }
                else {
                    var data = { 'op': 'ShowMyLocations' };
                    var s = function (msg) {
                        if (msg) {
                            Bindlocations(msg);
                        }
                        else {
                        }
                    };
                    var e = function (x, h, e) {
                    };
                    callHandler(data, s, e);
                }
            }
        }

        function update() {
            if (ViewType == "MultipleView") {
                var bottomCenterControls;
                if (MapType == "20") {
                    bottomCenterControls = map20.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map19.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map18.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map17.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });
                }
                if (MapType == "16" || MapType == "20") {
                    bottomCenterControls = map16.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map15.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map14.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map13.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });
                }
                if (MapType == "12" || MapType == "16" || MapType == "20") {
                    bottomCenterControls = map12.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map11.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map10.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map9.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });
                }
                if (MapType == "8" || MapType == "12" || MapType == "16" || MapType == "20") {
                    bottomCenterControls = map8.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map7.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map6.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });

                    bottomCenterControls = map5.controls[google.maps.ControlPosition.TOP_RIGHT];
                    bottomCenterControls.forEach(function (element, index) {
                        bottomCenterControls.removeAt(index);
                    });
                }
                bottomCenterControls = map4.controls[google.maps.ControlPosition.TOP_RIGHT];
                bottomCenterControls.forEach(function (element, index) {
                    bottomCenterControls.removeAt(index);
                });

                bottomCenterControls = map3.controls[google.maps.ControlPosition.TOP_RIGHT];
                bottomCenterControls.forEach(function (element, index) {
                    bottomCenterControls.removeAt(index);
                });

                bottomCenterControls = map2.controls[google.maps.ControlPosition.TOP_RIGHT];
                bottomCenterControls.forEach(function (element, index) {
                    bottomCenterControls.removeAt(index);
                });

                bottomCenterControls = map1.controls[google.maps.ControlPosition.TOP_RIGHT];
                bottomCenterControls.forEach(function (element, index) {
                    bottomCenterControls.removeAt(index);
                });
            }
            if (isplantview) {
                deleteOverlays();
                var j = 0;
                latlng_pos = [];
                for (var plantdata in plants) {
                    var myCenter = new google.maps.LatLng(plants[plantdata].latitude, plants[plantdata].longitude);
                    var mapscnt = parseInt(MapType);
                    var plantscnt = parseInt(plantdata);
                    if (mapscnt > plantscnt) {
                        PlantPlaceMarker(myCenter, plants[plantdata].BranchName, plants[plantdata].Decription, plantdata);
                    }
                }
            }
            else {
                deleteOverlays();
                var j = 0;
                latlng_pos = [];
                for (var vehicledata in livedata) {
                    var vehicleno = livedata[vehicledata].vehiclenum;
                    var speed = livedata[vehicledata].Speed;
                    var angle = livedata[vehicledata].direction;
                    var updatedata = livedata[vehicledata].Datetime;
                    var ignation = livedata[vehicledata].Ignation;
                    var acstatus = livedata[vehicledata].ACStatus;
                    var date = updatedata.split(" ")[0];
                    var time = updatedata.split(" ")[1];
                    //                    var todaymileage = livedata[vehicledata].todaymileage;
                    var DriverName = livedata[vehicledata].DriverName;
                    var CompanyID = livedata[vehicledata].CompanyID;
                    var MobileNo = livedata[vehicledata].MobileNo;
                    var RouteName = livedata[vehicledata].RouteName;
                    var make = livedata[vehicledata].make;
                    var model = livedata[vehicledata].model;
                    var capacity = livedata[vehicledata].capacity;
                    var datevalues = new Array();
                    var timevalues = new Array();
                    if (date == "0") {
                    }
                    else {
                        datevalues = date.split('/');
                        timevalues = time.split(':');
                    }
                    var updatetime = new Date(datevalues[2], datevalues[1] - 1, datevalues[0], timevalues[0], timevalues[1], timevalues[2]);

                    var todaydate = ServerDate;
                    var _MS_PER_DAY = 86400000;
                    var _MS_PER_aaa = 3600000;
                    var _MS_PER_sss = 60000;
                    var _MS_PER_ddd = 1000;
                    var days = Math.floor((todaydate - updatetime) / _MS_PER_DAY);
                    var hours = Math.floor((todaydate - updatetime) / _MS_PER_aaa);
                    if (hours > 24) {
                        hours = hours % 24;
                    }
                    var min = Math.floor((todaydate - updatetime) / _MS_PER_sss);
                    if (min > 60) {
                        min = min % 60;
                    }
                    var sec = Math.floor((todaydate - updatetime) / _MS_PER_ddd);
                    if (sec > 60) {
                        sec = sec % 60;
                    }
                    var timestamp;
                    if (days >= 1) {
                        timestamp = "There is no Update form " + days + " days " + hours + " Hrs " + min + " Min";
                    }
                    else if (hours > 1) {
                        timestamp = "There is no Update form " + hours + " Hrs " + min + " Min";
                    }
                    else if (min < 5) {
                        timestamp = min + " Min " + sec + " Sec Back Update";
                    }
                    else if (days < 1) {
                        timestamp = "There is no Update form " + hours + " Hrs " + min + " Min";
                    }
                    var vehicle = $("#" + vehicleno + "");
                    var count = checkedvehicles.indexOf(vehicleno);
                    if (count > -1) {
                        if (ViewType == "MultipleView") {
                            if (TabCount == 0) {
                                TabCount = 1;
                            }
                            if (MapType == "4") {
                                var startcount = (TabCount - 1) * 4;
                                var EndCount = TabCount * 4;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                            if (MapType == "8") {
                                var startcount = (TabCount - 1) * 4;
                                var EndCount = TabCount * 8;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                            if (MapType == "12") {
                                var startcount = (TabCount - 1) * 4;
                                var EndCount = TabCount * 12;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                            if (MapType == "16") {
                                var startcount = (TabCount - 1) * 16;
                                var EndCount = TabCount * 16;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                            if (MapType == "20") {
                                var startcount = (TabCount - 1) * 20;
                                var EndCount = TabCount * 20;
                                if (count >= startcount && count < EndCount) {

                                }
                                else {
                                    continue;
                                }
                            }
                        }
                        else {
                        }
                        var stpdtimestamp = "0 Min";
                        var stoppeddate = livedata[vehicledata].stoppedfor;
                        if (speed == 0 && stoppeddate != "") {
                            try {
                                var stpddate = stoppeddate.split(" ")[0];
                                var stpdtime = stoppeddate.split(" ")[1];
                                var stpddatevalues = new Array();
                                var stpdtimevalues = new Array();
                                stpddatevalues = stpddate.split('/');
                                stpdtimevalues = stpdtime.split(':');
                                var stpdupdatetime = new Date(stpddatevalues[2], stpddatevalues[1] - 1, stpddatevalues[0], stpdtimevalues[0], stpdtimevalues[1], stpdtimevalues[2]);
                                var _MS_PER_DAY = 86400000;
                                var _MS_PER_aaa = 3600000;
                                var _MS_PER_sss = 60000;
                                var _MS_PER_ddd = 1000;
                                var days = Math.floor((updatetime - stpdupdatetime) / _MS_PER_DAY);
                                var hours = Math.floor((updatetime - stpdupdatetime) / _MS_PER_aaa);
                                if (hours > 24) {
                                    hours = hours % 24;
                                }
                                var min = Math.floor((updatetime - stpdupdatetime) / _MS_PER_sss);
                                if (min > 60) {
                                    min = min % 60;
                                }
                                var sec = Math.floor((updatetime - stpdupdatetime) / _MS_PER_ddd);
                                if (sec > 60) {
                                    sec = sec % 60;
                                }
                                if (days >= 1) {
                                    stpdtimestamp = days + " days " + hours + " Hrs " + min + " Min";
                                }
                                else if (hours > 1) {
                                    stpdtimestamp = hours + " Hrs " + min + " Min";
                                }
                                else if (min < 10) {
                                    stpdtimestamp = min + " Min " + sec + " Sec";
                                }
                                else if (days < 1) {
                                    stpdtimestamp = hours + " Hrs " + min + " Min";
                                }
                            }
                            catch (Error) {
                            }
                        }
                        var myCenter = new google.maps.LatLng(livedata[vehicledata].latitude, livedata[vehicledata].longitude);
                        var iconsrc;
                        var VehicleType = "";
                        for (var vehicletype in vehicletypes) {
                            if (vehicletypes[vehicletype].vehicleno == vehicleno) {
                                VehicleType = vehicletypes[vehicletype].vehicletype;
                            }
                        }
                        if (typeof VehicleType === "undefined") {
                            VehicleType = "Car";
                        }
                        if (VehicleType == 'Escavator') {
                            iconsrc = "VehicleTypes/" + VehicleType + ".png";
                        }
                        else
                            if (VehicleType == "Roller") {
                                if (speed == 0) {
                                    VehicleType = "red" + VehicleType;
                                    iconsrc = "VehicleTypes/" + VehicleType + ".png";
                                }
                                else {
                                    VehicleType = "green" + VehicleType;
                                    iconsrc = "VehicleTypes/" + VehicleType + ".png";
                                }
                            }
                            else {
                                if (VehicleType == "") {
                                    VehicleType = "Car";
                                }
                                if (speed == 0) {
                                    if (VehicleType == "Truck") {
                                        VehicleType = "Tanker";
                                        VehicleType = "red" + VehicleType;
                                    }
                                    else {
                                        VehicleType = "red" + VehicleType;
                                    }
                                }
                                else {
                                    if (VehicleType == "Truck") {
                                        VehicleType = "Tanker";
                                        VehicleType = "green" + VehicleType;
                                    }
                                    else {
                                        VehicleType = "green" + VehicleType;
                                    }
                                }
                                if (angle >= 0 && angle < 22.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "4.png";
                                }
                                else if (angle >= 22.5 && angle < 45) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "5.png";
                                }
                                else if (angle >= 45 && angle < 67.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "6.png";
                                }
                                else if (angle >= 67.5 && angle < 90) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "7.png";
                                }
                                else if (angle >= 90 && angle < 112.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "8.png";
                                }
                                else if (angle >= 112.5 && angle < 135) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "9.png";
                                }
                                else if (angle >= 135 && angle < 157.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "10.png";
                                }
                                else if (angle >= 157.5 && angle < 180) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "11.png";
                                }
                                else if (angle >= 180 && angle < 202.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "12.png";
                                }
                                else if (angle >= 202.5 && angle < 225) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "13.png";
                                }
                                else if (angle >= 225 && angle < 247.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "14.png";
                                }
                                else if (angle >= 247.5 && angle < 270) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "15.png";
                                }
                                else if (angle >= 270 && angle < 292.5) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "16.png";
                                }
                                else if (angle >= 292.5 && angle < 315) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "1.png";
                                }
                                else if (angle >= 315 && angle < 360) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "2.png";
                                }
                                else if (angle >= 360) {
                                    iconsrc = "VehicleTypes/" + VehicleType + "3.png";
                                }
                                //                            }
                            }
                    if (ViewType == "MultipleView") {
                        MultimapPlaceMarker(myCenter, iconsrc, vehicleno, make, model, capacity, speed, timestamp, count, DriverName, RouteName, MobileNo, stpdtimestamp);
                    }
                    else {
                        placeMarker(myCenter, iconsrc, vehicleno, make, model, capacity, speed, timestamp, DriverName, RouteName, MobileNo, stpdtimestamp);
                    }
                    latlng_pos[j] = new google.maps.LatLng(livedata[vehicledata].latitude, livedata[vehicledata].longitude);
                    j++;
                }
                else {
                }
                var latlngbounds = new google.maps.LatLngBounds();
                if (latlng_pos.length > 1) {
                    for (var i = 0; i < latlng_pos.length; i++) {
                        latlngbounds.extend(latlng_pos[i]);
                    }
                    map.fitBounds(latlngbounds);
                }
                else if (latlng_pos.length == 1) {
                    for (var i = 0; i < latlng_pos.length; i++) {
                        latlngbounds.extend(latlng_pos[i]);
                    }
                    map.fitBounds(latlngbounds);
                    map.setZoom(12);
                }
                else {
                    map.setCenter(new google.maps.LatLng(17.497535, 78.408622));
                    map.setZoom(6);
                }
            }
        }
    }
    function PlantPlaceMarker(location, locationname, description, count) {
        var Username = '<%= Session["field1"] %>';

        var mMap;
        var mapcount = parseInt(MapType);
        if (count % mapcount == 19) {
            var homeControlDiv20 = document.createElement('div');
            var homeControl20 = new HomeControl20(homeControlDiv20, map20, "", locationname);
            map20.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv20);
            mMap = map20;
        }
        if (count % mapcount == 18) {
            var homeControlDiv19 = document.createElement('div');
            var homeControl19 = new HomeControl19(homeControlDiv19, map19, "", locationname);
            map19.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv19);
            mMap = map19;
        }
        if (count % mapcount == 17) {
            var homeControlDiv18 = document.createElement('div');
            var homeControl18 = new HomeControl18(homeControlDiv18, map18, "", locationname);
            map18.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv18);
            mMap = map18;
        }
        if (count % mapcount == 16) {
            var homeControlDiv17 = document.createElement('div');
            var homeControl17 = new HomeControl17(homeControlDiv17, map17, "", locationname);
            map17.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv17);
            mMap = map17;
        }

        if (count % mapcount == 15) {
            var homeControlDiv16 = document.createElement('div');
            var homeControl16 = new HomeControl16(homeControlDiv16, map16, "", locationname);
            map16.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv16);
            mMap = map16;
        }
        if (count % mapcount == 14) {
            var homeControlDiv15 = document.createElement('div');
            var homeControl15 = new HomeControl15(homeControlDiv15, map15, "", locationname);
            map15.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv15);
            mMap = map15;
        }
        if (count % mapcount == 13) {
            var homeControlDiv14 = document.createElement('div');
            var homeControl14 = new HomeControl14(homeControlDiv14, map14, "", locationname);
            map14.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv14);
            mMap = map14;
        }

        if (count % mapcount == 12) {
            var homeControlDiv13 = document.createElement('div');
            var homeControl13 = new HomeControl13(homeControlDiv13, map13, "", locationname);
            map13.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv13);
            mMap = map13;
        }


        if (count % mapcount == 11) {
            var homeControlDiv12 = document.createElement('div');
            var homeControl12 = new HomeControl12(homeControlDiv12, map12, "", locationname);
            map12.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv12);
            mMap = map12;
        }
        if (count % mapcount == 10) {
            var homeControlDiv11 = document.createElement('div');
            var homeControl11 = new HomeControl11(homeControlDiv11, map11, "", locationname);
            map11.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv11);
            mMap = map11;
        }
        if (count % mapcount == 9) {
            var homeControlDiv10 = document.createElement('div');
            var homeControl10 = new HomeControl10(homeControlDiv10, map10, "", locationname);
            map10.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv10);
            mMap = map10;
        }
        if (count % mapcount == 8) {
            var homeControlDiv9 = document.createElement('div');
            var homeControl9 = new HomeControl9(homeControlDiv9, map9, "", locationname);
            map9.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv9);
            mMap = map9;
        }
        if (count % mapcount == 7) {
            var homeControlDiv8 = document.createElement('div');
            var homeControl8 = new HomeControl8(homeControlDiv8, map8, "", locationname);
            map8.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv8);
            mMap = map8;
        }
        else if (count % mapcount == 6) {
            var homeControlDiv7 = document.createElement('div');
            var homeControl7 = new HomeControl7(homeControlDiv7, map7, "", locationname);
            map7.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv7);
            mMap = map7;
        }
        else if (count % mapcount == 5) {
            var homeControlDiv6 = document.createElement('div');
            var homeControl6 = new HomeControl6(homeControlDiv6, map6, "", locationname);
            map6.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv6);
            mMap = map6;
        }
        else if (count % mapcount == 4) {
            var homeControlDiv5 = document.createElement('div');
            var homeControl5 = new HomeControl5(homeControlDiv5, map5, "", locationname);
            map5.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv5);
            mMap = map5;
        }
        if (count % mapcount == 3) {
            var homeControlDiv4 = document.createElement('div');
            var homeControl4 = new HomeControl4(homeControlDiv4, map4, "", locationname);
            map4.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv4);
            mMap = map4;
        }
        else if (count % mapcount == 2) {
            var homeControlDiv3 = document.createElement('div');
            var homeControl3 = new HomeControl3(homeControlDiv3, map3, "", locationname);
            map3.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv3);

            mMap = map3;
        }
        else if (count % mapcount == 1) {
            var homeControlDiv2 = document.createElement('div');
            var homeControl2 = new HomeControl2(homeControlDiv2, map2, "", locationname);
            map2.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv2);
            mMap = map2;
        }
        else if (count % mapcount == 0) {
            var homeControlDiv1 = document.createElement('div');
            var homeControl1 = new HomeControl1(homeControlDiv1, map1, "", locationname);
            map1.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv1);
            mMap = map1;
        }

        var marker = new google.maps.Marker({
            position: location,
            map: mMap,
            center: location,
            zoom: 15,
            title: locationname
        });
        mMap.panTo(location);
        markersArray.push(marker);
    }

    function MultiPlantsMarker(location, iconsrc, vehicleno, make, model, capacity, speed, timestamp, Odometer, count, DriverName, RouteName, MobileNo, stpdtimestamp) {
        var Username = '<%= Session["field1"] %>';
        var image = new google.maps.MarkerImage(iconsrc,
        // This marker is 20 pixels wide by 32 pixels tall.
        null,
        // The origin for this image is 0,0.
        new google.maps.Point(0, 0),
        // The anchor for this image is the base of the flagpole at 0,32.
        new google.maps.Point(20, 20)
    );
        var mMap;
        //            if (VehicleCount <= "4") {
        var mapcount = parseInt(MapType);
        if (count % mapcount == 19) {
            mMap = map20;
        }
        if (count % mapcount == 18) {
            mMap = map19;
        }
        if (count % mapcount == 17) {
            mMap = map18;
        }
        if (count % mapcount == 16) {
            mMap = map17;
        }

        if (count % mapcount == 15) {
            mMap = map16;
        }
        if (count % mapcount == 14) {
            mMap = map15;
        }
        if (count % mapcount == 13) {
            mMap = map14;
        }

        if (count % mapcount == 12) {
            mMap = map13;
        }

        if (count % mapcount == 11) {
            mMap = map12;
        }
        if (count % mapcount == 10) {
            mMap = map11;
        }
        if (count % mapcount == 9) {
            mMap = map10;
        }
        if (count % mapcount == 8) {
            mMap = map9;
        }
        if (count % mapcount == 7) {
            mMap = map8;
        }
        else if (count % mapcount == 6) {
            mMap = map7;
        }
        else if (count % mapcount == 5) {
            mMap = map6;
        }
        else if (count % mapcount == 4) {
            mMap = map5;
        }
        if (count % mapcount == 3) {
            mMap = map4;
        }
        else if (count % mapcount == 2) {
            mMap = map3;
        }
        else if (count % mapcount == 1) {
            mMap = map2;
        }
        else if (count % mapcount == 0) {
            mMap = map1;
        }

        var marker = new google.maps.Marker({
            position: location,
            map: mMap,
            center: location,
            zoom: 15,
            icon: image,
            title: vehicleno
        });
        mMap.panTo(location);
        markersArray.push(marker);
        //            if (clusteredview) {
        //                markerClusterer.addMarker(marker);
        //            }
        var address;
        geocoder = new google.maps.Geocoder();
        infoWindow.close();
        address = geocoder.geocode({ 'latLng': location }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results.length > 0) {
                    if (results[0]) {
                        address = results[0].formatted_address;

                        var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/><a onclick='addlocations(" + location.lat() + "," + location.lng() + ")'>Add to My Locations</a><br/><a onclick='addRemarks(" + vehicleno + ")'>Add Remarks</a><br/>";
                        var infowindow = new google.maps.InfoWindow({
                            content: content
                        });

                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(mMap, marker);
                        });
                        attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo);
                    }
                    else {
                        address = "No results";

                        var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo;
                        var infowindow = new google.maps.InfoWindow({
                            content: content
                        });

                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(mMap, marker);
                        });
                        attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo);
                    }
                }
                else {
                    address = "No results";

                    var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/><a onclick='addlocations(" + location.lat() + "," + location.lng() + ")'>Add to My Locations</a><br/><a onclick='addRemarks(" + vehicleno + "," + location.lat() + "," + location.lng() + ")'>Add Remarks</a><br/>";
                    var infowindow = new google.maps.InfoWindow({
                        content: content
                    });

                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.open(mMap, marker);
                    });
                    attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo);
                }
            }
            else {
                address = "No results";

                var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/><a onclick='addlocations(" + location.lat() + "," + location.lng() + ")'>Add to My Locations</a><br/><a onclick='addRemarks(" + vehicleno + "," + location.lat() + "," + location.lng() + ")'>Add Remarks</a><br/>";


                var infowindow = new google.maps.InfoWindow({
                    content: content
                });

                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(mMap, marker);
                });
                attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo);
            }
        });
    }

    function MultimapPlaceMarker(location, iconsrc, vehicleno, make, model, capacity, speed, timestamp, count, DriverName, RouteName, MobileNo, stpdtimestamp) {
        var Username = '<%= Session["field1"] %>';
        var image = new google.maps.MarkerImage(iconsrc,
        // This marker is 20 pixels wide by 32 pixels tall.
        null,
        // The origin for this image is 0,0.
        new google.maps.Point(0, 0),
        // The anchor for this image is the base of the flagpole at 0,32.
        new google.maps.Point(20, 20)
    );
        var mMap;
        //            if (VehicleCount <= "4") {
        var mapcount = parseInt(MapType);
        if (count % mapcount == 19) {

            var homeControlDiv20 = document.createElement('div');
            var homeControl20 = new HomeControl20(homeControlDiv20, map20, vehicleno, RouteName, stpdtimestamp);
            map20.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv20);
            mMap = map20;
        }
        if (count % mapcount == 18) {
            var homeControlDiv19 = document.createElement('div');
            var homeControl19 = new HomeControl19(homeControlDiv19, map19, vehicleno, RouteName, stpdtimestamp);
            map19.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv19);
            mMap = map19;
        }
        if (count % mapcount == 17) {
            var homeControlDiv18 = document.createElement('div');
            var homeControl18 = new HomeControl18(homeControlDiv18, map18, vehicleno, RouteName, stpdtimestamp);
            map18.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv18);
            mMap = map18;
        }
        if (count % mapcount == 16) {
            var homeControlDiv17 = document.createElement('div');
            var homeControl17 = new HomeControl17(homeControlDiv17, map17, vehicleno, RouteName, stpdtimestamp);
            map17.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv17);
            mMap = map17;
        }

        if (count % mapcount == 15) {
            var homeControlDiv16 = document.createElement('div');
            var homeControl16 = new HomeControl16(homeControlDiv16, map16, vehicleno, RouteName, stpdtimestamp);
            map16.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv16);
            mMap = map16;
        }
        if (count % mapcount == 14) {
            var homeControlDiv15 = document.createElement('div');
            var homeControl15 = new HomeControl15(homeControlDiv15, map15, vehicleno, RouteName, stpdtimestamp);
            map15.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv15);
            mMap = map15;
        }
        if (count % mapcount == 13) {
            var homeControlDiv14 = document.createElement('div');
            var homeControl14 = new HomeControl14(homeControlDiv14, map14, vehicleno, RouteName, stpdtimestamp);
            map14.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv14);
            mMap = map14;
        }

        if (count % mapcount == 12) {
            var homeControlDiv13 = document.createElement('div');
            var homeControl13 = new HomeControl13(homeControlDiv13, map13, vehicleno, RouteName, stpdtimestamp);
            map13.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv13);
            mMap = map13;
        }


        if (count % mapcount == 11) {
            var homeControlDiv12 = document.createElement('div');
            var homeControl12 = new HomeControl12(homeControlDiv12, map12, vehicleno, RouteName, stpdtimestamp);
            map12.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv12);
            mMap = map12;
        }
        if (count % mapcount == 10) {
            var homeControlDiv11 = document.createElement('div');
            var homeControl11 = new HomeControl11(homeControlDiv11, map11, vehicleno, RouteName, stpdtimestamp);
            map11.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv11);
            mMap = map11;
        }
        if (count % mapcount == 9) {
            var homeControlDiv10 = document.createElement('div');
            var homeControl10 = new HomeControl10(homeControlDiv10, map10, vehicleno, RouteName, stpdtimestamp);
            map10.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv10);
            mMap = map10;
        }
        if (count % mapcount == 8) {
            var homeControlDiv9 = document.createElement('div');
            var homeControl9 = new HomeControl9(homeControlDiv9, map9, vehicleno, RouteName, stpdtimestamp);
            map9.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv9);
            mMap = map9;
        }
        if (count % mapcount == 7) {
            var homeControlDiv8 = document.createElement('div');
            var homeControl8 = new HomeControl8(homeControlDiv8, map8, vehicleno, RouteName, stpdtimestamp);
            map8.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv8);
            mMap = map8;
        }
        else if (count % mapcount == 6) {
            var homeControlDiv7 = document.createElement('div');
            var homeControl7 = new HomeControl7(homeControlDiv7, map7, vehicleno, RouteName, stpdtimestamp);
            map7.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv7);
            mMap = map7;
        }
        else if (count % mapcount == 5) {
            var homeControlDiv6 = document.createElement('div');
            var homeControl6 = new HomeControl6(homeControlDiv6, map6, vehicleno, RouteName, stpdtimestamp);
            map6.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv6);
            mMap = map6;
        }
        else if (count % mapcount == 4) {
            var homeControlDiv5 = document.createElement('div');
            var homeControl5 = new HomeControl5(homeControlDiv5, map5, vehicleno, RouteName, stpdtimestamp);
            map5.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv5);
            mMap = map5;
        }
        if (count % mapcount == 3) {
            var homeControlDiv4 = document.createElement('div');
            var homeControl4 = new HomeControl4(homeControlDiv4, map4, vehicleno, RouteName, stpdtimestamp);
            map4.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv4);
            mMap = map4;
        }
        else if (count % mapcount == 2) {
            var homeControlDiv3 = document.createElement('div');
            var homeControl3 = new HomeControl3(homeControlDiv3, map3, vehicleno, RouteName, stpdtimestamp);
            map3.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv3);

            mMap = map3;
        }
        else if (count % mapcount == 1) {
            var homeControlDiv2 = document.createElement('div');
            var homeControl2 = new HomeControl2(homeControlDiv2, map2, vehicleno, RouteName, stpdtimestamp);
            map2.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv2);
            mMap = map2;
        }
        else if (count % mapcount == 0) {
            var homeControlDiv1 = document.createElement('div');
            var homeControl1 = new HomeControl1(homeControlDiv1, map1, vehicleno, RouteName, stpdtimestamp);
            map1.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv1);
            mMap = map1;
        }

        var marker = new google.maps.Marker({
            position: location,
            map: mMap,
            center: location,
            zoom: 15,
            icon: image,
            title: vehicleno
        });
        mMap.panTo(location);
        markersArray.push(marker);
        //            if (clusteredview) {
        //                markerClusterer.addMarker(marker);
        //            }
        var address;
        geocoder = new google.maps.Geocoder();
        infoWindow.close();
        address = geocoder.geocode({ 'latLng': location }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results.length > 0) {
                    if (results[0]) {
                        address = results[0].formatted_address;

                        var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From1 : " + stpdtimestamp + "<br/><a onclick='addlocations(" + location.lat() + "," + location.lng() + ")'>Add to My Locations</a><br/><a onclick='addRemarks(" + vehicleno + "," + location.lat() + "," + location.lng() + ")'>Add Remarks</a><br/>";
                        var infowindow = new google.maps.InfoWindow({
                            content: content
                        });

                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(mMap, marker);
                        });
                        attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From2 : " + stpdtimestamp);
                    }
                    else {
                        address = "No results";

                        var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From3 : " + stpdtimestamp;
                        var infowindow = new google.maps.InfoWindow({
                            content: content
                        });

                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(mMap, marker);
                        });
                        attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From4 : " + stpdtimestamp);
                    }
                }
                else {
                    address = "No results";

                    var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From5 : " + stpdtimestamp + "<br/><a onclick='addlocations(" + location.lat() + "," + location.lng() + ")'>Add to My Locations</a><br/><a onclick='addRemarks(" + vehicleno + "," + location.lat() + "," + location.lng() + ")'>Add Remarks</a><br/>";
                    var infowindow = new google.maps.InfoWindow({
                        content: content
                    });

                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.open(mMap, marker);
                    });
                    attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From6 : " + stpdtimestamp);
                }
            }
            else {
                address = "No results";

                var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From7 : " + stpdtimestamp + "<br/><a onclick='addlocations(" + location.lat() + "," + location.lng() + ")'>Add to My Locations</a><br/><a onclick='addRemarks(" + vehicleno + "," + location.lat() + "," + location.lng() + ")'>Add Remarks</a><br/>";


                var infowindow = new google.maps.InfoWindow({
                    content: content
                });

                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(mMap, marker);
                });
                attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From8 : " + stpdtimestamp);
            }
        });
    }
    function placeMarker(location, iconsrc, vehicleno, make, model, capacity, speed, timestamp, DriverName, RouteName, MobileNo, stpdtimestamp) {
        var image = new google.maps.MarkerImage(iconsrc,
        // This marker is 20 pixels wide by 32 pixels tall.
        null,
        // The origin for this image is 0,0.
        new google.maps.Point(0, 0),
        // The anchor for this image is the base of the flagpole at 0,32.
        new google.maps.Point(20, 20)
    );
        var marker = new google.maps.Marker({
            position: location,
            map: map,
            center: location,
            zoom: 10,
            icon: image,
            title: vehicleno
        });
        markersArray.push(marker);
        //KS
        if (clusteredview) {
            markerClusterer.addMarker(marker);
        }
        var address;
        geocoder = new google.maps.Geocoder();
        infoWindow.close();
        address = geocoder.geocode({ 'latLng': location }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results.length > 0) {
                    if (results[0]) {
                        address = results[0].formatted_address;

                        var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From9 : " + stpdtimestamp + "<br/><a onclick='addlocations(" + location.lat() + "," + location.lng() + ")'>Add to My Locations</a><br/><a onclick='addRemarks(" + vehicleno + "," + location.lat() + "," + location.lng() + ")'>Add Remarks</a><br/>";
                        var infowindow = new google.maps.InfoWindow({
                            content: content
                        });

                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(map, marker);
                        });
                        attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From10 : " + stpdtimestamp);
                    }
                    else {
                        address = "No results";

                        var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From11 : " + stpdtimestamp;
                        var infowindow = new google.maps.InfoWindow({
                            content: content
                        });

                        google.maps.event.addListener(marker, 'click', function () {
                            infowindow.open(map, marker);
                        });
                        attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNoileNo + "<br/>" + "Stopped From12 : " + stpdtimestamp);
                    }
                }
                else {
                    address = "No results";

                    var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From13 : " + stpdtimestamp + "<br/><a onclick='addlocations(" + location.lat() + "," + location.lng() + ")'>Add to My Locations</a><br/><a onclick='addRemarks(" + vehicleno + "," + location.lat() + "," + location.lng() + ")'>Add Remarks</a><br/>";
                    var infowindow = new google.maps.InfoWindow({
                        content: content
                    });

                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.open(map, marker);
                    });
                    attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From14 : " + stpdtimestamp);
                }
            }
            else {
                address = "No results";

                var content = "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/><a onclick='addlocations(" + location.lat() + "," + location.lng() + ")'>Add to My Locations</a><br/><a onclick='addRemarks(" + vehicleno + "," + location.lat() + "," + location.lng() + ")'>Add Remarks</a><br/>";


                var infowindow = new google.maps.InfoWindow({
                    content: content
                });

                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(map, marker);
                });
                attachInfowindow(marker, location, "VehicleID : " + vehicleno + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name : " + RouteName + "<br/>" + "Mobile No : " + MobileNo + "<br/>" + "Stopped From15 : " + stpdtimestamp);
            }
        });
    }
    function attachInfowindow(marker, latlng, country) {
        var location = latlng;
        var boxText = document.createElement("div");
        boxText.style.cssText = "border: 1px solid black; margin-top: 8px; background: white; padding: 5px;";
        boxText.innerHTML = '<b>' + country + '</b><br />';

        var myOptions = {
            content: boxText
				, disableAutoPan: false
				, maxWidth: 0
				, pixelOffset: new google.maps.Size(-140, 0)
				, zIndex: null
				, boxStyle: {
				    background: "url('Images/tipbox.gif') no-repeat"
				  , opacity: 0.9
				  , width: "350px"
				}
				, closeBoxMargin: "10px 5px 0px 2px"
                , closeBoxURL: ""
				, infoBoxClearance: new google.maps.Size(1, 1)
				, isHidden: false
				, pane: "floatPane"
				, enableEventPropagation: false
        };


        var ib = new InfoBox(myOptions);
        //var infowindow = new google.maps.InfoWindow({ content: '<b>' + description + '</b><br />' + location });
        google.maps.event.addListener(marker, 'mouseover', function () {
            //infowindow.open(map,marker);
            ib.open(map, marker);
        });
        google.maps.event.addListener(marker, 'mouseout', function () {
            //infowindow.close();
            ib.close();
        });
    }

    $('.selectlist-list').click(function () {
    });
    function bphover(me, vehicleid) {
        var valu = $('#displaydiv');
        $('#displaydiv').css("display", "block");
        var pos = $(me).offset();
        var content = "";
        var timestamp;
        var myCenterZoom;
        for (var vehicledata in livedata) {
            var vehicleno = livedata[vehicledata].vehiclenum;
            var speed = livedata[vehicledata].Speed;
            //                var Odometer = livedata[vehicledata].todaymileage;

            var updatedata = livedata[vehicledata].Datetime;
            var DriverName = livedata[vehicledata].DriverName;
            var CompanyID = livedata[vehicledata].CompanyID;
            var MobileNo = livedata[vehicledata].MobileNo;
            var RouteName = livedata[vehicledata].RouteName;
            var make = livedata[vehicledata].make;
            var model = livedata[vehicledata].model;
            var capacity = livedata[vehicledata].capacity;
            var date = updatedata.split(" ")[0];
            var datevalues = new Array();
            var timevalues = new Array();
            if (date == "0") {
            }
            else {
                var time = updatedata.split(" ")[1];
                datevalues = date.split('/');
                timevalues = time.split(':');
            }
            var updatetime = new Date(datevalues[2], datevalues[1] - 1, datevalues[0], timevalues[0], timevalues[1], timevalues[2]);
            var todaydate = ServerDate;
            var _MS_PER_DAY = 86400000;
            var _MS_PER_aaa = 3600000;
            var _MS_PER_sss = 60000;
            var _MS_PER_ddd = 1000;
            var days = Math.floor((todaydate - updatetime) / _MS_PER_DAY);
            var hours = Math.floor((todaydate - updatetime) / _MS_PER_aaa);
            if (hours > 24) {
                hours = hours % 24;
            }
            var min = Math.floor((todaydate - updatetime) / _MS_PER_sss);
            if (min > 60) {
                min = min % 60;
            }
            var sec = Math.floor((todaydate - updatetime) / _MS_PER_ddd);
            if (sec > 60) {
                sec = sec % 60;
            }

            if (days >= 1) {
                timestamp = "No Update form " + days + " days " + hours + " Hrs " + min + " Min";
            }
            else if (hours > 1) {
                timestamp = "No Update form " + hours + " Hrs " + min + " Min";
            }
            else if (min < 5) {
                timestamp = min + " Min " + sec + " Sec Back";
            }
            else if (days < 1) {
                timestamp = "No Update form " + hours + " Hrs " + min + " Min";
            }
            var stpdtimestamp = "0 Min";
            var stoppeddate = livedata[vehicledata].stoppedfor;
            if (speed == 0 && stoppeddate != "") {
                try {
                    var stpddate = stoppeddate.split(" ")[0];
                    var stpdtime = stoppeddate.split(" ")[1];
                    var stpddatevalues = new Array();
                    var stpdtimevalues = new Array();
                    stpddatevalues = stpddate.split('/');
                    stpdtimevalues = stpdtime.split(':');
                    var stpdupdatetime = new Date(stpddatevalues[2], stpddatevalues[1] - 1, stpddatevalues[0], stpdtimevalues[0], stpdtimevalues[1], stpdtimevalues[2]);
                    var _MS_PER_DAY = 86400000;
                    var _MS_PER_aaa = 3600000;
                    var _MS_PER_sss = 60000;
                    var _MS_PER_ddd = 1000;
                    var days = Math.floor((updatetime - stpdupdatetime) / _MS_PER_DAY);
                    var hours = Math.floor((updatetime - stpdupdatetime) / _MS_PER_aaa);
                    if (hours > 24) {
                        hours = hours % 24;
                    }
                    var min = Math.floor((updatetime - stpdupdatetime) / _MS_PER_sss);
                    if (min > 60) {
                        min = min % 60;
                    }
                    var sec = Math.floor((updatetime - stpdupdatetime) / _MS_PER_ddd);
                    if (sec > 60) {
                        sec = sec % 60;
                    }
                    if (days >= 1) {
                        stpdtimestamp = days + " days " + hours + " Hrs " + min + " Min";
                    }
                    else if (hours > 1) {
                        stpdtimestamp = hours + " Hrs " + min + " Min";
                    }
                    else if (min < 10) {
                        stpdtimestamp = min + " Min " + sec + " Sec";
                    }
                    else if (days < 1) {
                        stpdtimestamp = hours + " Hrs " + min + " Min";
                    }
                }
                catch (Error) {
                }
            }
            var vehicle = $("#" + vehicleno + "");
            if (vehicleid == vehicleno) {
                content = "Vehicle ID : " + vehicleid + "<br/><br/>" + "Vehicle Make : " + make + "<br/><br/>" + "Model : " + model + "<br/><br/>" + "Capacity : " + capacity + "<br/><br/>" + "Speed : " + livedata[vehicledata].Speed + " Kms/Hr<br/><br/>" + "Ignition : " + livedata[vehicledata].Ignation + "<br/><br/>" + "A\C Status : " + livedata[vehicledata].ACStatus + "<br/><br/>" + "Update Status : " + timestamp + "<br/><br/>" + "Driver Name : " + DriverName + "<br/><br/>" + "Route Name : " + RouteName + "<br/><br/>" + "Mobile No : " + MobileNo + "<br/><br/>" + "Stopped From16 : " + stpdtimestamp;
            }
        }

        $("#displaydiv").html(content);

        var top = $(document).scrollTop();
        var tothei = $(document).height();
        var xx = window.screen.availHeight;
        var aa = pos.top;
        var zz = aa + 40;
        if ((top + xx) >= (pos.top + $('#displaydiv').height() + 30 + ($('#displaydiv').height() * 0.5))) {
            $('#displaydiv').css("top", zz).css("left", pos.left + 30);
        }
        else {
            if ((pos.top - $('#displaydiv').height()) < 0) {
                $('#displaydiv').css("top", "0").css("left", pos.left + 30);
            }
            else {
                $('#displaydiv').css("top", pos.top - $('#displaydiv').height() - 30).css("left", pos.left + 30);
            }
        }
    }

    function bpmouseout() {
        $("#displaydiv").css("display", "none"); $("#displaydiv").html("");
    }
    function addlocations(lat, lng) {
        var mytext = lat + "," + lng;
        window.open('Mylocation.aspx?lat=' + lat + "&long=" + lng);
    }
    function addRemarks(vehicleno, lat, long) {
        var now = new Date();
        now.format("dd/MM/yyyy h:mm tt");
        $("#divupdateinfo").css("display", "block");
        $("#txtvehno").val(vehicleno.value);
        $("#txttime").val(now);
        $("#txtlat").val(lat);
        $("#txtlong").val(long);

        $("#txtremarks").val("");
        //            $("#btnsave").val("");
    }
    var MarkLocation = [];
    $(function () {
        $('input[type="checkbox"]').bind('click', function () {
            if ($(this).is(':checked')) {
                MarkLocation.push($(this).val());
            }
            else {
                var i = MarkLocation.indexOf($(this).val());
                if (i != -1) {
                    MarkLocation.splice(i, 1);
                }
            }
        });
    });
    var LocationsArray = new Array();
    function placeMarkerlocations(location, BranchName, Image, Decription, isplant, radius, vehno) {
        //            var length = checkedvehicles.indexOf(vehno);
        //            if (length > -1) {
        var marker;
        //        var locationtype = document.getElementById('ddllocationtype').value;
        //            if (locationtype == "All") {
        //                if (isplant == "False") {
        //                    var lctnicon = "Images/ssmarker.png";
        //                    marker = new google.maps.Marker({
        //                        position: location,
        //                        map: map,
        //                        center: location,
        //                        zoom: 7,
        //                        title: BranchName,
        //                        icon: lctnicon
        //                    });
        //                }
        //                else {
        //                    var lctnicon = "Images/plantmarker.png";
        //                    marker = new google.maps.Marker({
        //                        position: location,
        //                        map: map,
        //                        center: location,
        //                        zoom: 7,
        //                        title: BranchName,
        //                        icon: lctnicon
        //                    });
        //                }
        //            }
        var lctnicon = "Images/ssmarker.png";
        if (MarkLocation.indexOf(Image) != -1) {
            if (Image == "build10") {
                lctnicon = "Images/ssmarker.png";
            }
            if (Image == "build11") {
                lctnicon = "UserImgs/build11.png";
            }
            if (Image == "build12") {
                lctnicon = "UserImgs/build12.png";
            }
            if (Image == "build13") {
                lctnicon = "UserImgs/build13.png";
            }
            if (Image == "build14") {
                lctnicon = "UserImgs/build14.png";
            }
            if (Image == "build15") {
                lctnicon = "UserImgs/build15.png";
            }
            marker = new google.maps.Marker({
                position: location,
                map: map,
                center: location,
                zoom: 7,
                title: BranchName,
                icon: lctnicon
            });
            LocationsArray.push(marker);

            var rrr = parseInt(radius, rrr);
            var circle = new google.maps.Circle({
                map: map,
                zoom: 16,
                radius: rrr,    // 10 miles in metres
                strokeColor: "#FFffff",
                fillColor: "#FF0000",
                fillOpacity: 0.35,
                strokeWeight: 1,
                strokeOpacity: 0
            });
            circle.bindTo('center', marker, 'position');
            LocationsArray.push(circle);

            var content = "Location : " + BranchName + "<br/>" + "Description : " + Decription;
            var infowindow = new google.maps.InfoWindow({
                content: content
            });

            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
        }
    }


    function trhover(id) {
        var newColor = 'rgba(0,0,0,0.1)';
        id.style.backgroundColor = (newColor == id.style.backgroundColor) ? origColor : newColor;
    }
    function trmouseout(id) {
        var newColor = 'transparent';
        id.style.backgroundColor = (newColor == id.style.backgroundColor) ? origColor : newColor;
    }
    function onvehicleclick(id, vehicleid) {
        var Vehicleclicked = false;
        for (var vehicletype in checkedvehicles) {
            if (checkedvehicles[vehicletype] == vehicleid) {
                Vehicleclicked = true;
            }
        }
        VehicleCount = checkedvehicles.length;
        if (ViewType == "MultipleView") {
            Multipleview();
        }
        //            alert(VehicleCount);
        if (Vehicleclicked) {
            for (var vehicledata in livedata) {
                if (livedata[vehicledata].vehiclenum == vehicleid) {
                    var myCenter = new google.maps.LatLng(livedata[vehicledata].latitude, livedata[vehicledata].longitude);
                    map.panTo(myCenter);
                    //                        map.fitBounds(latlngbounds);
                    //                        map.setZoom(14);

                    var updatedata = livedata[vehicledata].Datetime;
                    //                        var Odometer = livedata[vehicledata].todaymileage;
                    var date = updatedata.split(" ")[0];
                    var datevalues = new Array();
                    var timevalues = new Array();
                    if (date == "0") {
                    }
                    else {
                        var time = updatedata.split(" ")[1];
                        datevalues = date.split('-');
                        timevalues = time.split(':');
                    }
                    var updatetime = new Date(datevalues[2], datevalues[1] - 1, datevalues[0], timevalues[0], timevalues[1], timevalues[2]);
                    var todaydate = ServerDate;
                    var _MS_PER_DAY = 86400000;
                    var _MS_PER_aaa = 3600000;
                    var _MS_PER_sss = 60000;
                    var _MS_PER_ddd = 1000;
                    var days = Math.floor((todaydate - updatetime) / _MS_PER_DAY);
                    var hours = Math.floor((todaydate - updatetime) / _MS_PER_aaa);
                    if (hours > 24) {
                        hours = hours % 24;
                    }
                    var min = Math.floor((todaydate - updatetime) / _MS_PER_sss);
                    if (min > 60) {
                        min = min % 60;
                    }
                    var sec = Math.floor((todaydate - updatetime) / _MS_PER_ddd);
                    if (sec > 60) {
                        sec = sec % 60;
                    }
                    var timestamp;
                    if (days >= 1) {
                        timestamp = "There was no Update form " + days + " days " + hours + " Hrs " + min + " Min";
                    }
                    else if (hours > 1) {
                        timestamp = "There was no Update form " + hours + " Hrs " + min + " Min";
                    }
                    else if (min < 5) {
                        timestamp = min + " Min " + sec + " Sec Back Update";
                    }
                    else if (days < 1) {
                        timestamp = "There was no Update form " + hours + " Hrs " + min + " Min";
                    }
                    var speed = livedata[vehicledata].Speed;
                    var address;
                    var DriverName = livedata[vehicledata].DriverName;
                    var CompanyID = livedata[vehicledata].CompanyID;
                    var MobileNo = livedata[vehicledata].MobileNo;
                    var RouteName = livedata[vehicledata].RouteName;
                    var make = livedata[vehicledata].make;
                    var model = livedata[vehicledata].model;
                    var capacity = livedata[vehicledata].capacity;
                    geocoder = new google.maps.Geocoder();
                    infoWindow.close();
                    address = geocoder.geocode({ 'latLng': myCenter }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            if (results.length > 0) {
                                if (results[0]) {
                                    address = results[0].formatted_address;

                                    infoWindow.close();
                                    infoWindow.setOptions({
                                        content: "VehicleID : " + vehicleid + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name: " + RouteName + "<br/>" + "Mobile No : " + MobileNo,
                                        position: myCenter
                                    });
                                    infoWindow.open(map);
                                }
                                else {
                                    address = "No results";

                                    infoWindow.close();
                                    infoWindow.setOptions({
                                        content: "VehicleID : " + vehicleid + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name: " + RouteName + "<br/>" + "Mobile No : " + MobileNo,
                                        position: myCenter
                                    });
                                    infoWindow.open(map);
                                }
                            }
                            else {
                                address = "No results";

                                infoWindow.close();
                                infoWindow.setOptions({
                                    content: "VehicleID : " + vehicleid + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route Name: " + RouteName + "<br/>" + "Mobile No : " + MobileNo,
                                    position: myCenter
                                });
                                infoWindow.open(map);
                            }
                        }
                        else {
                            address = "No results";

                            infoWindow.close();
                            infoWindow.setOptions({
                                content: "VehicleID : " + vehicleid + "<br/>" + "Vehicle Make : " + make + "<br/>" + "Model : " + model + "<br/>" + "Capacity : " + capacity + "<br/>" + "Address : " + address + "<br/>" + "Speed : " + speed + " KMPH" + "<br/>" + "Update Status : " + timestamp + "<br/>" + "Driver Name : " + DriverName + "<br/>" + "Route  Name: " + RouteName + "<br/>" + "Mobile No : " + MobileNo,
                                position: myCenter
                            });
                            infoWindow.open(map);
                        }
                    });
                }
            }
        }
    }
    $(function () {
        var hidden = false;
        $("#btnClose").click(function () {
            if (hidden) {
                $(".togglediv").stop().animate({ left: 0 }, 500);
                hidden = false;
                $("#btnClose").attr('title', "Hide");
                $("#btnClose").attr('src', "Images/bigleft.png");
            }
            else {
                $(".togglediv").css('margin-left', 0);
                $(".togglediv").css('margin-right', 0);
                $(".togglediv").animate({ left: '-335px' }, 500);
                $("#btnClose").attr('title', "Show");
                $("#btnClose").attr('src', "Images/bigright.png");
                hidden = true;
            }
        });
    });
    </script>
    <script type="text/javascript">
        var triproutedata;
        function drawpoly() {
            var Username = '<%= Session["field1"] %>';
            var data = { 'op': 'dataforpoly', Username: Username };
            var s = function (msg) {
                if (msg) {
                    polyroute(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
                // $('#BookingDetails').html(x);
            };
            callHandler(data, s, e);
        }
        var count = 0;
        var markersArray = [];
        var polilinepath = [];
        var firstlog = false;
        var stoppedmarkers = [];
        var marker;
        var flightPath = null;
        function polyroute(msg) {
            triproutedata = msg;
            polilinepath = [];
            if (flightPath) {
                flightPath.setMap(null);
            }
            for (var cnt = 0; cnt < triproutedata.length; cnt++) {
                var flightPlanCoordinates = [];
                var data = [];
                data = triproutedata[cnt].logslist
                var vehicle = triproutedata[cnt].vehicleno;
                var length = checkedvehicles.indexOf(vehicle);
                if (length > -1) {
                    for (var count = 0; count < data.length; count++) {
                        var Latitude = data[count].latitude;
                        var Longitude = data[count].longitude;
                        var speed = data[count].speed;
                        speed = Math.round(speed);
                        var timestamp = "";
                        if (speed == 0) {
                            if (count < data.length - 1) {
                                var prestime = data[count].datetime;
                                var upcmngtime = data[count + 1].datetime;
                                var date = prestime.split(" ")[0];
                                var datevalues = new Array();
                                var timevalues = new Array();
                                if (date == "0") {
                                }
                                else {
                                    var time = prestime.split(" ")[1];
                                    if (date.indexOf("-") != -1) {
                                        datevalues = date.split('-');
                                    }
                                    else if (date.indexOf("/") != -1) {
                                        datevalues = date.split('/');
                                    }
                                    timevalues = time.split(':');
                                }
                                var updatetime = new Date(datevalues[2], datevalues[1] - 1, datevalues[0], timevalues[0], timevalues[1], timevalues[2]);

                                var upcmngdate = upcmngtime.split(" ")[0];
                                var upcmngtime = upcmngtime.split(" ")[1];
                                var upcmngdatevalues = new Array();
                                var upcmngtimevalues = new Array();
                                if (upcmngdate.indexOf("-") != -1) {
                                    upcmngdatevalues = upcmngdate.split('-');
                                }
                                else if (upcmngdate.indexOf("/") != -1) {
                                    upcmngdatevalues = upcmngdate.split('/');
                                }
                                upcmngtimevalues = upcmngtime.split(':');
                                var upcmngupdatetime = new Date(upcmngdatevalues[2], upcmngdatevalues[1] - 1, upcmngdatevalues[0], upcmngtimevalues[0], upcmngtimevalues[1], upcmngtimevalues[2]);

                                //                    var todaydate = new Date();
                                var _MS_PER_DAY = 86400000;
                                var _MS_PER_aaa = 3600000;
                                var _MS_PER_sss = 60000;
                                var _MS_PER_ddd = 1000;
                                var days = Math.floor((upcmngupdatetime - updatetime) / _MS_PER_DAY);
                                var hours = Math.floor((upcmngupdatetime - updatetime) / _MS_PER_aaa);
                                if (hours > 24) {
                                    hours = hours % 24;
                                }
                                var min = Math.floor((upcmngupdatetime - updatetime) / _MS_PER_sss);
                                if (min > 60) {
                                    min = min % 60;
                                }
                                var sec = Math.floor((upcmngupdatetime - updatetime) / _MS_PER_ddd);
                                if (sec > 60) {
                                    sec = sec % 60;
                                }
                                if (days >= 1) {
                                    timestamp = "Stopped for " + days + " days " + hours + " Hrs " + min + " Min";
                                }
                                else if (hours > 1) {
                                    timestamp = "Stopped for " + hours + " Hrs " + min + " Min";
                                }
                                else if (min > 1) {
                                    timestamp = "Stopped for " + min + " Min " + sec + " Sec";
                                }
                                else if (days < 1 && min > 1) {
                                    timestamp = "Stopped for " + hours + " Hrs " + min + " Min";
                                }
                            }
                        }
                        var status = data[count].Status;
                        var datetime = data[count].datetime;
                        var point = new google.maps.LatLng(
                          parseFloat(Latitude),
                          parseFloat(Longitude));
                        flightPlanCoordinates[count] = new google.maps.LatLng(Latitude, Longitude);
                        var usertype = '<%=Session["UserType"]%>';
                    }
                    var lineSymbol = {
                        path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
                    };
                    flightPath = new google.maps.Polyline({
                        path: flightPlanCoordinates,
                        strokeColor: "#" + cnt + "000CD",
                        strokeOpacity: 1.0,
                        strokeWeight: 2,
                        icons: [{
                            icon: lineSymbol,
                            offset: '100%'
                        }]
                    });

                    flightPath.setMap(map);
                    polilinepath.push(flightPath);
                }
            }
        }
        var ViewStatus = false;
        function ViewStatusclick() {
            var status = document.getElementById('btnViewStatus').value;
            if (status == "Open Route") {
                ViewStatus = true;
                document.getElementById('btnViewStatus').value = "Close Route";
            }
            else {
                ViewStatus = false;
                document.getElementById('btnViewStatus').value = "Open Route";
                map = new google.maps.Map(document.getElementById('googleMap'), {
                    zoom: 12,
                    center: new google.maps.LatLng(17.445974, 80.150965),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });
                var ArrayPath = [];
                var path = ArrayPath;
                var line = new google.maps.Polyline({
                    path: path,
                    strokeColor: '#ff0000',
                    strokeOpacity: 2.0,
                    zoom: 14,
                    strokeWeight: 3
                });
                line.setMap(map);
                liveupdate();
            }
        }
        function btnsaveclick() {
            var Username = '<%= Session["field1"] %>';
            var vehicleno = $("#txtvehno");
            var remarks = $("#txtremarks");
            var odometer = $("#txt_odometer");
            var lat = $("#txtlat");
            var long = $("#txtlong");

            var data = { 'op': 'remarkssave', vehicleno: vehicleno[0].value, remarks: remarks[0].value, odometer: odometer[0].value, lat: lat[0].value, long: long[0].value };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    $("#divupdateinfo").css("display", "none");
                }
                else {
                }
            };
            var e = function (x, h, e) {
                // $('#BookingDetails').html(x);
            };
            callHandler(data, s, e);
        }
        $(function () {
            $('#divinfoclose').click(function () {
                $('#divupdateinfo').css('display', 'none');
            });
        });
        function validate(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
            var regex = /[0-9]|\./;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) theEvent.preventDefault();
            }
        }
    </script>
    <style>
        .multiselect
        {
            width: 150px;
        }
        .selectBox
        {
            position: relative;
        }
        .selectBox select
        {
            width: 100%;
            font-weight: bold;
        }
        .overSelect
        {
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
        }
        #checkboxes
        {
            display: none;
            border: 1px #dadada solid;
        }
        #checkboxes label
        {
            display: block;
        }
        #checkboxes label:hover
        {
            background-color: #d3d6d8;
        }
    </style>
    <script>
        var expanded = false;
        function showCheckboxes() {
            var checkboxes = document.getElementById("checkboxes");
            if (!expanded) {
                checkboxes.style.display = "block";
                expanded = true;
            } else {
                checkboxes.style.display = "none";
                expanded = false;
            }
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divmap" style="width: 100%; height: 100%; top: 55px; display: none; position: absolute;
        z-index: 999999; border: 5px solid yellow;">
        <div id="divclose" style="width: 25px; top: 4%; right: 23%; position: absolute; border: 2px solid red;
            z-index: 99999; cursor: pointer;">
            <img src="Images/Close.png" alt="close" title="Close" />
        </div>
    </div>
    <div style="width: 100%; height: 100%;">
        <div style="text-align: right;">
            <table style="padding-left: 35%;">
                <tr>
                    <td>
                        <span style="color: blue;">Location Type</span>
                    </td>
                    <td>
                        <div class="multiselect">
                            <div class="selectBox" onclick="showCheckboxes()" >
                                <select id="ddllocationtype" onchange="test();">
                                    <option>Select Locations</option>
                                </select>
                                <div class="overSelect">
                                </div>
                            </div>
                            <div id="checkboxes" style="color: #979797; z-index: 99999; position: absolute; border: 2px solid gray;
                                background-color: white; width: 150px; padding-left: 0%; text-align: left;">
                                <label for="one">
                                    <input type="checkbox" class="messageCheckbox" id="one" name="mailId[]" value="build10" />Agents</label>
                                <label for="two">
                                    <input type="checkbox" class="messageCheckbox" id="two" name="mailId[]" value="build11" />Plants
                                </label>
                                <label for="three">
                                    <input type="checkbox" class="messageCheckbox" id="three" name="mailId[]" value="build12" />CC</label>
                                <label for="three">
                                    <input type="checkbox" class="messageCheckbox" id="Checkbox1" name="mailId[]" value="build14" />Marketing
                                    Offices</label>
                                <label for="three">
                                    <input type="checkbox" class="messageCheckbox" id="Checkbox2" name="mailId[]" value="build13" />Tollgates</label>
                                <label for="three">
                                    <input type="checkbox" class="messageCheckbox" id="Checkbox3" name="mailId[]" value="build15" />Cross
                                    Points</label>
                            </div>
                        </div>
                        <%--  <cc1:DropDownCheckList ID="ddllocationtype" runat="server" BorderColor="black" BorderStyle="Solid"
                                    AutoPostBack="true" ForeColor="#979797" Style="color: #979797" CheckListCssStyle="position:absolute;z-index:99999;overflow: auto; border: 1px solid black; padding: 4px; max-height:300px; background-color: #ffffff;"
                                    DisplayBoxCssStyle="border: 1px solid #000000; cursor: pointer; z-index:99999;"
                                    Width="160px" TextWhenNoneChecked="Location Types">
                            <asp:ListItem >Agents</asp:ListItem>
                            <asp:ListItem >Plants</asp:ListItem>
                            <asp:ListItem >CC</asp:ListItem>
                            <asp:ListItem>Marketing Offices</asp:ListItem>
                            <asp:ListItem>Tollgates</asp:ListItem>
                            <asp:ListItem>Cross Points</asp:ListItem>
                        </cc1:DropDownCheckList>--%>
                    </td>
                    <td>
                        <a onclick="MapviewClick();" style="color: blue; margin-left: 10px; margin-right: 20px;
                            text-decoration: none;"><b>Map View</b></a> <a onclick="TripviewClick();" style="color: blue;
                                text-decoration: none; margin-right: 2px;"><b>Trip View </b></a>
                        <input type="checkbox" id="ckb_plantview" onclick="PlantviewClick();" /><b style="color: blue;
                            margin-right: 10px;">Plant View </b><span style="color: blue;">MapType</span>
                        <select id="ddlmaptype" onchange="Maptypechange();" style="width: 80px;">
                            <option selected="selected">Select</option>
                            <option>1</option>
                            <option>4</option>
                            <option>8</option>
                            <option>12</option>
                            <option>16</option>
                            <option>20</option>
                        </select>
                        <input type="button" value="Open Route" id="btnViewStatus" class="ContinueButton"
                            onclick="ViewStatusclick();" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%;">
            <div id="mapcontent">
                <div id="googleMap" style="width: 100%; height: 100%; position: relative; background-color: rgb(229, 227, 223);">
                </div>
            </div>
        </div>
        <div class="togglediv" id="divtoggle">
            <div class="inner">
                <%--<input type="button" class="btntogglecls" value="" id="btnshowhide" onclick="clicked();" />--%>
                <img id="btnClose" alt="" src="Images/bigleft.png" title="Hide" style="float: right;
                    border: 1px solid #d5d5d5; width: 39px; height: 39px; background-color: #ffffff;" />
                <table cellpadding="0" cellspacing="0" style="background-color:#627d9a;">
                    <tr style="background: none 0px 0px repeat scroll rgba(0, 0, 0, 0.0980392);border-width: medium;border-style: none;border-color: initial;color: rgb(250, 251, 251);">
                        <td>
                        </td>
                        <td>
                            <cc1:DropDownCheckList ID="chblZones" runat="server" BorderColor="black" BorderStyle="Solid"
                                AutoPostBack="true" ForeColor="#979797" Style="color: black;font-weight: bold;" CheckListCssStyle="position:absolute;z-index:99999;overflow: auto; border: 1px solid black; padding: 4px; max-height:300px; background-color: #ffffff;"
                                DisplayBoxCssStyle="cursor: pointer; width:170px; height:30px;z-index:99999;border-bottom: medium none;border-top: medium none;border-left: medium none;border-right: medium none;color: #FFFFFF; background: #4F6877;"
                                Width="170px" TextWhenNoneChecked="Plant Name">
                            </cc1:DropDownCheckList>
                        </td>

                        <td>
                            <div style="display: block; width: 160px;" id="divchblvehicles">
                                <cc1:DropDownCheckList ID="chblVehicleTypes" runat="server" BorderColor="black" BorderStyle="Solid"
                                    AutoPostBack="true" ForeColor="#979797" Style="color: black;font-weight: bold;" CheckListCssStyle="position:absolute;z-index:99999;overflow: auto; border: 1px solid black; padding: 4px; max-height:300px; background-color: #ffffff;"
                                    DisplayBoxCssStyle="cursor: pointer; width:160px; height:30px;z-index:99999; border-bottom: medium none;border-top: medium none;border-left: medium none;border-right: medium none;color: #FFFFFF; background: #4F6877; text-align: center;"
                                    Width="160px" TextWhenNoneChecked="Vehicle Type">
                                </cc1:DropDownCheckList>
                            </div>
                        </td>
                    </tr>
                 <tr style="height:1px;"></tr>
                    <tr style="background: none 0px 0px repeat scroll rgba(0, 0, 0, 0.0980392);border-width: medium;border-style: none;border-color: initial;color: rgb(250, 251, 251);">
                        <td>
                        </td>
                        <td colspan="2">
                            <div style="display: block; width: 302px;" id="divchblstatus">
                                <cc1:DropDownCheckList ID="chblvelstatus" runat="server" BorderColor="black" BorderStyle="Solid"
                                    AutoPostBack="true" ForeColor="#979797" Style="color: black;font-weight: bold;" CheckListCssStyle="position:absolute;z-index:99999;overflow: auto; border: 1px solid black; padding: 4px; max-height:300px; background-color: #ffffff;"
                                    DisplayBoxCssStyle="cursor: pointer; width:330px; height:30px;z-index:99999; border-bottom: medium none;border-top: medium none;border-left: medium none;border-right: medium none;color: #FFFFFF; background: none repeat scroll 0 0 rgba(0, 0, 0, 0.1);border-radius: 9px; text-align: center;"
                                    Width="302px" TextWhenNoneChecked="Vehicle Status">
                                </cc1:DropDownCheckList>
                            </div>
                        </td>
                    </tr>
                    <tr style="height:5px;"></tr>
                </table>
                 <input type="text" id="txt_searchvehicleno" placeholder="Search Vehicle Number" class="form-control" style="border-top-width: 2px;height: 30px;width: 330px; ">
                <div id="divvehicles" style="width: 330px; overflow-x: auto; height: 90%;">
                    <div id="divAllvehicles" style="border-bottom: medium none;border-top: medium none;border-left: medium none;border-right: medium none;color: black;">
                    </div>
                </div>
            </div>
        </div>
        <div id="displaydiv" class="bpmouseover">
        </div>
        <div id="divupdateinfo" style="display: none; text-align: center; height: 100%; width: 100%;
            position: absolute; left: 0%; top: 0%; z-index: 99999; background-color: rgba(192, 192, 192, 0.701961);
            background-position: initial initial; background-repeat: initial initial;">
            <div style="left: 35%; top: 20%; height: 300px; width: 400px; background-color: #ffffcc;
                text-align: left; border: 2px solid #d5d5d5; position: absolute; border-radius: 5px 5px 5px 5px;">
                <table>
                    <tr>
                        <td>
                            <br />
                        </td>
                        <td>
                            <input type="text" id="txtlat" disabled="disabled" style="display: none;" />
                        </td>
                        <td>
                            <input type="text" id="txtlong" disabled="disabled" style="display: none;" />
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <span>Vehicle Number</span>
                        </td>
                        <td>
                            <input type="text" id="txtvehno" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <span>Time</span>
                        </td>
                        <td>
                            <input type="text" id="txttime" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <span>Odometer</span>
                        </td>
                        <td>
                            <input type="text" id="txt_odometer" />
                        </td>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <span>Remarks</span>
                            </td>
                            <td>
                                <textarea id="txtremarks" style="height: 100px; width: 300px;"></textarea>
                            </td>
                        </tr>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                            <input type="button" id="btnsave" value="SAVE" onclick="btnsaveclick();" style="height: 30px;
                                width: 100px; font-size: 14px;" />
                        </td>
                    </tr>
                </table>
                <div id="divinfoclose" style="width: 25px; top: 0px; right: 0px; position: absolute;
                    z-index: 99999; cursor: pointer;">
                    <img src="Images/Close.png" alt="close">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
