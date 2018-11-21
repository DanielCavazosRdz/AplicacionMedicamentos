# AplicacionMedicamentos

## Table of contents
- [Resumen Ejecutivo](#Resumen-Ejecutivo)
    * [Descripción](#Descripción) 
    * [Problema identificado](#Problema-identificado)
    * [Solución](#Solución)
    * [Arquitectura](#Arquitectura)
- [Requerimientos](#Requerimientos)
    * [Servidores de aplicación](#Servidores-de-aplicación)
    * [Paquetes adicionales](#Paquetes-adicionales)
    * [Version de Java](#Version-de-Java)
- [Instalación](#Instalación)
-[Configuración](#Configuración)
    * [Archivo de configuración](#Archivo-de-configuración)
    *[Configuración de base de datos](#Configuración-de-base-de-datos)
-[Uso](#Uso)
    *[Administradores](#Administradores)
    *[Empleados](#Empleados)
-[Contribución](#Contribución)
-[Roadmap](#Roadmap)




## Resumen Ejecutivo:


### Descripción:
Esta aplicación es un sistema de medicamentos, el cual puedes tener una multitud de medicamentos, que vienen de diferentes proveedores y decidir los usuarios que pueden ingresar a esta información, asi como declarar cuales son los usuarios que pueden cambiar esta información.

### Problema identificado:
Dentro de una empresa, se habia identificado que su sistema estaba muy anticuado en la forma que realizan sus actividades, algunos ejemplos de esto seria que se tenian que acordar de un numero de un medicamento para seleccionarlo.

### Solución:
Este sistema sirve como una forma mas facil de accesar a esa información, algunos ejemplos seria que puedes encontrar el medicamento por nombre y realizar el cambio que necesitas realizar, o hasta la creación de medicamentos, no se necesita ingresar un id, ya que la base de datos lo ingresa automaticamente.

### Arquitectura:
La aplicación tiene la arquitectura de una aplicación web, esto para que toda la información sea mas accesible. la base de datos se ingresaria por una forma de localhost y la aplicación se comunica por hibernate.


## Requerimientos:

### Servidores de aplicación:
Se neesitara una forma de crear un servicio localhost. un ejemplo de estos servicios seria Xampp

### Paquetes adicionales:
Como es un proyecto maven, todos los paquetes adicionales se deberian de descargar al implementar este proyecto en tu IDE respectivo.

### Version de Java:
Esta aplicacion fue creada con la version 1.8.0 de java.


## Instalación:
Para que pueda correr de la mejor manera, recomiendo que usen el IDE de Netbeans, solo seleccionan abrir proyecto en el IDE y deberia de abrir correctamente.
Para correr el proyecto para pruebas, dentro del IDE de netbeans, solo tienes que seleccionar cualquier archivo del proyecto y darle clic al boton de ejecutar, con eso te deberia de lanzar a tu navegador preferido y se desplegara la pagina de inicio.


## Configuración:
### Archivo de configuración:
    hibernate.cfg.xml

### Configuración de base de datos:
Para la base de datos, aqui les adjunto un [link para el dump de base de datos en mysql](https://drive.google.com/open?id=1Lij0XryMiDQo39zD0h8wtzzRAlYrotV3), esto para que no occuran problemas. Solo tienes que usar phpMyadmin o mysqlworkbench para hacer el import de esta base de datos. Tambien viene con informacion como ejemplo, esto se puede eliminar si gustan. Despues, tendras que navegar al tab de servicios y crear una nueva conexion a la base de datos creada. Tambien, para que se comunique correctamente, se tendra que entrar al archivo hibernate.cfg.xml y cambiar el hibernate.connection.username y hibernate.connection.password a su respectivo usuario y contraseña de su base de datos.


## Uso:
Este software, cuenta con 2 diferentes usuarios, los administradores y los empleados.

### Administradores:
Los administradores seran los usuarios que pueden configurar la información de la base de datos, esto incluye crear, modificar y eliminar medicamentos, proveedores y usuarios al sistema.

### Empleados:
Los empleados no pueden configurar la informacion, solo pueden ver el catalogo de medicamentos en el sistema.


## Contribución:
Si alguien quiere contribuir, seria crear un nuevo branch el cual le podrias agruegar lo que consideran agruegar, ya despues me contactan para que los pueda incluir en el proyecto como contribuidor, y con eso ya podrian realizar los cambios que hicieron y se reflejaria en el branch master.

## Roadmap:
Este software se podrian implementar mas modulos y funciones como la integracion de ordenes de medicamento, la venta de medicamentos que actualize la base de datos e implementación de facturas en el sistema.

