<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>

<%
String email = (String) session.getAttribute("email");
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `phone`";
con.createStatement().execute(sql);

//檢查註冊資料是否為空
if(request.getParameter("name") !=null && !request.getParameter("name").equals("") 
	&& request.getParameter("phone") != null && !request.getParameter("phone").equals("") 
	&& request.getParameter("password") != null && !request.getParameter("password").equals("") 
	&& request.getParameter("birthday") != null && !request.getParameter("birthday").equals("")){

    sql = "UPDATE `member` SET `password` = '" +  request.getParameter("password")
    + "', `username` = '', `name` = '" + request.getParameter("name")
    + "', `tel` = '" + request.getParameter("phone")
    + "', `addr` = '', `birth` = '" + request.getParameter("birthday")
    + "' WHERE `email` = '" + email + "'";

    int row = con.createStatement().executeUpdate(sql);
    session.setAttribute("name",request.getParameter("name"));
    con.close();
    out.print("<script>");
    out.print("alert('資料更新成功，請前往首頁瀏覽');");
    out.print("window.location.href='index.jsp';");
    out.print("</script>");


}
else{
    con.close();
    out.print("<script>");
    out.print("alert('資料未填寫完整，請重新輸入。');");
    out.print("window.location.href='member.jsp';");
    out.print("</script>");
}
%>
