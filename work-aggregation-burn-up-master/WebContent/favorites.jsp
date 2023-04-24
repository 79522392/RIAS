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
<title>My Favorites</title>

<style>
       
       body{
    	
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
            text-align: center;
            color: rgb(116, 114, 114);
        }
        .main{
       
            margin-top: 20px;
            width: 1000px;
           
            overflow:hidden;
			zoom:1;
          
        }
        .favoriteBox{
        margin-left: 20px;
        margin-bottom: 20px;
        width: 300px;
        height:220px;
        float:left;
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
	Object userID = session.getAttribute("userID");
    //out.print(userID);
    String url = "jdbc:mysql://47.113.179.20:3306/agile_mysql?user=root&password=password&userUnicode=true&characterEncoding=GB2312&serverTimezone=UTC";
	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();//加载驱动程序
	Connection conn = DriverManager.getConnection(url);
	try {

		if (!conn.isClosed())
			System.out.println("Succeeded connecting to the Database!");
		//2.创建statement类对象，用来执行SQL语句！！
		Statement statement = conn.createStatement();
		//要执行的SQL语句
		String sql = "";
		
		if(conn != null){// 判断 数据库连接是否为空			
			sql = "SELECT * FROM myfavorites WHERE UserID='" + userID + "'";

			ResultSet res = statement.executeQuery(sql);
			while (res.next()) {
	%>
	
       
        <div class="favoriteBox" onclick="window.open('<%=res.getString(11)%>');">
        
        <p >职位名称：<td align="center"  height="55"><%=res.getString(3)%></td></p>
        <p >公司名称：<td align="center"  height="55"><%=res.getString(4)%></td></p>
        <p >工作薪资：<td align="center"  height="55"><%=res.getString(5)%></td></p>
        <p >工作地点：<td align="center"  height="55"><%=res.getString(6)%></td></p>
       
        <p >经验需求：<td align="center"  height="55"><%=res.getString(8)%></td></p>
        <p >学历需求：<td align="center"  height="55"><%=res.getString(9)%></td></p>
        <p >职位类别：<td align="center"  height="55"><%=res.getString(10)%></td></p>
            
            </div>
          
<% 
		}
		}			
	}  catch (SQLException e) {
		//数据库连接失败异常处理
		e.printStackTrace();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	} finally {
		System.out.println("数据库数据成功获取！！");
	}
    
    %>
      </div>
      

</body>
</html>