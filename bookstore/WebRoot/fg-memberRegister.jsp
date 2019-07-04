<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.py.vo.Member" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<title>电子商务网站</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script>
function validate(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert("表单信息不能为空");
form.elements[i].focus();
return false;
}
}
if(!/^[a-z0-9]+$/.test(form.account.value)){
alert("请输入有数字和小写字母组成的用户名");
return false;
}
if(!/^[a-zA-Z0-9_-]{6,16}$/.test(form.password.value)){
alert("密码由6-16位字符组成");
return false;
}
if(form.password.value!=form.passwordOne.value){
alert("您两次输入的密码不一致，请重新输入");
return false;
}
if(!/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/.test(form.email.value)){
alert("邮箱格式不正确，请输入正确格式，如：123456789@123.com");
return false;
}
if(!/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/.test(form.tel.value)){
alert("手机号码格式错误");
return false;
}
if(!/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(form.idCard.value)){
alert("请入正确身份证号码");
return false;
}
return true;
}
</script>
</head>
<body>
	<jsp:include page="fg-header.jsp" flush="true" />
	<jsp:include page="fg-nav.jsp" flush="true" />
	<div id="main">
		<div class="iconRegister"></div>
		<hr/>
		<div class="fgText">
					<font class="red">用户注册</font>
		</div>
		<form name="memberForm" method="post" action="MemberServlet.do?method=insertMember" 
			onsubmit="return validate(this)">
		<div class="fgForm">
			<div class="fgInput">
					<span class="input3Text">会员账号：</span><input class="input3" name="account" type="text" />
			</div>
			<div class="fgInput">
					<span class="input3Text">会员密码：</span><input class="input3" name="password" type="password" />
			</div>
			<div class="fgInput">
					<span class="input3Text">密码确认：</span><input class="input3" name="passwordOne" type="password" />
			</div>
			<div class="fgInput">
					<span class="input3Text">真实姓名：</span><input class="input3" name="reallyName" type="text" />
			</div>
			<div class="fgInput">
					<span class="input3Text">Email：</span><input class="input3" name="email" type="text" />
			</div>
			<div class="fgInput">
					<span class="input3Text">手机号码：</span><input class="input3" name="tel" type="text" />
			</div>
			<div class="fgInput">
					<span class="input3Text">身份证号：</span><input class="input3" name="idCard" type="text" />
			</div>
			<div class="fgInput">
					<input type="image" src="images/save.jpg"/><a href="#" onclick="javascript:memberForm.reset()">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/clear.gif" width="51" height="20"/></a>
			</div>
		</div>
      </form>
	</div>
	<jsp:include page="fg-footer.jsp" flush="true" />
	<%
		String result = (String) request.getAttribute("result");
		if (result!=null) {	
 	%>
 		<script>alert('<%=result%>');</script>		
 	<%
 		}
  	 %>
</body>
</html>
