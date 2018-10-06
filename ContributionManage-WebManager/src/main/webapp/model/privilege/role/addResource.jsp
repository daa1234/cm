<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--     <jsp:include page="/header.jsp"></jsp:include> --%>
<%@ include file="/jsp/header.jsp"%>

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
					<i class="glyphicon glyphicon-tasks"></i>  ${object.name }--角色授权
				</h2>

				<div class="box-icon">
					<a href="#" class="btn btn-minimize btn-round btn-default"><i
						class="glyphicon glyphicon-chevron-up"></i></a>
					<!--             <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a> -->
				</div>
			</div>
			<div class="box-content">
				<form role="form" class="form-horizontal "
					action="" method="post">
					            <input type="hidden" value="${object.id }" id="objectId" name="id" >

<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>


					                <div class="form-group">  
					                    <div class="col-md-offset-2 col-md-10">  
					                        <button type="button" onclick="commit()" class="btn btn-primary btn-sm">  
					                            	确定 
					                        </button>  
					                          <button type="button" class="btn btn-primary btn-sm" onclick="javascript:window.location.reload();">  
					                       		     重置 
					                        </button>  
					                    </div>  
					                </div>  
				</form>
			</div>
		</div>
	</div>
	<!--/span-->

</div>
<!--/row-->
<%@ include file="/jsp/footer.jsp"%>
<%-- <jsp:include page="/footer.jsp"></jsp:include> --%>
<script type="text/javascript" charset="utf-8">
	$(function() {

	});
</script>
<link rel="stylesheet" href="${projectName }/tree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<!-- <script type="text/javascript" src="/tree/js/jquery-1.4.4.min.js"></script> -->
<script type="text/javascript" src="${projectName }/tree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${projectName }/tree/js/jquery.ztree.excheck.js"></script>
<SCRIPT type="text/javascript">
	var setting = {
		check : {
			enable : true
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		view:{
		showIcon :false
		}
	};

	var zNodes = ${treeListJson};
	var zTree;
	$(document).ready(function() {
// 		debugger;
// 		console.log(zNodes);
		zTree = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
	});
	
	function commit(){
		var checks = zTree.getCheckedNodes(true);
		debugger;
		var checksId=[]
		for(var i in checks){
			checksId.push(checks[i].id);
		}
		
		$.ajax({
			"type" : 'post',
			"url" : "${projectName }/role/auth.action",
			"dataType" : "json",
			"data" : {
				id:$("#objectId").val(),
				resourcesIds : checksId.join(",")
			},
			"success" : function(msg) {
				if (msg.error.errorCode != 0) {
					alert(msg.error.errorMessage);
				} else {
					alert("授权成功");
				}
			}
		});
	}
</SCRIPT>