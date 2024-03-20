/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.evaluation.beans;

import java.sql.Blob;

/**
 *
 * @author ΑΝΑΣΤΑΣΙΟΣ
 */
public class Questions {
    private int IDq;
    private String question;
    private Blob image_q;
    private String UC;
    private String result;
    private String UCI;
    

    public Questions(int IDq, String question, Blob image_q) {
        this.IDq = IDq;
        this.question = question;
        this.image_q = image_q;
    }

    public Questions(int IDq, String question, Blob image_q, String UC, String result, String UCI) {
        this.IDq = IDq;
        this.question = question;
        this.image_q = image_q;
        this.UC = UC;
        this.result = result;
        this.UCI = UCI;
    }

    public int getIDq() {
        return IDq;
    }

    public void setIDq(int IDq) {
        this.IDq = IDq;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Blob getImage_q() {
        return image_q;
    }

    public void setImage_q(Blob image_q) {
        this.image_q = image_q;
    }

    public String getUC() {
        return UC;
    }

    public void setUC(String UC) {
        this.UC = UC;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getUCI() {
        return UCI;
    }

    public void setUCI(String UCI) {
        this.UCI = UCI;
    }

}//Question
