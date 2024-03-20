<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Στατιστικά Στοιχεία Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <style>
            body{
                text-align: center;
                position: inherit;

            }
            header {
                margin-top: 1em;
            }

            .header h1 {
                color: rgb(0, 0, 0);
                font-size: 50px;
                text-align: center;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
                width: 50%;
                font-family: Arial, Helvetica, sans-serif;
                margin: auto;
                border-radius: 10px;
                border: 2px solid #000000;
            }

            .graph{
                border-radius: 10px;
                border: 2px solid #000000;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
            }

            img {
                width: 95%;
                margin: 1em;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
            }

        </style>
    </head>
    <body style="background-image: url(images/evaluationbackground2.jpg);background-repeat:repeat;
          background-size: 100%;">
        <script language="javascript" type="text/javascript">
            function send_with_ajax1() {
                xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            var image = document.getElementById("get_img1");
                            image.src = "data:image/gif;base64," + encode64(xhr.responseText);
                        } else {
                            alert("Something misconfiguration : " +
                                    "\nError Code : " + xhr.status +
                                    "\nError Message : " + xhr.responseText);
                        }
                    }
                };
                xhr.open("GET", "${pageContext.request.contextPath}/pieChart", false); // Make sure file is in same server
                xhr.overrideMimeType('text/plain; charset=x-user-defined');
                xhr.send();
            }

            function send_with_ajax2() {
                xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            var image = document.getElementById("get_img2");
                            image.src = "data:image/gif;base64," + encode64(xhr.responseText);
                        } else {
                            alert("Something misconfiguration : " +
                                    "\nError Code : " + xhr.status +
                                    "\nError Message : " + xhr.responseText);
                        }
                    }
                };
                xhr.open("GET", "${pageContext.request.contextPath}/pieChart1", false); // Make sure file is in same server
                xhr.overrideMimeType('text/plain; charset=x-user-defined');
                xhr.send();
            }

            function send_with_ajax3() {
                xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            var image = document.getElementById("get_img3");
                            image.src = "data:image/gif;base64," + encode64(xhr.responseText);
                        } else {
                            alert("Something misconfiguration : " +
                                    "\nError Code : " + xhr.status +
                                    "\nError Message : " + xhr.responseText);
                        }
                    }
                };
                xhr.open("GET", "${pageContext.request.contextPath}/lineChart", false); // Make sure file is in same server
                xhr.overrideMimeType('text/plain; charset=x-user-defined');
                xhr.send();
            }

            function send_with_ajax4() {
                xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            var image = document.getElementById("get_img4");
                            image.src = "data:image/gif;base64," + encode64(xhr.responseText);
                        } else {
                            alert("Something misconfiguration : " +
                                    "\nError Code : " + xhr.status +
                                    "\nError Message : " + xhr.responseText);
                        }
                    }
                };
                xhr.open("GET", "${pageContext.request.contextPath}/barChart", false); // Make sure file is in same server
                xhr.overrideMimeType('text/plain; charset=x-user-defined');
                xhr.send();
            }

            function encode64(inputStr) {
                var b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
                var outputStr = "";
                var i = 0;

                while (i < inputStr.length) {
                    var byte1 = inputStr.charCodeAt(i++) & 0xff;
                    var byte2 = inputStr.charCodeAt(i++) & 0xff;
                    var byte3 = inputStr.charCodeAt(i++) & 0xff;

                    var enc1 = byte1 >> 2;
                    var enc2 = ((byte1 & 3) << 4) | (byte2 >> 4);

                    var enc3, enc4;
                    if (isNaN(byte2)) {
                        enc3 = enc4 = 64;
                    } else {
                        enc3 = ((byte2 & 15) << 2) | (byte3 >> 6);
                        if (isNaN(byte3)) {
                            enc4 = 64;
                        } else {
                            enc4 = byte3 & 63;
                        }
                    }
                    outputStr += b64.charAt(enc1) + b64.charAt(enc2) + b64.charAt(enc3) + b64.charAt(enc4);
                }
                return outputStr;
            }
        </script>
        <div class="header">
            <h1><i>Στατιστικά Στοιχεία Αξιολόγησης Στρατιωτικού Προσωπικού</i></h1>
        </div><br><br>
        <div class="row">
            <div class="col-6 graph">
                <img id="get_img1">
            </div><br><br>
            <div class="col-6 graph">
                <img id="get_img2">
            </div><br><br>
            <div class="col-6 graph">
                <img id="get_img3">
            </div>
            <div class="col-6 graph">
                <img id="get_img4">
            </div>
        </div>
        <script>
            send_with_ajax1();
            send_with_ajax2();
            send_with_ajax3();
            send_with_ajax4();
        </script>
    </body>
</html>

