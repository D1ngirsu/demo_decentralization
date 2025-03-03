<%-- 
    Document   : list
    Created on : Feb 5, 2025, 11:19:40 AM
    Author     : sonnt-local
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        ${1+1} <br/>
        ${"I love"}${"sonnt"} <br/>
        ${1 eq 1?"sonnt":"Female"} <br/>
        ${requestScope.rects[0].w} <br/>
        ${param.num} <br/>


        <canvas id="myCanvas" width="500" height="500" style="border:1px solid grey"></canvas>

        <script>
            const c = document.getElementById("myCanvas");
            const ctx = c.getContext("2d");
            <c:forEach items="${requestScope.rects}" var="r" varStatus="loop">
                <c:if test="${loop.index mod 2 eq 0}">
                    <c:if test="${r.x ge 200}">
                    ctx.fillStyle = "red";
                    ctx.fillRect(${r.x}, ${r.y}, ${r.w}, ${r.h});
                    </c:if>
                ctx.beginPath();
                ctx.rect(${r.x}, ${r.y}, ${r.w}, ${r.h});
                ctx.stroke();
                </c:if>
            </c:forEach>
        </script> 
    </body>
</html>
