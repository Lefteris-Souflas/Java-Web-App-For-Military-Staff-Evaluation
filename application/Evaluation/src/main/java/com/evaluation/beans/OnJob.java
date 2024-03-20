/*
 * OnJob Bean
 */
package com.evaluation.beans;


public class OnJob {
    private int idon_job;
    private int ids;
    private String field;

    public OnJob() {
    }

    public OnJob(String field) {
        this.field = field;
    }
    

    public int getIdon_job() {
        return idon_job;
    }

    public void setIdon_job(int idon_job) {
        this.idon_job = idon_job;
    }

    public int getIds() {
        return ids;
    }

    public void setIds(int ids) {
        this.ids = ids;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    
    
}
