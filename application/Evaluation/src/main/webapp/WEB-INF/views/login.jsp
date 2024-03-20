<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <link href="css/login.css" rel="stylesheet">

        <script src="js/register.js"></script>
    </head>

    <body class="text-center">

        <div class="header">
        </div>
        
            <div class="entrypage">
                <table>
                    <div class="welcomeentry">
                        <tr>
                            <th>
                                <p>
                                <h1>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</h1>
                                </p>
                            </th>
                        </tr>
                    </div>
                </table>
        </div>
        <div class="center">
            
            <form class="form-signin" method="POST" action="${pageContext.request.contextPath}/login">
                <img class="mb-3" src="img/unnamed.png" alt="" width="200">
                <h1 class="mb-3 font-weight-normal">Είσοδος στην Εφαρμογή</h1>
                
                <input type="text" name="username" id="username" class="form-control" value="${user.getUsername()}"
                       placeholder="Username" required autofocus>
                
                <input type="password" name="password" value="${user.getPassword()}" id="inputPassword" class="form-control"
                       placeholder="Password" required>

                <button class="btn btn-lg btn-primary btn-block" type="submit" >Είσοδος</button>
                

            </form>
        </div>
    

        <div class="footer">
            <p>
            <h4>Evaluation Project &copy; ΣΠΗΥ 137 ΕΣ 2021</h4><h5 id="clock"></h5>
        </p>
    </div>
</body>

</html>