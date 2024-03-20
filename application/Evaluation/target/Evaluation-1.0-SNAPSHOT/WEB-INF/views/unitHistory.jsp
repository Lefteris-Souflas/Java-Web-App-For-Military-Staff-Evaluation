<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        <link rel="stylesheet" src="css/jquery/jquery-ui.css">
        <link rel="stylesheet" href="css/personalHistory.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.18/datatables.min.css" />

        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.18/datatables.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.18/datatables.min.css" />

        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.18/datatables.min.js"></script>



        <!-- ΓΙΑ ΠΑΡΑΓΩΓΗ ΤΟΥ ΕΓΓΡΑΦΟΥ PDF - EXC  -->

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
        <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

        <script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>

        <script>
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

    <body id="sailorTable1" style="background-image: url(images/evaluationbackground2.jpg);background-repeat: no-repeat;
          background-size: 100%;">
        <div class="page-wrapper chiller-theme toggled">


            <main class="page-content">
                <class class="container-fluid">
                    <div class="jumbotron">
                        <h1 class="display-4">Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</h1>

                        <hr class="my-4">
                        <form action="" method="get">
                            <p class="lead">

                            <h4><i>Πίνακας Ιστορικού Αξιολογήσεων Προσωπικού Μονάδος</i></h4>
                            </p>
                        </form>
                    </div>
                </class>
            </main>
            <p class="table-responsive" id="sailorTableArea">
            <table id="sailorTable" class="table table-striped table-bordered" width="98%">
                <thead>
                    <tr>

                        <th>Α/Α</th>
                        <th>Κωδικός Χρήστη</th>
                        <th>Ημερομηνία Θεωρητικής</th>
                        <th>Θεωρητική Αξιολόγηση</th>
                        <th>Πρακτική Αξιολόγηση</th>
                        <th>Ημερομηνία Πρακτικής</th>
                        <th>Τελικός Βαθμός</th>        
                        <th>Παραγόμενο Έγγραφο</th>
                    </tr>
                </thead>
                <tbody>



                <form action="" method="post">
                    <c:set var="count" value="0"  />
                    <c:forEach items="${unitHistory}" var="unithistoryresult">    
                        <c:set var="count" value="${count + 1}"/>
                        <tr> 

                            <td>${count}</td>
                            <td>${unithistoryresult.getIdu()}</td>
                            <td>${unithistoryresult.getDate()}</td>
                            <td>${unithistoryresult.getExamGrade()}</td>
                            <td>${unithistoryresult.getOnJobGrade()}</td>
                            <td>${unithistoryresult.getOnJobDate()}</td>
                            <td>${unithistoryresult.getFinalGrade()}</td>   

                            <td><a href="generatePDF?idu=${unithistoryresult.getIdu()}" class="btn btn-primary">Έγγραφο Αξιολόγησης</a></td>
                        </tr>
                    </c:forEach>  
                </form>



                <!-- εδω θα μπει η εντολη που θα τραβαει το array απο τη βαση -->
                </tbody>

            </table>
        </p>
        <div class="btn-group btn-group-lg" style="justify-content: right; float: right; padding:2em; margin-top: 2em; display: flex;">
            <input type="button" class="btn btn-danger" id="btnExport" onclick="fnExcelReport();" value="Αποθήκευση Ιστορικού (PDF)">
        </div>
        <form action="" method="post">
            <div id="hidebutton" class="btn-group btn-group-lg" style="justify-content: left; margin-top: 2em; padding:1em; display: flex;">
                <a  href="${pageContext.request.contextPath}/AdminPage" type="button" class="btn btn-dark" >Προηγούμενη Σελίδα</a>
            </div>
        </form>




    </div>

    <!-- ΑΠΟ ΕΔΩ ΚΑΙ ΚΑΤΩ ΕΙΝΑΙ ΓΙΑ ΤΗΝ ΑΠΟΚΡΥΨΗ ΤΟΥ BACK BUTTON -->
    <!--  <script>
        const targetDiv = document.getElementById("hidebutton");
        const btn = document.getElementById("btnExport");
        btn.onclick = function () {
          if (targetDiv.style.display !== "none") {
            targetDiv.style.display = "none";
          } else {
            targetDiv.style.display = "block";
          }
        };
      </script>-->

    <!-------------------------------------------->
    <script>
        const targetDiv = document.getElementById("returnbtn");
        const btn = document.getElementById("btnExportExcel");
        btn.onclick = function () {
            if (targetDiv.style.display !== "none") {
                targetDiv.style.display = "none";
            } else {
                targetDiv.style.display = "block";
            }
        };
    </script>



    <!-- ΑΠΟ ΕΔΩ ΚΑΙ ΚΑΤΩ ΕΙΝΑΙ ΓΙΑ ΤΟ ΚΑΤΕΒΑΣΜΑ ΤΟΥ PDF -->
    <script type="text/javascript">
        $("body").on("click", "#btnExport", function () {
            html2canvas($('#sailorTable1')[0], {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                                image: data,
                                width: 540,

                            }]
                    };
                    pdfMake.createPdf(docDefinition).download("UnitEvaluationHistory.pdf");
                }
            });
        });
    </script>

    <!-- ΑΠΟ ΕΔΩ ΚΑΙ ΚΑΤΩ ΕΙΝΑΙ ΓΙΑ ΤΟ ΚΑΤΕΒΑΣΜΑ ΤΟΥ EXCEL -->

    <script>
        function fnExcelReport() {
            var tab_text = "<table border='2px'><tr bgcolor='#87AFC6'>";
            var textRange;
            var j = 0;
            tab = document.getElementById('sailorTable'); // id of table

            for (j = 0; j < tab.rows.length; j++) {
                tab_text = tab_text + tab.rows[j].innerHTML + "</tr>";
                //tab_text=tab_text+"</tr>";
            }

            tab_text = tab_text + "</table>";
            tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
            tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
            tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // removes input params

            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
            {
                txtArea1.document.open("txt/html", "replace");
                txtArea1.document.write(tab_text);
                txtArea1.document.close();
                txtArea1.focus();
                sa = txtArea1.document.execCommand("SaveAs", true, "Say Thanks to Submit.xls");
            } else                 //other browser not tested on IE 11
                sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));

            return (sa);
        }
    </script>



    <script type="text/javascript">
        $(document).ready(function () {
            $('#sailorTable').DataTable({
                paging: true
            });
        });
    </script>
</body>

</html>