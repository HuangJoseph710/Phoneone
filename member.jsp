<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `phone`";
con.createStatement().execute(sql);

try{
  //從資料庫獲取member
  String email = (String) session.getAttribute("email");
  sql = "SELECT * FROM `member` WHERE email = '" + email + "'";
  ResultSet rs = con.createStatement().executeQuery(sql);
  if(rs.next()){

%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      <title>member</title>
      <link rel="stylesheet" href="css/index.css">
      <link rel="stylesheet" href="css/member.css">

      <script>
        function switchTab(tabId) {
            const tabs = document.querySelectorAll('.tab');
            const contents = document.querySelectorAll('.content');

            tabs.forEach((tab) => {
                if (tab.id === tabId) {
                    tab.classList.add('active');
                } else {
                    tab.classList.remove('active');
                }
            });

            contents.forEach((content) => {
                if (content.id === tabId) {
                    content.classList.add('active');
                } else {
                    content.classList.remove('active');
                }
            });
        }
    </script>
  </head>
  <body>
    <header>
      <div class='container'>
        <nav class="navbar navbar-expand-md navbar-light fixed-top header-color">
          <a class="navbar-brand" href="index.jsp"><img src='photo/logo.png' width='155'></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
      
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link nav-text" href="index.jsp" id="backToIndex">回首頁</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </header>
	
	<form method="post" action="check_member.jsp" >
		<div class="member">
			<h1>會員資料</h1>
			
			<div class="mgroup">
				<label for="name">姓名:</label>
				<input type="text" id="name" name="name" value="<%= rs.getString("name") %>">
			</div>
			
			<div class="mgroup">
				<label for="phone">電話:</label>
				<input type="text" id="phone" name="phone" value="<%= rs.getString("tel") %>">
			</div>
			
			<div class="mgroup">
			  <label for="birthday">生日:</label>
				<input type="date" id="birthday" name="birthday" value="<%= rs.getString("birth") %>">
			</div>
			
			<div class="mgroup">
			  <label for="password">密碼變更:</label>
				<input type="password" id="password" name="password" value="<%= rs.getString("password") %>">
			</div>
			
			<div class="button-container">
				<input class="button" type="submit" value="儲存">
			</div>
		</div>
	</form>

<%
  } else {
    con.close();
    out.print("<script>");
    out.print("alert('連線逾時，請重新登入');");
    out.print("window.location.href='login.html';");
    out.print("</script>");
  }
} catch (Exception sExec) {
  con.close();
  out.println("SQL錯誤"+sExec.toString());
  out.print("<script>");
  out.print("alert('連線逾時，請重新登入');");
  out.print("window.location.href='login.html';");
  out.print("</script>");
}

%>

      <div class="tabs">
        <div class="tab active" id="shopping-history" onclick="switchTab('shopping-history')">歷史訂單</div>
        <div class="tab" id="message-history" onclick="switchTab('message-history')">評論紀錄</div>
      </div>

<%  
		String url2="jdbc:mysql://localhost/?serverTimezone=UTC";
		Connection con2=DriverManager.getConnection(url2,"root","1234");   
				
		if(con2.isClosed()) {
            out.println("連線建立失敗");}
    else {	
	
			con2.createStatement().execute("USE `phone`");

			String sql2 = "SELECT * FROM `order_form` WHERE `email` = '" + session.getAttribute("email") + "'";
			ResultSet rs2 =  con2.createStatement().executeQuery(sql2);

			while(rs2.next()){			

	%>

  <div class="content active" id="shopping-history">
        <p>商品名稱: <%= rs2.getString(3) %> </p>
        <p>商品數量: <%= rs2.getString(5) %></p>
        <p>金額: $ <%= rs2.getString(6)%></p>
  </div>
				             
<%
			
		  }
      con2.close();
    }

        
%>

<%  
		String url3="jdbc:mysql://localhost/?serverTimezone=UTC";
		Connection con3=DriverManager.getConnection(url3,"root","1234");   
				
		if(con3.isClosed()) {
            out.println("連線建立失敗");}
    else {	
	
			con3.createStatement().execute("USE `phone`");

			String sql3 = "SELECT * FROM `message` WHERE `email` = '" + session.getAttribute("email") + "'";
			ResultSet rs3 =  con3.createStatement().executeQuery(sql3);

			while(rs3.next()){			

	%>

  <div class="content" id="message-history">
        <p>留言時間: <%=rs3.getString(3)%></p>
        <p>評論星等: <%=rs3.getString(4)%></p>
        <p>留言內容: <%=rs3.getString(2)%></p>
  </div>
				             
<%
			
		  }
      con3.close();
    }

        
%>
      




    </div>
  </body>

</html>

