package com.evaluation.servlet;

import com.evaluation.beans.Users;
import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/AdminPage"})
public class AdminPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Users loginedUser = MyUtils.getLoginedUser(session);
        if (loginedUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.setAttribute("user", loginedUser);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/adminPage.jsp");
        dispatcher.forward(req, resp);
        req.setAttribute("user", loginedUser);
        
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}