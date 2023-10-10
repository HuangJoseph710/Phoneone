<%@ page import = "java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.removeAttribute("email");
    session.removeAttribute("name");
    out.print("<script>");
    out.print("alert('已成功登出!');");
    out.print("window.location.href='index.jsp';");
    out.print("</script>");
%>