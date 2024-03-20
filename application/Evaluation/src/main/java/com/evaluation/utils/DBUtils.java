/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.evaluation.utils;

import com.evaluation.beans.Answers;
import com.evaluation.beans.ExamDateCheck;
import com.evaluation.beans.GeneratePDF;
import com.evaluation.beans.OnJob;
import com.evaluation.beans.Questions;
import com.evaluation.beans.Results;
import com.evaluation.beans.Users;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class DBUtils {

    public static void registerUser(Connection conn, String rank, int IDsp, String name, String surname, String fathersname,
            String AM, int IDs, String battalion, String email, String username, String password, String verification)
            throws SQLException {
        System.out.println("#################### exei mpei PRIN APO TO query  ######################");
        String sql = "INSERT INTO users(Ranki,IDsp,Name,Surname,FathersName,AM,IDs,Battalion,email,username,password,verification) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, rank);
        pstm.setInt(2, IDsp);
        pstm.setString(3, name);
        pstm.setString(4, surname);
        pstm.setString(5, fathersname);
        pstm.setString(6, AM);
        pstm.setInt(7, IDs);
        pstm.setString(8, battalion);
        pstm.setString(9, email);
        pstm.setString(10, username);
        pstm.setString(11, password);
        pstm.setString(12, verification);
//        pstm.setBlob(13, image);
        System.out.println("-----------------------------------------------------------------");
        pstm.executeUpdate();

        System.out.println("#################### exei mpei ######## kai sto query  ######################");
    }//registerUser

    public static Users findUser(Connection conn, String userName, String password)
            throws SQLException {
//        Rank, IDsp, Name, Surname, FathersName, AM, IDs, Battalion, email, role, UserName, Password, Verification
        String sql = "SELECT IDu, Ranki, IDsp, Name, Surname, FathersName, AM, IDs, Battalion, email, role, verification FROM users WHERE username= ? AND password= ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet results = pstm.executeQuery();
        if (results.next()) {
            Users user = new Users();
            user.setIdu(results.getInt("IDu"));
            user.setRank(results.getString("Ranki"));
            user.setIdsp(results.getInt("IDsp"));
            user.setName(results.getString("Name"));
            user.setSurname(results.getString("Surname"));
            user.setFathersname(results.getString("FathersName"));
            user.setAm(results.getString("AM"));
            user.setIDs(results.getInt("IDs"));
            user.setBattalion(results.getString("Battalion"));
            user.setEmail(results.getString("email"));
            user.setRole(results.getInt("role"));
            user.setUsername(userName);
            user.setPassword(password);
            user.setVerification(results.getString("verification"));
            return user;
        }//if
        return null;
    }//findUser

    public static Users findUser(Connection conn, String userName)
            throws SQLException {
        String sql = "SELECT UserName, Password, Verification, IDs FROM Users WHERE UserName= ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        ResultSet results = pstm.executeQuery();
        if (results.next()) {
            Users user = new Users();
            user.setUsername(userName);
            user.setPassword(results.getString("Password"));
            user.setVerification(results.getString("Verification"));
            user.setIDs(results.getInt("IDs"));
            return user;
        }//if
        return null;
    }//findUser

//    public static List<MultipleChoice> getQuestionier(Connection conn, int IDs) throws SQLException {
//        String sql = "SELECT IDq, IDs, question, image_q, IDa, answer, correct, image_a FROM evaluation.apantiseis_kata_erwtisi AS a NATURAL JOIN (SELECT IDq FROM erwtiseis_kat_eidikotita WHERE IDs=? ORDER BY RAND() LIMIT 50) AS q";
//        PreparedStatement pstm = conn.prepareStatement(sql);
//        pstm.setInt(1, IDs);
//        ResultSet results = pstm.executeQuery();
//        List<MultipleChoice> choices = new ArrayList<MultipleChoice>();
//        List<Questions> questions = new ArrayList<Questions>();
//        while (results.next()) {
//            MultipleChoice mc = new MultipleChoice();
//            mc.setIDs(IDs);
//            mc.setIDq(results.getInt("IDq"));
//            mc.setQuestion(results.getString("question"));
//            mc.setImage_q(results.getBlob("image_q"));
//            mc.setIDa(results.getInt("IDa"));
//            mc.setAnswer(results.getString("answer"));
//            mc.setCorrect(results.getByte("correct"));
//            mc.setImage_a(results.getBlob("image_a"));
//            choices.add(mc);
//            int IDq = choices.get(choices.size() - 1).getIDq();
//            if (mc.getIDq() != IDq) {
//                Questions q = new Questions(mc.getIDq(), mc.getQuestion(), mc.getImage_q());
//                questions.add(q);
//            }
//        }
//        return choices;
//    }//getQuestionier
    public static void answerOnJob(Connection conn, int Idu, double vathmos) throws SQLException {
        String sql = "UPDATE results SET OnJobGrade = ?, OnJobDate = now() WHERE IDu= ? and year(Date) = year(now())";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1, vathmos);
        pstm.setInt(2, Idu);
        pstm.executeUpdate();
    }

    public static List<OnJob> onJobQuestions(Connection conn, int IDs) throws SQLException {
        String sql = "SELECT field from on_job WHERE IDs= ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDs);
        System.out.println(IDs);
        ResultSet results = pstm.executeQuery();
        List<OnJob> questions = new ArrayList<OnJob>();
        while (results.next()) {
            OnJob q = new OnJob(results.getString("field"));
            questions.add(q);
        }
        System.out.println(questions.size());
        return questions;
    }

    public static List<Users> usersOnJob(Connection conn, String Battalion) throws SQLException {
        String sql = "SELECT IDu, Ranki, Name, Surname, FathersName, AM, IDs, Battalion from users NATURAL JOIN results where Battalion= ? AND FinalGrade IS NULL";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, Battalion);
        System.out.println(Battalion);
        ResultSet results = pstm.executeQuery();
        List<Users> users = new ArrayList<Users>();
        while (results.next()) {
            Users u = new Users(results.getInt("IDu"), results.getString("Ranki"), results.getString("Name"),
                    results.getString("Surname"), results.getString("FathersName"), results.getString("AM"),
                    results.getInt("IDs"), results.getString("Battalion"));
            users.add(u);
        }
        System.out.println("size= " + users.size());
//        System.out.println("AM= "+ users.get(1).getAm() );
        return users;
    }//usersOnJob

    public static List<Answers> examCorrection(Connection conn, int IDu) throws SQLException {
        String sql = "SELECT IDa, correct FROM answers WHERE IDa IN (SELECT DISTINCT IDa FROM final_answers WHERE IDu = ? AND exam_started_at >= DATE_SUB(NOW(), INTERVAL 50 MINUTE) ORDER BY idfinal_answers)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        ResultSet results = pstm.executeQuery();
        List<Answers> given = new ArrayList<Answers>();
        while (results.next()) {
            Answers choice = new Answers(results.getInt("IDa"), results.getInt("correct"));
            given.add(choice);
        }
        return given;
    }

    public static ExamDateCheck checkExam(Connection conn, int IDu)
            throws SQLException {
        String sql = "SELECT year(Date) FROM results WHERE IDu=? ORDER BY Date DESC LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        ResultSet results = pstm.executeQuery();
        ExamDateCheck checkExam = new ExamDateCheck();
        while (results.next()) {
            checkExam.setIdu(IDu);
            checkExam.setDate(results.getLong("year(Date)"));
            System.out.println("results = " + checkExam.getDate());
            return checkExam;
        }//if
        return null;
    }//findUser

    public static List<Results> queryEvaluationHistory(Connection conn, int IDu) throws SQLException {
        String sql = "SELECT * FROM results WHERE IDu=? ORDER BY Date";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        ResultSet results = pstm.executeQuery();
        List<Results> list = new ArrayList<Results>();
        while (results.next()) {
            Results personalresult = new Results();
            personalresult.setDate(results.getTimestamp("Date"));
            personalresult.setExamGrade(results.getDouble("ExamGrade"));
            personalresult.setOnJobGrade(results.getDouble("OnJobGrade"));
            personalresult.setFinalGrade(results.getDouble("FinalGrade"));
            personalresult.setOnJobDate(results.getTimestamp("OnJobDate"));
            list.add(personalresult);

        }
        return list;

    }//queryEvaluationHistory

    public static List<Results> queryUnitHistory(Connection conn) throws SQLException {
        String sql = "SELECT * FROM results WHERE year(Date)=2021 and OnJobGrade IS NOT NULL ORDER BY Date";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet results = pstm.executeQuery();
        List<Results> list = new ArrayList<Results>();
        while (results.next()) {
            Results unithistoryresult = new Results();
            unithistoryresult.setIdu(results.getInt("IDu"));
            unithistoryresult.setDate(results.getTimestamp("Date"));
            unithistoryresult.setExamGrade(results.getDouble("ExamGrade"));
            unithistoryresult.setOnJobGrade(results.getDouble("OnJobGrade"));
            unithistoryresult.setFinalGrade(results.getDouble("FinalGrade"));
            unithistoryresult.setOnJobDate(results.getTimestamp("OnJobDate"));
            list.add(unithistoryresult);
        }
        return list;

    }//queryUnitHistory

    public static List<Questions> questions(Connection conn, int IDs) throws SQLException {
        String sql = "SELECT IDq, question, image_q FROM questions WHERE IDs= ? ORDER BY RAND() LIMIT 10";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDs);
        System.out.println(IDs);
        ResultSet results = pstm.executeQuery();
        List<Questions> questions = new ArrayList<Questions>();
        while (results.next()) {
            Questions q = new Questions(results.getInt("IDq"), results.getString("question"), results.getBlob("image_q"));
            questions.add(q);
        }
        System.out.println(questions.size());
        return questions;
    }

    public static List<Answers> answers(Connection conn, int IDq) throws SQLException {
        String sql = "SELECT IDa, answer, correct, image_a FROM answers WHERE IDq= ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDq);
        ResultSet results = pstm.executeQuery();
        List<Answers> answers = new ArrayList<Answers>();
        while (results.next()) {
            Answers a = new Answers(results.getInt("IDa"), results.getString("answer"), results.getInt("correct"), results.getBlob("image_a"));
            answers.add(a);
        }
        return answers;
    }

    public static void insertAnswers(Connection conn, int IDu, int IDq, int IDa, Timestamp time)
            throws SQLException {
        String sql = "INSERT INTO final_answers (IDu, IDq, IDa, exam_started_at) VALUES (?, ?, ?, ?);";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        pstm.setInt(2, IDq);
        pstm.setInt(3, IDa);
        pstm.setTimestamp(4, time);
        pstm.executeUpdate();
    }//registerUser

    public static List<Answers> examCorrection(Connection conn, int IDu, int length) throws SQLException {
        String sql = "SELECT IDa, correct FROM (SELECT * FROM answers NATURAL JOIN final_answers WHERE IDu = ? AND "
                + "exam_started_at >= DATE_SUB(NOW(), INTERVAL 50 MINUTE) ORDER BY idfinal_answers DESC LIMIT ?) as a ORDER BY idfinal_answers";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        pstm.setInt(2, length);
        ResultSet results = pstm.executeQuery();
        List<Answers> given = new ArrayList<Answers>();
        while (results.next()) {
            Answers choice = new Answers(results.getInt("IDa"), results.getInt("correct"));
            given.add(choice);
        }
        return given;
    }

    public static void answerTheory(Connection conn, int Idu, double vathmos) throws SQLException {
        String sql = "INSERT INTO results (IDu, Date, ExamGrade) VALUES (?, now(), ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, Idu);
        pstm.setDouble(2, vathmos);
        pstm.executeUpdate();
    }

    public static List<GeneratePDF> finalDocumentGenerate(Connection conn, int idu) throws SQLException {
        String sql = "SELECT IDu, Ranki, Name, Surname, FathersName, AM, IDs, Date, ExamGrade, OnJobGrade, FinalGrade,OnJobDate from users NATURAL JOIN results where IDu= ? ORDER BY Date DESC LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idu);
        ResultSet results = pstm.executeQuery();
        List<GeneratePDF> finalDocument = new ArrayList<GeneratePDF>();
        while (results.next()) {
            GeneratePDF generate = new GeneratePDF();
            generate.setIdu(results.getInt("IDu"));
            generate.setRank(results.getString("Ranki"));
            generate.setName(results.getString("Name"));
            generate.setSurname(results.getString("Surname"));
            generate.setFathersname(results.getString("FathersName"));
            generate.setAm(results.getString("AM"));
            generate.setIDs(results.getInt("IDs"));

            generate.setDate(results.getTimestamp("Date"));
            generate.setExamGrade(results.getDouble("ExamGrade"));
            generate.setOnJobGrade(results.getDouble("OnJobGrade"));
            generate.setFinalGrade(results.getDouble("FinalGrade"));
            generate.setOnJobDate(results.getTimestamp("OnJobDate"));
            finalDocument.add(generate);
        }
        System.out.println("generate size= " + finalDocument.size());
//        System.out.println("AM= "+ users.get(1).getAm() );
        return finalDocument;
    } //generatePDF

    public static void insertTemp(Connection conn, int IDu, int IDq, int IDa, Timestamp time, int u, String UC, String result, String UCI) throws SQLException {
        String sql = "INSERT INTO temp (IDu, IDq, IDa, exam_started_at, u, UC, result, UCI) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        pstm.setInt(2, IDq);
        pstm.setInt(3, IDa);
        pstm.setTimestamp(4, time);
        pstm.setInt(5, u);
        pstm.setString(6, UC);
        pstm.setString(7, result);
        pstm.setString(8, UCI);
        pstm.executeUpdate();
    }

    public static void deleteTemp(Connection conn, int IDu) throws SQLException {
        String sql = "SET sql_safe_updates = 0";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.executeUpdate();
        sql = "DELETE FROM temp WHERE IDu = ?";
        pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        pstm.executeUpdate();
    }

    public static int countTempAns(Connection conn, int IDu) throws SQLException {
        String sql = "SELECT max(u) FROM temp WHERE IDu = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        ResultSet results = pstm.executeQuery();
        int u = 0;
        if (results.next()) {
            u = results.getInt("max(u)");
        }
        System.out.println("DB u= " + u);
        return u;
    }

    public static List<Questions> tempQuestions(Connection conn, int IDu, int u, int IDs) throws SQLException {
        String sql = "(SELECT IDq, question, image_q, idtemp, UC, result, UCI FROM (SELECT * FROM temp NATURAL JOIN questions WHERE IDu = ? AND UCI != 'undefined' ORDER BY idtemp DESC LIMIT ?) as a ORDER BY idtemp) UNION "
                + "(SELECT q.IDq, question, image_q, idtemp, UC, result, UCI FROM questions q LEFT JOIN (SELECT * FROM (SELECT * FROM temp ORDER BY idtemp LIMIT ?) as a ORDER BY idtemp) t ON q.IDq = t.IDq WHERE t.IDq IS NULL AND IDs= ? ORDER BY RAND() LIMIT ?) ORDER BY -idtemp DESC";
        PreparedStatement pstm = conn.prepareStatement(sql);
        int minus = 10 - u;
        pstm.setInt(1, IDu);
        pstm.setInt(2, u);
        pstm.setInt(3, u);
        pstm.setInt(4, IDs);
        pstm.setInt(5, minus);
        ResultSet results = pstm.executeQuery();
        List<Questions> questions = new ArrayList<Questions>();
        while (results.next()) {
            Questions q = new Questions(results.getInt("IDq"), results.getString("question"), results.getBlob("image_q"), results.getString("UC"), results.getString("result"), results.getString("UCI"));
            questions.add(q);
        }
        System.out.println(questions.size());
        return questions;
    }

    public static Timestamp getExamStart(Connection conn, int IDu) throws SQLException {
        String sql = "SELECT exam_started_at FROM temp WHERE IDu = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        ResultSet results = pstm.executeQuery();
        List<Questions> questions = new ArrayList<Questions>();
        Timestamp exam_started_at = null;
        if (results.next()) {
            exam_started_at = results.getTimestamp("exam_started_at");
        }
        return exam_started_at;
    }

    public static JSONArray getTemp(Connection conn, int IDu, int u) throws SQLException {
        String sql = "SELECT idtemp, IDq, IDa, exam_started_at FROM (SELECT * FROM temp WHERE IDu = ? ORDER BY idtemp DESC LIMIT ?) as a ORDER BY idtemp";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        pstm.setInt(2, u);
        ResultSet results = pstm.executeQuery();
        JSONArray arrayA = new JSONArray();
        int i = 0;
        while (results.next()) {
            JSONObject objectA = new JSONObject();
            objectA.put("idQ", results.getInt("IDq"));
            objectA.put("idA", results.getInt("IDa"));
            System.out.println("objectA= " + objectA.getInt("idQ"));
            arrayA.put(i, objectA);
            i++;
        }
        return arrayA;
    }

    public static List<Double> pieChart(Connection conn, int IDu) throws SQLException {
        String sql = "SELECT count(ExamGrade), count(OnJobGrade) FROM results NATURAL JOIN users WHERE YEAR(Date) = YEAR(NOW()) AND Battalion = (SELECT Battalion FROM users WHERE idu = ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        System.out.println("IDu= " + IDu);
        ResultSet results = pstm.executeQuery();
        double examGrade = 0;
        double onJobGrade = 0;
        List<Double> list = new ArrayList<Double>();
        while (results.next()) {
            examGrade = results.getDouble("count(ExamGrade)");
            onJobGrade = results.getDouble("count(OnJobGrade)");
            list.add(examGrade);
            list.add(onJobGrade);
        }
        System.out.println("examGrade= " + examGrade);
        return list;
    }

    public static double totalUser(Connection conn, int IDu) throws SQLException {
        String sql = "SELECT count(*) FROM users WHERE Battalion = (SELECT Battalion FROM users WHERE idu = ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        ResultSet results = pstm.executeQuery();
        double total = 0;
        while (results.next()) {
            total = results.getDouble("count(*)");
        }
        return total;
    }

    public static List<Double> pieChart1(Connection conn, int IDu) throws SQLException {
        String sql = "SELECT (SELECT count(FinalGrade) FROM results WHERE FinalGrade >= 90) AS EXCELLENT, "
                + "(SELECT count(FinalGrade) FROM results WHERE FinalGrade >= 80 AND FinalGrade < 90) AS VERYGOOD, "
                + "(SELECT count(FinalGrade) FROM results WHERE FinalGrade >= 60 AND FinalGrade < 80) AS GOOD, "
                + "(SELECT count(FinalGrade) FROM results WHERE FinalGrade >= 50 AND FinalGrade < 60) AS AVERAGE, "
                + "(SELECT count(FinalGrade) FROM results WHERE FinalGrade < 50) AS FAILED "
                + "FROM results NATURAL JOIN users WHERE YEAR(Date) = YEAR(NOW()) AND Battalion = (SELECT Battalion FROM users WHERE idu = ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        ResultSet results = pstm.executeQuery();
        double aristos = 0;
        double decent = 0;
        double good = 0;
        double average = 0;
        double failed = 0;
        List<Double> list = new ArrayList<Double>();
        while (results.next()) {
            aristos = results.getDouble("EXCELLENT");
            decent = results.getDouble("VERYGOOD");
            good = results.getDouble("GOOD");
            average = results.getDouble("AVERAGE");
            failed = results.getDouble("FAILED");
            list.add(aristos);
            list.add(decent);
            list.add(good);
            list.add(average);
            list.add(failed);
        }
        System.out.println("examGrade= " + average);
        return list;
    }

    public static JSONArray lineChart(Connection conn, int IDu) throws SQLException {
        String sql = "SELECT year(OnJobDate) as year, avg(FinalGrade) as average FROM results NATURAL JOIN users WHERE Battalion = (SELECT Battalion FROM users WHERE idu = ?) GROUP BY year(OnJobDate) ORDER BY year";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        System.out.println("IDu= " + IDu);
        ResultSet results = pstm.executeQuery();
        int i = 0;
        JSONArray arrayA = new JSONArray();
        while (results.next()) {
            JSONObject objectA = new JSONObject();
            String year = String.valueOf(results.getInt("year"));
            System.out.println("objectA= " + year);
            objectA.put("year", year);
            objectA.put("average", results.getDouble("average"));
            arrayA.put(i, objectA);
            i++;
        }
        return arrayA;
    }

    public static JSONArray barChart(Connection conn, int IDu) throws SQLException {
        String sql = "SELECT question, count(IDq) as plithos, specializationcol as eidikotita FROM final_answers NATURAL JOIN questions NATURAL JOIN answers NATURAL JOIN specialization NATURAL JOIN users WHERE Battalion = (SELECT Battalion FROM users WHERE idu = ?) AND year(exam_started_at) = year(now()) AND correct = 0 GROUP BY IDq HAVING count(IDq) > 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, IDu);
        System.out.println("IDu= " + IDu);
        ResultSet results = pstm.executeQuery();
        int i = 0;
        JSONArray arrayA = new JSONArray();
        while (results.next()) {
            JSONObject objectA = new JSONObject();
            objectA.put("question", results.getString("question"));
            objectA.put("plithos", results.getInt("plithos"));
            objectA.put("eidikotita", results.getString("eidikotita"));
            arrayA.put(i, objectA);
            i++;
        }
        return arrayA;
    }

}//class
