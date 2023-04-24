package util;



import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {

	private String dbUrl="jdbc:mysql://47.113.179.20/agile_mysql";
	private String dbUserName="root";
	private String dbPassword="password";
	private String jdbcName="com.mysql.cj.jdbc.Driver";
	
	public Connection getCon() throws Exception{
		Class.forName(jdbcName);
		Connection con=DriverManager.getConnection(dbUrl,dbUserName,dbPassword);
		System.out.println("数据库连接成功！");
		return con;
	}
	
	public void closeCon(Connection con) throws Exception{
		if(con!=null){
			con.close();
		}
	}
	
	public static void main(String[] args) {
		DbUtil dbUtil=new DbUtil();
		try {
			dbUtil.getCon();
			System.out.println("数据库连接成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("get data error");
			e.printStackTrace();
		}
	}
}
