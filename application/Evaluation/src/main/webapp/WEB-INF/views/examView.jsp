<%@page import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.json.*"%>
<%@page import="org.json.JSONArray"%>
<%JsonArray box = (JsonArray) request.getAttribute("quiz");
    request.setAttribute("box", box);
    JSONArray answers = (JSONArray) request.getAttribute("given_answers");
    request.setAttribute("answers", answers);
    String u1 = (String) request.getAttribute("u");
    int u = Integer.parseInt(u1);
    request.setAttribute("u", u);
    JsonArray correct = (JsonArray) request.getAttribute("correct");
    request.setAttribute("correct", correct);
    Timestamp timestamp = (Timestamp) session.getAttribute("Exam_Time");
    request.setAttribute("timestamp", timestamp);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Εφαρμογή Αξιολόγησης Στρατιωτικού Προσωπικού</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="css/exam.css" rel="stylesheet">
        <style>

            body{
                text-align: center;
            }

            #clockdiv{
                font-family: sans-serif;
                color: black;
                display: inline-block;
                font-weight: 100;
                text-align: center;
                font-size: 30px;
            }

            #clockdiv > div{
                padding: 10px;
                border-radius: 3px;
                background: #0275d7;
                display: inline-block;
            }

            #clockdiv div > span{
                padding: 15px;
                border-radius: 3px;
                background: #fff;
                display: inline-block;
            }

            .smalltext{
                padding-top: 5px;
                font-size: 16px;
                color: white;
            }
        </style>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script>
            var correctCount = 0;
            var q = <%=box%>;
            if (q === null) {
                var q = [];
            }
            for (var w = 0; w < q.length; w++) {
                console.log("UCI[" + w + "]= " + q[w].UCI);
            }
            // var q=[{'txtQ': '', 'idQ': '', 'C':[{'txtA':'','idA':''}]}]
            var A = <%=answers%>;
            if (A === null) {
                var A = [];
            }
            var u = <%=u%>;
            console.log("u= " + u);
            if (u === 0) {
                var u = 0;
                var flag_goto = true;
            } else {
                var flag_goto = false;
            }
            var flag_temp = true;
            var questionNo = u;
            console.log("questionNo= " + questionNo);
            console.log("q.length= " + q.length);
            // A[0..49].idQ = , idA;
            for (var dd = u; dd < q.length; dd++) {
                q[dd].UC = "Δεν δόθηκε απάντηση";
                q[dd].result = "Λάθος";
                q[dd].UCI = "undefined";
            }

            function goto(k) {
                metr = questionNo;
                $('#goto' + metr).show();
                questionNo = k - 1;
                myFunction(questionNo);
            }

            function finalize() {
                var myq = "myq=" + JSON.stringify(A) + "quiz=" + JSON.stringify(q);
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/exam",
                    data: myq
                }).success(function (response) {
                    console.log("response= " + response);
                    var cor = response;
                    console.log("cor= " + cor);
                    if (cor === null) {
                        var cor = []; // A[0..49].idQ = , idA;
                    }
                    // cor[0..49].IDa = .. , .correct = ..
                    alert("Η θεωρητική αξιολόγηση ολοκληρώθηκε! Πατήστε στο κουμπί για να ολοκληρωθεί η διαδικασία.");
                    $('#quiz').fadeOut();
                    $('label.element-animation').unbind('click');
                    setTimeout(function () {
                        for (var i = 0; i < q.length; i++) {
                            if ((i < cor.length) && (cor[i].correct === 1)) {
                                q[i].result = "Σωστό";
                                correctCount++;
                            }
                        }
                        var toAppend = '';
                        $.each(q, function (i, a) {
                            toAppend += '<tr>';
                            toAppend += '<td>' + (i + 1) + '</td>';
                            toAppend += '<td>' + a.UC + '</td>';
                            toAppend += '<td>' + a.result + '</td>';
                            toAppend += '</tr>';
                        });
                        $('#quizResult').html(toAppend);
                        $('#totalCorrect').html("Συνολικά σωστά: " + correctCount + "/10");
                        $('#quizResult').show();
                        $('#result-of-question').show();
                    }, 1000);
                }).error(function () {
                    console.log("FAIL");
                    menu();
                }).complete(function () {
                    console.log("COMPLETE");
                });
            }

            function menu() {
                var data = 0;
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/mainPage",
                    data: data
                });
            }

            function myFunction(questionNo) {
                var p = u * 100 / q.length;
                $('#progress').css('width', p + '%').attr('aria-valuenow', p);
                setTimeout(function () {
                    if (flag_goto === true) {
                        for (var metr = 1; metr <= q.length; metr++) {
                            $('#goto' + metr).hide();
                        }
                    } else if (flag_temp === true) {
//                        for (var metr = 1; metr <= q.length; metr++) {
//                            $('#goto' + metr).hide();
//                        }
                        for (var metr = u + 1; metr <= q.length; metr++) {
                            $('#goto' + metr).hide();
                            console.log('#goto' + metr);
                        }
                    }
                    console.log("flag_temp= " + flag_temp);
                    flag_goto = false;
                    flag_temp = false;
                    $('#qid').html(questionNo + 1 + "/10");
                    $('label.element-animation').unbind('click');
                    console.log("should be ok #" + q[questionNo].UCI);
                    $('#' + q[questionNo].UCI).prop('checked', true);
                    setTimeout(function () {
                        $('#quiz').show();
                    }, 1500);
                    $('#question').html(q[questionNo].txtQ);
                    $($('#1-option').find('label')).html(q[questionNo].C[0].txtA);
                    $($('#2-option').find('label')).html(q[questionNo].C[1].txtA);
                    $($('#3-option').find('label')).html(q[questionNo].C[2].txtA);
                    $('#4-option').hide();
                    $('#5-option').hide();
                    $('#6-option').hide();
                    if (q[questionNo].C.length >= 4) {
                        $('#4-option').show();
                        $($('#4-option').find('label')).html(q[questionNo].C[3].txtA);
                    }
                    if (q[questionNo].C.length >= 5) {
                        $('#5-option').show();
                        $($('#5-option').find('label')).html(q[questionNo].C[4].txtA);
                    }
                    if (q[questionNo].C.length >= 6) {
                        $('#6-option').show();
                        $($('#6-option').find('label')).html(q[questionNo].C[5].txtA);
                    }
                });
            }

            $(function () {
                $(document.body).on('click', "label.element-animation", function (e) {

                    //ripple start
                    var parent, ink, d, x, y;
                    parent = $(this);
                    if (parent.find(".ink").length === 0)
                        parent.prepend("<span class='ink'></span>");
                    ink = parent.find(".ink");
                    ink.removeClass("animate");
                    if (!ink.height() && !ink.width()) {
                        d = Math.max(parent.outerWidth(), parent.outerHeight());
                        ink.css({height: "100px", width: "100px"});
                    }
                    x = e.pageX - parent.offset().left - ink.width() / 2;
                    y = e.pageY - parent.offset().top - ink.height() / 2;
                    ink.css({top: y + 'px', left: x + 'px'}).addClass("animate");
                    //ripple end

                    $('label.element-animation').unbind('click');
                    var choice = $(this).parent().find('input:radio').val();
                    console.log("questionNo= " + questionNo);
                    console.log("choice= " + choice);
                    q[questionNo].UC = choice;
                    q[questionNo].UCI = $(this).parent().find('input:radio').attr('id');
                    console.log("UCI= " + q[questionNo].UCI);
                    var idQ = $($(this).parent().find('input')).attr('idQ');
                    console.log("idQ= " + idQ);
                    var idA = $($(this).parent().find('input')).attr('idA');
                    console.log("idA= " + idA);
                    A.push({
                        "idQ": $($(this).parent().find('input')).attr('idQ'),
                        "idA": $($(this).parent().find('input')).attr('idA')
                    });
                    setTimeout(function () {
                        questionNo++;
                        if (questionNo > u) {
                            u++;
                        }
                        if ((questionNo + 1) > q.length) {
                            finalize();
                        } else {
                            var tempAns = "tempAns=" + JSON.stringify(A) + "u=" + JSON.stringify(q) + "u=" + u;
                            $.ajax({
                                type: "POST",
                                url: "${pageContext.request.contextPath}/temp",
                                data: tempAns
                            }).success(function () {
                                console.log("SENT");
                            }).error(function () {
                                console.log("FAIL");
                                menu();
                            }).complete(function () {
                                console.log("COMPLETE");
                            });
                            $('#qid').html(questionNo + 1 + "/10");
                            console.log(q[questionNo].UCI);
                            if (q[questionNo].UCI !== "undefined") {
                                $('#' + q[questionNo].UCI).prop('checked', true);
                            } else {
                                $('input:radio').prop('checked', false);
                            }
                            setTimeout(function () {
                                $('#quiz').show();
                            }, 1500);
                            var p = u * 100 / q.length;
                            $('#goto' + u).show();
//                            console.log("u= " + u + " p= " + p);
                            $('#progress').css('width', p + '%').attr('aria-valuenow', p);
                            $('#question').html(q[questionNo].txtQ);
                            $($('#1-option').find('label')).html(q[questionNo].C[0].txtA);
                            $($('#1-option').find('input')).attr('idQ', q[questionNo].idQ);
                            $($('#1-option').find('input')).attr('idA', q[questionNo].C[0].idA);
                            $($('#2-option').find('label')).html(q[questionNo].C[1].txtA);
                            $($('#2-option').find('input')).attr('idQ', q[questionNo].idQ);
                            $($('#2-option').find('input')).attr('idA', q[questionNo].C[1].idA);
                            $($('#3-option').find('label')).html(q[questionNo].C[2].txtA);
                            $($('#3-option').find('input')).attr('idQ', q[questionNo].idQ);
                            $($('#3-option').find('input')).attr('idA', q[questionNo].C[2].idA);
                            $('#4-option').hide();
                            $('#5-option').hide();
                            $('#6-option').hide();
                            if (q[questionNo].C.length >= 4) {
                                $('#4-option').show();
                                $($('#4-option').find('label')).html(q[questionNo].C[3].txtA);
                                $($('#4-option').find('input')).attr('idQ', q[questionNo].idQ);
                                $($('#4-option').find('input')).attr('idA', q[questionNo].C[3].idA);
                            }
                            if (q[questionNo].C.length >= 5) {
                                $('#5-option').show();
                                $($('#5-option').find('label')).html(q[questionNo].C[4].txtA);
                                $($('#5-option').find('input')).attr('idQ', q[questionNo].idQ);
                                $($('#5-option').find('input')).attr('idA', q[questionNo].C[4].idA);
                            }
                            if (q[questionNo].C.length >= 6) {
                                $('#6-option').show();
                                $($('#6-option').find('label')).html(q[questionNo].C[5].txtA);
                                $($('#6-option').find('input')).attr('idQ', q[questionNo].idQ);
                                $($('#6-option').find('input')).attr('idA', q[questionNo].C[5].idA);
                            }
                        }
                    }, 1000);
                });
            }
            );
        </script>
    </head>
    <body onload="myFunction(questionNo)" style="background-color: white">
        <div class="container">
            <div class="row"><br><br>
                <div class="col-sm-8 col-sm-offset-2">
                    <div class="loader">
                        <div id="quiz">
                            <p>${errorString}</p>
                            <div id="clockdiv">
                                <div>
                                    <span class="minutes"></span>
                                    <div class="smalltext">Λεπτά</div>
                                </div>
                                <div>
                                    <span class="seconds"></span>
                                    <div class="smalltext">Δευτερόλεπτα</div>
                                </div>
                            </div>
                            <br><br>
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%" id="progress">
                                    <span class="sr-only"></span>
                                </div>
                            </div>
                            <div class="row question" style="background-color: #629dc8">
                                <div class="col-sm-2"><h3 class="text-center" id="qid">1/10</h1></div>
                                <div class="col-sm-10">
                                    <h3 id="question"><%=box.getJsonObject(0).getString("txtQ")%></h3>
                                </div>
                            </div>
                            <!--                            <div style="background-color: #629dc8" class="question">
                                                            <h3><div class="label label-warning" id="qid">1/10</div>
                                                                <div class="float-right" id="question"><//%=box.getJsonObject(0).getString("txtQ")%></div>
                                                            </h3>
                                                        </div>-->
                            <ul class="list">
                                <li id="1-option" style="color: #000000;">
                                    <input type="radio" id="1st-option" name="selector" value="α" idQ="<%=box.getJsonObject(0).getInt("idQ")%>" idA="<%=box.getJsonObject(0).getJsonArray("C").getJsonObject(0).getInt("idA")%>">
                                    <label for="1-option" class="element-animation"><%=box.getJsonObject(0).getJsonArray("C").getJsonObject(0).getJsonString("txtA")%></label>
                                    <div class="check"></div>
                                </li>
                                <li id="2-option" style="color: #000000">
                                    <input type="radio" id="2nd-option" name="selector" value="β" idQ="<%=box.getJsonObject(0).getInt("idQ")%>" idA="<%=box.getJsonObject(0).getJsonArray("C").getJsonObject(1).getInt("idA")%>">
                                    <label for="2-option" class="element-animation"><%=box.getJsonObject(0).getJsonArray("C").getJsonObject(1).getJsonString("txtA")%></label>
                                    <div class="check"><div class="inside"></div></div>
                                </li>
                                <li id="3-option" style="color: #000000">
                                    <input type="radio" id="3rd-option" name="selector" value="γ" idQ="<%=box.getJsonObject(0).getInt("idQ")%>" idA="<%=box.getJsonObject(0).getJsonArray("C").getJsonObject(2).getInt("idA")%>">
                                    <label for="3-option" class="element-animation"><%=box.getJsonObject(0).getJsonArray("C").getJsonObject(2).getJsonString("txtA")%></label>
                                    <div class="check"><div class="inside"></div></div>
                                </li>
                                <% boolean flag4 = false;
                                    int idQ = -1;
                                    int idA = -1;
                                    if (box.getJsonObject(0).getJsonArray("C").size() >= 4) {
                                        flag4 = true;
                                        idQ = box.getJsonObject(0).getInt("idQ");
                                        idA = box.getJsonObject(0).getJsonArray("C").getJsonObject(3).getInt("idA");
                                    }
                                    request.setAttribute("flag4", flag4);
                                %>
                                <li id="4-option" style="color: #000000">
                                    <input type="radio" id="4th-option" name="selector" value="δ" idQ="<%=idQ%>" idA="<%=idA%>">
                                    <label class="element-animation">
                                        <c:if test="${flag4}">
                                            <%=box.getJsonObject(0).getJsonArray("C").getJsonObject(3).getJsonString("txtA")%>
                                        </c:if>
                                    </label>
                                    <div class="check"><div class="inside"></div></div>
                                </li>
                                <% boolean flag5 = false;
                                    idQ = -1;
                                    idA = -1;
                                    if (box.getJsonObject(0).getJsonArray("C").size() >= 5) {
                                        flag5 = true;
                                        idQ = box.getJsonObject(0).getInt("idQ");
                                        idA = box.getJsonObject(0).getJsonArray("C").getJsonObject(4).getInt("idA");
                                    }
                                    request.setAttribute("flag5", flag5);
                                %>
                                <li id="5-option" style="color: #000000">
                                    <input type="radio" id="5th-option" name="selector" value="ε" idQ="<%=idQ%>" idA="<%=idA%>">
                                    <label class="element-animation">
                                        <c:if test="${flag5}">
                                            <%=box.getJsonObject(0).getJsonArray("C").getJsonObject(4).getJsonString("txtA")%>
                                        </c:if>
                                    </label>
                                    <div class="check"><div class="inside"></div></div>
                                </li>
                                <% boolean flag6 = false;
                                    idQ = -1;
                                    idA = -1;
                                    if (box.getJsonObject(0).getJsonArray("C").size() >= 6) {
                                        flag6 = true;
                                        idQ = box.getJsonObject(0).getInt("idQ");
                                        idA = box.getJsonObject(0).getJsonArray("C").getJsonObject(5).getInt("idA");
                                    }
                                    request.setAttribute("flag6", flag6);
                                %>
                                <li id="6-option" style="color: #000000">
                                    <input type="radio" id="6th-option" name="selector" value="στ" idQ="<%=idQ%>" idA="<%=idA%>">
                                    <label class="element-animation">
                                        <c:if test="${flag6}">
                                            <%=box.getJsonObject(0).getJsonArray("C").getJsonObject(5).getJsonString("txtA")%>
                                        </c:if>
                                    </label>
                                    <div class="check"><div class="inside"></div></div>
                                </li>
                            </ul>
                            <div class="btn-toolbar" role="group" style="justify-content: center; display: flex;">
                                <!--                                <div class="btn-group"><button type="button" class="btn btn-default">&laquo;</button></div>-->
                                <div id="goto" class="btn-group">
                                    <button type="button" class="btn btn-default" id="goto1" onclick="goto($(this).val())" value="1">1</button>
                                    <button type="button" class="btn btn-default" id="goto2" onclick="goto($(this).val())" value="2">2</button>
                                    <button type="button" class="btn btn-default" id="goto3" onclick="goto($(this).val())" value="3">3</button>
                                    <button type="button" class="btn btn-default" id="goto4" onclick="goto($(this).val())" value="4">4</button>
                                    <button type="button" class="btn btn-default" id="goto5" onclick="goto($(this).val())" value="5">5</button>
                                    <button type="button" class="btn btn-default" id="goto6" onclick="goto($(this).val())" value="6">6</button>
                                    <button type="button" class="btn btn-default" id="goto7" onclick="goto($(this).val())" value="7">7</button>
                                    <button type="button" class="btn btn-default" id="goto8" onclick="goto($(this).val())" value="8">8</button>
                                    <button type="button" class="btn btn-default" id="goto9" onclick="goto($(this).val())" value="9">9</button>
                                    <button type="button" class="btn btn-default" id="goto10" onclick="goto($(this).val())" value="10">10</button>
                                </div>
                                <!--                                <div class="btn-group"><button type="button" class="btn btn-default">&raquo;</button></div>-->
                            </div>
                            <div class="btn-group btn-group-lg" style="justify-content: center; display: flex;"><button type="button" class="btn btn-primary" onclick="finalize()" id="finalize" style="align-items: ">Ολοκλήρωση αξιολόγησης</button></div>
                        </div>
                    </div>
                    <div class="text-muted">
                        <span id="answer"></span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <div id="result-of-question" class="pulse animated" style="display: none;">
                        <span id="totalCorrect" class="pull-right"></span>
                        <table class="table table-hover table-responsive" >
                            <thead>
                                <tr>
                                    <th>Α/Α ερώτησης</th>
                                    <!--                                    <th>Σωστή απάντηση</th>-->
                                    <th>Δοθείσα απάντηση</th>
                                    <th>Αποτέλεσμα</th>
                                </tr>
                            </thead>
                            <tbody id="quizResult"></tbody>
                        </table>
                        <div class="btn-group btn-group-lg" style="justify-content: center; display: flex;"><button type="button" class="btn btn-success" onclick="location.href = '${pageContext.request.contextPath}/mainPage';" id="menu" style="align-items: ">Επιστροφή στην Αρχική Σελίδα</button></div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function getTimeRemaining(endtime) {
                const total = Date.parse(endtime) - Date.parse(new Date());
                const seconds = Math.floor((total / 1000) % 60);
                const minutes = Math.floor((total / 1000 / 60) % 60);

                return {
                    total,
                    minutes,
                    seconds
                };
            }

            function initializeClock(endtime) {
                const clock = document.getElementById('clockdiv');
                const minutesSpan = clock.querySelector('.minutes');
                const secondsSpan = clock.querySelector('.seconds');

                function updateClock() {
                    const t = getTimeRemaining(endtime);
                    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
                    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

                    if (t.total <= 0) {
                        clearInterval(timeinterval);
                        finalize();
                    }
                }

                updateClock();
                const timeinterval = setInterval(updateClock, 1000);
            }

            const timeInMinutes = 2;
            var timeExam = "<%=timestamp%>";
            const currentTime = Date.parse(timeExam);
            const deadline = new Date(currentTime + timeInMinutes * 60 * 1000);

            initializeClock(deadline);
        </script> 
   </body>
</html>
