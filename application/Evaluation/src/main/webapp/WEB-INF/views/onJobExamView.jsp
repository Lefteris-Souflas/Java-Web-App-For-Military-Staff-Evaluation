<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>

<html lang="en">
    <head>
        <title>Ερωτήσεις Πρακτικής</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        
        <link href="css/onJobExam.css" rel="stylesheet">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
      
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        
        <script>
            var local_sum = 0;
            var size = ${size};
            function add_function() {
                for (var i = 0; i < size; i++) {
                    local_sum = local_sum + eval(document.getElementById('soula' + i).value);
                }
                var final_onjob = local_sum/size*10;
                var url_string = window.location.href;
                var url = new URL(url_string);
                var c = url.searchParams.get("idu");
                var myA = "myA=" + final_onjob.toString() + "&idu=" + c.toString();
                console.log(myA);
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/onExam",
                    data: myA
                });
                location.href = "${pageContext.request.contextPath}/onJob";
                alert("Επιτυχής Εισαγωγή της Πρακτικής Αξιολόγησης");
            }

        </script>

    </head>
    <body id="sailorTable1" style="background-image: url(images/evaluationbackground2.jpg);background-repeat: no-repeat;
    background-size: 100%;">
      <div class="page-wrapper chiller-theme toggled">
    
    
        <main class="page-content">
          <class class="container-fluid">
            <div class="jumbotron">
              <h1 class="display-4">Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</h1>
    
              <hr class="my-4">

              <p class="lead">
                  
              <h4><i>Εισαγωγή Αποτελεσμάτων Πρακτικής Αξιολόγησης</i></h4>
              </p>
    
            </div>
          </class>
        </main>
                <div class="row">
                    <div class="col-md-12">
                        
                        <div class="table-wrap">
                            <table id="sailorTable" class="table table-striped table-bordered" width="98%">
                                <thead class="thead-primary">
                                    <tr>
                                        <th>ΤΟΜΕΙΣ ΠΡΑΚΤΙΚΗΣ ΑΞΙΟΛΟΓΗΣΗΣ</th>
                                        <th>ΒΑΘΜΟΛΟΓΙΑ ΠΡΑΚΤΙΚΩΝ ΕΝΕΡΓΕΙΩΝ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${questionsOnJob}" var="questions" varStatus="loop">
                                        <tr>
                                            <td> ${questions.getField()} </td>
                                            <td> 
                                                <div class="form-body">
                                                    <select name="choice" id="soula${loop.index}">
                                                        <option value="0">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </div> 
                                            </td>
                                        </tr>
                                    </c:forEach>                             
                                </tbody>
                            </table>
                            <!--                            <button onclick="add_func()">press here to add</button>-->
                            
                            <div class="btn-group btn-group-lg" style="justify-content: center; display: flex;">
                                <button type="button" class="btn btn-primary" onclick="add_function()" id="finalize" >Υποβολή Πρακτικής Αξιολόγησης</button>
                            </div>
                            <form action="" method="post">
                             <div class="btn-group btn-group-lg" style="justify-content: left; padding:1em; display: flex;">
                                 <a href="${pageContext.request.contextPath}/onJob" type="button" class="btn btn-dark" >Προηγούμενη Σελίδα</a>
                             </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--        <script src="js/jquery.min.js"></script>
                <script src="js/popper.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/main.js"></script>-->

    </body>
</html>
