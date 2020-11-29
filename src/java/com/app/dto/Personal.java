
package com.app.dto;

public class Personal extends Persona{
    private int idp;
    private Area area;

    public Personal() {
    }

    public Personal(int idp, Area area) {
        this.idp = idp;
        this.area = area;
    }

       
    public int getIdp() {
        return idp;
    }

    public void setIdp(int idp) {
        this.idp = idp;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    
}
