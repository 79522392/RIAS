<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <style>
        html{
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
        body{
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            
        }
        input{
            text-align: center;
            border:none; 
            background-color: rgba(239, 248, 250, 0.1);
            border-bottom:1px solid rgb(80, 196, 241);
            width: 260px;
        }
        
        p{
            text-align: center;
            color: rgb(116, 114, 114);
        }
        
        .main{
            margin-top: 30px;
            width: 1000px;
            height: 600px;
        
        
        }
        
        .R_register{
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
 
        .R_login{
            margin-top: 30px;
            width: 300px;
            float: left;
            justify-content: center;
            align-items: center;
            height: 600px;
            background-color: rgba(167, 150, 150,0.6);
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
 
        #R_loginbtn{
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
        .title{
            color: white;
            text-align: center;
        }
                  
    </style>
</head>
<div class="main">
        <div class="R_register">
            <h3 style="color: rgb(122, 211, 247);">立即注册</h3>
            
            <p >用户名</p>
            <p><input type="text"  placeholder="用户名长度不能超过5位" id="R_user" name="R_user"></p>
                              
            <p >密码</p>
            <p><input type="password" placeholder="密码长度至少为6位且为数字和字母的组合" id="R_pwd" name="R_pwd" ></p>
            <p >确认密码</p>
            <p><input type="password" placeholder="两次密码需一致" id="R_repwd" onkeyup="checkpassword()"></p>
            <span id="tishi"></span></input>
            <p><button id="R_registerbtn" onclick=javascrtpt:jump()>注册</button></p>
        </div>
        <div class="R_login">
            <br><br>
            <h3 class="title">已有账号？</h3>
            <p style="color: white;">已有账号就登录吧，好久不见！</p>
            <br><br><br><br><br><br><br><br><br><br><br><br><br>
            <p><button id="R_loginbtn" onclick=javascrtpt:jump3()>登录</button></p>
        </div>
</div>    

   
        <script>

        R_user.onchange = function(){
		    var  R_user= this.value;
		    var reg = /^\S{1,5}$/;
		    if(!reg.test( R_user)){
		    	alert("用户名长度不能超过5位！");
		    	window.location.href = "register.jsp";
		    }
	        }
 
            R_pwd.onchange = function(){
		    var R_pwd = this.value;
		    var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$/;
		    if(!reg.test(R_pwd)){
                alert("密码长度要大于6位，由数字和字母组成,请重新输入！");
                window.location.href = "register.jsp";
		    }
	        }

        function checkpassword() {
		var password = document.getElementById("R_pwd").value;
		var repassword = document.getElementById("R_repwd").value;
		if(password == repassword) {
			 document.getElementById("tishi").innerHTML="<font color='green'>两次密码输入一致</font>";
		}else {
			 document.getElementById("tishi").innerHTML="<font color='red'>两次输入密码不一致!</font>";
		} 
	    }
       
        function jump(){
            localStorage.setItem("username",document.getElementById("R_user").value);
            localStorage.setItem("password",document.getElementById("R_pwd").value);
           
            var User = document.getElementById("R_user");  
            
            var Password = document.getElementById("R_pwd");
            var Repassword = document.getElementById("R_repwd");

            if(User.value ==""|| Password.value =="") {            
                alert("用户名或密码不能为空！" );    
                window.location.href = "register.jsp";
                  
            }  
            else if(Password.value == Repassword.value) {
            	window.location.href = "CheckRegister.jsp?R_user="+document.getElementById("R_user").value+"&R_pwd="+Password.value;
                                         
            }
            else{
               alert("注册信息有误！");
               window.location.href = "register.jsp";
              
            }
        }

        function jump3(){
        	window.location.href = "login.jsp";
        }
        </script>
   
</body>
</html>