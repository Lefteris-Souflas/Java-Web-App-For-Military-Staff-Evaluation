
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        <link rel="stylesheet" src="css/jquery/jquery-ui.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>

            $(document).ready(function () {
                $("#IDsp").change(function () {
                    $("#IDs").show();
                    var x = $(this).children("option:selected").val();
                    $("#IDs").val('');
                    $("#IDs > option[sub!='" + x + "']").hide();
                    $("#IDs > option[sub='" + x + "']").show();
                });
            });

    // αφορα το dropdown menu της επιλογης του βαθμου
            $(document).ready(function () {
                $("#IDsp").change(function () {
                    $("#rank").show();
                    var x = $(this).children("option:selected").val();
                    $("#rank").val('');
                    $("#rank > option[sub!='" + x + "']").hide();
                    $("#rank > option[sub='" + x + "']").show();
                });
            });

    // αφορα το dropdown menu της επιλογης της μοναδας
            $(document).ready(function () {
                $("#IDsp").change(function () {
                    $("#battalion").show();
                    var x = $(this).children("option:selected").val();
                    $("#battalion").val('');
                    $("#battalion> option[sub!='" + x + "']").hide();
                    $("#battalion > option[sub='" + x + "']").show();
                });
            });

        </script>
        <link rel="stylesheet" href="css/registerstyle.css">


    </head>

    <!--  BODY  -->

    <body>
        <div class="header">



        </div>
        <!-- ΑΠΟ ΕΔΩ ΚΑΙ ΚΑΤΩ ΞΕΚΙΝΑΕΙ ΤΟ MAIN BODY -->

        <form class="box" method="POST" formenctype='multipart/form-data' action="${pageContext.request.contextPath}/register">
            <div class="table">
                <table>
                    <caption>| Φόρμα Εγγραφής |</caption>
                    <p>${errorString}</p>
                    <tr>
                        <th>
                            <h3>Βαθμός</h3>
                        </th>
                        <td>
                            <div class="battalionselect" id="battalionselect">
                                <select class="IDsp" id="IDsp" name="IDsp" title="Επιλογή Όπλου / Σώματος">
                                    <option value=0>Επιλογή</option>
                                    <option value=1>Πεζικό</option>
                                    <option value=2>Πυροβολικό</option>
                                    <option value=3>Τεθωρακισμένα</option>
                                    <option value=4>Διαβιβάσεις</option>
                                    <option value=5>Μηχανικό</option>
                                    <option value=6>Αεροπορία Στρατού</option>
                                    <option value=7>Τεχνικό</option>
                                    <option value=8>Εφοδιασμού Μεταφορών</option>
                                    <option value=9>Υλικού Πολέμου</option>
                                </select>
                                <select class="rank" id="rank" name="rank" onchange="populateRankID()" title="Επιλογή Βαθμού"
                                        hidden="true" required>
                                    
                                    <option value="Ταγματάρχης" sub=1>Ταγματάρχης</option>
                                    <option value="Λοχαγός" sub=1>Λοχαγός</option>
                                    <option value="Υπολοχαγός" sub=1>Υπολοχαγός</option>
                                    <option value="Ανθυπολοχαγός" sub=1>Ανθυπολοχαγός</option>
                                    <option value="Ανθυπασπιστής" sub=1>Ανθυπασπιστής</option>
                                    <option value="Αρχιλοχίας" sub=1>Αρχιλοχίας</option>
                                    <option value="Επιλοχίας" sub=1>Επιλοχίας</option>
                                    <option value="Λοχίας" sub=1>Λοχίας</option>

                                    <option value="Ταγματάρχης" sub=2>Ταγματάρχης</option>
                                    <option value="Λοχαγός" sub=2>Λοχαγός</option>
                                    <option value="Υπολοχαγός" sub=2>Υπολοχαγός</option>
                                    <option value="Ανθυπολοχαγός" sub=2>Ανθυπολοχαγός</option>
                                    <option value="Ανθυπασπιστής" sub=2>Ανθυπασπιστής</option>
                                    <option value="Αρχιλοχίας" sub=2>Αρχιλοχίας</option>
                                    <option value="Επιλοχίας" sub=2>Επιλοχίας</option>
                                    <option value="Λοχίας" sub=2>Λοχίας</option>

                                    <option value="Ταγματάρχης" sub=3>Επίλαρχος</option>
                                    <option value="Λοχαγός" sub=3>Ίλαρχος</option>
                                    <option value="Υπολοχαγός" sub=3>Υπίλαρχος</option>
                                    <option value="Ανθυπολοχαγός" sub=3>Ανθυπίλαρχος</option>
                                    <option value="Ανθυπασπιστής" sub=3>Ανθυπασπιστής</option>
                                    <option value="Αρχιλοχίας" sub=3>Αρχιλοχίας</option>
                                    <option value="Επιλοχίας" sub=3>Επιλοχίας</option>
                                    <option value="Λοχίας" sub=3>Λοχίας</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Όνομα</h3>
                        </th>
                        <td><input type="text" maxlength="45" id="name" name="name" title="Όνομα" placeholder="Όνομα" required />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Επώνυμο</h3>
                        </th>
                        <td><input type="text" maxlength="45" name="surname" id="surname" title="Επώνυμο"
                                   placeholder="Επώνυμο" required />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Όνομα Πατρός</h3>
                        </th>
                        <td><input type="text" maxlength="45" name="fathersname" id="fathersname" title="Όνομα Πατρός"
                                   placeholder="Όνομα Πατρός" required />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Αριθμός Μητρώο (ΑΜ - ΕΠΟ)</h3>
                        </th>
                        <td><input type="text" maxlength="20" name="AM" id="AM" title="Αριθμός Μητρώο" placeholder="ΑΜ"
                                   required />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Μονάδα</h3>
                        </th>
                        <td>
                            <div class="battalionselect" id="battalionselect">
                                <select class="battalion" id="battalion" name="battalion" title="Μονάδα"
                                        placeholder="Μονάδα" hidden="true" required>
                                    <option value="535 Μ/Κ ΤΠ" sub=1>535 Μ/Κ ΤΠ</option>
                                    <option value="536 Μ/Κ ΤΠ"  sub=1>536 Μ/Κ ΤΠ </option>
                                    <option value="645 Μ/Κ ΤΠ"  sub=1>645 Μ/Κ ΤΠ</option>
                                    <option value="31 Λ/ΑΤ"  sub=1>31 Λ/ΑΤ </option>
                                    <option value="Χειριστής Α/Τ TOW"  sub=1>Χειριστής Α/Τ TOW </option>

                                    <option value="110 Α/Κ ΜΜΠ" sub=2>110 Α/Κ ΜΜΠ</option>
                                    <option value="137 Α/Κ ΜΜΠ" sub=2>137 Α/Κ ΜΜΠ</option>
                                    <option value="138 Α/Κ ΜΜΠ" sub=2>138 Α/Κ ΜΜΠ</option>
                                    <option value="139 Α/Κ ΜΜΠ" sub=2>139 Α/Κ ΜΜΠ</option>
                                    <option value="140 Α/Κ ΜΜΠ" sub=2>140 Α/Κ ΜΜΠ</option>
                                    <option value="88 ΜΑ/ΑΠ" sub=2>88 ΜΑ/ΑΠ</option>

                                    <option value="12 ΕΜΑ" sub=3>12 ΕΜΑ</option>
                                    <option value="22 ΕΜΑ" sub=3>22 ΕΜΑ</option>
                                    <option value="23 ΕΜΑ" sub=3>23 ΕΜΑ</option>
                                    <option value="25 ΕΜΑ" sub=3>25 ΕΜΑ</option>
                                    <option value="Γ ΕΑΝ" sub=3>Γ ΕΑΝ</option>
                                </select>

                            </div>

                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Ειδικότητα</h3>
                        </th>
                        <td>
                            <div class="eidikotites" id="eidikotites">

                                <select class="IDs" id="IDs" name="IDs" title="Επιλογή Ειδικότητας" hidden="true"
                                        required>
                                    <option value=11 sub=1>Δκτης Λόχου</option>
                                    <option value=12 sub=1>Δρίτης </option>
                                    <option value=13 sub=1>Χειριστής Ελαφρών Όπλων </option>
                                    <option value=14 sub=1>Χειριστής Α/Τ MILAN </option>
                                    <option value=15 sub=1>Χειριστής Α/Τ TOW </option>
                                    <option value=16 sub=1>Χειριστής Α/Τ FAGOT </option>
                                    <option value=17 sub=1>Χειριστής Α/Τ CARL-GUSTAV </option>
                                    <option value=18 sub=1>Χειριστής Ολμου 4"2 </option>
                                    <option value=19 sub=1>Χειριστής Ολμου 81 χιλ. </option>
                                    <option value=20 sub=1>Χειριστής Ολμου 60 χιλ. </option>
                                    <option value=21 sub=1>Ομαδάρχης </option>
                                    <option value=22 sub=1>Β.Ομαδάρχη </option>

                                    <option value=1 sub=2>Δκτης Πυρ/χιας </option>
                                    <option value=2 sub=2>Δκτης ΠΔ</option>
                                    <option value=5 sub=2>Αξκός Βολής</option>
                                    <option value=26 sub=2>Αξκός Τακτικού Ελέγχου</option>
                                    <option value=27 sub=2>Χειριστής Οργάνου Ελέγχου Πυρός</option>
                                    <option value=28 sub=2>Υπηρέτης Α/Α ΠΒ</option>
                                    <option value=29 sub=2>Υπηρέτης Α/Α Κ/Β</option>
                                    <option value=3 sub=2>Ηλεκτροτεχνίτης Ερπυστριοφόρων Οχημάτων(ΗΕΟ)</option>
                                    <option value=4 sub=2>Μηχανουργός Πυρ/λων</option>
                                    <option value=32 sub=2>Υπηρέτης ΠΒ Μάχης</option>
                                    <option value=33 sub=2>Αρχηγός Στοιχείου ΑΣΑΚ</option>
                                    <option value=34 sub=2>Αρχηγός Στοιχείου ΠΕΠ</option>
                                    <option value=35 sub=2>Τεχνικός Βοηθός Παρατηρητή</option>
                                    <option value=36 sub=2>Οδηγός Α/Κ Πυρ/λων</option>

                                    <option value=37 sub=3>Δκτης Ίλης </option>
                                    <option value=38 sub=3>Ουλαμαγός</option>
                                    <option value=39 sub=3>Πλήρωμα Άρματος</option>
                                    <option value=40 sub=3>Ολμιστής</option>
                                    <option value=41 sub=3>Οδηγός Ερπυστριοφόρου</option>
                                    <option value=42 sub=3>Τεχνίτης Πύργου</option>
                                    <option value=43 sub=3>Τεχνίτης Σκάφους </option>
                                    <option value=44 sub=3>Τεχνίτης Τηλεπικοινωνιών</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>E-mail</h3>
                        </th>
                    <div></div>
                    <td><input type="email" maxlength="45" title="E-mail" name="email" id="email" placeholder="E-mail"
                               required />
                    </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Όνομα Χρήστη (username)</h3>
                        </th>
                        <td><input type="text" maxlength="45" title="Όνομα Χρήστη" name="username" id="username"
                                   placeholder="Username" required />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Κωδικός Πρόσβασης (password)</h3>
                        </th>
                        <td><input type="password" maxlength="45" title="Κωδικός Πρόσβασης" name="password" id="password"
                                   placeholder="Password" required />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Επιβέβαιωση Κωδικού</h3>
                        </th>
                        <td><input type="password" maxlength="45" title="Επιβέβαιωση Κωδικού" name="confirm" id="confirm"
                                   placeholder="Password" required />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Ερώτηση Ασφαλείας</h3>
                        </th>
                        <td><input type="text" name="verification" id="verification"
                                   title="Εισάγετε το όνομα του πρώτου σας φίλου"
                                   placeholder="Εισάγετε το όνομα του πρώτου σας φίλου:" required />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <h3>Ανέβασμα Φωτογραφίας</h3>
                        </th>
                        <td>
                            <input type="file" name="file" id="file" title="Ανέβασμα Φωτογραφίας" />
<!--                            <input type="text" value="/tmp" name="destination"/>-->
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Ολοκλήρωση Εγγραφής" />
                            <input type="reset" value="Καθαρισμός Φόρμας" />

                        </td>
                    </tr>
                </table>
            </div>
        </form>

        <div class="footer">
            <p>
            <h4>Evaluation Project &copy; ΣΠΗΥ 137 ΕΣ 2021</h4><span></span>
            <h5 id="clock"></h5>
            <div><img src="images/unnamed.png" alt="unnamed.png" width="100px" height="100px" /></div>
        </p>
    </div>

</body>

</html>