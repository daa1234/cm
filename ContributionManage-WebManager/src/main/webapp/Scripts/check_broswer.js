checkedBrowser();
//checkedBrowser2();
//s6();
function checkedBrowser(){
/*
 * 智能机浏览器版本信息:
 * 
 */
var browser = {
	versions: function() {
			var u = navigator.userAgent, app = navigator.appVersion;
			return {// 移动终端浏览器版本信息
				trident: u.indexOf('Trident') > -1, // IE内核
				presto: u.indexOf('Presto') > -1, // opera内核
				webKit: u.indexOf('AppleWebKit') > -1, // 苹果、谷歌内核
				gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, // 火狐内核
//				mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), // 是否为移动终端
				mobile: !!u.match(/AppleWebKit.*Mobile.*/), // 是否为移动终端
				ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), // ios终端
				android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, // android终端或者uc浏览器
				iPhone: u.indexOf('iPhone') > -1 , // 是否为iPhone或者QQHD浏览器
				iPad: u.indexOf('iPad') > -1, // 是否iPad
				webApp: u.indexOf('Safari') == -1 // 是否web应该程序，没有头部与底部
			};
		}(),
		language: (navigator.browserLanguage || navigator.language).toLowerCase()
	}
	if (browser.versions.mobile) {
		location.href="/news/index.html";
	}else if (browser.versions.android || browser.versions.iPhone || browser.versions.iPad) {
		location.href="/news/index.html";
	}
}

function checkedBrowser2(){
var browser = { 
    versions : function() { 
        var u = navigator.userAgent, app = navigator.appVersion; 
        alert("版本: "+u); 
        alert("版本: "+app); 
        return {// 移动终端浏览器版本信息
        trident : u.indexOf('Trident') > -1, // IE内核
        presto : u.indexOf('Presto') > -1, // opera内核
        webKit : u.indexOf('AppleWebKit') > -1, // 苹果、谷歌内核
        gecko : u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, // 火狐内核
//        mobile : !!u.match(/AppleWebKit.*Mobile.*/) 
//                || !!u.match(/AppleWebKit/), // 是否为移动终端
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), // 是否为移动终端
        ios : !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), // ios终端
        android : u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, // android终端或者uc浏览器
        iPhone : u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, // 是否为iPhone或者QQHD浏览器
        iPad: u.indexOf('iPad') > -1, // 是否iPad
        webApp : u.indexOf('Safari') == -1,// 是否web应该程序，没有头部与底部
        google:u.indexOf('Chrome')>-1 
    }; 
}(), 
language : (navigator.browserLanguage || navigator.language).toLowerCase() 
} 

alert(" 是否为移动终端: "+browser.versions.mobile); 
}

function s6(){
	   var bForcepc  = fGetQuery("dv") == "pc";   
	      function  fBrowserRedirect(){   
	          var sUserAgent = navigator.userAgent.toLowerCase();  
	          var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";    
	          var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";  
	          var bIsMidp = sUserAgent.match(/midp/i) == "midp";  
	          var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";  
	          var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";  
	          var bIsAndroid = sUserAgent.match(/android/i) == "android";  
	          var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";  
	          var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";   
	          if(bIsIpad){   
	              var sUrl =  location.href;      
	              if(!bForcepc){   
//	                  window.location.href = "http://ipad.mail.163.com/";  
	                  alert("ipc");
	              }   
	          }   
	          if(bIsIphoneOs || bIsAndroid){   
	              var sUrl =  location.href;      
	              if(!bForcepc){   
//	                  window.location.href = "http://smart.mail.163.com/";  
	                  alert("pc");
	              }   
	          }   
	          if(bIsMidp||bIsUc7||bIsUc||bIsCE||bIsWM){   
	              var sUrl = location.href;      
	              if(!bForcepc){   
//	                  window.location.href = "http://m.mail.163.com/";  
	                  alert("!!!!!pc");
	              }   
	          }   
	      }  
	      function  fGetQuery(name){// 获取参数值
	          var sUrl = window.location.search.substr(1);  
	          var r = sUrl.match(new RegExp("(^|&)" + name + "=([^&]*)(&|$)"));  
	          return (r == null ? null : (r[2]));  
	      }  
	      function  fShowVerBlock(){     
	          if(bForcepc){   
	              document.getElementByIdx_x("dv_block").style.display = "block";  
	          }   
	          else{   
	              document.getElementByIdx_x("ad_block").style.display = "block";  
	          }   
	      }  
	      fBrowserRedirect();   
}