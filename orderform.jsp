<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Phoneone 訂單總表_後台</title>
        <link rel="stylesheet" href="css/shoppingcart.css">
        <link rel="stylesheet" href="css/index.css">
    </head>
    <style>
    tr:hover{
        color: #0066ff;
        background-color: #dae43844;
    }
    </style>
<body>
<%
try {
  String email = (String) session.getAttribute("email");
  if(email.equals("admin@gmail.com")){
%>
    <header>
        <div class='container'>
            <nav class="navbar navbar-expand-md navbar-light fixed-top header-color">
                <a class="navbar-brand" href="index.jsp"><img src='photo/logo.png' width='155'></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item d-flex userHrefContainer">
                            <a class="nav-link nav-text" href="logout.jsp">登出</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header><br/>

    <div class="col-xl-12">
        <div class="row margintop">
            <div class="col-xl-2">
                <div class="class="list-group-item list-group-item-action active aria-current="true">
                <a class="list-group-item list-group-item-action" href="./backstage.jsp" style="text-align: center; width: 200px; margin-left: 60px; background-color:#d9d9d9;color: #23305c; border-radius: 10px 10px 0 0;"></border>管理商品</a>
                <a class="list-group-item list-group-item-action" href="./reply.jsp" style="text-align: center; width: 200px; margin-left: 60px; background-color:#d9d9d9;color: #23305c; ">查看留言</a>
                <a class="list-group-item list-group-item-action" href="./orderform.jsp" style="text-align: center; width: 200px; margin-left: 60px; background-color:#d9d9d9;color: #23305c; border-radius: 0 0 10px 10px;">訂單總表</a>
                </div>
            </div>
        </div>

        <div class="cart" style="max-width: 100%;">
            <div>
                <div class="table-center" style="text-align:center";>
                    <style type="text/css">
                    #container {
                        margin: 0 auto; width: 100%;
                    }
                    td {
                        padding: 5px;
                    }
                    </style>
                    <h1 style="text-align:center">訂單總表_後台</h1>
                    <div class="col-xl-10 margintop mx-auto">
                        <hr style="color:#542c1e; border-bottom-style: solid; border-width: 2px; width: 100%;">
                        <table class="table-style mx-auto" style="max-width: 100%;" border="1">
                            <tr>
                                <td><h3 style="">帳號</h3></td>
                                <td><h3 style="">名稱</h3></td>
                                <td><h3 style="">數量</h3></td>
                                <td><h3 style="">價格</h3></td>
                                <td><h3 style="">訂購者</h3></td>
                                <td><h3 style="">城市</h3></td>
                                <td><h3 style="">地址</h3></td>
                                <td><h3 style="">電話</h3></td>
                                <td><h3 style="">備註</h3></td>
                            </tr>
                            <form>
<%  
try {
    Class.forName("com.mysql.jdbc.Driver");	  
    try {
 
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		Connection con=DriverManager.getConnection(url,"root","1234");   
				
		if(con.isClosed())
            out.println("連線建立失敗");
        else {	
	
			con.createStatement().execute("USE `phone`");

			String sql = "SELECT * FROM `order_form`" ;
			ResultSet rs =  con.createStatement().executeQuery(sql);

			while(rs.next()){			

	%>
				<tr style="height: 80px">
                    <td><h6><%= rs.getString(3) %></h6></td>
                    <td><h6><%= rs.getString(2) %></h6></td>
                    <td><h6><%= rs.getString(5) %>個</h6></td>
                    <td><h6>$<span class="sub"><%= rs.getString(6) %></span></h6></td>
                    <td><h6><%= rs.getString(7) %></h6></td>                
                    <td><h6><%= rs.getString(8) %></h6></td>                
                    <td><h6><%= rs.getString(9) %></h6></td>
                    <td><h6><%= rs.getString(10) %></h6></td>
                    <td><h6><%= rs.getString(11) %></h6></td>           
                </tr>                
<%
			
		    }
				
            con.close();
        }
    } catch (SQLException sExec) {
        out.println("SQL錯誤"+sExec.toString());
    }

} catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
        
%>
                            </form>
                            <tr>
                              <td colspan="9"><p style="text-align: right; font-size: 25px; font-style:italic;"><strong>總金額：NT$ <span id="ctotal">1350</span>&emsp;</strong></p></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div><br><br><br><br>
<%
  } else {
    out.print("<script>");
    out.print("alert('你不是管理者，請回到首頁。');");
    out.print("window.location.href='index.jsp';");
    out.print("</script>");
  }
} catch (Exception e) {
    out.print("<script>");
    out.print("alert('請先登入!');");
    out.print("window.location.href='login.html';");
    out.print("</script>");
}
%>
    </body>
    
    <script>
        function countTotal(){
            var subElements = document.getElementsByClassName("sub");
            var sum = 0;

            for (var i = 0; i < subElements.length; i++) {
                var text = subElements[i].textContent;
                var number = parseInt(text);

                if (!isNaN(number)) {
                sum += number;
                }
            }

            var ctotal = document.getElementById("ctotal");
            ctotal.textContent = sum;
        }
        countTotal();
    </script>

    <script>
        //收到inddex.html傳來的username
        var searchParams = new URLSearchParams(window.location.search);
        var name = searchParams.get("name");

        //點擊右上角回首頁傳到index.html
        function handleUserDetail(event) {
        event.preventDefault(); 
        
        window.location.href = "index.html?name=" + encodeURIComponent(name);
        }
        var backToIndex = document.getElementById("backToIndex");
        backToIndex.addEventListener("click", handleUserDetail);
    </script>
</html>


