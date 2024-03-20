<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        <link rel="stylesheet" src="css/jquery/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/register.js"></script>
        <link rel="stylesheet" href="css/entrypage.css">
    </head>

    <body>

        <div class="entrypage">
            <table>
                <div class="welcomeentry">
                    <tr>
                        <th>
                            <p><h1>Ετήσια Αξιολόγηση Στελεχών του Στρατού Ξηράς</h1></p>
                        </th>
                    </tr>
                </div>
            </table>
            <table class="table2">
                <div class="mainbody">
                    <tr>
                        <th>
                            <p>
                            <h1>Λεπτομέρειες Διαδικασίας</h1>
                            </p>
                            <form action="${pageContext.request.contextPath}/exam" method="GET">
                                <p>
                                <ul>
                                    <li>Καλείστε να απαντήσετε σε 50 ερωτήσεις της <b>κύριας ειδικότητάς</b> σας.</li>
                                    <li>Ο χρόνος διεξαγωγής της διαδικασίας θα είναι <b>50 λεπτά.</b> </li>
                                    <li>Οι ερωτήσεις αφορούν το <b>θεωρητικό</b> κομμάτι της αξιολόγησης. Το πρακτικό θα
                                        πραγματοποιηθεί στη Μονάδα σας.</li>
                                    <li>Η ύλη των θεωρητικών ερωτήσεων προέρχεται απο τις αντίστοιχες Διευθύνσεις των Όπλων -
                                        Σωμάτων.</li>
                                    <li>Σε περίπτωση απώλειας της σύνδεσης με την εφαρμογή, υπάρχει χρόνος ασφαλείας <b>10
                                            λεπτών</b> για την επανασύνδεση σας σε αυτή αλλιώς λαμβάνεται το διαγώνισμα ως
                                        <b>"μη έγκυρο"</b>.</li>
                                    <li>Με το πέρας της διαδικασίας, τα αποτελέσματα <b>θα αποθηκεύονται</b> στη βάση δεδομένων και
                                        αντίγραφο αυτών θα αποστέλεται προς επεξεργασια απο <br>τις εκάστοτε Διευθύνσεις.</li>
                                    <li>Πατώντας το κουμπί <b>"Αποδοχή και Συνέχεια στη Διαδικασία"</b>, αποδέχεστε ότι έχετε
                                        διαβάσει τα ανωτέρω και συναινείτε με αυτά.</li>
                                </ul>
                                </p>
                                <input type="submit" href="" value="Αποδοχή και Συνέχεια στη Διαδικασία" />
                            </form>
                        </th>
                    </tr>
                </div>
            </table>
            <div class="footer">
                <p>
                <h4>Evaluation Project &copy; ΣΠΗΥ 137 ΕΣ 2021</h4>
                <h5 id="clock"></h5>
                </p>
                <div><img src="img/unnamed.png" alt="unnamed.png" width="100px" height="100px"/></div>
            </div>
        </div>
    </body>

</html>