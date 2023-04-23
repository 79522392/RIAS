package com.work.mapper;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnMapper {
	public static Connection getConnection()throws Exception{
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  String url="jdbc:mysql://103.228.170.64:3306/rjgc?serverTimezone=UTC&useSSL=false&characterEncoding=UTF-8";
		  return DriverManager.getConnection(url, "rjgc", "123456");
	}
	
	public static void close(ResultSet rs,Statement sta,Connection con)throws Exception{
		  if(rs!=null){
		                 //关闭结果集
		                rs.close();
		  }
		  if(sta!=null){
		                 //关闭操作句柄
		                 sta.close();
		  }
		  if(con!=null){
		                //关闭链接
		                con.close();
		  }
	}
}
