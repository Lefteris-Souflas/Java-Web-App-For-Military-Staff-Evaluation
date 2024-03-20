/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.evaluation.beans;

import java.sql.Timestamp;

/**
 *
 * @author Lefteris
 */
public class FinalAnswers {
    private int IDtemp;
    private int IDu;
    private int IDq;
    private int IDa;
    private Timestamp examStarted;

    public FinalAnswers() {
    }
    
    public FinalAnswers(int IDtemp, int IDu, int IDq, int IDa, Timestamp examStarted) {
        this.IDtemp = IDtemp;
        this.IDu = IDu;
        this.IDq = IDq;
        this.IDa = IDa;
        this.examStarted = examStarted;
    }

    public Timestamp getExamStarted() {
        return examStarted;
    }

    public void setExamStarted(Timestamp examStarted) {
        this.examStarted = examStarted;
    }

    public int getIDtemp() {
        return IDtemp;
    }

    public void setIDtemp(int IDtemp) {
        this.IDtemp = IDtemp;
    }

    public int getIDu() {
        return IDu;
    }

    public void setIDu(int IDu) {
        this.IDu = IDu;
    }

    public int getIDq() {
        return IDq;
    }

    public void setIDq(int IDq) {
        this.IDq = IDq;
    }

    public int getIDa() {
        return IDa;
    }

    public void setIDa(int IDa) {
        this.IDa = IDa;
    }
    
}
