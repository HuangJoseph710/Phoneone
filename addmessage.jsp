<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
try {
    String email = (String) session.getAttribute("email");
    if (email != null){
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        String sql="USE `phone`";
        con.createStatement().execute(sql);

        //檢查註冊資料是否為空
        if(request.getParameter("message") !=null && !request.getParameter("message").equals("") 
            && request.getParameter("starCount") != null) {
            int starnum = 1;
            try {
                starnum = Integer.parseInt(request.getParameter("starCount"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            
            
            LocalDateTime now = LocalDateTime.now();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateTime = now.format(formatter);
                    
            sql = "INSERT INTO `message` (`msg_content`, `msg_date`, `star`, `email`) VALUES ('" 
            + request.getParameter("message") +  "','" 
            + formattedDateTime +  "','" 
            + starnum +  "','" 
            + email + "')";
            
            int row = con.createStatement().executeUpdate(sql);
            con.close();
            out.print("<script>");
            out.print("alert('留言成功送出!');");
            out.print("window.location.href='index.jsp';");
            out.print("</script>");

        } else{
            con.close();
            out.print("<script>");
            out.print("alert('資料未填寫完整，請重新輸入。');");
            out.print("window.location.href='index.jsp';");
            out.print("</script>");
        }
    } else {
        out.print("<script>");
        out.print("alert('留言前請先登入!');");
        out.print("window.location.href='login.html';");
        out.print("</script>");
    }
} catch (Exception sExec) {
  out.println("SQL錯誤"+sExec.toString());
  out.print("<script>");
  out.print("alert('連線逾時，請重新登入');");
  out.print("window.location.href='login.html';");
  out.print("</script>");
}
%>