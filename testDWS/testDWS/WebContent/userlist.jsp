<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
  if(session.getAttribute("admin")==null)
  	response.sendRedirect("/digital-um/admin_login.jsp");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'newslist.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
    <!-- 创建一个table -->
	<table id="userListDg" class="easyui-datagrid"></table>
	
	<!-- 创建工具栏 -->
	<div id="userListTb" style="padding:2px 5px;">
	<a href="javascript:void(0)"
		class="easyui-linkbutton" iconCls="icon-edit" plain="true"
		onclick="SetIsEnableUser(1);">启用用户</a> 
	<a href="javascript:void(0)"
		class="easyui-linkbutton" iconCls="icon-remove"
		onclick="SetIsEnableUser(0);" plain="true">禁用用户</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" onclick="addUserInfo();" plain="true">添加用户</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" onclick="deleteUserInfo();" plain="true">删除用户</a>
	
	</div>
	
	<!-- 创建搜索栏 -->
	<div id="searchUserListTb" style="padding:4px 3px;">
		<form id="searchUserListForm">
			<div style="padding:3px ">
				用户名称&nbsp;&nbsp;<input class="easyui-textbox" name="search_userName"
					id="search_userName" style="width:110px" /><a href="javascript:void(0)"
					class="easyui-linkbutton" iconCls="icon-search" plain="true"
					onclick="searchUserInfo();">查找</a>
			</div>			
		</form>
	</div>
	<div id="addUserDlg" class="easyui-dialog" title="添加用户" closed="true"
		style="width:500px;">
		<div style="padding:10px 60px 20px 60px">
			<form id="addUserForm" method="POST" action="">
				<table cellpadding="5">
					<tr>
						<td>用户名</td>
						<td><input class="easyui-textbox" type="text" id="userName"
							name="userName" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input class="easyui-textbox" type="text" id="password"
							name="password" data-options="required:true"></input></td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="saveUserInfo();">保存</a> <a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="clearAddUserForm();">清空</a>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$('#userListDg').datagrid({
				singleSelect : false,
				url : 'userinfo/userlist',
				queryParams : {}, //查询条件
				pagination : true, //启用分页
				pageSize : 5, //设置初始每页记录数（页大小）
				pageList : [ 5, 10, 15 ], //设置可供选择的页大小
				rownumbers : true, //显示行号
				fit : true, //设置自适应
				toolbar : '#userListTb', //为datagrid添加工具栏
				header : '#searchUserListTb', //为datagrid标头添加搜索栏
				columns : [ [ { //编辑datagrid的列
					title : '序号',
					field : 'id',
					align : 'center',
					checkbox : true
				}, {
					field : 'userName',
					title : '用户名',					
					width : 100
				}, {
					field : 'status',
					title : '用户状态',
					width : 100,
					formatter : function(value, row, index) {
						if (row.status==1) {
							return "启用";
						} else {
							return "禁用";
						}
					}
				} ] ]
			});
		});

		var urls;
		var data;
		
		function searchUserInfo() {
			var userName = $('#search_userName').textbox("getValue");
			$('#userListDg').datagrid('load', {
				userName : userName
			});
		}
		
		
		// 设置启用或禁用用户
		function SetIsEnableUser(flag) {
			var rows = $("#userListDg").datagrid('getSelections');
			if (rows.length > 0) {
				$.messager.confirm('Confirm', '确认要设置么?', function(r) {
					if (r) {
						var uids = "";
						for (var i = 0; i < rows.length; i++) {
							uids += rows[i].id + ",";
						}						
						$.post('userinfo/setIsEnableUser', {
							uids : uids,
							flag : flag
						}, function(result) {
							if (result.success == 'true') {
								$("#userListDg").datagrid('reload'); 
								$.messager.show({
									title : '提示信息',
									msg : result.message
								});
							} else {
								$.messager.show({
									title : '提示信息',
									msg : result.message
								});
							}
						}, 'json');

					}
				});
			} else {
				$.messager.alert('提示', '请选择要启用或禁用的客户', 'info');
			}
		}
		
		// 打开新增管理员对话框
		function addUserInfo() {
			$('#addUserDlg').dialog('open').dialog('setTitle', '新增用户');
			$('#addUserDlg').form('clear');
			urls = 'userinfo/addUserInfo';
		}
		
		// 保存新增的用户信息
		function saveUserInfo() {
			$("#addUserForm").form("submit", {
				url : urls, //使用参数				
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success == 'true') {
						$("#userListDg").datagrid("reload");
						$("#addUserDlg").dialog("close");
					}					
					$.messager.show({
						title : "提示信息",
						msg : result.message
					});
				}
			});
		}
		function clearAddUserForm() {
			$('#addUserForm').form('clear');
		}
		
		function deleteUserInfo() {
			var rows = $("#userListDg").datagrid('getSelections');
			if (rows.length > 0) {
				$.messager.confirm('Confirm', '确认要删除么?', function(r) {
					if (r) {
						var uids = "";
						for (var i = 0; i < rows.length; i++) {
							uids += rows[i].id + ",";
						}						
						$.post('userinfo/deleteUserInfo', {
							uids : uids
						}, function(result) {
							if (result.success == 'true') {
								$("#userListDg").datagrid('reload'); 
								$.messager.show({
									title : '提示信息',
									msg : result.message
								});
							} else {
								$.messager.show({
									title : '提示信息',
									msg : result.message
								});
							}
						}, 'json');

					}
				});
			} else {
				$.messager.alert('提示', '请选择要启用或禁用的客户', 'info');
			}
		}
		
	</script>
</body>
</html>
