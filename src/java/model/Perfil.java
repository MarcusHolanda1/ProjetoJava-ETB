/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author guima
 */
public class Perfil {
    
    
    private int idPerfil;
    private String nome;

    @Override
    public String toString() {
        return "Perfil{" + "nome=" + nome + '}';
    }

    public Perfil() {
    }

    public Perfil(int idPerfil, String nome) {
        this.idPerfil = idPerfil;
        this.nome = nome;
    }

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
}
