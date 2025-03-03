<%-- 
    Document   : create
    Created on : Mar 3, 2025, 8:16:13 AM
    Author     : sonnt-local
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="create" method="POST">
            Title: <input type="text" name="title"/> <br/>
            Reason:<textarea name="reason"></textarea> <br/>
            From: <input type="date" name="from"/> <br/>
            To: <input type="date" name="to"/> <br/>
            Owner: 
            <select name="eid">
                <c:forEach items="${requestScope.employees}" var="e">
                    <option value="${e.id}"
                            <c:if test="${e.id eq sessionScope.user.employee.id}">
                            selected="selected"
                            </c:if>
                            >
                        ${e.name}
                    </option>
                </c:forEach>
            </select><br/>
            <input type="submit" value="Send"/>
        </form>
    </body>
</html>
