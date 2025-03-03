<%-- 
    Document   : list
    Created on : Feb 5, 2025, 10:36:43 AM
    Author     : sonnt-local
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="data.Student" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .dataRow
            {
                background-color: gray;
            }
        
        </style>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Dob</td>
            </tr>
            <c:forEach items="${requestScope.students}" var="s">
            <tr class="dataRow">
                <td>${s.id}</td>
                <td>${s.name}</td>
                <td>
                    <c:if test="${s.gender}">
                        <img width="16" height="16" src="../img/student/male.png" alt=""/>
                    </c:if>
                    <c:if test="${!s.gender}">
                        <img width="16" height="16" src="../img/student/female.png" alt=""/>
                    </c:if>
                </td>
                <td><fmt:formatDate type = "date" 
         value = "${s.dob}" /></td>
            </tr>
           </c:forEach>
        </table>
    </body>
</html>
