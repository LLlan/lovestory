<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/layer/layer.js"></script>
</head>
<body style="text-align: -webkit-center;margin-top: 150px;">
	<div id="zhongxin">
	<table style="margin: 15px 0 0 25px;">
		<tr class="info">
			<td>用户　名:</td>
			<td>
				<input type="text" id="phone" placeholder="输入用户名"/>
			</td>
		</tr>
		<tr class="info">
			<td>选择身份:</td>
			<td>
				<select id="identity">
					<option value="1" selected="selected">单身会员</option>
					<option value="2">月老红娘</option>
				</select>
			</td>
		</tr>
		<tr style="position: absolute;margin: 25px 0 0 65px;">
			<td onclick="save();" style="text-align: center;width: 174px;background: #9999f4;font-size: 15px;line-height: 2;border-radius: 5px;" colspan="2">保存</td>
		</tr>
	</table>
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>

	<div style="font-size: 15px;margin-top: 90px;width: 500px;height: 200px;text-align: left;background: #e2dbdb;padding: 10px 0 0 10px;">
		<p>注意事项:</p>
		<p>1.用户名为手机号,不能输入中文、英文以及其他特殊字符</p>
		<p>2.用户名可以输入多个,请用逗号(,)隔开</p>
		<p>3.默认身份为单身男女,请注意选择身份信息</p>
		<p>4.由此处注入的会员,默认密码为123456</p>
		<p>5.可以先在文本处把会员用户名按要求拼接好,再复制到此处</p>
	</div>
<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#phone").val()==""){
			$("#phone").tips({
				side:3,
	            msg:'请输入用户名',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#phone").focus();
			return false;
		}
		$.post('memberManage/saveMember.do',{phone:$("#phone").val(),identity:$("#identity option:selected").val()},function(data){
			if(data.str1=="" && data.str2==""){
				layer.confirm('注入成功!点击确定继续添加。', {
					btn: ['退出','确定'] //按钮
					}, function(){
						window.location.href="memberManage/toMemberAdd.do";
					}, function(){
						window.location.href="memberManage/toMemberAdd.do";
					});
			}else{
				var str="";
				if(data.str1!=""){
					str="用户名格式错误("+data.str1+")";
				}
				if(data.str2!=""){
					if(str==""){
						str="用户名已存在("+data.str2+")";
					}else{
						str=str+",用户名已存在("+data.str2+")";
					}
				}
				layer.alert(str,{
		            title:false//提示标题，默认为：信息
		            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
		            ,anim: 0 //动画类型0-6，默认为：0
		            ,closeBtn: 0//是否显示关闭按钮，0-不显示，1-显示，默认为1
		            ,btn: ['知道了','继续添加'] //按钮
					,yes:function(){
						window.location.href="memberManage/toMemberAdd.do";
		            }
					,btn2:function(){
						window.location.href="memberManage/toMemberAdd.do";
		            }
		        });
			}
			
			
		});
	}
</script>
</body>
</html>