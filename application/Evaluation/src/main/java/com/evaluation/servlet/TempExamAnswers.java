package com.evaluation.servlet;

import com.evaluation.beans.FinalAnswers;
import com.evaluation.beans.Users;
import com.evaluation.utils.DBUtils;
import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.json.Json;
import javax.json.JsonArray;
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

/**
 *
 * @author USER
 */
@WebServlet(urlPatterns = {"/temp"})
public class TempExamAnswers extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(req);
        HttpSession session = req.getSession();
        Users userInSession = MyUtils.getLoginedUser(session);
        String errorString = null;
        if (userInSession == null) {
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp");
            dispatcher.forward(req, resp);
        } else {
            FinalAnswers temp = new FinalAnswers();
            temp.setIDu(userInSession.getIdu());
            temp.setExamStarted((Timestamp) session.getAttribute("Exam_Time"));
            String json1 = req.getParameter("tempAns");
            String[] arrOfStr1 = json1.split("u=");
            System.out.println("json1 = " + json1);
            int u = Integer.parseInt(arrOfStr1[2]);
            for (int i = 0; i < arrOfStr1.length; i++) {
                System.out.println("arrOfStr1[" + i + "] = " + arrOfStr1[i]);
            }
            JSONArray arrayA = new JSONArray(arrOfStr1[0]);
            JSONArray arrayB = new JSONArray(arrOfStr1[1]);
            JsonReader jsonReader = Json.createReader(new StringReader(arrOfStr1[1]));
            JsonArray quiz = jsonReader.readArray();
            jsonReader.close();
            // arrOfStr1[1] = [{"txtQ":"???? ????????? ????????? ????????? ?? ???? ?????? ?? ?????;","idQ":14,"C":[{"txtA":"???? ????????????","idA":53},{"txtA":"???? ????","idA":54},{"txtA":"???? ???????","idA":55},{"txtA":"???? ?????","idA":56}],"UC":"?","result":"?????","UCI":"1st-option"}
            for (int i = 0; i < arrayA.length(); i++) {
                JSONObject obj_i = (JSONObject) arrayA.get(i);
                JSONObject obj_j = (JSONObject) arrayB.get(i);
                temp.setIDq(obj_i.getInt("idQ"));
                temp.setIDa(obj_i.getInt("idA"));
                String UC = obj_j.getString("UC");
                String result = obj_j.getString("result");
                String UCI = obj_j.getString("UCI");
                try {
                    DBUtils.insertTemp(conn, temp.getIDu(), temp.getIDq(), temp.getIDa(), temp.getExamStarted(), u, UC, result, UCI);
                } catch (SQLException ex) {
                    errorString = ex.getMessage();
                }
            }
            System.out.println("arrayA.length= " + arrayA.length());
            if (errorString != null) {
                req.setAttribute("given_answers", arrayA);
                req.setAttribute("errorString", errorString);
                RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher("/WEB-INF/views/examView.jsp");
                dispatcher.include(req, resp);
            } else {
                System.out.println("Success!!!");
            }
        }
    }
}
