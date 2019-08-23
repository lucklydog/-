<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>登录页</title>
</head>

<body>
	<form action="userinfo/login" method="post">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="userName" /></td>
			</tr>
			<tr>
				<td>密 码：</td>
				<td><input type="text" name="password" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="登录" /></td>
				<td></td>
			</tr>
		</table>
	</form>

</body>
</html>
