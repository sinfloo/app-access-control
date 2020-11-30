package com.app.dto;

public class Historial {

    private int id;
    private Operacion operacion;
    private double totaldeuda;
    private Usuario usuario;

    public Historial() {
    }

    public Historial(int id, Operacion operacion, double totaldeuda, Usuario usuario) {
        this.id = id;
        this.operacion = operacion;
        this.totaldeuda = totaldeuda;
        this.usuario = usuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Operacion getOperacion() {
        return operacion;
    }

    public void setOperacion(Operacion operacion) {
        this.operacion = operacion;
    }

    public double getTotaldeuda() {
        return totaldeuda;
    }

    public void setTotaldeuda(double totaldeuda) {
        this.totaldeuda = totaldeuda;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
}
