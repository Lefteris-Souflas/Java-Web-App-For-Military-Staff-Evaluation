package com.evaluation.servlet;

import com.evaluation.beans.OnJob;
import com.evaluation.beans.Results;
import com.evaluation.beans.Users;
import com.evaluation.utils.DBUtils;
import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/onExam"})
public class OnJobExam extends HttpServlet {

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
            int UserIDS = userInSession.getIDs();
            List<OnJob> list = null;
            int ids = Integer.parseInt(req.getParameter("ids"));
            System.out.println("ids=" + ids);
            try {
                list = DBUtils.onJobQuestions(conn, ids);
            } catch (SQLException ex) {
                errorString = ex.getMessage();
            }//catch
            req.setAttribute("size", list.size());
            req.setAttribute("questionsOnJob", list);
            req.setAttribute("errorString", errorString);
            req.setAttribute("user", userInSession);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/onJobExamView.jsp");
            dispatcher.forward(req, resp);
        }//if-else
    }//doGet

//        System.out.println("UserIDu = " + idu + " onJobExam = " + myA);
//        int vathmos = Integer.parseInt(myA);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Users userInSession = MyUtils.getLoginedUser(session);
        String errorString = null;
        Connection conn = MyUtils.getStoredConnection(req);
        double myA = Double.parseDouble(req.getParameter("myA"));
        int idu = Integer.parseInt(req.getParameter("idu"));
        Results results = new Results();
        results.setOnJobGrade(myA);
        results.setIdu(idu);
        try {
            DBUtils.answerOnJob(conn, idu, myA);
        } catch (SQLException ex) {
            errorString = ex.getMessage();
        }
        if (errorString != null) {
            req.setAttribute("errorString", errorString);
            req.setAttribute("results", results);
            RequestDispatcher dispatcher
                    = req.getRequestDispatcher("/WEB-INF/views/onJobExamView.jsp");
            dispatcher.forward(req, resp);
        }//if
        else {
            resp.sendRedirect(req.getContextPath() + "/onJob");
//            resp.sendRedirect("/WEB-INF/views/usersBattalionView.jsp");
        }//else
    }//doPost
}//onJobExam
