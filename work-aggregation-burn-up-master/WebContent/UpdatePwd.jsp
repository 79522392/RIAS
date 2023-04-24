<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Password</title>
<style>
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

input {
	text-align: center;
	border: none;
	background-color: rgba(239, 248, 250, 0.1);
	border-bottom: 1px solid rgb(80, 196, 241);
	width: 260px;
}

p {
	text-align: center;
	color: rgb(116, 114, 114);
}

.main {
	margin-top: 30px;
	width: 1000px;
	height: 600px;
}

.R_register {
	margin-top: 30px;
	width: 600px;
	float: left;
	justify-content: center;
	align-items: center;
	text-align: center;
	height: 600px;
	background-color: rgba(246, 250, 250, 0.7);
	box-shadow: 7px 7px 17px rgba(246, 250, 250, 0.4);
}

.R_login {
	margin-top: 30px;
	width: 300px;
	float: left;
	justify-content: center;
	align-items: center;
	height: 600px;
	background-color: rgba(167, 150, 150, 0.6);
	box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.3);
}

#R_registerbtn {
	border-color: cornsilk;
	background-color: rgba(59, 194, 248, 0.6);
	color: aliceblue;
	border-style: hidden;
	border-radius: 15px;
	width: 190px;
	height: 31px;
	font-size: 16px;
}

#R_loginbtn {
	border: 20px solid white;
	background-color: rgba(71, 196, 245, 0.6);
	border-radius: 50%;
	color: aliceblue;
	border-style: hidden;
	border-radius: 15px;
	width: 100px;
	height: 31px;
	font-size: 16px;
}

.title {
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<div class="R_register">
		<h3 style="color: rgb(122, 211, 247);">修改密码</h3>


		<p>原密码：</p>
		<p>
			<input type="password" placeholder="请输入原密码" id="Old_pwd"
				name="Old_pwd" onkeyup="checkOldPassword()">
		</p>
		<p>新密码：</p>
		<p>
			<input type="password" placeholder="密码长度至少为6位且为数字和字母的组合" id="New_pwd"
				name="New_pwd">
		</p>
		<p>确认密码：</p>
		<p>
			<input type="password" placeholder="两次密码需一致" id="New_repwd"
				onkeyup="checkpassword()">
		</p>
		<span id="tishi"></span>
		<p>
			<button id="R_registerbtn" onclick=javascrtpt:jump()>修改</button>
		</p>
	</div>

	<script>
     
            New_pwd.onchange = function(){
		    var New_pwd = this.value;
		    var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$/;
		    if(!reg.test(New_pwd)){
                alert("密码长度要大于6位，由数字和字母组成,请重新输入！");
                window.location.href = "UpdatePwd.jsp";
		    }
	        }
           
        function checkOldPassword(){
        	
        	var Old_password ='<%=session.getAttribute("Old_password")%>';
        	//alert(Old_password);
        	var password = document.getElementById("Old_pwd").value;
        	if(password == Old_password) {
   			 document.getElementById("tishi").innerHTML="<font color='green'>与原密码一致</font>";
   		}else {
   			 document.getElementById("tishi").innerHTML="<font color='red'>与原密码不一致!</font>";
   		} 
        }
        function checkpassword() {
    	
		var password = document.getElementById("New_pwd").value;
		var repassword = document.getElementById("New_repwd").value;
		
		if(password == repassword) {
			 document.getElementById("tishi").innerHTML="<font color='green'>两次密码输入一致</font>";
		}else {
			 document.getElementById("tishi").innerHTML="<font color='red'>两次输入密码不一致!</font>";
		} 
	    }
        
        function jump(){
            localStorage.setItem("Old_password",document.getElementById("Old_pwd").value);
            localStorage.setItem("password",document.getElementById("New_pwd").value);            
         
          
            var Old_password = document.getElementById("Old_pwd");
            var Password = document.getElementById("New_pwd");
            var Repassword = document.getElementById("New_repwd");
            
            if(Old_password.value ==""|| Password.value =="") {            
                alert("密码不能为空！" );    
                window.location.href = "UpdatePwd.jsp";
                  
            }  
            else if(Password.value == Repassword.value) {
            	window.location.href = "CheckPwd.jsp?Old_pwd="+Old_password.value+"&R_pwd="+Password.value;         
            }
            else{
               alert("密码有误！");
               window.location.href = "UpdatePwd.jsp";
              
            }
        }

        </script>

</body>
</html>