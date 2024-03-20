package com.evaluation.servlet;

import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Logout", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.getSession(false).removeAttribute("user");
        //session.invalidate();
       // session.setMaxInactiveInterval(0);
        session.removeAttribute("COOKIE CHECKED");
        MyUtils.deleteUserCookie(resp);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp");
        dispatcher.forward(req, resp);
//        PrintWriter pw=resp.getWriter();  
//        resp.sendRedirect("/WEB-INF/views/login.jsp");
//        pw.close();  
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
