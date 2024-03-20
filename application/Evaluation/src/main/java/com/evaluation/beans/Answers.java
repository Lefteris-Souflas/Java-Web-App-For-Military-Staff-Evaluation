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
public class Answers {

    private int IDa;
    private String answer;
    private int correct;
    private Blob image_a;

    public Answers(int IDa, String answer, int correct, Blob image_a) {
        this.IDa = IDa;
        this.answer = answer;
        this.correct = correct;
        this.image_a = image_a;
    }

    public Answers(int IDa, int correct) {
        this.IDa = IDa;
        this.correct = correct;
    }

    public int getIDa() {
        return IDa;
    }

    public void setIDa(int IDa) {
        this.IDa = IDa;
    }

    public int getCorrect() {
        return correct;
    }

    public void setCorrect(int correct) {
        this.correct = correct;
    }

    public Blob getImage_a() {
        return image_a;
    }

    public void setImage_a(Blob image_a) {
        this.image_a = image_a;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
    
}
