package com.evaluation.servlet;

import com.evaluation.beans.ExamDateCheck;
import com.evaluation.beans.Users;
import com.evaluation.utils.DBUtils;
import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/mainPage"})
public class MainPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(req);
        HttpSession session = req.getSession();
        Users loginedUser = MyUtils.getLoginedUser(session);
        if (loginedUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.setAttribute("user", loginedUser);
        int IDu = loginedUser.getIdu();
        long checkDate = 0;
        ExamDateCheck dateCheck = null;
        try {
            dateCheck = DBUtils.checkExam(conn, IDu);
            System.out.println("mpika");
        } catch (SQLException ex) {
            Logger.getLogger(MainPageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (dateCheck != null) {
            checkDate = dateCheck.getDate();
            System.out.println("checkdate from Servlet= " + checkDate);
            session.setAttribute("check", checkDate);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mainPage.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
