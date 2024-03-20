<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    
    <meta charset="UTF-8">
    <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
    <link rel="stylesheet" src="css/jquery/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="../js/register.js"></script>
    <link rel="stylesheet" href="css/logout.css">

</head>

<!--  BODY  -->

<body>

    <div class="entrypage">
        <table>
            <div>
                
            </div>
        </table>
        
        <div class="entrypage2">
            <table>
                <div>
                    <h1>Έχετε εξέλθει επιτυχώς απο την Εφαρμογή.</h1>
                    <div class="container">
                        <form action="${pageContext.request.contextPath}/welcomepage" method="POST">
                        <button type="submit" class="btn" value="submit">Επιστροφή στην αρχική.</button>
                        </form>
                    </div>
                </div>
            </table>
    </div>
</div>


</body>

</html>

