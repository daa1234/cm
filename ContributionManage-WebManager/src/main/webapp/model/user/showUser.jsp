<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--     <jsp:include page="/header.jsp"></jsp:include> --%>
<%@ include file="/jsp/header.jsp"%>
<style>
</style>
   <div>
         <ul class="breadcrumb">
			<li><a href="javascript:;" onClick="javascript:history.back(-1);">返回上一页</a></li>
		</ul>
    </div>

<div class="row">
	<div class="box col-md-12">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon glyphicon-user"></i> 视图
				</h2>

				<div class="box-icon">
					<a href="#" class="btn btn-minimize btn-round btn-default"><i
						class="glyphicon glyphicon-chevron-up"></i></a>
				</div>
			</div>
			<div class="box-content">
				<form role="form" class="form-horizontal "
					action="${projectName }/user/editAction.action" method="post">
					<input type="hidden" value="${object.id }" name="id">
					<div class="form-group">
						<label class="col-md-2 control-label" for="realName">姓名</label>
						<div class="col-md-6 ppp">${object.realName }</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="nickName">呢称</label>
						<div class="col-md-6 ppp">${object.nickName }</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="exampleInputFile">头像</label>
						<div class="col-md-6 ppp">
							<img alt="" src="${object.imgUrlPath }" style="width: 200px;">
						</div>
					</div>
					<%-- <div class="form-group">
						<label class="col-md-2 control-label" for="type">角色</label>
						<div class="col-md-2 ppp">${object.roleName }</div>
					</div> --%>
					<div class="form-group">
						<label class="col-md-2 control-label" for="mobile">手机号码</label>
						<div class="col-md-6 ppp">${object.mobile}</div>
					</div>



					<div class="form-group">
						<label class="col-md-2 control-label" for="email">邮箱地址</label>
						<div class="col-md-6 ppp">${object.email}</div>
					</div>

					<div class="form-group">
						<label class="col-md-2 control-label" for="loginName">登录名</label>
						<div class="col-md-6 ppp ">${object.loginName }</div>
					</div>
				</form>
			</div>
			
		</div>
	</div>
	<!--/span-->

</div>
<!--/row-->
<%@ include file="/jsp/footer.jsp"%>
