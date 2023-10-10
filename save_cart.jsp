<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%
//<script>

try {
    Class.forName("com.mysql.jdbc.Driver");	  
    try {
        //獲取資料
        String data = request.getParameter("data");
        String[] dataArray = data.split("a");

        String email = (String) session.getAttribute("email");

		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		Connection con=DriverManager.getConnection(url,"root","1234");   
        String sql="USE `phone`";
        con.createStatement().execute(sql);
        
        //select 所有這個user的cart
        sql = "SELECT * FROM `cart` WHERE `email` = '" + email + "'" ;
		ResultSet rs =  con.createStatement().executeQuery(sql);

        int i = 0;
        int row = 0;
        //依序更新數量
        while (rs.next()) {
            sql = "UPDATE `cart` SET `product_q` = '" +  dataArray[i]
            + "' WHERE `cid` = '" + rs.getString(1) + "'";
            row = con.createStatement().executeUpdate(sql);
            i += 1;
        }
        
        con.close();

        out.print("<script>");
        out.print("alert('以儲存購物車!');");
        out.print("window.location.href='index.jsp';");
        out.print("</script>");
        
    } catch (SQLException sExec) {
        out.println("SQL錯誤"+sExec.toString());
    }

} catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
%>