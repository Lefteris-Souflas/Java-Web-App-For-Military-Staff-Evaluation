<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="css/userBattalionView.css">
        <link rel="stylesheet" src="css/jquery/jquery-ui.css">

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
                  
              <h4><i>Εισαγωγή Αποτελεσμάτων <b>Πρακτικής Αξιολόγησης</b> Προσωπικού που έχει Ολοκληρώσει τη <b>Θεωρητική Αξιολόγηση</b></i></h4>
              </p>

    
            </div>
          </class>
        </main>
        <p class="table-responsive" id="sailorTableArea">
                            <table id="sailorTable" class="table table-striped table-bordered" width="98%">
                                <thead class="thead-primary">
                                    <tr>
                                        <th> ΒΑΘΜΟΣ </th>
                                        <th> ΟΝΟΜΑ </th>
                                        <th> ΕΠΩΝΥΜΟ </th>
                                        <th> ΟΝΟΜΑ ΠΑΤΡΟΣ </th>
                                        <th> ΑΜ </th>
                                        <th> ΜΟΝΑΔΑ </th>
                                        <th> ΠΡΑΚΤΙΚΗ ΑΞΙΟΛΟΓΗΣΗ </th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${usersOnJob}" var="users">
                                    <tr>
                                        <td> ${users.getRank()} </td>
                                        <td> ${users.getName()} </td>
                                        <td> ${users.getSurname()} </td>
                                        <td> ${users.getFathersname()}</td>
                                        <td> ${users.getAM()}</td>
                                        <td> ${users.getBattalion()}</td>
                                        <td><a href="onExam?idu=${users.getIdu()}&ids=${users.getIDs()}" class="btn btn-primary">Εισαγωγή</a></td>
                                    </tr>
                                </c:forEach>                             
                                </tbody>
                            </table>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                            <form action="" method="post">
                             <div class="btn-group btn-group-lg" style="justify-content: left; padding:1em; display: flex;">
                                 <a href="${pageContext.request.contextPath}/AdminPage" type="button" class="btn btn-dark" >Προηγούμενη Σελίδα</a>
                             </div>
                            </form>
        <script type="text/javascript">
            $(document).ready(function() {
              $('#sailorTable').DataTable({
                paging: true
              });
            });
            </script>
    </body>
</html>

