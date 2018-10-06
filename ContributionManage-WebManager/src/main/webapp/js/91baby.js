
function callReturnUrl() {
	var retUrl = GetQueryString("retUrl");
	if(retUrl==null){
		window.history.back(); 
	}else{
			var hasParam = (retUrl.indexOf('?') != -1);
			if (retUrl) {
				var iDisplayStart = GetQueryString("iDisplayStart");
				if (iDisplayStart) {
					var riDisplayStart = GetQueryStringByUrl(retUrl, "iDisplayStart");
					if (riDisplayStart) {
						location.href = retUrl.substring(0, retUrl
								.indexOf('iDisplayStart='))
								+ "iDisplayStart=" + iDisplayStart;
					} else if (hasParam) {
						location.href = retUrl + "&iDisplayStart=" + iDisplayStart
					} else {
						location.href = retUrl + "?iDisplayStart=" + iDisplayStart
					}
				} else {
					location.href = retUrl;
				}
			}
	}
}

function preSubmit(url) {
	var info = tableObject.api().page.info();
	var displayStart = info.length * info.page;
	location.href = url + "&iDisplayStart=" + displayStart + "&retUrl="
			+ encodeURIComponent(this.location.href);
}

function preSubmitRetUrl(url) {
	location.href = url + "&retUrl=" + encodeURIComponent(this.location.href);
}

function GetQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}

function GetQueryStringByUrl(url, name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	if (url.indexOf("?") != -1) {
		var r = url.substr(url.indexOf("?")).substr(1).match(reg);
	}
	if (r != null)
		return unescape(r[2]);
	return null;
}

	function setPlace(val) {
			$.ajax({
				"type" : 'GET',
				"url" : "http://api.map.baidu.com/geocoder/v2/?ak=3ecea51f560650b1ed8a4b99808f52e8&output=json&address="
						+ val,
				"dataType" : "JSONP",
				"success" : function(data) {
					if (data.status == 0) {
						var _value = data.result;
						if (_value.location) {
							if (_value.location.lat && _value.location.lng) {
								$("#longitude").val(_value.location.lng);
								$("#latitude").val(_value.location.lat);
							}
						}
					}
				}
			});
	}


function current_times() {
	// 获取当前日期
	var date_time = new Date();
	// 年
	var year = date_time.getFullYear();
	// 判断小于10，前面补0
	if (year < 10) {
		year = "0" + year;
	}
	// 月
	var month = date_time.getMonth() + 1;
	// 判断小于10，前面补0
	if (month < 10) {
		month = "0" + month;
	}
	// 日
	var day = date_time.getDate();
	// 判断小于10，前面补0
	if (day < 10) {
		day = "0" + day;
	}
	// 时
	var hours = date_time.getHours();
	// 判断小于10，前面补0
	if (hours < 10) {
		hours = "0" + hours;
	}
	// 分
	var minutes = date_time.getMinutes();
	// 判断小于10，前面补0
	if (minutes < 10) {
		minutes = "0" + minutes;
	}
	// 秒
	var seconds = date_time.getSeconds();
	// 判断小于10，前面补0
	if (seconds < 10) {
		seconds = "0" + seconds;
	}
	// 拼接年月日时分秒
	var date_str = year + "-" + month + "-" + day;
	return date_str;
}
