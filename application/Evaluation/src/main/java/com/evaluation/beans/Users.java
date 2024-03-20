/*
* User Bean

*/
package com.evaluation.beans;


public class Users {
    private int idu;
    private String rank;
    private int idsp;
    private String name;
    private String surname;
    private String fathersname;
    private String am;
    private int IDs;
    private String battalion;
    private String email;
    private int role;
    private String username;
    private String password;
    private String verification;
    private String image;

    public Users() {
    }

    public Users(int idu, String rank, String name, String surname, String fathersname, String am, int IDs, String battalion) {
        this.idu = idu;
        this.rank = rank;
        this.name = name;
        this.surname = surname;
        this.fathersname = fathersname;
        this.am = am;
        this.IDs = IDs;
        this.battalion = battalion;
        
    }

    public Users(int idu, String rank, int idsp, String name, String surname, String fathersname, String am, int IDs, String battalion, String email, int role, String username, String password, String verification, String image) {
        this.idu = idu;
        this.rank = rank;
        this.idsp = idsp;
        this.name = name;
        this.surname = surname;
        this.fathersname = fathersname;
        this.am = am;
        this.IDs = IDs;
        this.battalion = battalion;
        this.email = email;
        this.role = role;
        this.username = username;
        this.password = password;
        this.verification = verification;
        this.image = image;
    }
    

    
    
//    public Users(int aInt, String string, String string0, String string1, String string2, String string3, int aInt0, String string4) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

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

    public void setIdsp(int idSp) {
        this.idsp = idSp;
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

    public void setSurname(String surName) {
        this.surname = surName;
    }

    public String getFathersname() {
        return fathersname;
    }

    public void setFathersname(String fathersName) {
        this.fathersname = fathersName;
    }

    public String getAM() {
        return am;
    }

    public void setAm(String am) {
        this.am = am;
    }

    public String getBattalion() {
        return battalion;
    }

    public void setBattalion(String battalion) {
        this.battalion = battalion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getVerification() {
        return verification;
    }

    public void setVerification(String verification) {
        this.verification = verification;
    }

    public int getIDs() {
        return IDs;
    }

    public void setIDs(int IDs) {
        this.IDs = IDs;
    }
   
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    

    
}