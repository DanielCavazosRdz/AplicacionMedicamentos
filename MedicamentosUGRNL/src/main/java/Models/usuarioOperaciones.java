/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Daniel
 */
public class usuarioOperaciones {
    
    public ArrayList<Usuario> getUsuarios(){    
        SessionFactory sesion= HibernateUtil.getSessionFactory();
        Session session= sesion.openSession();
        Transaction tx = session.beginTransaction();
        ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
        Query q = session.createQuery("from Usuario");
        List<Usuario> lista= q.list();
        Iterator<Usuario> iter= lista.iterator();
        tx.commit();
        session.close();
        while(iter.hasNext()){
            Usuario noti = (Usuario) iter.next();
            usuarios.add(noti);
        }
        return usuarios;
    }
    
    public boolean Login(String user, String pass){
        SessionFactory sesion= HibernateUtil.getSessionFactory();
        Session session= sesion.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Usuario");
        List<Usuario> lista= q.list();
        Iterator<Usuario> iter= lista.iterator();
        tx.commit();
        session.close();
        while(iter.hasNext()){
            Usuario noti = (Usuario) iter.next();
            if(noti.getNombre().equals(user)&&noti.getPass().equals(pass)){
               return true; 
            }
        }
        return false;
    }
    
    public int getRol(String user, String pass){
        SessionFactory sesion= HibernateUtil.getSessionFactory();
        Session session= sesion.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Usuario");
        List<Usuario> lista= q.list();
        Iterator<Usuario> iter= lista.iterator();
        tx.commit();
        session.close();
        while(iter.hasNext()){
            Usuario noti = (Usuario) iter.next();
            if(noti.getNombre().equals(user)&&noti.getPass().equals(pass)){
               return noti.getRol();
            }
        }
        return 0;
    }
    
    public void addUsuario(String nombre, String pass, int rol){
        try{
            SessionFactory sesion= HibernateUtil.getSessionFactory();
            Session session= sesion.openSession();
            Usuario usr = new Usuario();
            usr.setNombre(nombre);
            usr.setPass(pass);
            usr.setRol(rol);
            session.save(usr);
            session.beginTransaction().commit();
            session.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    public void updateUsuario(int id, String nombre, String pass, int rol){
        try{
            SessionFactory sesion= HibernateUtil.getSessionFactory();
            Session session= sesion.openSession();
            Usuario usr = new Usuario();
            usr.setId(id);
            usr.setNombre(nombre);
            usr.setPass(pass);
            usr.setRol(rol);
            session.update(usr);
            session.beginTransaction().commit();
            session.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    public void deleteUsuario(int id){
        try{
            SessionFactory sesion= HibernateUtil.getSessionFactory();
            Session session= sesion.openSession();
            Usuario usr = new Usuario();
            usr.setId(id);
            session.delete(usr);
            session.beginTransaction().commit();
            session.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
}

