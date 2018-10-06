$(function(){
	
	 tbl = $("#fuck").dataTable({
			"oLanguage" : { // 汉化
				"sProcessing" : "正在加载数据...",
				"sLengthMenu" : "显示_MENU_条 ",
				"sZeroRecords" : "没有您要搜索的内容",
				"sInfo" : "从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",
				"sInfoEmpty" : "记录数为0",
				"sInfoFiltered" : "(全部记录数 _MAX_  条)",
				"sInfoPostFix" : "",
				"sSearch" : "搜索",
				"oPaginate" : {
					"sFirst" : "第一页",
					"sPrevious" : " 上一页 ",
					"sNext" : " 下一页 ",
					"sLast" : " 最后一页 "
				}
			},
			"bJQueryUI": true,
			"bPaginate" : true,// 分页按钮
			"bFilter" : true,// 搜索栏
			"bLengthChange" : true,// 每行显示记录数
			"iDisplayLength" : 10,// 每页显示行数
			"bSort" : false,// 排序
			//"aLengthMenu": [[50,100,500,1000,10000], [50,100,500,1000,10000]],//定义每页显示数据数量
			//"iScrollLoadGap":400,//用于指定当DataTable设置为滚动时，最多可以一屏显示多少条数据
			//"aaSorting": [[4, "desc"]],
			"bInfo" : true,// Showing 1 to 10 of 23 entries 总记录数没也显示多少等信息
			"bWidth":true,
			//"sScrollY": "62%",
            //"sScrollX": "210%",
            "bScrollCollapse": true,
//			"sPaginationType" : "full_numbers", // 分页，一共两种样式 另一种为two_button // 是datatables默认
			"bProcessing" : true,
			"bServerSide" : true,
			"bDestroy": true,
			"bSortCellsTop": true,	
//	        "sAjaxSource": '/searchInformationAction.action', 
	        "aoColumns":
	           [  
	            { "mData": "id", 'sClass':'left'},
	        	{ "mData": "title", 'sClass':'center'}, 
	        	{ "mData": "content",'sClass':'center'},
	        	{ "mData": "createDate", 'sClass':'center'}
	            	/*
	            	{ "mData": "pass<a href="http://www.it165.net/edu/ebg/" target="_blank" class="keylink">word</a>",'sClass':'left',"mRender":function(data,type,full){
	            		return "<button type='button' onclick=fuck11("+data+")>"+data+"</button>"
	            		}
	            	}
	            	*/
	            ],
	        "fnServerData" : function(sSource, aoData, fnCallback) {
				$.ajax({
					"type" : 'post',
					"url" : sSource,
					"dataType" : "json",
					"data" : {
						aoData : "[]"
					},
					"success" : function(resp) {
						fnCallback(resp);
					}
				});
	
			}
			 
		});
	 

});