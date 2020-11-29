package com.app.dto;

public class Usuario extends Persona{
    private int idUser;
    private String usuario;
    private String password;
    private Rol rol;

    public Usuario(int idUser) {
        this.idUser = idUser;
    }

    public Usuario() {
    }

    
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    
    
}
