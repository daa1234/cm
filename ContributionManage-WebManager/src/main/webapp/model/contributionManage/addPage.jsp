<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--     <jsp:include page="/header.jsp"></jsp:include> --%>
<%@ include  file="/jsp/header.jsp" %>

   <div>
         <ul class="breadcrumb">
			<li><a href="javascript:;" onClick="javascript:history.back(-1);">返回上一页</a></li>
		</ul>
    </div>

    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-tasks"></i> 新增</h2>

        <div class="box-icon">
            <a href="#" class="btn btn-minimize btn-round btn-default"><i
                    class="glyphicon glyphicon-chevron-up"></i></a>
<!--             <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a> -->
        </div>
    </div>
    <div class="box-content">
            <form role="form" class="form-horizontal " action="${projectName }/contributionManage/save.action" method="post">  
					<div class="form-group">
						<label class="col-md-2 control-label" for="contributionTitel">稿件标题</label>
						<div class="col-md-6">
						<input class="form-control" name="contributionTitel" type="text" id="contributionTitel" placeholder="稿件标题"  /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="author">原始撰稿人（持卡人）</label>
						<div class="col-md-6">
						<input class="form-control" name="author" type="text" id="author" placeholder="原始撰稿人"  /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="money">稿费金额</label>
						<div class="col-md-6">
						<input class="form-control" name="money" type="text" id="money" placeholder="稿费金额，单位元"  /> 
						</div>
					</div>  
					<div class="form-group">
						<label class="col-md-2 control-label" for="authorCompany">撰稿人单位</label>
						<div class="col-md-6">
						<input class="form-control" name="authorCompany" type="text" id="authorCompany" placeholder="撰稿人单位"  /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="authorTitle">撰稿人职称</label>
						<div class="col-md-6">
						<input class="form-control" name="authorTitle" type="text" id="authorTitle" placeholder="撰稿人职称"  /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="authorEmail">撰稿人邮箱</label>
						<div class="col-md-6">
						<input class="form-control" name="authorEmail" type="text" id="authorEmail" placeholder="撰稿人邮箱"  /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="mobile">撰稿人手机号</label>
						<div class="col-md-6">
						<input class="form-control" name="mobile" type="text" id="mobile" placeholder="撰稿人手机号"  /> 
						</div>
					</div>
				 	 <div class="form-group">
							<label class="col-md-2 control-label" for="bankName">撰稿人开户行</label>
							<div class="col-md-6">
							<input class="form-control" name="bankName" type="text" id="bankName" placeholder="开户行"  /> 
							</div>
						</div>
<!-- 				 	 <div class="form-group"> -->
<!-- 							<label class="col-md-2 control-label" for="bankUserName"> 户名</label> -->
<!-- 							<div class="col-md-6"> -->
<%-- 							<input class="form-control" name="bankUserName" type="text" id="bankUserName" placeholder="户名" value="${object.bankUserName }" />  --%>
<!-- 							</div> -->
<!-- 						</div> -->
				 	 <div class="form-group">
							<label class="col-md-2 control-label" for="bankNo">撰稿人银行卡账号</label>
							<div class="col-md-6">
							<input class="form-control" name="bankNo" type="text" id="bankNo" placeholder="银行卡账号"   /> 
							</div>
					</div>
				<div class="form-group">
					<label class="col-md-2 control-label" for="identityCard">撰稿人身份证信息</label>
					<div class="col-md-6">
					<input class="form-control" name="identityCard" type="text" id="identityCard" placeholder="身份证信息"   /> 
					</div>
				</div>
				
				<div class="form-group">  
                    <label class="col-md-2 control-label" for="publishPlatform">发布平台</label> 
					<div class="col-md-6">  
						<input class="form-control" name="publishPlatform" type="text" id="publishPlatform" placeholder="发布平台"   /> 
					</div>
                </div>
                <div class="form-group">  
                	      <label for="releaseTime" class="col-md-2 control-label">发布时间</label> 
		                <div  class="input-group date form_datetime col-md-6" data-date="2017-08-08" data-date-format="yyyy-mm-dd" data-link-field="releaseTime">
		                    <input id="releaseTime" name="releaseTime" class="form-control"  type="text" value="" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
		                </div>
                </div>
                <div class="form-group" >  
                    <label class="col-md-2 control-label" for="remark">备注</label> 
                    <div class="col-md-9">  
                        <textarea class="form-control" rows="5" name="remark" placeholder="备注"></textarea>  
                    </div>  
                </div>  
                <!-- 上传文件 -->
                <div class="form-group">
					<label  class="col-md-2 control-label" for="contributionUrl">上传稿件文件</label>
					<div class="col-md-6">  
						<input type="hidden" name="contributionUrl" id="contributionUrl" value="">
						<input type="hidden" name="fileName" id="fileName" value="">
						 <input data-no-uniform="true" type="file" name="filedata" id="filedata">
<!-- 						 <img alt="" src="" id="showImage"  style="width: 200px;display: none;"> -->
						 <div style="display:none;font-size:20px;"  id="upLoadResult" ></div> 
					</div>
				</div>
						 
					<div class="form-group">  
                    <div class="col-md-offset-2 col-md-10">  
                        <button type="button" onclick="javascript:validateUploadFile();" class="btn btn-primary btn-sm" id="commit">  
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

    </div><!--/row-->
    <%@ include  file="/jsp/footer.jsp" %>
<%-- <jsp:include page="/footer.jsp"></jsp:include> --%>
 <script type="text/javascript" charset="utf-8"> 
 function validateUploadFile(){
	 debugger;
	 var contributionUrl = $("#contributionUrl").val();
	 if(contributionUrl == null || contributionUrl == ''){
		 alert("请上传文件！")
		 return false;
	 }else{
		 $("#commit").submit();
	 }
 }
 $(function() {
	 var currentTime = current_times();
	 $("#releaseTime").val(currentTime);
	 $('.form_datetime').datetimepicker({
			//      language:  'ch',
			minView : 2,
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1,
			format : "yyyy-mm-dd",
			pickerPosition : "bottom-left"
		});
	  $("#filedata").uploadify({
		        'height'        : 27,
		        'width'         : 80, 
		        'buttonText'    : '选择文件',
		        'swf'           : '${projectName }/misc/uploadify.swf',
		        'uploader'      : '${projectName }/baseUpload/uploadPdf.action;jsessionid=<%=session.getId()%>',
		        'auto'          : true,
		        'multi'         : false,
		        'removeCompleted':true,
		        'progressData': 'percentage',
//	 	        'cancelImg'     : '/js/uploadify/uploadify-cancel.png',
		        'fileTypeExts'  : '*.doc;*.docx;*.pdf',
		        'fileSizeLimit' : '20MB',
		        'fileObjName':'file[]',
		        'formData'      : {'uploadType' : 2},
		        'onUploadSuccess':function(file,data,response){
		        	debugger;
					if(!data){
		        		$("#upLoadResult").html("文件"+file.name+"上传失败");
		        	}else{
		        		debugger;
		        		var obj = eval("("+data+")");
			        	if(!!obj.errorMessage && typeof(obj.errorMessage)!="undefined"){
			        		$("#upLoadResult").html(obj.errorMessage);
			        	}else{
			        		console.log(obj);
			        		console.log(obj.object);
			        		console.log(obj.object.fileUrl);
			        		$('#contributionUrl').val(obj.object.fileUrl);
			        		$('#fileName').val(file.name);
			        		$("#upLoadResult").html("文件<span style='color:blue;'>"+file.name+"</span>上传成功");
			        		$("#upLoadResult").show();
			        	}
		        	}
		        },
		        //加上此句会重写onSelectError方法【需要重写的事件】
		        'overrideEvents': ['onSelectError', 'onDialogClose'],
		        //返回一个错误，选择文件的时候触发
		        'onSelectError':function(file, errorCode, errorMsg){
		            switch(errorCode) {
		                case -110:
		                    alert("文件 ["+file.name+"] 大小超出系统限制的" + jQuery('#filedata').uploadify('settings', 'fileSizeLimit') + "大小！");
		                    break;
		                case -120:
		                    alert("文件 ["+file.name+"] 大小异常！");
		                    break;
		                case -130:
		                    alert("文件 ["+file.name+"] 类型不正确！");
		                    break;
		            }
		        },
		    });
	 });
 var MyValidator = function() {
	    var handleSubmit = function() {
	        $('.form-horizontal').validate({
	            errorElement : 'span',
	            errorClass : 'help-block',
	            focusInvalid : false,
	            rules : {
	                
	                contributionTitel : {
	                    required : true
	                },
	                author : {
	                    required : true
	                },
	                money : {
	                    required : true,
	                    digits : true
	                },
	                mobile : {
	                    required : true ,
	                    remote:{
	                        url:"${projectName }/validate/validateMobile.action"
	                    }
	                },
	                bankName : {
	                    required : true
	                },
	                bankNo : {
	                    required : true ,
	                    remote:{
	                        url:"${projectName }/validate/validateBankNo.action"
	                    }
	                },
	                identityCard : {
	                    required : true ,
	                    remote:{
	                        url:"${projectName }/validate/validateIdentityCard.action"
	                    }
	                },
	                contributionUrl : {
	                    required : true
	                },
	                authorCompany : {
	                    required : true
	                },
	                authorTitle : {
	                    required : true
	                },
	                authorEmail : {
	                    required : true ,
	                    remote:{
	                        url:"${projectName }/validate/validateEmail.action"
	                    }
	                } ,
	                releaseTime : {
	                    required : true
	                }
	            },
	            messages : {
	            	 contributionTitel : {
		                    required : "稿件标题不能为空"
		                },
		                author : {
		                    required : "稿件标题不能为空"
		                },
		                money : {
	                    required : "稿费金额不能为空",
	                    digits : "稿费金额必须为正整数"
	                },
	                mobile : {
	                    required : "撰稿人手机号不能为空",
	                    remote : "撰稿人手机号不符合规范"
	                },
	                bankName : {
	                    required : "撰稿人开户行不能为空"
	                },
	                bankNo : {
	                    required : "撰稿人银行卡账号不能为空",
	                    remote : "撰稿人银行卡账号不符合规范"
	                },
	                identityCard : {
	                    required : "撰稿人身份证信息不能为空",
	                    remote : "撰稿人身份证信息不符合规范"
	                },
	                contributionUrl : {
	                    required : "请上传稿件文件"
	                },
	                authorCompany : {
	                    required : "撰稿人单位不能为空"
	                },
	                authorTitle : {
	                    required : "撰稿人职称不能为空"
	                },
	                authorEmail : {
	                    required : "撰稿人邮箱不能为空" ,
	                    remote:"撰稿人邮箱不符合规范"
	                } ,
	                releaseTime : {
	                    required : "发布时间不能为空"
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