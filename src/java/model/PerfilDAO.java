/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author guima
 */
public class PerfilDAO extends DataBaseDAO {
    
    public PerfilDAO()throws Exception{}
    
    public ArrayList<Perfil> getLista() throws Exception{
       
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        String SQL = "SELECT * FROM perfil";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);
        while(rs.next()){
            Perfil p = new Perfil();
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setNome(rs.getString("nome"));
            lista.add(p);
        }
        this.desconectar();
        return lista;
        
    }
    
    public boolean gravar (Perfil p){
        
        try{
            String sql;
            this.conectar();
            if (p.getIdPerfil()==0){
                sql = "INSET INTO perfil(nome) VALUES(?)";
                
            
            }else {
                sql = "UPDATE perfil SET nome=? WHERE idPerfil=?";
            }
            
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, p.getNome());
            if(p.getIdPerfil()>0){
                pstm.setInt(2,p.getIdPerfil());
            }
            
            pstm.execute();
            this.desconectar();
            return true;
            
        }catch(Exception e){
            System.out.println(e);
            return false;
            
        }
    
    
    }
    
    public Perfil getCarregaPorID(int idPerfil) throws Exception{
        Perfil p =new Perfil();
        String sql = "SELECT * FROM perfil WHERE idPerfil=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idPerfil);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setNome(rs.getString("nome"));
        }
        this.desconectar();
        return p;
    }
    
    public boolean deletar (Perfil p){
        try{
            this.conectar();
            String sql = "DELETE FROM perfil WHERE idPerfil=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, p.getIdPerfil());
            pstm.execute();
            this.desconectar();
            return true;
        
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
}
