<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
         
        html {
            height: 100%;
            width: 100%;
            overflow: hidden;
            margin: 0;
            padding: 0;
            background: url(images/bg.jpg) no-repeat 0px 0px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            -moz-background-size: 100% 100%;
        }
         
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }
         
        #loginDiv {
            width: 30%;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 300px;
            background-color: rgba(246, 250, 250, 0.6);
            box-shadow: 7px 7px 17px rgba(246, 250, 250, 0.4);
            border-radius: 30px;
        }
         
        #loginDiv:hover{  
           filter: grayscale(60%);
        }  
 
        input{
            text-align: center;
            border:none; 
            background-color: rgba(239, 248, 250, 0.1);
            border-bottom:1px solid rgb(80, 196, 241);
            width: 200px;
            
        }
 
        #L_login {
            border-color: cornsilk;
            background-color: rgba(59, 194, 248, 0.8);
            color: aliceblue;
            border-style: hidden;
            border-radius: 5px;
            width: 100px;
            height: 31px;
            font-size: 16px;
        }
 
        #L_register {
            border-color: cornsilk;
            background-color: rgba(59, 194, 248, 0.8);
            color: aliceblue;
            border-style: hidden;
            border-radius: 5px;
            width: 100px;
            height: 31px;
            font-size: 16px;
        }
    </style>
</head>
 
<body>
    <div id="loginDiv">
        <form action="checklogin.jsp" id="form" name="form" method="post" >
            <table>
                <h2 style="text-align: center; color: rgb(59, 194, 248);">立即登录</h2></br>
                <tr><td style="text-align: center; color: gray;">用户名</td></tr>
                <tr><td>
                  <input class="line" type="text" 
                  id="UserID" name="UserID" placeholder="输入id,不超过5" 
                  onKeyUp="value=value.replace(/[^\d]/g,'')"
                  maxlength="5"></td></tr>
                <tr><td style="text-align: center; color: gray;">密码</td></tr>
                <tr><td > 
                  <input class="line" type="password" 
                  placeholder="密码长度至少为6位" id="Password" name="Password" onkeyup="checkpassword()" >
                  </p>
                  <span id="tips"></span></input>
                  </td></tr>
           </table>
        </br>
        <div style="text-align: center;margin-top: 15px;">
            <input type="submit" id="L_login" value="登录" >
            <input type="button" id="L_register" value="注册" onclick=javascrtpt:jump2()>
        </div>
        </form>
    </div>
    <script>
        UserID.onchange = function(){
		var UserID = this.value;
		
	    }
        Password.onchange = function(){
		var Password = this.value;
		
	    }
        function checkpassword() {
    		var password = document.getElementById("Password").value;
    		reg = /^\S{6,}$/
    		if(!reg.test(password)) {
    			 document.getElementById("tips").innerHTML="<font color='red'>密码至少6位</font>";
			}else{
				document.getElementById("tips").innerHTML="";
			}
    		
    	}

        
        function jump2(){
           window.location.href="register.jsp";
        }
        
    </script>
</body>
</html>