
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=0.7">
        <meta charset="UTF-8">
        <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        <link rel="stylesheet" src="css/jquery/jquery-ui.css">
        <link rel="stylesheet" href="css/adminPage.css">
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
    <body style="background-image: url(images/evaluationbackground2.jpg);background-repeat: repeat; background-size: 100%;">
        <div class="page-wrapper chiller-theme toggled">
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
                <i class="fas fa-bars"></i>
            </a>
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content">
                    <div class="sidebar-brand">
                        <a href="#">ΣΤΟΙΧΕΙΑ ΠΡΟΣΩΠΙΚΟΥ</a>
                        <div id="close-sidebar">
                            <i class="fas fa-times"></i>
                        </div>
                    </div>
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
                                <span class="user-name">Διαχειριστής</span>
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
                                <form method="post" action="${pageContext.request.contextPath}/onJob">
                                    <a href="${pageContext.request.contextPath}/onJob">
                                        <i class="fa fa-shopping-alt"></i>
                                        <span>Καταχώρηση Πρακτικής Αξιολόγησης</span>
                                    </a>
                                </form>
                            </li><hr>
                            <li class="sidebar-dropdown">
                                <form method="post" action="${pageContext.request.contextPath}/unitHistory">
                                    <a href="${pageContext.request.contextPath}/unitHistory">
                                        <i class="fa fa-shopping-alt"></i>
                                        <span>Σύνολο Αξιολογήσεων Μονάδος</span>
                                    </a>
                                </form>
                            </li><hr>
                            <li class="sidebar-dropdown">
                                <form method="post" action="${pageContext.request.contextPath}/evaluationStatistics">
                                    <a href="${pageContext.request.contextPath}/evaluationStatistics">
                                        <i class="fa fa-shopping-alt"></i>
                                        <span>Στατιστικά Στοιχεία Αξιολογήσεων</span>
                                    </a>
                                </form>
                            </li><hr>
                            <li class="sidebar-dropdown">
                                <form method="post" action="${pageContext.request.contextPath}/register">
                                    <a href="${pageContext.request.contextPath}/register">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Εγγραφή Νέου Αξιολογούμενου</span>
                                    </a>
                                </form>
                            </li><hr>
                            <li class="sidebar-dropdown">
                                <form method="post" action="${pageContext.request.contextPath}/mainPage">
                                    <a href="${pageContext.request.contextPath}/mainPage">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span><strong>Μενού Αξιολογούμενου</strong></span>
                                    </a>
                                </form>
                            </li><hr>
                            <li class="sidebar-dropdown">
                                <form method="post" action="logout">
                                    <a href="logout">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span class="badge-pill badge-danger">Έξοδος</span>                        
                                    </a>
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- sidebar-menu  -->
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
                            Έχετε εισέλθει ως: <strong>Διαχειριστής</strong>
                        </p>
                    </div>
                </class>
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