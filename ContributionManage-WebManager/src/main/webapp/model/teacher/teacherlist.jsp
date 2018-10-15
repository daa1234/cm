<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp"%>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>提示</h3>
			</div>
			<div class="modal-body">
				<p>确定要修改帐号状态吗？</p>
			</div>
			<div class="modal-footer">
				<a href="#" id="closeTip" class="btn btn-default"
					data-dismiss="modal">取消</a> <a href="#" id="submitTip"
					class="btn btn-primary" data-dismiss="modal">确定</a>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myDeleteModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">

	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>提示</h3>
			</div>
			<div class="modal-body">
				<p>确定要删除该帐号吗？</p>
			</div>
			<div class="modal-footer">
				<a href="#" id="closeDeleteTip" class="btn btn-default"
					data-dismiss="modal">取消</a> <a href="#" id="submitDeleteTip"
					class="btn btn-primary" data-dismiss="modal">确定</a>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="box col-md-12">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-user"></i> 教师管理
				</h2>

				<div class="box-icon">
					<!--             <a href="#" class="btn btn-setting btn-round btn-default"><i class="glyphicon glyphicon-cog"></i></a> -->
					<a href="#" class="btn btn-minimize btn-round btn-default"><i
						class="glyphicon glyphicon-chevron-up"></i></a>
					<!--             <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a> -->
				</div>
			</div>
			<div class="box-content">
				<div class="alert alert-info">
					<a href="${projectName }/teacher/addPage.action" class="btn btn-success" href="#">
						<i class="glyphicon glyphicon-plus-sign"></i> 新增
					</a>
				</div>
				<table id="intable"
					class="table-striped table-bordered bootstrap-datatable datatable responsive">
					<thead>
						<tr>
							<th>姓名</th>
							<th>帐号名</th>
							<th>帐号状态</th>
							<th>创建时间</th>
							<th style="width: 400px;">操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<!--/span-->
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
<%=request.getParameter("iDisplayStart") == null ? 0 : request.getParameter("iDisplayStart")%>
	,
							"bProcessing" : true,
							"bServerSide" : true,
							"sDom" : "<'row'<'col-md-6'l><'col-md-6'f>r>t<'row'<'col-md-12'i><'col-md-12 center-block'p>>",
							//  		"sDom":   '<"top"fli>rt<"bottom"p><"clear">',
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
							"sAjaxSource" : '${projectName }/teacher/searchTeacher.action',
							"aoColumns" : [
									{
										"mData" : "realName",
										'sClass' : 'center'
									},
									{
										"mData" : "loginName",
										'sClass' : 'center'
									},
									{
										"mData" : "status",
										'sClass' : 'center',
										"mRender" : function(data, type, full) {
											var info = "";
											var zlass = "label label-warning";
											if (data == 1) {
												info = "启用";
												zlass = "label label-success";
											} else {
												info = "停用";
											}

											var rstr = "<span class='"+zlass+"'>"
													+ info + "</span>";
											return rstr;
										}
									},
									{
										"mData" : "createDate",
										'sClass' : 'center'
									},
									{
										"mData" : "id",
										'sClass' : 'center',
										"mRender" : function(data, type, full) {
											return "<a style='margin-right: 4px;' class='btn btn-success'  onclick='preSubmit(\""
													+ "${projectName }/teacher/showPage.action?id="
													+ data
													+ "\")'  href='javascript:;' ><i class='glyphicon glyphicon-zoom-in icon-white'></i>"
													+ "\n详情</a>"
													+ "<a class='btn btn-info' href='${projectName }/teacher/editPage.action?id="
													+ data
													+ "'>  <i class='glyphicon glyphicon-edit icon-white'></i>"
													+ "\n编辑</a> "
													+ "<a onclick='showTip("
													+ data
													+ ")'  class='btn btn-danger' href='javascript:;'> <i class='glyphicon glyphicon-lock icon-white'></i>"
													+ "\n修改状态</a>"
													+ "&nbsp;<a onclick='showDeleteTip("
													+ data
													+ ")' name='deletea' class='btn btn-danger' href='javascript:;'> <i class='glyphicon glyphicon-trash icon-white'></i>"
													+ "\n删除</a>";
										}
									}

							],

							//  	           "<a onclick='showTip("+data+")' name='deletea' class='btn btn-danger' href='javascript:;'> <i class='glyphicon glyphicon-trash icon-white'></i>"
							//                 +"\n删除</a>"
							"fnServerData" : function(sSource, aoData,
									fnCallback) {
								$.ajax({
									"type" : 'post',
									"url" : sSource,
									"dataType" : "json",
									"data" : aoData,
									"success" : function(resp) {
										//debugger;
										fnCallback(resp.list);
									}
								});

							}
						});

		$("#submitTip").click(function() {
			$.ajax({
				type : "POST",
				url : "${projectName }/systemUser/changSataus.action",
				data : "id=" + $("#myModal").data("delId"),
				success : function(msg) {
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

		$("#submitDeleteTip").click(function() {
			$.ajax({
				type : "POST",
				url : "${projectName }/systemUser/delete.action",
				data : "id=" + $("#myDeleteModal").data("delId"),
				success : function(msg) {
// 					msg = JSON.parse(msg).error;
					msg = msg.error;
					if (msg.errorCode != 0) {
						alert(msg.errorMessage);
					} else {
						tableObject.fnDraw();
						alert(msg.errorMessage);
// 						tableObject.api().ajax.reload();
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

	function showDeleteTip(id) {
		//e.preventDefault();
		$('#myDeleteModal').modal('show');
		$("#myDeleteModal").data("delId", id);
	}
</script>