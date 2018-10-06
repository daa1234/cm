<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/jsp/header.jsp"%>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>提示</h3>
			</div>
			<div class="modal-body">
				<p>确定要删除吗？</p>
			</div>
			<div class="modal-footer">
				<a href="#" id="closeTip" class="btn btn-default" data-dismiss="modal">取消</a> 
				<a href="#" id="submitTip" class="btn btn-primary" data-dismiss="modal">确定</a>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="box col-md-12">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-tasks"></i> 菜单
				</h2>
				<div class="box-icon">
					<a href="#" class="btn btn-minimize btn-round btn-default">
						<i class="glyphicon glyphicon-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="box-content">
				<div class="alert alert-info">
					<a href="${projectName }/menu/addPage.action" class="btn btn-success" href="#">
						<i class="glyphicon glyphicon-plus-sign"></i> 新增
					</a>
				</div>
				<table id="intable"
					class="table-striped table-bordered bootstrap-datatable datatable responsive">
					<thead>
						<tr>
							<th>id</th>
							<th>名称</th>
							<th>上一级</th>
							<th style="width: 400px;">操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--/row-->
<%@ include file="/jsp/footer.jsp"%>
<script>
	var tableObject = null;
	$(function() {
		//datatable
		tableObject = $('#intable')
				.dataTable(
						{
							"sScrollY" : "100%",
							"iDisplayStart" :
	<%=request.getParameter("iDisplayStart") == null ? 0 : 
	request.getParameter("iDisplayStart")%>
	,
							"bProcessing" : true,
							"bServerSide" : true,
							"sDom" : "<'row'<'col-md-6'l><'col-md-6'f>r>t<'row'<'col-md-12'i><'col-md-12 center-block'p>>",
							"sPaginationType" : "bootstrap",
							"oLanguage" : {
								"sLengthMenu" : "每页显示 _MENU_ 条记录",
								"sZeroRecords" : "抱歉， 没有找到",
								"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
								"sInfoEmpty" : "没有数据",
								"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
								"oPaginate" : {
									"sFirst" : "首页",
									"sPrevious" : "前一页",
									"sNext" : "后一页",
									"sLast" : "尾页"
								},
								"sSearch" : "关键字:",
								"sZeroRecords" : "没有检索到数据",
								"sProcessing" : "<img src='${projectName }/img/ajax-loaders/ajax-loader-4.gif' />"
							},
							"bAutoWidth" : true,
							"sAjaxSource" : '${projectName }/menu/searchResourcesAction.action',
							"aoColumns" : [
									{
										"mData" : "id",
										'sClass' : 'center'
									},
									{
										"mData" : "name",
										'sClass' : 'center'
									},
									{
										"mData" : "presourceName",
										'sClass' : 'center'
									},
									{
										"mData" : "id",
										'sClass' : 'center',
										"mRender" : function(data, type, full) {
											return "<a class='btn btn-info' href='${projectName }/menu/editPage.action?id="
													+ data
													+ "'>  <i class='glyphicon glyphicon-edit icon-white'></i>"
													+ "\n编辑</a> "
													+ "<a onclick='showTip("
													+ data
													+ ")' name='deletea' class='btn btn-danger' href='javascript:;'> <i class='glyphicon glyphicon-trash icon-white'></i>"
													+ "\n删除</a>";
										}
									}

							],
							"fnServerData" : function(sSource, aoData,
									fnCallback) {
								$.ajax({
									"type" : 'post',
									"url" : sSource,
									"dataType" : "json",
									"data" : aoData,
									"success" : function(resp) {
										debugger;
										fnCallback(resp.list);
									}
								});

							}
						});

		$("#submitTip").click(function() {
			$.ajax({
				type : "POST",
				url : "${projectName }/menu/delete.action",
				data : "id=" + $("#myModal").data("delId"),
				success : function(msg) {
					debugger
// 					msg = JSON.parse(msg).error;
					msg = msg.error;
					if (msg.errorCode != 0) {
						alert(msg.errorMessage);
					} else {
						tableObject.fnDraw();
						alert(msg.errorMessage);
					}
				}
			});

		})

	})

	function showTip(id) {
		//e.preventDefault();
		$('#myModal').modal('show');
		$("#myModal").data("delId", id);
	}
</script>