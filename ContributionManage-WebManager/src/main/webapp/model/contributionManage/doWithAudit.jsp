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
        <h2><i class="glyphicon glyphicon-tasks"></i> 审核</h2>

        <div class="box-icon">
            <a href="#" class="btn btn-minimize btn-round btn-default"><i
                    class="glyphicon glyphicon-chevron-up"></i></a>
<!--             <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a> -->
        </div>
    </div>
    <div class="box-content">
            <form role="form" class="form-horizontal " action="${projectName }/contributionManage/doWithAudit.action" method="post">  
					<div class="form-group">
						<label class="col-md-2 control-label" for="contributionTitel">稿件标题</label>
						<div class="col-md-6">
						<input class="form-control" value="${object.contributionTitel }" readonly="readonly"   type="text"  /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="author">原始撰稿人</label>
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
				
				<div  style=" border-bottom:solid 1px green; border-left:solid 1px gray; border-right:solid 1px blue; border-top:solid 1px black">
				</div> 
				
				<br />
				
				<div class="form-group">
					<label  class="col-md-2 control-label" for="auditStatus">审核结果</label>
					<div class="col-md-2">  
						<select name="auditStatus" class="form-control" >
						  <option value="1">通过</option>
						  <option value="-1">不通过</option>
						</select>
					</div>
				</div>
				
				<div class="form-group" >  
                    <label for="auditRemark" class="control-label col-md-2">审核意见</label>  
                    <div class="col-md-9">  
                        <textarea class="form-control" rows="5" name="auditRemark" placeholder="审核意见"></textarea>  
                    </div>  
                </div>  
                <input type="hidden" name="id" value="${object.id }" />
                <br />
  
                <div class="form-group">  
                    <div class="col-md-offset-2 col-md-10">  
                        <button type="submit" class="btn btn-primary btn-sm" >  
                            	确定 
                        </button>
                          <button type="button" class="btn btn-primary btn-sm" onclick="javascript:window.location.reload();">  
                       		     重置 
                        </button>  
                    </div>  
                </div> 
						 
<!-- 					<div class="form-group">   -->
<!--                 </div>  -->
            </form>  
    </div>
    </div>
    </div>
    <!--/span-->

    </div><!--/row-->
    <%@ include  file="/jsp/footer.jsp" %>
<%-- <jsp:include page="/footer.jsp"></jsp:include> --%>
 