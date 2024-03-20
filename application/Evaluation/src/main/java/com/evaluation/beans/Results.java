/*
 * Results Bean
 */
package com.evaluation.beans;

import java.sql.Timestamp;

// σε περίπτωση που χρειαστεί κάτι τέτοιο ------------- import java.text.DecimalFormat;
public class Results {

    private int idu;
    private Timestamp date;
    private double examGrade;
    private double onJobGrade;
    private double finalGrade;
    private Timestamp OnJobDate;

    public Results() {
    }

    public Results(int idu, Timestamp date, double examGrade, double onJobGrade, double finalGrade, Timestamp OnJobDate) {
        this.idu = idu;
        this.date = date;
        this.examGrade = examGrade;
        this.onJobGrade = onJobGrade;
        this.finalGrade = finalGrade;
        this.OnJobDate = OnJobDate;
    }

    public int getIdu() {
        return idu;
    }

    public void setIdu(int idu) {
        this.idu = idu;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public double getExamGrade() {
        return examGrade;
    }

    public void setExamGrade(double examGrade) {
        this.examGrade = examGrade;
    }

    public double getOnJobGrade() {
        return onJobGrade;
    }

    public void setOnJobGrade(double onJobGrade) {
        this.onJobGrade = onJobGrade;
    }

    public double getFinalGrade() {
        return finalGrade;
    }

    public void setFinalGrade(double finalGrade) {
        this.finalGrade = finalGrade;
    }

    public Timestamp getOnJobDate() {
        return OnJobDate;
    }

    public void setOnJobDate(Timestamp OnJobDate) {
        this.OnJobDate = OnJobDate;
    }

}
