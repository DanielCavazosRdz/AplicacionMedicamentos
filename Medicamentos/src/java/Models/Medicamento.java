/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Daniel
 */
public class Medicamento {
    int id;
    String nombre;
    int proveedorId;
    float costo;
    float venta;
    int inventario;
    float porcentajeGanancia;
    
    Medicamento(){
        id = 0;
        nombre = "";
        proveedorId = 0;
        costo = 0;
        venta = 0;
        inventario = 0;
        porcentajeGanancia = 0;
    }
    
    Medicamento(int id, String nombre, int proveedorId, float costo, float venta, int inventario, float porcentajeGanancia){
        this.id = id;
        this.nombre = nombre;
        this.proveedorId = proveedorId;
        this.costo = costo;
        this.venta = venta;
        this.inventario = inventario;
        this.porcentajeGanancia = porcentajeGanancia;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getProveedorId() {
        return proveedorId;
    }

    public void setProveedorId(int proveedorId) {
        this.proveedorId = proveedorId;
    }

    public float getCosto() {
        return costo;
    }

    public void setCosto(float costo) {
        this.costo = costo;
    }

    public float getVenta() {
        return venta;
    }

    public void setVenta(float venta) {
        this.venta = venta;
    }

    public int getInventario() {
        return inventario;
    }

    public void setInventario(int inventario) {
        this.inventario = inventario;
    }

    public float getPorcentajeGanancia() {
        return porcentajeGanancia;
    }

    public void setPorcentajeGanancia(float porcentajeGanancia) {
        this.porcentajeGanancia = porcentajeGanancia;
    }
    
    
    
}
