<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*,java.util.*,javax.swing.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="informationAddResult.jsp" method="post">
    职位名称：<input type="text" name="jobname" value=""><br>
    工作薪资：<input type="text" name="salary" value=""><br>
    学历需求：<select name="degree">
    <option>年少有为</option>
    <option>中专</option>
    <option>高中</option>
    <option>大专</option>
    <option>本科</option>
    <option>硕士</option>
    <option>博士</option>
    </select><br>
    经验需求：<select name="workyear">
    <option>无经验</option>
    <option>1到3年</option>
    <option>3到5年</option>
    <option>5到10年</option>
    <option>10年以上</option>
    </select><br>
    工作地点：<input type="text" name="jobarea" value=""><br>
    公司名称：<input type="text" name="companyname" value=""><br>
    公司规模：<input type="text" name="companysize" value=""><br>
    职位类别：<input type="text" name="industrytype" value=""><br>
    工作网址：<input type="text" name="jobhref" value=""><br>
    公司网址：<input type="text" name="companyhref" value=""><br>


    <input type="submit" name="" value="提交">
</form>
</body>
</html>