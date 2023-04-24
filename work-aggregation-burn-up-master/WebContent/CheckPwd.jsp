<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*,java.util.*,javax.swing.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>密码修改检测</title>
</head>
<body>
	<% 
	//获取地址栏参数，name:参数名称

	    String flag=session.getAttribute("userID").toString();
		//out.print(flag);
	    int userID=Integer.valueOf(flag);
		
	
		String password=new String(request.getParameter("Old_pwd").getBytes("utf-8"),"GBK");
		String newpassword=new String(request.getParameter("R_pwd").getBytes("utf-8"),"GBK");
		String url = "jdbc:mysql://47.113.179.20:3306/agile_mysql?user=root&password=password&userUnicode=true&characterEncoding=GB2312&serverTimezone=UTC";
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();//加载驱动程序
		Connection conn = DriverManager.getConnection(url);
		try {

			//if (!conn.isClosed())
				//out.print("Succeeded connecting to the Database!");
			//2.创建statement类对象，用来执行SQL语句！！
			Statement statement = conn.createStatement();
			
			if(conn != null){// 判断 数据库连接是否为空			
				
			
				
            String sql = "UPDATE user SET password=? WHERE UserID =? AND Password=?";
            PreparedStatement pstmt=conn.prepareStatement(sql);
 
            pstmt.setString(1,newpassword);
            pstmt.setInt(2,userID);
            pstmt.setString(3,password);
            int n1=pstmt.executeUpdate();
			 
			 out.print("<script>alert('修改成功'); window.location.href='login.jsp' </script>");
			}
        } catch (SQLException e) {
    		//数据库连接失败异常处理
    		e.printStackTrace();
    	} catch (Exception e) {
    		// TODO: handle exception
    		e.printStackTrace();
    	} finally {
    		//out.print("数据库数据成功获取！！");
    	}
    



	%>


</body>
</html>