<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <jsp:include page="/header.jsp"></jsp:include> --%>
<%@ include  file="/jsp/header.jsp" %>
    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-leaf"></i>稿件收集</h2>

        <div class="box-icon">
<!--             <a href="#" class="btn btn-setting btn-round btn-default"><i class="glyphicon glyphicon-cog"></i></a> -->
            <a href="#" class="btn btn-minimize btn-round btn-default"><i
                    class="glyphicon glyphicon-chevron-up"></i></a>
<!--             <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a> -->
        </div>
    </div>
    <div class="box-content">
    <div class="alert alert-info"><a href="${projectName }/contributionManage/addPage.action"   class="btn btn-success" href="#">
    <i class="glyphicon glyphicon-plus-sign"></i> 添加稿件</a>
    </div>
    <table id="intable" class="table-striped table-bordered bootstrap-datatable datatable responsive">
    <thead>
    <tr>
        <th>稿件标题</th>
        <th>稿费金额（元）</th>
        <th>原始撰稿人（持卡人）</th>
        <th>发布平台</th>
        <th>发布时间</th>
        <th>稿件状态</th>
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
    	"sAjaxSource": '${projectName }/contributionManage/query.action',
    		"aoColumns":
 	           [  
 	            { "mData": "contributionTitel", 'sClass':'center'},
 	        	{ "mData": "money", 'sClass':'center'},
 	        	{ "mData": "author", 'sClass':'center'},
 	        	{ "mData": "publishPlatform", 'sClass':'center'},
 	        	{ "mData": "releaseTime", 'sClass':'center'},
 	        	{ "mData": "auditStatus", 'sClass':'center',"mRender":function(data,type,full){
 	        		if(data==undefined){
 	        			return "";
 	        		}
 	        		if(data==-1){
 	        			return "未通过";
 	        		}
 	        		if(data==0){
 	        			return "审核中";
 	        		}
 	        		if(data==1){
 	        			return "已通过";
 	        		}
 	        		if(data==2){
 	        			return "已结算";
 	        		}
 	        		}
 	        	},
				{
					"mData" : "id",
					'sClass' : 'center',
					"mRender" : function(data, type, full) {
						return "<a style='margin-right: 4px;' class='btn btn-success'   href='${projectName }/baseUpload/dowloadFile.action?path="+full.contributionUrl+"&filename="+full.fileName+"&uploadType=2'>"
								+ "<i class='glyphicon glyphicon-zoom-in icon-white'></i>\n下载稿件</a>"
								+ "<a class='btn btn-info' href='${projectName }/contributionManage/show.action?id="+data+"'>  <i class='glyphicon glyphicon-edit icon-white'></i>"
			 	                   +"\n详情</a>";
					}
				}
 	            ],
 	        "fnServerData" : function(sSource, aoData, fnCallback) {
 	        	 //添加额外的参数传给服务器
	        	 var selectCategory=  $("#auditStatus").val();
	        	 if(selectCategory){
	        		 var temp ={};
	 	        	 temp.name="auditStatus";
	 	        	temp.value=selectCategory;
		       		 aoData.push(temp);
	        	 }
 				$.ajax({
 					"type" : 'post',
 					"url" : sSource,
 					"dataType" : "json",
 					"data" :aoData,
 					"success" : function(resp) {
  						debugger;
 						fnCallback(resp.object);
 					}
 				});
 	
 			},
			"fnInitComplete":initComplete
    });
	  
	
	
  
})

function showTip(id){
		//e.preventDefault();
        $('#myModal').modal('show');
        $("#myModal").data("delId", id);
}

/**
	     * 表格加载渲染完毕后执行的方法
	     * @param data
	     */
	function initComplete(data) {
		// 	alert( 'DataTables has finished its initialisation.' );
		var dataPlugin = "";
		dataPlugin = ''
				+ '<label>审核状态:<select id="auditStatus"><option value=""> </option><option value="0">审核中</option><option value="-1">未通过</option><option value="1">已通过</option><option value="2">已结算</option></select></label>'
				+ '';
		$('#mytoolbox').append(dataPlugin);

		//选择时间后触发重新加载的方法
		$("#auditStatus").change(function() {
			debugger;
			//当选择时间后，出发dt的重新加载数据的方法
			tableObject.api().ajax.reload();
		});
	}
</script>