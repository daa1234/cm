/**
 * 已知图片的宽度和高度的等比例缩放
 */
 
 function knowImgSize(id) {
    var idWidth = $(id).width();  // 容器的宽度和高度
      var  idHeight = $(id).height();
    $(id + ' img').each(function(index,img){
        var img_w = $(this).width();
          var  img_h = $(this).height();
          if(img_w==0||img_h==0){
        	   $(this).css("width",idWidth).css("height","auto");
          }
        // 如果图片自身宽度大于容器的宽度的话 那么高度等比例缩放
        if(img_w > idWidth) {
            
            var height = img_h * idWidth / img_w;
            $(this).css({"width":idWidth, "height":height});
        }
        
    });
 
 }
 function knowbodySize(id) {
	    var idWidth = $(id).width();  // 容器的宽度和高度
	      var  idHeight = $(id).height();
	    $("#bobyid").each(function(index,img){
//	    	var width = $(window).width();
	    	   var x = navigator;
	   	    var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
//	   	    var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
	        // 自适应
	        if(w < idWidth) {
	            $(this).css({"width":w, "height":idHeight});
	        }else{
	        	
	        }
	    });
	 }
 // 初始化
 $(function(){
    knowbodySize("#bobyid");
    knowImgSize("#divcsss");
 });