<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");	  
    try {
 
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		Connection con=DriverManager.getConnection(url,"root","1234");   
				
        String sql="USE `phone`";
        con.createStatement().execute(sql);
        
        String email = (String) session.getAttribute("email");
        

        sql = "INSERT INTO `cart` (`email`, `product_name`, `product_pic`) VALUES('" 
        + email  +  "','" 
        + request.getParameter("product")  +  "','" 
        + request.getParameter("phoneimg") + "')";
        int row = con.createStatement().executeUpdate(sql);
        con.close();
        out.print("<script>");
        out.print("alert('已加入購物車！請回到首頁繼續瀏覽~');");
        out.print("window.location.href='index.jsp';");
        out.print("</script>");
        
        con.close();
        
    } catch (SQLException sExec) {
        out.println("SQL錯誤"+sExec.toString());
    }

} catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
        

%>