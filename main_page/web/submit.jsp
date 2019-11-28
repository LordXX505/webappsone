<%--
  Created by IntelliJ IDEA.
  User: Think
  Date: 2019/11/27
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="java.util.*" import="java.lang.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String username="admin";
    String userpwd="123";
    Cookie uesrnameCookie = new Cookie("username",request.getParameter("username"));
    Cookie visittimesCookie = new Cookie("visitTimes", "0");
    response.addCookie(uesrnameCookie);
    response.addCookie(visittimesCookie);
    if(request.getParameter("Username").equals(username)&&request.getParameter("Password").equals(userpwd))
    {
        session.setAttribute("judge","ok");
        session.setAttribute("username",request.getParameter("Username"));
        response.sendRedirect("index.jsp");
    }
    else
    {
        request.getRequestDispatcher("log.jsp").forward(request,response);
    }
%>
</body>
</html>
