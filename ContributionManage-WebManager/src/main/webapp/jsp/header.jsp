<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
// 		Object loginUser = session.getAttribute("loginUser");
// 		if(loginUser ==null){
// 			response.sendRedirect("../../index.jsp");  
// 		}
	%>
<c:set var="projectName" value="/cw" />
<c:if test="${sessionScope.loginUser==null }">
	<c:redirect url="/login.jsp"/>
</c:if>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>知学中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs-css" href="${projectName}/css/bootstrap-cerulean.min.css" rel="stylesheet">
	
    <link href="${projectName }/css/charisma-app.css" rel="stylesheet">
    <link href='${projectName }/bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='${projectName }/bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='${projectName }/bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='${projectName }/bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='${projectName }/bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='${projectName }/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='${projectName }/css/jquery.noty.css' rel='stylesheet'>
    <link href='${projectName }/css/noty_theme_default.css' rel='stylesheet'>
    <link href='${projectName }/css/elfinder.min.css' rel='stylesheet'>
    <link href='${projectName }/css/elfinder.theme.css' rel='stylesheet'>
    <link href='${projectName }/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='${projectName }/css/uploadify.css' rel='stylesheet'>
    <link href='${projectName }/css/animate.min.css' rel='stylesheet'>
    <link href='${projectName }/css/bootstrap-datetimepicker.min.css' rel='stylesheet'>
    <link href='${projectName }/css/91baby.css' rel='stylesheet'>

<script src="${projectName }/bower_components/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${projectName }/ckeditor/ckeditor.js"></script>
    <link rel="shortcut icon" href="http://www.91baby.cn/img/favicon.ico" type="image/x-icon">
	<style type="text/css">
	#d{
		font-size: 32px;
	}
	</style>
</head>

<body>
	<input id="project_Name" type="hidden" value="${projectName }" />
    <!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">
		<input id="project_Name" type="hidden" value="${ projectName}">
        <div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/index.jsp"> <img alt="Charisma Logo" src="${projectName }/img/logo20.png" class="hidden-xs"/>
                <span>知学中心</span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> ${sessionScope.loginUser.loginName}</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="${projectName }/systemUser/showPage.action?id=${sessionScope.loginUser.id}">个人信息</a></li>
                    <li class="divider"></li>
                    <li><a href="${projectName }/systemUser/logout.action">注销</a></li>
                </ul>
            </div>
 

        </div>
    </div>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">

        <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                    	<c:forEach items="${sessionScope.ownResourceList}" var="r">
                    	  <c:if test="${!empty r.children}">
                    		<li class="accordion">
                    			<c:if test="${r.uri==''}">
	                            	<a href="#"><i class="glyphicon "></i><span> ${r.name }</span></a>
	                          	</c:if>
	                          	<c:if test="${r.uri!=''}">
	                            	<a href="${r.uri}"><i class="glyphicon "></i><span> ${r.name }</span></a>
	                          	</c:if>
		                            <ul class="nav nav-pills nav-stacked">
										<c:forEach items="${r.children}" var="c">
			                       			  <li><a href="${projectName }${c.uri }"> ${c.name }</a>
			                       			 </li>
		                       			 </c:forEach>
		                            </ul>
	                           
	                        </li>
	                       </c:if>
	                        <c:if test="${empty r.children}">
		                        <li>
		                        	<c:if test="${ r.uri==''}">
		                        		<a href="#"><i class="glyphicon"></i><span> ${r.name }</span></a>
		                        	</c:if>
		                        	<c:if test="${ r.uri!=''}">
		                        		<a href="${ r.uri}"><i class="glyphicon"></i><span> ${r.name }</span></a>
		                        	</c:if>
		                        </li>
	                        </c:if>
                    	</c:forEach>
                    	
                    </ul>
                </div>
            </div>
        </div>
        <!--/span-->
        <!-- left menu ends -->


        <div id="content" class="col-lg-10 col-sm-10">
