<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*,java.util.*,javax.swing.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>My User Center</title>

<style>
       
       body{
    		font-size: 20px;
            display: flex;
            overflow: hidden;
            align-items: center;
            justify-content: center;
            height: 100%;
            
        }
        input{
            text-align: center;
            border:none; 
            background-color: rgba(239, 248, 250, 0.1);
            border-bottom:1px solid rgb(80, 196, 241);
            width: 260px;
        }
 
       p{
          	margin: 3px 0px 32px;
            text-align: center;
            color: rgb(116, 114, 114);
        }
        .main{
       
            margin-top: 20px;
            width: 950px;
           float:center;
            overflow:hidden;
			zoom:1;
          
        }
        .favoriteBox{
        margin-left: 20px;
        margin-top: 20px;
        width: 900px;
        height:220px;
        float:center;
        background: #F1E1FF;
        box-shadow: 7px 7px 17px rgba(246, 250, 250, 0.4);
        border-radius:15px;
        }
        .title{
            color: white;
            text-align: center;
        }
  </style>

</head>

<body>

<div class="main">
 <%
    Object userID  =  session.getAttribute("userID");
    //out.print(userID);
    String url = "jdbc:mysql://47.113.179.20:3306/agile_mysql?user=root&password=password&userUnicode=true&characterEncoding=GB2312&serverTimezone=UTC";
	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();//加载驱动程序
	Connection conn = DriverManager.getConnection(url);
	try {

		//if (!conn.isClosed())
			//out.print("Succeeded connecting to the Database!");
		//2.创建statement类对象，用来执行SQL语句！！
		Statement statement = conn.createStatement();
		//要执行的SQL语句
		String sql = "select * from user WHERE UserID ='"+userID+"'";
		//3.ResultSet类，用来存放获取的结果集！！
		ResultSet res = statement.executeQuery(sql);
		
			while (res.next()) {
				
	%>
	
       
        <div class="favoriteBox" >
        
        <p >我的ID：<td align="center"  height="55"><%=res.getString(1)%></td></p>
        <p >我的昵称：<td align="center"  height="55"><%=res.getString(2)%></td></p>
        <p >我的密码：<td align="center"  height="55"><%=res.getString(3).replaceAll("(\\d{0})\\d{3}(\\d{0})","$1****$2")%></td></p>
            </div>
          
<%
			}
	
				
	}  catch (SQLException e) {
		//数据库连接失败异常处理
		e.printStackTrace();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	} finally {
		//out.print("数据库数据成功获取！！");
	}
	
    %>
      </div>
      

</body>
</html>