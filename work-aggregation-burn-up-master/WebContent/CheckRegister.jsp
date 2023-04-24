<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*,java.util.*,javax.swing.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册检测</title>
</head>
<body>
	<%
	int[] intRandom = new int[1000];
	List mylist = new ArrayList(); //生成数据集，用来保存随即生成数，并用于判断
	Random rd = new Random();
	while(mylist.size() < 1000) {
	int num = rd.nextInt(1001);
	if(!mylist.contains(num)) {
	mylist.add(num); //往集合里面添加数据。
	}
	}
	for(int i = 0;i <mylist.size();i++) {
	intRandom[i] = (Integer)(mylist.get(i));
	}
	
	//获取地址栏参数，name:参数名称
   
	
	String userName=new String(request.getParameter("R_user").getBytes("utf-8"),"GBK");
	String password=new String(request.getParameter("R_pwd").getBytes("utf-8"),"GBK");
	String url = "jdbc:mysql://47.113.179.20:3306/agile_mysql?user=root&password=password&userUnicode=true&characterEncoding=GB2312&serverTimezone=UTC";
	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();//加载驱动程序
	Connection conn = DriverManager.getConnection(url);
	try {

		if (!conn.isClosed())
			System.out.println("Succeeded connecting to the Database!");
		//2.创建statement类对象，用来执行SQL语句！！
		Statement statement = conn.createStatement();
		//要执行的SQL语句
		String sql = "select * from user";
		//3.ResultSet类，用来存放获取的结果集！！
		ResultSet res = statement.executeQuery(sql);
		if(conn != null){// 判断 数据库连接是否为空			
			String sql2="select * from user where UserName='"+userName+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql2);
			
				//out.print("3");
				String sql3="insert into user(UserID,UserName,Password)values(?,?,?)";
				PreparedStatement pstmt=conn.prepareStatement(sql3);
				int ID=intRandom[(int)Math.random()*100];
				pstmt.setInt(1, ID);
				pstmt.setString(2, userName);
				pstmt.setString(3, password);
				 int n1=pstmt.executeUpdate();
				 
				 out.print("<script>alert('请记住！您的用户ID为："+ID+"'); window.location.href='login.jsp' </script>");
				//response.sendRedirect("homePage.jsp");	
				 session.setAttribute("userID", ID);
				 session.setAttribute("Old_password", password);
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


</body>
</html>