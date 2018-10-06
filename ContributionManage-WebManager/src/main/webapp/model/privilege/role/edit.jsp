<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<i class="glyphicon glyphicon-tasks"></i> 修改
				</h2>

				<div class="box-icon">
					<a href="#" class="btn btn-minimize btn-round btn-default">
						<i class="glyphicon glyphicon-chevron-up"></i>
				 	</a>
				</div>
			</div>
			<div class="box-content">
				<form role="form" class="form-horizontal "
					action="${projectName }/role/editAction.action" method="post">
					<input type="hidden" value="${object.id }" name="id">
					<div class="form-group">
						<label class="col-md-2 control-label" for="name">名称</label>
						<div class="col-md-9">
							<input class="form-control" name="name" type="text" id="name"
								placeholder="name" value="${object.name }" />
						</div>
					</div>

					<div class="form-group" id="remark">
						<label for="remark" class="control-label col-md-2">备注</label>
						<div class="col-md-9">
							<textarea id="remark" class="form-control" rows="5" name="remark"
								placeholder="remark">${object.remark }</textarea>
						</div>
					</div>


					<div class="form-group">
						<div class="col-md-offset-2 col-md-10">
							<button type="submit" class="btn btn-primary btn-sm">确定
							</button>
							<button type="button" class="btn btn-primary btn-sm"
								onclick="javascript:window.location.reload();">重置</button>
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

	var MyValidator = function() {
		var handleSubmit = function() {
			$('.form-horizontal').validate({
				errorElement : 'span',
				errorClass : 'help-block',
				focusInvalid : false,
				rules : {
					name : {
						required : true
					},
					code : {
						required : true
					},
					content : {
						required : true
					},
					url : {
						required : true
					}
				},
				messages : {
					name : {
						required : "name is required."
					},
					code : {
						required : "code is required."
					},
					content : {
						required : "content is required."
					},
					url : {
						required : "url is required."
					}
				},

				highlight : function(element) {
					$(element).closest('.form-group').addClass('has-error');
				},

				success : function(label) {
					label.closest('.form-group').removeClass('has-error');
					label.remove();
				},

				errorPlacement : function(error, element) {
					element.parent('div').append(error);
				},

				submitHandler : function(form) {
					form.submit();
				}
			});

			$('.form-horizontal input').keypress(function(e) {
				if (e.which == 13) {
					if ($('.form-horizontal').validate().form()) {
						$('.form-horizontal').submit();
					}
					return false;
				}
			});
		}
		return {
			init : function() {
				handleSubmit();
			}
		};

	}();

	MyValidator.init();
</script>
