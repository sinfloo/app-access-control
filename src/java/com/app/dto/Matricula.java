
package com.app.dto;

public class Matricula {
    private int id;
    private String year;
    private Historial historial;
    private Usuario usuario;
    private Grado grado;

    public Matricula() {
    }

    public Matricula(int id, String year, Historial historial, Usuario usuario, Grado grado) {
        this.id = id;
        this.year = year;
        this.historial = historial;
        this.usuario = usuario;
        this.grado = grado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Historial getHistorial() {
        return historial;
    }

    public void setHistorial(Historial historial) {
        this.historial = historial;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Grado getGrado() {
        return grado;
    }

    public void setGrado(Grado grado) {
        this.grado = grado;
    }
    
    
}
