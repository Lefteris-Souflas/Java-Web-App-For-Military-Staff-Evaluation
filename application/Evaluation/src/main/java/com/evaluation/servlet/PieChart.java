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
import java.util.ArrayList;
import java.util.List;
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
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author anast
 */
@WebServlet(urlPatterns = {"/pieChart"})
public class PieChart extends HttpServlet {

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
                List<Double> list = new ArrayList<Double>();
                double total = 0;
                try {
                    list = DBUtils.pieChart(conn, IDu);
                    total = DBUtils.totalUser(conn, IDu);
                } catch (SQLException ex) {
                    Logger.getLogger(PieChart.class.getName()).log(Level.SEVERE, null, ex);
                }
                double diff = total - list.get(0);
                DefaultPieDataset dataset = new DefaultPieDataset();
                dataset.setValue("Ολοκληρωση Συνολικής Αξιολόγησης", list.get(1));
                dataset.setValue("Ολοκληρωση Θεωρητικής Αξιολόγησης", list.get(0));
                dataset.setValue("Ολοκληρωση Πρακτικής Αξιολόγησης", list.get(1));
                dataset.setValue("Υπολείποντες προς Αξιολόγηση", diff);
                JFreeChart chart = ChartFactory.createPieChart3D(
                        "Ποσοστό Ολοκλήρωσης Ετήσιας Αξιολόγησης των Στελεχών\nτης Μονάδας: " + userInSession.getBattalion(), // chart title
                        dataset, // data
                        true, // include legend
                        true,
                        false);
                PiePlot3D plot = (PiePlot3D) chart.getPlot();
                plot.setStartAngle(270);
                plot.setForegroundAlpha(0.60f);
                plot.setInteriorGap(0.02);
                int width = 640;
                /* Width of the image */
                int height = 480;
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                ChartUtilities.writeChartAsPNG(bos, chart, width, height);
                resp.setContentType("image/png");
                OutputStream out = new BufferedOutputStream(resp.getOutputStream());
                out.write(bos.toByteArray());
                out.flush();
                out.close();
            }
        }
    }
}
