<%@page import="com.evaluation.beans.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.evaluation.utils.DBUtils"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
  
<%
    Users user = (Users)request.getAttribute("user");
    request.setAttribute("user", user);
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        <link rel="stylesheet" src="css/jquery/jquery-ui.css">
        <link rel="stylesheet" href="css/mainpage.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            jQuery(function ($) {

                $(".sidebar-dropdown > a").click(function () {
                    $(".sidebar-submenu").slideUp(200);
                    if (
                            $(this)
                            .parent()
                            .hasClass("active")
                            ) {
                        $(".sidebar-dropdown").removeClass("active");
                        $(this)
                                .parent()
                                .removeClass("active");
                    } else {
                        $(".sidebar-dropdown").removeClass("active");
                        $(this)
                                .next(".sidebar-submenu")
                                .slideDown(200);
                        $(this)
                                .parent()
                                .addClass("active");
                    }
                });

                $("#close-sidebar").click(function () {
                    $(".page-wrapper").removeClass("toggled");
                });
                $("#show-sidebar").click(function () {
                    $(".page-wrapper").addClass("toggled");
                });




            });



// Αφορά το ρολόι που υπάρχει μέσα στο μενού //

            function myFunction() {
                alert("Hello! I am an alert box!");
            }

            function getDateTime() {
                var now = new Date();
                var year = now.getFullYear();
                var month = now.getMonth() + 1;
                var day = now.getDate();
                var hour = now.getHours();
                var minute = now.getMinutes();
                var second = now.getSeconds();
                if (month.toString().length == 1) {
                    month = '0' + month;
                }
                if (day.toString().length == 1) {
                    day = '0' + day;
                }
                if (hour.toString().length == 1) {
                    hour = '0' + hour;
                }
                if (minute.toString().length == 1) {
                    minute = '0' + minute;
                }
                if (second.toString().length == 1) {
                    second = '0' + second;
                }
                var dateTime = 'Ημερομηνία: ' + day + '/' + month + '/' + year + ' || ' + 'Ώρα: ' + hour + ':' + minute + ':' + second;
                return dateTime;
            }

// example usage: realtime clock
            setInterval(function () {
                currentTime = getDateTime();
                document.getElementById("clock").innerHTML = currentTime;
            }, 1000);

        </script>





    </head>

    <!--  BODY  -->

    <body style="background-image: url(images/evaluationbackground2.jpg);background-repeat: no-repeat;
          background-size: 100%;">
        <div class="page-wrapper chiller-theme toggled">
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
                <i class="fas fa-bars"></i>
            </a>
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content">
                    <form action="" method="post">
                        <div class="sidebar-brand">
                            <a href="${pageContext.request.contextPath}/mainPage">ΣΤΟΙΧΕΙΑ ΠΡΟΣΩΠΙΚΟΥ</a>
                            <div id="close-sidebar">
                                <i class="fas fa-times"></i>
                            </div>
                        </div>
                    </form>
                    <form action="" method="get">
                        <div class="sidebar-header">
                            <div class="user-pic">
                                <img class="img-responsive img-rounded" src="images/avatar.jpg"
                                     alt="User picture">
                            </div>
                            <div class="user-info">
                                <span class="user-name">Όνομα Χρήστη:
                                    <strong>${user.getUsername()}</strong>
                                </span>
                                <span class="user-name">AM:
                                    <strong>${user.getAM()}</strong>
                                </span>
                                <span class="user-name">Βαθμός: 
                                    <strong>${user.getRank()}</strong>
                                </span>
                                <span class="user-name">Όνομα: 
                                    <strong>${user.getName()}</strong>
                                </span>
                                <span class="user-name">Επώνυμο: 
                                    <strong>${user.getSurname()}</strong>
                                </span><br>
                                <span class="user-name">
                                    <strong><h6 id="clock"></h6></strong>
                                </span>
                                <br><hr>
                                <span class="user-name">Αξιολογούμενος</span>
                                <br>
                                <li>
                                    <span class="badge-pill badge-success">Ενεργός</span>
                                </li>
                            </div>
                        </div>
                    </form>
                    <div class="sidebar-menu">
                        <ul>
                            <li class="header-menu">
                                <span>Διαχείριση Μενού</span><hr>
                            </li>
                            <li class="sidebar-dropdown">
                                <form method="post" action="${pageContext.request.contextPath}/evaluationHistory">
                                    <a href="${pageContext.request.contextPath}/evaluationHistory">
                                        <i class="fa fa-tachometer-alt"></i>
                                        <span>Ιστορικό Αξιολογήσεων</span>
                                    </a>
                                </form>
                            </li><hr>
                            <%
                                DateFormat dateFormat = new SimpleDateFormat("yyyy");
                                Calendar calendar = Calendar.getInstance();
                                String checkdate = dateFormat.format(calendar.getTime());
                                System.out.println("checkdate= " + checkdate);
                                String check = String.valueOf(session.getAttribute("check"));
                                System.out.println("check= " + check);
                                boolean flag = false;
                                if (!check.equals(checkdate)|| check == null ) {
                                    flag = true;
                                }
                                System.out.println("flag= " + flag);
                                request.setAttribute("flag", flag);
                            %>
                            <c:if test="${flag}">
                                <li class="sidebar-dropdown">
                                    <form method="post" action="${pageContext.request.contextPath}/entrypage" >
                                        <a href="${pageContext.request.contextPath}/entrypage">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span><strong>Νέα Αξιολόγηση</strong></span>
                                        </a>
                                    </form>
                                </li>
                                <hr>
                            </c:if>
                                <%
                               boolean flag1= false;
                               if (user.getRole() == 1 ){
                                   flag1= true;
                               }
                                request.setAttribute("flag1", flag1);
                               
                            %>
                                
                                 <c:if test="${flag1}">
                                <li class="sidebar-dropdown">
                                    <form method="post" action="${pageContext.request.contextPath}/AdminPage" >
                                        <a href="${pageContext.request.contextPath}/AdminPage">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span><strong> Μενού Αξιολογητή</strong></span>
                                        </a>
                                    </form>
                                </li>
                                <hr>
                            </c:if>

                            <li class="sidebar-dropdown">
                                <form method="post" action="${pageContext.request.contextPath}/logout">
                                    <a href="${pageContext.request.contextPath}/logout">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span class="badge-pill badge-danger">Έξοδος</span>                        
                                    </a>
                                </form>
                            </li>

                        </ul>
                    </div>
                    <!-- sidebar-menu  -->
                </div>

            </nav>
            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <class class="container-fluid">
                    <div class="jumbotron">
                        <h1 class="display-4">Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</h1>
                        <p class="lead"></p>
                        <hr class="my-4">
                        <p></p>
                        <p class="lead">

                        </p>
                </class>
        </div>
        <hr style="width:79%;text-align:left;margin-left:0;margin-right:0">






    </main>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
crossorigin="anonymous"></script>
</body>
</html>

