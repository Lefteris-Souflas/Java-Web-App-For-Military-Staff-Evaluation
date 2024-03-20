/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.evaluation.servlet;

import com.evaluation.beans.Users;
import com.evaluation.utils.DBUtils;
import com.evaluation.utils.MyUtils;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.json.JSONArray;

/**
 *
 * @author Panagiotis
 */
@WebServlet(urlPatterns = {"/barChart"})
public class BarChart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Users userInSession = MyUtils.getLoginedUser(session);
        String errorString = null;
        if (userInSession == null) {
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp");
            dispatcher.forward(req, resp);
        } else {
            Connection conn = MyUtils.getStoredConnection(req);
            if (userInSession.getRole() != 1) {
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/mainPage.jsp");
                dispatcher.forward(req, resp);
            } else {
                int IDu = userInSession.getIdu();
                JSONArray arrayA = new JSONArray();
                try {
                    arrayA = DBUtils.barChart(conn, IDu);
                } catch (SQLException ex) {
                    Logger.getLogger(PieChart.class.getName()).log(Level.SEVERE, null, ex);
                }
                DefaultCategoryDataset dataset = new DefaultCategoryDataset();
                for (int i = 0; i < arrayA.length(); i++) {
                    dataset.addValue(arrayA.getJSONObject(i).getInt("plithos"), arrayA.getJSONObject(i).getString("eidikotita"), arrayA.getJSONObject(i).getString("question"));
                }

                JFreeChart barChart = ChartFactory.createBarChart3D(
                        "Συχνότερα Λάθη ανά Ειδικότητα",
                        "Ερώτηση",
                        "Πλήθος Λανθασμένων Απαντήσεων",
                        dataset,
                        PlotOrientation.VERTICAL,
                        true, true, false);
                CategoryAxis axis = barChart.getCategoryPlot().getDomainAxis();
                axis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);
                int width = 640;
                /* Width of the image */
                int height = 480;
                /* Height of the image */
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                ChartUtilities.writeChartAsPNG(bos, barChart, width, height);
                resp.setContentType("image/png");
                OutputStream out = new BufferedOutputStream(resp.getOutputStream());
                out.write(bos.toByteArray());
                out.flush();
                out.close();
            }
        }
    }
}
