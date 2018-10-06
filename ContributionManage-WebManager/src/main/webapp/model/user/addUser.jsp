<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <h2><i class="glyphicon glyphicon glyphicon-user"></i> 新增</h2>

        <div class="box-icon">
            <a href="#" class="btn btn-minimize btn-round btn-default"><i
                    class="glyphicon glyphicon-chevron-up"></i></a>
        </div>
    </div>
    <div class="box-content">
            <form role="form" class="form-horizontal " action="${projectName }/systemUser/editAction.action" method="post">  
                <div class="form-group">  
                    <label class="col-md-2 control-label" for="realName">姓名</label>  
                    <div class="col-md-6">  
                        <input class="form-control" name="realName" type="text" id="realName" placeholder="真实姓名" value="${object.realName }" />  
                    </div>  
                </div>  
                <div class="form-group">  
                    <label class="col-md-2 control-label" for="nickName">呢称</label>  
                    <div class="col-md-6">  
                        <input class="form-control" name="nickName" type="text" id="nickName" placeholder="呢称" value="${object.nickName }" />  
                    </div>  
                </div>  
                <div class="form-group">
					<label  class="col-md-2 control-label" for="exampleInputFile">头像</label>
					<div class="col-md-6">  
						<input type="hidden" name="imgUrl" id="imgSrc" value="${object.imgUrl }">
						 <input data-no-uniform="true" type="file" name="filedata" id="filedata">
						 <img alt="" src="" id="showImage"  style="width: 200px;display: none;">
					</div>
				</div>
				
				<div class="form-group">
					<input type="hidden" name="role" value="4">
					<label  class="col-md-2 control-label" for="type">角色</label>
					<div class="col-md-3">  
						<select id="roleselect" name="systemRoleId" class="form-control" >
<!-- 						  <option value="4">普通角色</option> -->
<!-- 						  <option value="1">运营角色</option> -->
<!-- 						  <option value="2">审核角色</option> -->
<!-- 						  <option value="999">超管</option> -->
						  <c:forEach items="${roleList}" var="r">
						  	 <option value="${r.id }">${r.name }</option>
						  </c:forEach>
						</select>
					</div>
				</div>
				 <div class="form-group">  
                    <label class="col-md-2 control-label" for="mobile">手机号码</label>  
                    <div class="col-md-6">  
                        <input class="form-control" name="mobile" type="text" id="mobile" placeholder="手机号" value="${object.mobile}" />  
                    </div>  
                </div>  
                
                
                
                <div class="form-group">  
                    <label class="col-md-2 control-label" for="email">邮箱地址</label>  
                    <div class="col-md-6">  
                        <input class="form-control" name="email" type="text" id="email" placeholder="邮箱地址" value="${object.email}" />  
                    </div>  
                </div>  
                
                <hr/>
                
                  <div class="form-group">  
                    <label class="col-md-2 control-label" for="loginName">登录名</label>  
                    <div class="col-md-6  ">  
                        <input class="form-control" name="loginName" type="text" id="loginName" placeholder="登录名" value="${object.loginName }" />  
                        <c:if test="${error!=null &&''!=error.errorMessage}" >
							<label class="control-label" for="loginName">${error.errorMessage}</label>
						</c:if>
                    </div>  
                </div>  
                
                
				 <div class="form-group" >  
                    <label class="col-md-2 control-label" for="password">登录密码</label>  
                    <div class="col-md-6">  
                        <input class="form-control" name="password" type="password" id="password" placeholder="登录密码" value="" />  
                    </div>  
                </div>  
                
                 <div class="form-group" >  
                    <label class="col-md-2 control-label" for="confirm_password">确认密码</label>  
                    <div class="col-md-6">  
                        <input class="form-control" name="confirm_password" type="password" id="confirm_password" placeholder="确认密码" value="" />  
                    </div>  
                </div>  

                <div class="form-group">  
                    <div class="col-md-offset-2 col-md-10">  
                        <button type="submit" class="btn btn-primary btn-sm">  
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
 <script type="text/javascript" charset="utf-8"> 
 $(function() {
	    $("#filedata").uploadify({
	        'height'        : 27,
	        'width'         : 80, 
	        'buttonText'    : '选择图片',
	        'swf'           : '${projectName }/misc/uploadify.swf',
	        'uploader'      : '${projectName }/baseUpload/uploadImg.action;jsessionid=<%=session.getId()%>',
	        'auto'          : true,
	        'multi'         : false,
	        'removeCompleted':true,
	        'progressData': 'percentage',
// 	        'cancelImg'     : '/js/uploadify/uploadify-cancel.png',
	        'fileTypeExts'  : '*.jpg;*.jpge;*.gif;*.png',
	        'fileSizeLimit' : '5MB',
	        'fileObjName' : 'file[]',
	        'formData'      : {'uploadType' : 2},
	        'onUploadSuccess':function(file,data,response){
				if(!data){
	        		alert("上传失败");
	        	}else{
	        		var obj = eval("("+data+")");
		        	if(!!obj.errorMessage && typeof(obj.errorMessage)!="undefined"){
		        		alert(obj.errorMessage);
		        	}else{
		        		$('#imgSrc').val(obj.object.fileUrl);
		        		$("#showImage").attr("src",obj.object.fileUrlPath);
		        		$("#showImage").show();
		        	}
	        	}
// 	            $('#' + file.id).find('.data').html('');
// 	            $("#filedata_name").val(data);
// 	            $("#filedata_img").attr("src","${pageContext.request.contextPath}/getImg?file="+data);  
// 	            $("#filedata_img").show();
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
	    
	    $('.form_datetime').datetimepicker({
	    	//      language:  'ch',
	    	     weekStart: 1,
	    	     todayBtn:  1,
	    		autoclose: 1,
	    		todayHighlight: 1,
	    		startView: 2,
	    		forceParse: 0,
	    	     showMeridian: 1
	    	 });
	    ///////////
	    
	    $("#roleselect").val(${object.role==null?4:object.role})
	    
	    
	    
	});
 //////////////////
 
	
 var MyValidator = function() {
	    var handleSubmit = function() {
	        $('.form-horizontal').validate({
	            errorElement : 'span',
	            errorClass : 'help-block',
	            focusInvalid : false,
	            rules : {
	                loginName : {
	                    required : true,
	                    remote:"${projectName }/systemUser/checkUnique.action"
	                },
	                email : {
	                    email:true 
	                },
	                mobile : {
// 	                	required : true,
	                    remote:"${projectName }/systemUser/checkUnique.action?filed=moblie"
	                },
	                password: { 
	                	required: true, 
	                	minlength: 5 
	                }, 
	                confirm_password: { 
	                	required: true, 
	                	minlength: 5, 
	                	equalTo: "#password" 
	                } 

	            },
	            messages : {
	                loginName : {
	                    required : "请输入登录名",
	                    remote:"该登录名已存在，不能重复使用。"
	                },
	                email: {
	                    email: "Your email address must be in the format of name@domain.com"
	                  },
	                  mobile: {
// 		                    required : "请输入手机号",
		                    remote:"该手机号已被注册，不能重复使用。"
		                },
	                password: { 
	                	required: "请输入密码", 
	                	minlength:  $.validator.format("密码不能小于{0}个字符")
	                	}, 
	                confirm_password: { 
	                	required: "请输入确认密码", 
	                	minlength:  $.validator.format("确认密码不能小于{0}个字符"), 
	                	equalTo: "两次输入密码不一致嘛" 
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