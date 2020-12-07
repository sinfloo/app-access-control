
package com.app.dto;

import java.util.List;

public class Apoderado extends Persona{
    private int idApo;
    private Parentesco parentesco;
    private List<Usuario>usuarios;

    public Apoderado() {
    }

    public Apoderado(int idApo, Parentesco parentesco, List<Usuario> usuarios) {
        this.idApo = idApo;
        this.parentesco = parentesco;
        this.usuarios = usuarios;
    }

    public int getIdApo() {
        return idApo;
    }

    public void setIdApo(int idApo) {
        this.idApo = idApo;
    }

    public Parentesco getParentesco() {
        return parentesco;
    }

    public void setParentesco(Parentesco parentesco) {
        this.parentesco = parentesco;
    }

    public List<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(List<Usuario> usuarios) {
        this.usuarios = usuarios;
    }
    
    
}
