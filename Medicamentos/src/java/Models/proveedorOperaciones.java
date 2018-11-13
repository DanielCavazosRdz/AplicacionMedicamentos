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
public class proveedorOperaciones {
    
    public ArrayList<Proveedor> getProveedores(){    
        SessionFactory sesion= HibernateUtil.getSessionFactory();
        Session session= sesion.openSession();
        Transaction tx = session.beginTransaction();
        ArrayList<Proveedor> proveedores = new ArrayList<Proveedor>();
        Query q = session.createQuery("from Proveedor");
        List<Proveedor> lista= q.list();
        Iterator<Proveedor> iter= lista.iterator();
        tx.commit();
        session.close();
        while(iter.hasNext()){
            Proveedor noti = (Proveedor) iter.next();
            proveedores.add(noti);
        }
        return proveedores;
    }
    
    public void addProveedor(String nombre, String direccion){
        try{
            SessionFactory sesion= HibernateUtil.getSessionFactory();
            Session session= sesion.openSession();
            Proveedor prov = new Proveedor();
            prov.setNombre(nombre);
            prov.setDireccion(direccion);
            session.save(prov);
            session.beginTransaction().commit();
            session.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    public void updateProveedor(int id, String nombre, String direccion){
        try{
            SessionFactory sesion= HibernateUtil.getSessionFactory();
            Session session= sesion.openSession();
            Proveedor prov = new Proveedor();
            prov.setId(id);
            prov.setNombre(nombre);
            prov.setDireccion(direccion);
            session.update(prov);
            session.beginTransaction().commit();
            session.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    public void deleteProveedor(int id){
        try{
            SessionFactory sesion= HibernateUtil.getSessionFactory();
            Session session= sesion.openSession();
            Proveedor prov = new Proveedor();
            prov.setId(id);
            session.delete(prov);
            session.beginTransaction().commit();
            session.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
