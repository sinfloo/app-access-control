package com.app.dto;

public class Persona {
    private int id;
    private TipoDoc tipodoc;
    private String nrodoc;
    private String carnetext;
    private String nombres;
    private String apellidos;
    private String telefono;
    private String correo;

    public Persona() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TipoDoc getTipodoc() {
        return tipodoc;
    }

    public void setTipodoc(TipoDoc tipodoc) {
        this.tipodoc = tipodoc;
    }

    public String getNrodoc() {
        return nrodoc;
    }

    public void setNrodoc(String nrodoc) {
        this.nrodoc = nrodoc;
    }

    public String getCarnetext() {
        return carnetext;
    }

    public void setCarnetext(String carnetext) {
        this.carnetext = carnetext;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    
}
