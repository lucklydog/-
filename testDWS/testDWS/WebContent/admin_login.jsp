<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>后台登录页</title>
<!-- 引入EasyUI的相关css和js文件 -->
<link href="Easyui/themes/default/easyui.css" rel="stylesheet"
	type="text/css" />
<link href="Easyui/themes/icon.css" rel="stylesheet" type="text/css" />
<link href="Easyui/demo.css" rel="stylesheet" type="text/css" />
<script src="Easyui/jquery.min.js" type="text/javascript"></script>
<script src="Easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="Easyui/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>

<body>
	
	<div id="adminLoginDlg" class="easyui-dialog"
		style="top: 250;left: 250;width: 250;height: 200"
		data-options="title:'后台登录',buttons:'#bb',modal:true">
		<form id="adminLoginForm" method="post">
			<table>
				<tr>
					<th>用户名</th>
					<td><input class="easyui-textbox" type="text" id="name"
						name="name" data-options="required:true"></input></td>
				</tr>
				<tr>
					<th>密码</th>
					<td><input class="easyui-textbox" type="text" id="pwd"
						name="pwd" data-options="required:true"></input></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="bb">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="checkAdminLogin()">登录</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" onclick="clearForm();">重置</a>
	</div>
	<script type="text/javascript">
		function clearForm() {
			$('#adminLoginForm').form('clear');
		}

		function checkAdminLogin() {
			$("#adminLoginForm").form("submit", {
				url : 'admininfo/login',
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success == 'true') {
						window.location.href = 'usermanager.jsp';
						$("#adminLoginDlg").dialog("close");
					} else {
						$.messager.show({
							title : "提示信息",
							msg : result.message
						});
					}
				}
			});
		}
	</script>
</body>
</html>