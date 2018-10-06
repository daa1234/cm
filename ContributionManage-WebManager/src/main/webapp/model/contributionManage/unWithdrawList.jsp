<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <jsp:include page="/header.jsp"></jsp:include> --%>
<%@ include  file="/jsp/header.jsp" %>
    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-leaf"></i>稿件结算</h2>

        <div class="box-icon">
<!--             <a href="#" class="btn btn-setting btn-round btn-default"><i class="glyphicon glyphicon-cog"></i></a> -->
            <a href="#" class="btn btn-minimize btn-round btn-default"><i
                    class="glyphicon glyphicon-chevron-up"></i></a>
<!--             <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a> -->
        </div>
    </div>
    <div class="box-content">
    <div class="alert alert-info">
					<a  class="btn btn-success" href="${projectName}/contributionManage/export.action")">
						<i class="glyphicon glyphicon-plus-sign"></i> 生成EXCEL
					</a>
				</div>
    <table id="intable" class="table-striped table-bordered bootstrap-datatable datatable responsive">
    <thead>
    <tr>
         <th>稿件标题</th>
        <th>稿费金额（元）</th>
        <th>原始撰稿人（持卡人）</th>
        <th> 身份证</th>
        <th>银行卡号</th>
        <th>开户行</th>
        <th>手机号</th>
        <th>发布平台</th>
        <th>发布时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    </table>
    
    </div>
    </div>
    </div>
    <!--/span-->
    </div><!--/row-->
    <%@ include  file="/jsp/footer.jsp" %>
<%-- <jsp:include page="/footer.jsp"></jsp:include> --%>
<script>
var channel = null;
var tableObject =null;
$(function(){
	  //datatable
   tableObject =  $('#intable').dataTable({
    	"bProcessing": true,
		"bServerSide": true,
        "sScrollY": "100%",
		"iDisplayStart" :
		<%=request.getParameter("iDisplayStart") == null ? 0 : request.getParameter("iDisplayStart")%>
		,
        "sDom": "<'row'<'col-md-6'l <'#mytoolbox'>><'col-md-6'f>r>t<'row'<'col-md-12'i><'col-md-12 center-block'p>>",
//  		"sDom":   '<"top"fli>rt<"bottom"p><"clear">',
        "sPaginationType": "bootstrap",
        "oLanguage": {
        	"sLengthMenu": "每页显示 _MENU_ 条记录",
        	"sZeroRecords": "抱歉， 没有找到",
        	"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
        	"sInfoEmpty": "没有数据",
        	"sInfoFiltered": "(从 _MAX_ 条数据中检索)",
        	"oPaginate": {  
        	    "sFirst": "首页",  
        	    "sPrevious": "前一页",
        	    "sNext": "后一页",  
        	    "sLast": "尾页"  
        	}, 
        	"sSearch":"关键字:",
        	"sZeroRecords": "没有检索到数据",  
        	"sProcessing": "<img src='${projectName }/img/ajax-loaders/ajax-loader-4.gif' />"
        },
		"bAutoWidth": true,
    	"sAjaxSource": '${projectName}/contributionManage/queryUnSetAccount.action',
    		"aoColumns":
 	           [  
 	            { "mData": "contributionTitel", 'sClass':'center'},
 	        	{ "mData": "money", 'sClass':'center'},
 	        	{ "mData": "author", 'sClass':'center'},
 	        	{ "mData": "identityCard", 'sClass':'center'},
 	        	{ "mData": "bankNo", 'sClass':'center'},
 	        	{ "mData": "bankName", 'sClass':'center'},
 	        	{ "mData": "mobile", 'sClass':'center'},
 	        	{ "mData": "publishPlatform", 'sClass':'center'},
 	        	{ "mData": "releaseTime", 'sClass':'center'},
				{
					"mData" : "id",
					'sClass' : 'center',
					"mRender" : function(data, type, full) {
						return "<a style='margin-right: 4px;' class='btn btn-success'   href='javascript:setAccount("+data+");' ><i class='glyphicon glyphicon-zoom-in icon-white'></i>" 
	            		+"\n结算</a>";
					}
				}
 	            ],
 	        "fnServerData" : function(sSource, aoData, fnCallback) {
 	        	 //添加额外的参数传给服务器
	        		 var temp ={};
	 	        	 temp.name="type";
	 	        	temp.value=0;
		       		 aoData.push(temp);
 				$.ajax({
 					"type" : 'post',
 					"url" : sSource,
 					"dataType" : "json",
 					"data" :aoData,
 					"success" : function(resp) {
 						fnCallback(resp.object);
 					}
 				});
 			}
    });
})

</script>
<script type="text/javascript">
function setAccount(id){
	if(confirm("确定要结算吗？")){
		$
		.ajax({
			url : "${projectName }/contributionManage/setAccount.action", //请求的url地址
			dataType : "json", //返回格式为json
			async : true,//请求是否异步，默认为异步，这也是ajax重要特性
			data : {
				"id" : id
			}, //参数值
			type : "POST", //请求方式
			success : function(data) {
				debugger;
				alert(data.error.errorMessage);
				location.reload();
			}
		});
	}
}
</script>