<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="projectName" value="/cw" />
<%-- <c:if test="${sessionScope.loginUser !=null}"> --%>
<%-- 		<c:redirect url="/index.jsp"/> --%>
<%-- </c:if> --%>
<head>
<meta charset="utf-8">
<title>知学中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<!-- The styles -->
<link id="bs-css" href="${projectName }/css/bootstrap-cerulean.min.css"
	rel="stylesheet">

<link href="${projectName }/css/charisma-app.css" rel="stylesheet">
<link
	href='${projectName }/bower_components/fullcalendar/dist/fullcalendar.css'
	rel='stylesheet'>
<link
	href='${projectName }/bower_components/fullcalendar/dist/fullcalendar.print.css'
	rel='stylesheet' media='print'>
<link href='${projectName }/bower_components/chosen/chosen.min.css'
	rel='stylesheet'>
<link
	href='${projectName }/bower_components/colorbox/example3/colorbox.css'
	rel='stylesheet'>
<link
	href='${projectName }/bower_components/responsive-tables/responsive-tables.css'
	rel='stylesheet'>
<link
	href='${projectName }/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css'
	rel='stylesheet'>
<link href='${projectName }/css/jquery.noty.css' rel='stylesheet'>
<link href='${projectName }/css/noty_theme_default.css' rel='stylesheet'>
<link href='${projectName }/css/elfinder.min.css' rel='stylesheet'>
<link href='${projectName }/css/elfinder.theme.css' rel='stylesheet'>
<link href='${projectName }/css/jquery.iphone.toggle.css'
	rel='stylesheet'>
<link href='${projectName }/css/uploadify.css' rel='stylesheet'>
<link href='${projectName }/css/animate.min.css' rel='stylesheet'>

<!-- jQuery -->
<script src="${projectName }/bower_components/jquery/jquery.min.js"></script>

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
   <script src="/js/html5.js"></script>
    <![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="http://www.91baby.cn/img/favicon.ico"
	type="image/x-icon">
</head>
<body>
	<div class="ch-container">
		<div class="row">

			<div class="row">
				<div class="col-md-12 center login-header">
					<h2>欢迎来到后台管理系统</h2>
					<!-- <h2>Welcome to 91baby</h2> -->
				</div>
				<!--/span-->
			</div>
			<!--/row-->

			<div class="row">
				<div class="well col-md-5 center login-box">
					<div class="alert alert-info">
						<!-- Please login with your Username and Password. -->
						请输入你的账号和密码
					</div>
					<form class="form-horizontal"
						action="${projectName}/systemUser/login.action" method="post">
						<fieldset>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user red"></i></span> <input type="text"
									name="loginName" class="form-control" placeholder="账号" >
							</div>
							<div class="clearfix"></div>
							<br>

							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock red"></i></span> <input
									type="password" name="password" class="form-control"
									placeholder="密码" >
							</div>
							<div class="clearfix "></div>
							<div class="input-prepend has-error">
								<!--                         <label class="remember" for="remember"><input type="checkbox" id="remember"> Remember me</label> -->
								<c:if test="${''!=error.errorMessage}">
									<label class="control-label" for="inputError1">${error.errorMessage}</label>
								</c:if>
							</div>
							<div class="clearfix"></div>

							<p class="center col-md-5">
								<button type="submit" class="btn btn-primary">Login</button>
							</p>
						</fieldset>
					</form>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
		</div>
		<!--/fluid-row-->

	</div>
	<!--/.fluid-container-->


</body>
</html>
