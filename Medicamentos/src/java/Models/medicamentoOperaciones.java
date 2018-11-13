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
public class medicamentoOperaciones {
    
    public ArrayList<Medicamento> getMedicamentos(){    
        SessionFactory sesion= HibernateUtil.getSessionFactory();
        Session session= sesion.openSession();
        Transaction tx = session.beginTransaction();
        ArrayList<Medicamento> medicamentos = new ArrayList<Medicamento>();
        Query q = session.createQuery("from Medicamento");
        List<Medicamento> lista= q.list();
        Iterator<Medicamento> iter= lista.iterator();
        tx.commit();
        session.close();
        while(iter.hasNext()){
            Medicamento noti = (Medicamento) iter.next();
            medicamentos.add(noti);
        }
        return medicamentos;
    }
    
    public void addMedicamento(String nombre, int proveedorId, float costo, float venta, int inventario, float porcentajeGanancia){
        try{
            SessionFactory sesion= HibernateUtil.getSessionFactory();
            Session session= sesion.openSession();
            Medicamento medi = new Medicamento();
            medi.setNombre(nombre);
            medi.setCosto(costo);
            medi.setProveedorId(proveedorId);
            medi.setVenta(venta);
            medi.setInventario(inventario);
            medi.setPorcentajeGanancia(porcentajeGanancia);
            session.save(medi);
            session.beginTransaction().commit();
            session.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    public void updateMedicamento(int id, String nombre, int proveedorId, float costo, float venta, int inventario, float porcentajeGanancia){
        try{
            SessionFactory sesion= HibernateUtil.getSessionFactory();
            Session session= sesion.openSession();
            Medicamento medi = new Medicamento();
            medi.setId(id);
            medi.setNombre(nombre);
            medi.setCosto(costo);
            medi.setProveedorId(proveedorId);
            medi.setVenta(venta);
            medi.setInventario(inventario);
            medi.setPorcentajeGanancia(porcentajeGanancia);
            session.update(medi);
            session.beginTransaction().commit();
            session.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    public void deleteMedicamento(int id){
        try{
            SessionFactory sesion= HibernateUtil.getSessionFactory();
            Session session= sesion.openSession();
            Medicamento medi = new Medicamento();
            medi.setId(id);
            session.delete(medi);
            session.beginTransaction().commit();
            session.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    
    
}
