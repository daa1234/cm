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
        <h2><i class="glyphicon glyphicon-tasks"></i> 详情</h2>

        <div class="box-icon">
            <a href="#" class="btn btn-minimize btn-round btn-default"><i
                    class="glyphicon glyphicon-chevron-up"></i></a>
<!--             <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a> -->
        </div>
    </div>
    <div class="box-content">
            <form role="form" class="form-horizontal " >  
					<div class="form-group">
						<label class="col-md-2 control-label" for="contributionTitel">稿件标题</label>
						<div class="col-md-6">
						<input class="form-control" value="${object.contributionTitel }" readonly="readonly"   type="text"  /> 
						</div>
					</div>
					<div class="form-group">  
                    <label class="col-md-2 control-label" for="publishPlatform">稿件状态</label> 
					<div class="col-md-6">  
						<input class="form-control" name="publishPlatform" type="text" 
						<c:if test="${object.auditStatus == -1 }">
							value="不通过" 
						</c:if>
						<c:if test="${object.auditStatus == 0 }">
							value="审核中" 
						</c:if>
						<c:if test="${object.auditStatus == 1 }">
							value="通过" 
						</c:if>
						<c:if test="${object.auditStatus == 2 }">
							value="已结算" 
						</c:if>
						readonly="readonly"  /> 
					</div>
                </div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="author">原始撰稿人（持卡人）</label>
						<div class="col-md-6">
						<input class="form-control" name="author" type="text" value="${object.author }" readonly="readonly"  /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="money">稿费金额</label>
						<div class="col-md-6">
						<input class="form-control" name="money" type="text" value="${object.money }" readonly="readonly"  /> 
						</div>
					</div>  
					<div class="form-group">
						<label class="col-md-2 control-label" for="authorCompany">撰稿人单位</label>
						<div class="col-md-6">
						<input class="form-control" name="authorCompany" type="text" value="${object.authorCompany }" readonly="readonly"   /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="authorTitle">撰稿人职称</label>
						<div class="col-md-6">
						<input class="form-control" name="authorTitle" type="text" value="${object.authorTitle }" readonly="readonly"   /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="authorEmail">撰稿人邮箱</label>
						<div class="col-md-6">
						<input class="form-control" name="authorEmail" type="text" value="${object.authorEmail }" readonly="readonly"  /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="mobile">撰稿人手机号</label>
						<div class="col-md-6">
						<input class="form-control" name="mobile" type="text" value="${object.mobile }" readonly="readonly"  /> 
						</div>
					</div>
				 	 <div class="form-group">
							<label class="col-md-2 control-label" for="bankName">撰稿人开户行</label>
							<div class="col-md-6">
							<input class="form-control" name="bankName" type="text" value="${object.bankName }" readonly="readonly"  /> 
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
							<input class="form-control" name="bankNo" type="text" value="${object.bankNo }" readonly="readonly"  /> 
							</div>
					</div>
				<div class="form-group">
					<label class="col-md-2 control-label" for="identityCard">撰稿人身份证信息</label>
					<div class="col-md-6">
					<input class="form-control" name="identityCard" type="text" value="${object.identityCard }" readonly="readonly"  /> 
					</div>
				</div>
				
				<div class="form-group">  
                    <label class="col-md-2 control-label" for="publishPlatform">发布平台</label> 
					<div class="col-md-6">  
						<input class="form-control" name="publishPlatform" type="text" value="${object.publishPlatform }" readonly="readonly"  /> 
					</div>
                </div>
                <div class="form-group">  
                	      <label for="releaseTime" class="col-md-2 control-label">发布时间</label> 
                	      <div class="col-md-6">  
							<input class="form-control" name="releaseTime" type="text" value="${object.releaseTime }" readonly="readonly"  /> 
						</div>
                </div>
                <div class="form-group" >  
                    <label class="col-md-2 control-label" for="remark">备注</label> 
                    <div class="col-md-9">  
                        <textarea class="form-control" rows="5" readonly="readonly" >${object.remark }</textarea>  
                    </div>  
                </div>  
				<c:if test="${not empty object.auditRemark }">
					<div class="form-group" >  
	                    <label class="col-md-2 control-label" for="remark">审核意见</label> 
	                    <div class="col-md-9">  
	                        <textarea class="form-control" rows="5" readonly="readonly" >${object.auditRemark }</textarea>  
	                    </div>  
	                </div>  
				</c:if>						 
					<div class="form-group">  
                </div> 
            </form>  
    </div>
    </div>
    </div>
    <!--/span-->

    </div><!--/row-->
    <%@ include  file="/jsp/footer.jsp" %>
<%-- <jsp:include page="/footer.jsp"></jsp:include> --%>
 