
package com.app.dto;

public class Parentesco {
    private int id;
    private String parentesco;

    public Parentesco() {
    }

    public Parentesco(int id, String parentesco) {
        this.id = id;
        this.parentesco = parentesco;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }
    
}
