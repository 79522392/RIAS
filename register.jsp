
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>
	
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/loginstyle.css">
<style>
.form-group {
      padding-bottom: 0px;  
}
</style>
</head>
<body>

    <div class="bg"></div>
    <div class="container">
        <div class="line bouncein">
            <div class="xs6 xm4 xs3-move xm4-move">
                <div style="height:50px;"></div>
                <div class="media media-y margin-big-bottom">
                </div>
                <form action="registerresult.jsp" method="post">
                  <div class="text-center margin-big padding-big-top">
                            <h1>互联网招聘信息聚合系统</h1>
                        </div> 
                    <div class="panel loginbox">
                    
                        <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="text" class="input input-big" name="dianhua" id="account" placeholder="账号" />
                                   
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="password" class="input input-big" name="mima" id="mima"  placeholder="登录密码" />
                       </span>
                                </div>
                            </div>
                                <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="text" class="input input-big" name="xingming" id="xingming" placeholder="姓名" />
                                    
                                </div>
                            </div>

                            </div>
                        </div>
                        <div style="padding:30px;background:#66ccf5;">
                            <input type="submit" id="button" class="button button-block bg-main text-big input-big" value="注册"/>
<a href="Login.jsp">用户登录</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>