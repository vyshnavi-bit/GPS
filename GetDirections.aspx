﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="GetDirections.aspx.cs" Inherits="GetDirections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        .h1, .h2, .h3, h1, h2, h3
        {
            margin-top: 5px !important;
            margin-bottom: 10px;
        }
        .menuclass
        {
            height: 59px !important;
        }
        html, body, #map-canvas
        {
            height: 100%;
            margin: 0px;
            padding: 0px;
        }
        #control
        {
            background: #fff;
            padding: 5px;
            font-size: 14px;
            font-family: Arial;
            border: 1px solid #ccc;
            box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
            display: none;
        }
           div#mapcontent
        {
            right: 0;
            bottom: 0;
            left: 0px;
            top: 70px;
            overflow: hidden;
            position: absolute;
        }
        
    </style>
    <script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbt9z3InHbzrV66t1eSZB5TnlJ2HQ-Uc8&v=3.exp&sensor=false"></script>
      <link rel="stylesheet" type="text/css" href="dist/css/AdminLTE.css" />
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
     <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script type="text/javascript">
        var rendererOptions = {
            draggable: true
        };
        var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions); ;
        var directionsService = new google.maps.DirectionsService();
        var map;

        var australia = new google.maps.LatLng(-25.274398, 133.775136);

        function initialize() {

            var mapOptions = {
                zoom: 7,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: australia
            };
            map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);
            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('directionsPanel'));

            google.maps.event.addListener(directionsDisplay, 'directions_changed', function () {
                computeTotalDistance(directionsDisplay.directions);
            });
            var control = document.getElementById('control');
            control.style.display = 'block';
            map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
            calcRoute();
        }

        function calcRoute() {
           var start = document.getElementById('start').value;
            var end = document.getElementById('end').value;
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });
        }

        function computeTotalDistance(result) {
            var total = 0;
            var myroute = result.routes[0];
            for (var i = 0; i < myroute.legs.length; i++) {
                total += myroute.legs[i].distance.value;
            }
            total = total / 1000.
            document.getElementById('total').innerHTML = total + ' km';
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    <script type="text/javascript">
        $(function () {
            //            var Username = '<%= Session["field1"] %>';
            var Username = 'hfil';
            var data = { 'op': 'ShowMyLocations', 'Username': Username };
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
        function Bindlocations(data) {
            Locationsdata = data;
            var start = document.getElementById('start');
            var end = document.getElementById('end');
            for (var vehicledata in data) {
                var opt = document.createElement('option');
                opt.innerHTML = data[vehicledata].BranchName;
                opt.value = data[vehicledata].latitude + "," + data[vehicledata].longitude,
                start.appendChild(opt);
                var opt1 = document.createElement('option');
                opt1.innerHTML = data[vehicledata].BranchName;
                opt1.value = data[vehicledata].latitude + "," + data[vehicledata].longitude;
                end.appendChild(opt1);
            }
            var key = 'Locations';
            var temp = location.search.match(new RegExp(key + "=(.*?)($|\&)", "i"));
            if (temp === null || temp === typeof undefined) {
            }
            else {
                var locations = temp[1].split('@');
                document.getElementById('start').value = locations[0];
                document.getElementById('end').value = locations[1];
                calcRoute();
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="control">
        <table>
        <tr>
        <td>
<br />
        </td>
        </tr>
            <tr>
                <td>
                    <strong>Source:</strong>
                    <select id="start" onchange="calcRoute();" class="form-control">
                    </select>
                </td>
                <td style="width:6px;"></td>
                <td>
                    <strong>Destination:</strong>
                    <select id="end" onchange="calcRoute();" class="form-control">
                    </select>
                </td>
            </tr>
        </table>
    </div>
    <div style="width: 100%;">
            <div id="mapcontent">
                <div id="googleMap" style="width: 70%; height: 100%; position: relative; background-color: rgb(229, 227, 223);">
                </div>
            </div>
        </div>
    <div id="directionsPanel" style="float: right; width: 30%; height: 100%; overflow-x: auto;">
        <p>
            Total Distance: <span id="total"></span>
        </p>
    </div>
</asp:Content>
