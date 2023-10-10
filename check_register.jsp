<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>

<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `phone`";
con.createStatement().execute(sql);

//檢查註冊資料是否為空
if(request.getParameter("email") !=null && !request.getParameter("email").equals("") 
	&& request.getParameter("password") != null && !request.getParameter("password").equals("") 
	&& request.getParameter("bday") != null && !request.getParameter("bday").equals("")){

    //檢查信箱是否已被註冊過
    sql = "SELECT * FROM member WHERE email ='" + request.getParameter("email") + "'";
    ResultSet rs = con.createStatement().executeQuery(sql);
    if (!rs.next()){
        //檢查輸入的兩次密碼是否一樣
        if(request.getParameter("password").equals(request.getParameter("passwordch"))){
            
            sql = "INSERT INTO `member` (`email`, `password`, `birth`, `username`, `name`, `tel`, `addr`) VALUES ('" 
            + request.getParameter("email") +  "','" 
            + request.getParameter("password") +  "','" 
            + request.getParameter("bday") + "','','','','')";
            
            int row = con.createStatement().executeUpdate(sql);
            session.setAttribute("email",request.getParameter("email"));
            con.close();
            out.print("<script>");
            out.print("alert('註冊成功，請接著設定使用者資料');");
            out.print("window.location.href='member.jsp';");
            out.print("</script>");
            
        } else {
            con.close();
            out.print("<script>");
            out.print("alert('兩次密碼不同，請重新輸入。');");
            out.print("window.location.href='register.html';");
            out.print("</script>");
        }
    } else {
        con.close();
        out.print("<script>");
        out.print("alert('該信箱已被註冊過，請至登入頁面登入。');");
        out.print("window.location.href='login.html';");
        out.print("</script>");
    }
    

}
else{
    con.close();
    out.print("<script>");
    out.print("alert('資料未填寫完整，請重新輸入。');");
    out.print("window.location.href='register.html';");
    out.print("</script>");
}
%>
