/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.evaluation.servlet;

import com.evaluation.beans.Answers;
import com.evaluation.beans.Questions;
import com.evaluation.beans.FinalAnswers;
import com.evaluation.beans.Users;
import com.evaluation.utils.DBUtils;
import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.JsonReader;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(urlPatterns = {"/exam"})
public class ExamServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Users userInSession = MyUtils.getLoginedUser(session);
        String errorString = null;
        if (userInSession == null) {
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp");
            dispatcher.forward(req, resp);
        }//if
        else {
            Connection conn = MyUtils.getStoredConnection(req);
            int IDs = userInSession.getIDs();
            int IDu = userInSession.getIdu();
            Timestamp timestamp = null;
            try {
                System.out.println("mpika");
                timestamp = DBUtils.getExamStart(conn, IDu);
                session.setAttribute("Exam_Time", timestamp);
            }//try
            catch (SQLException ex) {
                errorString = ex.getMessage();
            }//catch
            if (session.getAttribute("Exam_Time") == null) {
                timestamp = new Timestamp(System.currentTimeMillis());
                session.setAttribute("Exam_Time", timestamp);
            }
            List<Questions> listQ = null;
            List<Answers> listA = null;
            JsonArray array = null;
            JSONArray arrayA = null;
            int u = 0;
            try {
                System.out.println("mpika");
                u = DBUtils.countTempAns(conn, IDu);
            }//try
            catch (SQLException ex) {
                errorString = ex.getMessage();
            }//catch
            System.out.println("u= " + u);
            if (u == 0) {
                try {
                    listQ = DBUtils.questions(conn, IDs);
                }//try
                catch (SQLException ex) {
                    errorString = ex.getMessage();
                }//catch
            } else {
                System.out.println("Work to be done");
                try {
                    listQ = DBUtils.tempQuestions(conn, IDu, u, IDs);
                }//try
                catch (SQLException ex) {
                    errorString = ex.getMessage();
                }//catch
                // arrOfStr1[0] = [{"idQ":"59","idA":"233"},{"idQ":"132","idA":"510"}]
                try {
                    arrayA = DBUtils.getTemp(conn, IDu, u);
                }//try
                catch (SQLException ex) {
                    errorString = ex.getMessage();
                }//catch
                System.out.println("arrayA= " + arrayA.getJSONObject(0));
            }
            JsonArrayBuilder arrayBuilder = Json.createArrayBuilder(); //εξωτερικό []
            for (int i = 0; i < listQ.size(); i++) {
                System.out.println("i= " + i);
                int IDq = listQ.get(i).getIDq();
                try {
                    listA = DBUtils.answers(conn, IDq);
                } catch (SQLException ex) {
                    errorString = ex.getMessage();
                }
                String question = listQ.get(i).getQuestion();
                String UC = listQ.get(i).getUC();
                if (UC == null) {
                    UC = "undefined";
                }
                String result = listQ.get(i).getResult();
                if (result == null) {
                    result = "undefined";
                }
                String UCI = listQ.get(i).getUCI();
                if (UCI == null) {
                    UCI = "undefined";
                }
                JsonArrayBuilder answersLineBuilder = Json.createArrayBuilder();
                JsonObjectBuilder insideAnswers = Json.createObjectBuilder();
                for (int j = 0; j < listA.size(); j++) {
                    answersLineBuilder.add(insideAnswers.add("txtA", listA.get(j).getAnswer()).add("idA", listA.get(j).getIDa()));
                }
                JsonArray answersLine = answersLineBuilder.build(); // ['msg("Hello World");','alert("Hello World");','alertBox("Hello World");']
                System.out.println("answersLine= " + answersLine);
                JsonObjectBuilder eachLineBuilder = Json.createObjectBuilder()
                        .add("txtQ", question) // 'Q':'How do you write "Hello World" in an alert box?',
                        .add("idQ", IDq)
                        .add("C", answersLine); // 'C':['msg("Hello World");','alert("Hello World");','alertBox("Hello World");']
                if (u != 0) {
                    eachLineBuilder
                            .add("UC", UC)
                            .add("result", result)
                            .add("UCI", UCI);
                }
                JsonObject eachLine = eachLineBuilder.build();
                System.out.println("eachLine" + eachLine);
                arrayBuilder.add(eachLine); //εξωτερικό []
                System.out.println("arrayBuilder" + arrayBuilder);
            }
//            var q=[{'txtQ': '', 'idQ': '', 'C':[{'txtA':'','idA':''}]}]
            array = arrayBuilder.build();
            for (int i = 0; i < array.size(); i++) {
                for (int j = 0; j < array.getJsonObject(i).getJsonArray("C").size(); j++) {
                    System.out.println("array= " + array.getJsonObject(i).getJsonArray("C").getJsonObject(j).getJsonString("txtA"));
                }
            }
            String u1 = Integer.toString(u);
            req.setAttribute("quiz", array);
            req.setAttribute("given_answers", arrayA);
            req.setAttribute("u", u1);
            req.setAttribute("errorString", errorString);
            req.setAttribute("user", userInSession);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/examView.jsp");
            dispatcher.forward(req, resp);
        }//if-else
    }//doGet

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //doGet(req, resp);
        HttpSession session = req.getSession();
        Users userInSession = MyUtils.getLoginedUser(session);
        Connection conn = MyUtils.getStoredConnection(req);
        String errorString = null;
        if (userInSession == null) {
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp");
            dispatcher.forward(req, resp);
        }//if
        else {
            int IDu = userInSession.getIdu();
            FinalAnswers temp = new FinalAnswers();
            temp.setIDu(userInSession.getIdu());
            temp.setExamStarted((Timestamp) session.getAttribute("Exam_Time"));
            String json = req.getParameter("myq");
            String[] arrOfStr = json.split("quiz=");
            System.out.println("json= " + json);
            JSONArray arrayA = new JSONArray(arrOfStr[0]);
            JsonReader jsonReader = Json.createReader(new StringReader(arrOfStr[1]));
            JsonArray quiz = jsonReader.readArray();
            jsonReader.close();
            for (int i = 0; i < arrayA.length(); i++) {
                JSONObject obj_i = (JSONObject) arrayA.get(i);
                temp.setIDq(obj_i.getInt("idQ"));
                temp.setIDa(obj_i.getInt("idA"));
                try {
                    DBUtils.insertAnswers(conn, temp.getIDu(), temp.getIDq(), temp.getIDa(), temp.getExamStarted());
                } catch (SQLException ex) {
                    errorString = ex.getMessage();
                }
            }
            System.out.println("arrayA.length= " + arrayA.length());
            if (errorString != null) {
                System.out.println("IDq= " + arrayA.getJSONObject(0).getInt("idQ"));
                System.out.println("errorstring= " + errorString);
                req.setAttribute("errorString", errorString);
                RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher("/WEB-INF/views/examView.jsp");
                dispatcher.include(req, resp);
            } else {
                System.out.println("Success!!!");
                List<Answers> listCorrection = null;
                try {
                    listCorrection = DBUtils.examCorrection(conn, temp.getIDu(), arrayA.length());
                } catch (SQLException ex) {
                    errorString = ex.getMessage();
                }
                double sumCorrect = 0;
                for (int i = 0; i < listCorrection.size(); i++) {
                    sumCorrect = sumCorrect + listCorrection.get(i).getCorrect();
                }
                sumCorrect = sumCorrect / 10 * 50; //10 ερωτήσεις για το demo της παρουσίασης
                try {
                    DBUtils.answerTheory(conn, IDu, sumCorrect);
                } catch (SQLException ex) {
                    errorString = ex.getMessage();
                }
                JsonArray correctArray = null;
                JsonArrayBuilder correctArrayBuilder = Json.createArrayBuilder(); //εξωτερικό []
                JsonObjectBuilder correctEach = Json.createObjectBuilder();
                for (int i = 0; i < listCorrection.size(); i++) {
                    correctArrayBuilder.add(correctEach.add("IDa", listCorrection.get(i).getIDa()).add("correct", listCorrection.get(i).getCorrect()));
                }
                correctArray = correctArrayBuilder.build();
                for (int i = 0; i < correctArray.size(); i++) {
                    System.out.println("IDa= " + correctArray.getJsonObject(i).getInt("IDa") + " and correct= " + correctArray.getJsonObject(i).getInt("correct"));
                }
                try {
                    System.out.println("into delete");
                    DBUtils.deleteTemp(conn, IDu);
                } catch (SQLException ex) {
                    errorString = ex.getMessage();
                }
                PrintWriter out = resp.getWriter();
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                out.print(correctArray);
                out.flush();
            }
        }
    }//doPost

}//class
