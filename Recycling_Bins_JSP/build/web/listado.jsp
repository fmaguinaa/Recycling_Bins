<%-- 
    Document   : listado
    Created on : Jun 28, 2016, 3:23:54 PM
    Author     : frz19x
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <link href="estilo.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Centros</title>
        <link rel="icon" href="https://raw.githubusercontent.com/asdfrz/PDM/master/Proyectov2.0/Proyectov1.0/app/src/main/res/drawable/ic_recycling.png">
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://127.0.0.1/recyclingbins"
            user="root"  password="asd"/>
    </head>
    <body>
        <div id="bienvenida">
            <h2>Recycling Bins</h2>
        </div>

        <ul>
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="listado.jsp">Lista de Centros</a></li>
            <li><a href="login.jsp">Registro</a></li>
        </ul>


        <div id="contenedor">
            <h2>Lista de Centros</h2>
            <table border="1" width="100%">
                <sql:query dataSource="${snapshot}" var="datos">
                    SELECT nombre,tipo from basurero inner join tipobasurero inner join tipo on basurero.id=idbasurero and tipo.id=idtipo  ;
                </sql:query>
                <tr>
                    <th><center>Tipo a Reciclar</center></th>
                    <th><center>Centro</center></th>
                </tr>
                <c:forEach var="row" items="${datos.rows}">
                    <tr>
                        <td><center><c:out value="${row.tipo}"/></center></td>
                        <td><center><c:out value="${row.nombre}"/></center></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
