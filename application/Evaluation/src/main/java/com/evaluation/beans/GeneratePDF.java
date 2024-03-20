package com.evaluation.beans;

import java.sql.Timestamp;


public class GeneratePDF {
   private int idu;
    private String rank;
    private int idsp;
    private String name;
    private String surname;
    private String fathersname;
    private String am;
    private int IDs;
    
    
    private Timestamp date;
    private double examGrade;
    private double onJobGrade;
    private double finalGrade;
    private Timestamp OnJobDate;

    public GeneratePDF() {
    }

    public int getIdu() {
        return idu;
    }

    public void setIdu(int idu) {
        this.idu = idu;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public int getIdsp() {
        return idsp;
    }

    public void setIdsp(int idsp) {
        this.idsp = idsp;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getFathersname() {
        return fathersname;
    }

    public void setFathersname(String fathersname) {
        this.fathersname = fathersname;
    }

    public String getAm() {
        return am;
    }

    public void setAm(String am) {
        this.am = am;
    }

    public int getIDs() {
        return IDs;
    }

    public void setIDs(int IDs) {
        this.IDs = IDs;
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
