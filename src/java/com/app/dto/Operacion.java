
package com.app.dto;

public class Operacion {
    private int id;
    private int tipooperacion;
    private String nroticket;
    private String fecha;
    private String descripcion;
    private double importe;

    public Operacion() {
    }

    public Operacion(int tipooperacion, String nroticket, String fecha, String descripcion, double importe) {
        this.tipooperacion = tipooperacion;
        this.nroticket = nroticket;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.importe = importe;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTipooperacion() {
        return tipooperacion;
    }

    public void setTipooperacion(int tipooperacion) {
        this.tipooperacion = tipooperacion;
    }

    public String getNroticket() {
        return nroticket;
    }

    public void setNroticket(String nroticket) {
        this.nroticket = nroticket;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }
    
    
}
