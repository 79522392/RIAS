<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    String url = "jdbc:mysql://103.228.170.64:3306/rjgc?useSSL=false&serverTimezone=UTC";
	String user = "rjgc";
	String password = "123456";
%>

<%!
String jobname=null;
String salary=null;
String degree=null;
String workyear=null;
String jobarea=null;
String companyname=null;
String companysize=null;
String industrytype=null;
String jobhref=null;
String companyhref=null;
String decription=null;
%>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn= DriverManager.getConnection(url,user,password);
        request.setCharacterEncoding("utf-8");
        
        jobname=request.getParameter("jobname");
        salary=request.getParameter("salary");
        degree=request.getParameter("degree");
        workyear=request.getParameter("workyear");
        jobarea=request.getParameter("jobarea");
        companyname=request.getParameter("companyname");
        companysize=request.getParameter("companysize");
        industrytype=request.getParameter("industrytype");
        jobhref=request.getParameter("jobhref");
        companyhref=request.getParameter("companyhref");

        
        
        String sql="insert into information(job_name,salary,degree,work_year,job_area,Company_name,Company_size,industry_type,job_href,company_href) values ('"+jobname+"','"+salary+"','"+degree+"','"+workyear+"','"+jobarea+"','"+companyname+"','"+companysize+"','"+industrytype+"','"+jobhref+"','"+companyhref+"')";;
        PreparedStatement pst=conn.prepareStatement(sql);
        int rs=pst.executeUpdate();
        if(rs!=0){
%>
<jsp:forward page="informationAdd.jsp"></jsp:forward>
<%
        }
    }
    catch(Exception e){
        out.println(e);
    }
%>

</body>
</html>
