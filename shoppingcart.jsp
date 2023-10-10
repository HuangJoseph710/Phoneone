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
        <title>Shoppingcart</title>
        <link rel="stylesheet" href="css/shoppingcart.css">
        <link rel="stylesheet" href="css/index.css">
    </head>

    <body>
<%
//判斷是否已登入
	String email = (String) session.getAttribute("email");
	String name = (String) session.getAttribute("name");
	if (email != null) {
    //判斷用戶是否已完成資料填寫
		if (name == null) {
			out.print("<script>");
			out.print("alert('資料未填寫完整，請先填寫會員資料。');");
			out.print("window.location.href='member.jsp';");
			out.print("</script>");
		} else {


%>
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

        <div class="cart">
            <div class="header">
                <h1>購物車</h1>
            </div>
        
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `phone`";
con.createStatement().execute(sql);

//抓取用戶的購物車清單
sql = "SELECT * FROM `cartview` WHERE `email`='" +email + "'"; 
ResultSet rs =con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
int subtotal = 0;
int total = 0;

//如果購物車裡沒有東西，顯示回去購物
if (rs.next()) {

    // 重置 ResultSet 指標回到第一個之前
    rs.beforeFirst();

    while(rs.next()){
        //計算各個商品的小計
        subtotal = rs.getInt(5) * rs.getInt(6);
%>
            <div class="cart-item">
                <img src="<%= (String)rs.getString(4) %>" alt="product pic">
                <div class="cartdetails">
                    <div class="ctitle"><%= rs.getString(3) %></div>
                    <div class="cprice">$
                        <span id="price<%= rs.getString(1) %>"><%= rs.getInt(5) %></span>
                    </div>
                </div>
                <div class="quantity">
                    <input type="number" min="1" id="quantity<%= rs.getString(1) %>" value="<%= rs.getString(6) %>">
                </div>
                <div class="subtotal">小計$
                    <span class="sub" id="subtotal<%= rs.getString(1) %>"><%= subtotal %></span>
                </div>
                <form method="post" action="delcart.jsp">
                    <input type="hidden" name="cid" value="<%= rs.getString(1) %>">
                    <input type="submit" class="delete-btn" value="刪除">
                </form>
            </div>

            <script>
                // 獲取 數量、小計、總計
                var quantity<%= rs.getString(1) %> = document.getElementById("quantity<%= rs.getString(1) %>");
                var price<%= rs.getString(1) %> = document.getElementById("price<%= rs.getString(1) %>");
                var subtotal<%= rs.getString(1) %> = document.getElementById("subtotal<%= rs.getString(1) %>");

                // 監聽input改變事件
                quantity<%= rs.getString(1) %>.addEventListener("input", function() {
                    var newValue<%= rs.getString(1) %> = quantity<%= rs.getString(1) %>.value; //獲取更動的值
                    subtotal<%= rs.getString(1) %>.textContent =(parseInt(newValue<%= rs.getString(1) %>) * parseInt(price<%= rs.getString(1) %>.textContent)); // 更新subtotal
                    countTotal();
                });
            </script>
<%
        //累計小計成為總計
        total = total + subtotal;
    }
    con.close();

%>

            <form method="post" action="addorder.jsp">
                <div class="shipping">
                    <div class="leftcolumn">
                        <div class="form1">
                            <label for="recipient">收件人</label>
                            <input type="text" name="recipient" id="recipient" placeholder="請輸入收件人姓名">
                        </div>
                        <div class="form1">
                            <label for="contact">聯絡方式</label>
                            <input type="text" name="contact" id="contact" placeholder="請輸入聯絡方式">
                        </div>
                    </div>
                    <div class="rightcolumn">
                        <div class="form1">
                            <label for="send">寄送地址</label>
                            <select id="send" name="send">
                                <option value="台北市">台北市</option>
                                <option value="新北市">新北市</option>
                                <option value="桃園市">桃園市</option>
                                <option value="台中市">台中市</option>
                                <option value="台南市">台南市</option>
                                <option value="高雄市">高雄市</option>
                                <option value="宜蘭縣">宜蘭縣</option>
                                <option value="新竹縣">新竹縣</option>
                                <option value="新竹市">新竹市</option>
                                <option value="苗栗縣">苗栗縣</option>
                                <option value="彰化縣">彰化縣</option>
                                <option value="南投縣">南投縣</option>
                                <option value="雲林縣">雲林縣</option>
                                <option value="嘉義縣">嘉義縣</option>
                                <option value="嘉義市">嘉義市</option>
                                <option value="屏東縣">屏東縣</option>
                                <option value="花蓮縣">花蓮縣</option>
                                <option value="台東縣">台東縣</option>
                                <option value="澎湖縣">澎湖縣</option>
                                <option value="基隆市">基隆市</option>
                            </select>
                        </div>
                        <div class="form1">
                            <label for="address">地址</label>
                            <input type="text" name="address" id="address" placeholder="請輸入地址">
                        </div>
                    </div>
                </div>
            
            

                <div class="notes">
                    <textarea rows="3" name="memo" placeholder="請輸入備註"></textarea>
                </div>
                
                
                
                <!--新增產品-->
                
                <div class="total" id="total">總計: $
                    <span id="ctotal"><%= total %></span>
                </div>
                <input type="submit" value="結帳" class="checkout-btn">
                <%-- <a href="index.jsp" class="checkout-btn" onclick="showAlert()">結帳</a> --%>
                
            </form>
            <button id="saveChange" class="checkout-btn">儲存修改，並繼續購物</button>
            
        </div>


        <script>
        //儲存修改後的數量
            var saveChangeButton = document.getElementById('saveChange');

            saveChangeButton.addEventListener('click', function() {
                var inputs = document.querySelectorAll('input[type="number"]');
                var values = [];

                for (var i = 0; i < inputs.length; i++) {
                values.push(inputs[i].value);
                }

                var data = values.join('a');

                window.location.href = 'save_cart.jsp?data=' + encodeURIComponent(data);
            });
        </script>
        
        <script>
        //隨時更正總計
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
        </script>

        <script>
            function showAlert(){
                alert("感謝您的購買(ﾉ∀`*)~~!請確保您選擇之手機殼與您的手機型號相符!如您有特殊要求或緊急狀況，請與客服聯繫，我們會盡快為您服務~!");
                window.location.href='index.jsp';
            }
        </script>




<%
} else {
    out.print("尚未有商品在購物車，請回到首頁瀏覽商品");
}
    }
	} else {
    out.print("<script>");
    out.print("alert('連線逾時，請重新登入');");
    out.print("window.location.href='login.html';");
    out.print("</script>");
  }

%>
    </body>
</html>


