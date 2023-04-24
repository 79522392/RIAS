<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录检测</title>
</head>
<body>
<%
	String userID=new String(request.getParameter("UserID").getBytes("utf-8"),"GBK");
	String password=new String(request.getParameter("Password").getBytes("utf-8"),"GBK");
	//String userID=new String(request.getParameter("UserID"));
	//out.print(userID);
	
	if(userID==""||password==""){
		out.print("<script>alert('用户名或密码错误，请重新输入！'); window.location='login.jsp'  </script>"); 
	}else if(password.length()>0&&password.length()<6){
		out.print("<script>alert('用户名或密码错误，请重新输入！'); window.location='login.jsp'  </script>"); 
	}
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver"); // 加载数据库驱动，注册到驱动管理器
		String url = "jdbc:mysql://47.113.179.20:3306/agile_mysql";// 数据库连接字符串
		String usename = "root";// 数据库用户名
		String psw = "password";// 数据库密码
		Connection conn = DriverManager.getConnection(url,usename,psw);// 创建Connection连接
		//out.print("1");	
		if(conn != null){// 判断 数据库连接是否为空			
			String sql="select * from user where UserID='"+userID+"' and Password='"+ password + "'";
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			//out.print("2");
			if(rs.next()){
				//检测成功，跳转页面
				//out.print("3");
				session.setAttribute("userID", userID);
				session.setAttribute("Old_password", password);
				response.sendRedirect("index.jsp");	
			
			}else{
				out.print("<script>alert('用户名或密码错误，请重新输入！'); window.location.href='login.jsp'  </script>"); 
				//out.print("用户名或密码错误，请重新输入！");
				 
			}			
			
			//out.println("数据库连接成功！");
			// 关闭数据库连接
			conn.close();
		}else{
			// 输出连接信息
			out.println("数据库连接失败！");						
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>


</body>
</html>