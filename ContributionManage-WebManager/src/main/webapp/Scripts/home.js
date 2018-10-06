define("pagelet/feedlist/feedlist.js",
function(require, exports, module) {
    var bdshare = require("common/util/bdshare.js"),
    loginDialog = require("common/loginDialog/loginDialog.js"),
    dateFormat = require("common/util/dateFormat.js"),
    user = require("common/util/user.js"),
    confirm = require("common/confirm/confirm.js"),
    TEMPLATE = function(obj) {
        {
            var __t, __p = "";
            Array.prototype.join
        }
    	data = obj.aaData;
        with(obj || {}) {
            __p += "";
            for (var i = 0; i < data.length; i++) {
            	var aurl = data[i].contentStaticUrl;
            	var imageUrl = data[i].imageSrcPath;
            	
            	var thumbUrl = imageUrl.substring(0,imageUrl.lastIndexOf("/")+1)+"thumb_"+imageUrl.substring(imageUrl.lastIndexOf("/")+1)
            	__p +='<li class="item clearfix" data-node="item"><div class="info" ga_event="feed_item" ga_label="hasImg"><p class="title "><a href="'+aurl+'" ga_event="feed_title" target="_blank">';
            	__p += data[i].title;
            	__p += "</a><span>";
            	__p += data[i].summary;
            	__p += "</span><strong>";
            	__p += data[i].releaseTimeInvid;
            	__p += "</strong>";
            	__p +='</p></div>';
            	__p +='<div class="thumbnail lf"><div class="img-box">';
//            	__p +='<a class="feed-img" ga_event="feed_img" href="'+aurl+'" target="_blank">';
            	__p +='<img src="'+imageUrl+'" style=" height: 110px; width: 171px;"> </div> </div></li>';
            }
            __p += "\n"
        }
        return __p
    },
    TEMPLATEVideo = function(obj) {
        {
            var __t, __p = "";
            Array.prototype.join
        }
    	data = obj.aaData;
    	debugger;
        with(obj || {}) {
            __p += "";
            //<i class="iconPlay" style="top: 37.4921875px; left: 93.875px;"></i>
            for (var i = 0; i < data.length; i++) {
            	var imageUrl = data[i].imageSrcPath;
            	var thumbUrl = imageUrl.substring(0,imageUrl.lastIndexOf("/")+1)+"thumb_"+imageUrl.substring(imageUrl.lastIndexOf("/")+1)
            	__p +='<li class="item clearfix" data-node="item"><div class="info" ga_event="feed_item" ga_label="hasImg"><p class="title ">';
//            	__p += '<a href="javascript:void(0);" >';
            	__p += data[i].title;
            	__p += "<span>";
            	__p += data[i].summary;
            	__p += "</span><strong>";
            	__p += data[i].releaseTimeInvid;
            	__p += "</strong>";
            	__p +='</p></div>';
            	__p +='<div class="thumbnail lf"><div class="img-box">';
            	__p += '<a class="feed-img" ga_event="feed_img" href="javascript:void(0);" videokeyid="play_btn" video_key="';
            	__p += data[i].url;
            	__p += '" title="';
            	__p += data[i].title;
            	__p += '" target="_self">';
            	__p +='<img src="'+imageUrl+'" style=" height: 110px; width: 171px;"></a></div> </div></li>';
            }
            __p += "\n"
        }
        return __p
    },
    TEMPLATEDOCTOR= function(obj) {
        {
            var __t, __p = "";
            Array.prototype.join
        }
    	data = obj.aaData;
        with(obj || {}) {
            __p += "";
            for (var i = 0; i < data.length; i++) {
//            	var aurl = data[i].contentUrl+"&accessSource=webPc";
            	var imageUrl = data[i].user.imgUrlPath;
            	if(!imageUrl){
            		imageUrl = "/img/header_image.jpg";
            	}
//            	alert(imageUrl);
//            	var thumbUrl = imageUrl.substring(0,imageUrl.lastIndexOf("/")+1)+"thumb_"+imageUrl.substring(imageUrl.lastIndexOf("/")+1)
            	__p +='<li class="item clearfix" data-node="item"><div class="thumbnail rf"><div class="img-box">';
//            	__p +='<a class="feed-img" ga_event="feed_img" href="javascript:void(0);"  >';
            	__p +='<img src="'+imageUrl+'" style=" height: 190px; width: 170px;"> </div> </div>';
//            	__p +='<div class="info" ga_event="feed_item" ga_label="hasImg"><p class="title "><a href="javascript:void(0);"  ga_event="feed_title" >';
            	__p +='<div class="info" ga_event="feed_item" ga_label="hasImg"><p class="title ">';
            	__p += data[i].user.realName;
//            	__p += "</a><strong>";
            	__p += "<strong>";
            	__p += (data[i].technicalOfficeName+"&nbsp;&nbsp;");
            	__p += data[i].positionName;
            	__p += "</strong>";
            	__p += "<span>";
            	__p += (data[i].introduction+"<br/>"+data[i].expertise);
            	__p +='</span></p></div></li>';
            	
            }
            __p += "\n"
        }
        return __p
    },
    adList = { },
    DISLIKE_KLS = "disliked",
    LIKE_KLS = "liked",
    REPIN_KLS = "cllectioned",
    LIST_AJAX = Config_91Baby.config_domain_name+"/info/infoList.action?entranceType=APP&access=web",
    DOCTOR_LIST_AJAX= Config_91Baby.config_domain_name+"/doctor/webDoctorList.action?entranceType=APP";
    SEARCH_AJAX = "",
    GROUP_ARTICLE_AJAX = "/group/article/",
    DISLIKE_AJAX = "/api/dislike/",
    UNREAD_DELAY = 18e4,
    LOAD_HEIGHT = 750;
    module.exports = Pagelet.extend({
        el: "#pagelet-feedlist",
        events: {
            "click $digg": "onDiggOrBuryClick",
            "click $bury": "onDiggOrBuryClick",
            "click $repin": "onRepinClick",
            "click $close": "onCloseClick",
            "click $share": "onShareClick",
            "click $unread": "onUnreadClick",
            "click $loadMore": "onLoadMoreClick",
            "click $adClose": "onAdCloseClick"
        },
        channels: {
            "com..feedlist refresh": "onFeedListRefresh"
        },
        init: function(t) {
            var i = this;
            this.$win = $(window),
            this.$doc = $(document),
            this.spec = t,
            this.loading = !1,
            this.scrollTimer = "",
            this.maxCreateTime = 0,
            this.searchOffset = 0,
            this.keyword = this.spec.keyword || "",
            this.pageid = this.spec.pageid || "",
            this.curMaxBehotTime = this.spec.max_behot_time,
            this.$win.on("scroll", $.proxy(this.onWinScroll, this)),
            this.getList(function() {
                i.insertAD(),
                $(function() {
                    window.scrollTo(0, 0)
                });
                var t = i.$win.scrollTop(),
                e = i.$doc.height(),
                a = i.$win.height();
                LOAD_HEIGHT > e - t - a && i.getList()
            }),
            this.spec.unreadTips && "" === this.spec.category && (this.unReadTimer = setTimeout(function() {
                i.$dom.unread.slideDown("fast")
            },
            UNREAD_DELAY)),
            this.page=0,
            this.pageSize=10
        },
        insertAD: function() {
        },
        render: function(t) {
            var i = t.list || [];
            if("333"==this.spec.category){
            	 this.$dom.listBox.append(TEMPLATEVideo(i))
            	 initVideoShow();
        	}else{
        		 this.$dom.listBox.append(TEMPLATE(i))
        	}
           
        },
        renderDoctor: function(t) {
            var i = t.list || [];
           this.$dom.listBox.append(TEMPLATEDOCTOR(i))
           
        },
        getList: function(t) {
        	if("/doctorList/"=== this.pageid){
        		return this.getDoctorList(t);
        	}else{
        		return "/search/" === this.pageid ? this.getSearchList(t) : void this.getArticleList(t)
        	}
        },
        getDoctorList: function(t) {
        	var objtemp = this;
            if (!this.loading) {
            	$(".loadmore").show();
            	var urlAction= DOCTOR_LIST_AJAX;
                this.loading = !0;
                var i = {
                    pageSize: this.pageSize,
                    page: this.page
                };
                this.maxCreateTime && (i.max_create_time = this.maxCreateTime),
                $.ajax({
                    url: urlAction,
                    type: "GET",
                    dataType: "json",
                    data: i,
                    success: function(i) {
//                    	debugger;
                        if (objtemp.loading = !1, i = i || {},
                        0 === i.error.errorCode) {
                            var e = i.list || {},
                            a = e.aaData || [],
                            n = a[a.length - 1] || {};
                            if(0==a.length){
                            	objtemp.loading = !0
                            	return ;
                            }
                            objtemp.curMaxBehotTime = e.max_behot_time,
                            objtemp.maxCreateTime = n.create_time || 0,
                            objtemp.renderDoctor(i),
                            objtemp.page+=1;
                            "function" == typeof t && t()
                        }
                    },
                    error: function() {
                    	objtemp.loading = !1
                    }
                })
            }else{
            	$(".loadmore").hide();
            }
        },
        getSearchList: function(t) {
        	if(this.keyword==''){
    			return;
    		}
        	var objtemp = this;
            if (!this.loading) {
            	$(".loadmore").show();
            	var urlAction= LIST_AJAX;
                this.loading = !0;
                var i = {
                    pageSize: this.pageSize,
                    category: this.spec.category,
                    keyword: this.keyword,
                    page: this.page
                };
                this.maxCreateTime && (i.max_create_time = this.maxCreateTime),
                $.ajax({
                    url: urlAction,
                    type: "GET",
                    dataType: "json",
                    data: i,
                    success: function(i) {
//                    	debugger;
                        if (objtemp.loading = !1, i = i || {},
                        0 === i.error.errorCode) {
                            var e = i.list || {},
                            a = e.aaData || [],
                            n = a[a.length - 1] || {};
                            if(0==a.length){
                            	objtemp.loading = !0
                            	return ;
                            }
                            objtemp.curMaxBehotTime = e.max_behot_time,
                            objtemp.maxCreateTime = n.create_time || 0,
                            objtemp.render(i),
                            objtemp.page+=1;
                            "function" == typeof t && t()
                        }
                    },
                    error: function() {
                    	objtemp.loading = !1
                    }
                })
            }else{
            	$(".loadmore").hide();
            }
        },
        getArticleList: function(t) {
        	var objtemp = this;
            if (!this.loading) {
            	$(".loadmore").show();
            	var urlAction="";
            	if("333"==this.spec.category){
            		urlAction = Config_91Baby.config_domain_name+"/video/videoList.action?entranceType=APP"
            	}else{
            		urlAction = LIST_AJAX;
            	}
                this.loading = !0;
                var i = {
                    pageSize: this.pageSize,
                    userCategory: this.spec.category,
                    page: this.page
                };
                this.maxCreateTime && (i.max_create_time = this.maxCreateTime),
                $.ajax({
                    url: urlAction,
                    type: "GET",
                    dataType: "json",
                    data: i,
                    success: function(i) {
//                    	debugger;
                        if (objtemp.loading = !1, i = i || {},
                        0 === i.error.errorCode) {
                            var e = i.list || {},
                            a = e.aaData || [],
                            n = a[a.length - 1] || {};
                            if(0==a.length){
                            	objtemp.loading = !0
                            	return ;
                            }
                            objtemp.curMaxBehotTime = e.max_behot_time,
                            objtemp.maxCreateTime = n.create_time || 0,
                            objtemp.render(i),
                            objtemp.page+=1;
                            "function" == typeof t && t()
                        }
                    },
                    error: function() {
                    	objtemp.loading = !1
                    }
                })
            }else{
            	$(".loadmore").hide();
            }
        },
        onLoadMoreClick: function() {
            this.getList()
        },
        onAdCloseClick: function(t) {
            var i = $(t.currentTarget),
            e = i.parents('[data-node="adItem"]');
            i.hide(),
            e.animate({
                height: 0
            },
            200,
            function() {
                e.hide()
            })
        },
        onDiggOrBuryClick: function(t) {
            var i = $(t.currentTarget),
            e = i.parents('[data-node="likeGroup"]'),
            a = e.hasClass(DISLIKE_KLS) || e.hasClass(LIKE_KLS);
            if (!a) {
                var n = i.data("node"),
                s = i.data("groupid"),
                o = GROUP_ARTICLE_AJAX + s + "/" + n + "/",
                r = function() {
//                    $.ajax({
//                        url: o,
//                        type: "POST",
//                        success: function(t) {
//                            if (t = t || {},
//                            "success" === t.message) {
//                                i.hasClass("line") && i.addClass("digg");
//                                var a = t.stats || {},
//                                s = n + "_count";
//                                e.addClass("digg" === n ? LIKE_KLS: DISLIKE_KLS),
//                                i.attr("title", "digg" === n ? "已顶": "已踩"),
//                                a[s] && i.find('[data-node="num"]').html(a[s])
//                            }
//                        }
//                    })
                };
                user.checkLogin({
                    successCb: function() {
                        r()
                    },
                    errorCb: function() {
                        loginDialog().show({
                            successCb: function() {
                                r()
                            }
                        })
                    }
                })
            }
        },
        repinArticle: function(t, i) {
        },
        unRepinArticle: function(t, i) {
        },
        onRepinClick: function(t) {
            var i = $(t.currentTarget),
            e = i.hasClass(REPIN_KLS),
            a = i.data("groupid"),
            n = this,
            s = function() {
                e ? n.unRepinArticle(i, a) : n.repinArticle(i, a)
            };
            user.checkLogin({
                successCb: function() {
                    s()
                },
                errorCb: function() {
                    loginDialog().show({
                        successCb: function() {
                            s()
                        }
                    })
                }
            })
        },
        onShareClick: function(t) {
            var i = $(t.currentTarget),
            e = $(t.target),
            a = e.data("type");
            a && bdshare(a, i.data())
        },
        onCloseClick: function(t) {
        },
        onWinScroll: function() {
            this.scrollTimer && clearTimeout(this.scrollTimer);
            var t = this;
            this.scrollTimer = setTimeout(function() {
                var i = t.$win.scrollTop(),
                e = t.$doc.height(),
                a = t.$win.height();
                LOAD_HEIGHT > e - i - a && t.getList()
            },
            50)
        },
        onUnreadClick: function() {
            var t = this;
            listener.trigger("com..feedlist", "refresh"),
            this.$dom.unread.hide(),
            this.unReadTimer = setTimeout(function() {
                t.$dom.unread.slideDown("fast")
            },
            UNREAD_DELAY)
        },
        onFeedListRefresh: function() {
            var t = this;
            this.$dom.alertMsg.show(),
            window.scrollTo(0, 0),
            this.spec.unreadTips && "" === this.spec.category && (clearTimeout(this.unReadTimer), this.$dom.unread.hide(), this.unReadTimer = setTimeout(function() {
                t.$dom.unread.slideDown("fast")
            },
            UNREAD_DELAY)),
            $.ajax({
                url: LIST_AJAX,
                type: "GET",
                dataType: "json",
                data: {
                    max_behot_time: 0
                },
                success: function(t) {
//                	debugger;
                    this.$dom.alertMsg.slideUp("fast"),
                    t = t || {},
                    "success" === t.message && (t.highlight = function(t) {
                        return t
                    },
                    this.$dom.listBox.html(TEMPLATE(t)))
                },
                error: function() {
                    this.$dom.alertMsg.hide(),
                    this.loading = !1
                }
            })
        }
    })
});;
define("pagelet/hotcomment/hotcomment.js",
function(require, exports, module) {
    var LIST_AJAX = "",
    template = function(obj) {
        {
            var __t, __p = "";
            Array.prototype.join
        }
        with(obj || {}) {
            __p += "";
            for (var i = 0; i < data.length; i++) __p += '\n<li>\n    <p class="comment-title">\n        <a ga_event="hotcomment_headimg" href="/user/' + (null == (__t = data[i].user_id) ? "": __t) + '/subscribe/">\n            <img src="' + (null == (__t = data[i].avatar_url) ? "": __t) + '">\n        </a>\n        <a ga_event="hotcomment_name" class="name" href="/user/' + (null == (__t = data[i].user_id) ? "": __t) + '/subscribe/">\n            ' + (null == (__t = data[i].screen_name) ? "": __t) + '\n        </a>\n        <a ga_event="hotcomment_dig" class="btn" href="javascript:;" data-node="digg" data-id="' + (null == (__t = data[i].str_group_id || data[i].group_id) ? "": __t) + '">\n            <i class="icon icon-like-blue icon-small"></i>\n            <span class="liked-num" data-node="likedNum">' + (null == (__t = data[i].digg_count) ? "": __t) + '</span>\n        </a>\n    </p>\n    <p class="comment">\n        <i class="arrow"></i>\n        ' + (null == (__t = data[i].text) ? "": __t) + '\n    </p>\n    <p class="label">评论于：</p>\n    <p class="source">\n        <a ga_event="hotcomment_title" href="/group/article/' + (null == (__t = data[i].str_group_id || data[i].group_id) ? "": __t) + '" target="_blank">\n            ' + (null == (__t = data[i].title) ? "": __t) + "\n        </a>\n    </p>\n</li>\n";
            __p += ""
        }
        return __p
    },
    OFFSET = 25,
    DIGG_AJAX = "";
    module.exports = Pagelet.extend({
        el: "#pagelet-hotcomment",
        events: {
            "click $next": "onNextClick",
            "click $digg": "onDiggClick"
        },
        init: function(t) {
            this.getList(),
            this.spec = t || {};
            var e = this,
            n = this.spec.fixedTop || 0,
            i = this.$el.offset(),
            s = $(document).scrollTop(),
            a = i.top - (OFFSET + n);
            $(window).on("scroll",
            function() {
                a = e.$el.offset().top - (OFFSET + n),
                s = $(document).scrollTop(),
                s > a ? (e.$dom.inner.css({
                    position: "fixed",
                    top: OFFSET + n
                }), e.fixed = !0) : a >= s && (e.$dom.inner.css({
                    position: "static"
                }), e.fixed = !1)
            });
            var o = _.debounce(function() {
                e.$dom.inner.css({
                    left: e.$el.offset().left
                }),
                e.$dom.inner.show()
            },
            300);
            $(window).on("resize",
            function() {
                e.fixed && e.$dom.inner.hide(),
                o()
            })
        },
        render: function() {
        },
        getList: function() {
        },
        onNextClick: function() {
            this.render()
        },
        onDiggClick: function(t) {
            var e = $(t.currentTarget);
            if (!e.hasClass("liked")) {
                var n = e.data("id");
                $.post(DIGG_AJAX, {
                    id: n,
                    cancel: 1
                },
                function(t) {
                    t = t || {},
                    "success" !== t.message
                });
                var i = $(e.find('[data-node="likedNum"]'));
                i.html(parseInt(i.html(), 10) + 1),
                e.addClass("liked")
            }
        }
    })
});;
define("pagelet/toolbar/toolbar.js",
function(e, t, o) {
    var s = e("common/util/storage.js"),
    r = '<li><a ga_event="nav_search_hot" data-node="searchItem" href="javascript:;" class="layer-item">#{keyword}</a></li>',
    i = /hot_words/,
    a = ["11","12","13"],
    a=[];
    n = ["最新"],
    n=[];
    c = "news_hot,news_society,news_entertainment,news_tech,news_car,news_sports",
    h = "点击添加分类",
    l = "分类已满（最多7个），请先删除一些";
    o.exports = Pagelet.extend({
        el: "#pagelet-toolbar",
        events: {
            "click $custom": "onCustomClick",
            "click $category": "onCategoryClick",
            "click $refresh": "onRefreshClick",
            "focusin $searchBox": "onSearchBoxFocus",
            "focusout $searchBox": "onSearchBoxBlur",
            "click $searchItem": "onSearchItemClick",
            "click $toolbarInner": "onToolbarInnerClick",
            "click $searchInput": "onSearchInputClick",
            "submit $searchForm": "onSearchFormSubmit"
        },
        init: function(e) {
            e = e || {},
            this.curCategory = e.category || "",
            this.isCustom = !1,
            this.userCategory = s.get("menuDefaults_new") || c,
            this.getHotwords(),
            this.render();
            var t = this,
            o = $(document).scrollTop();
            $(document).on("click",
            function() {
                t.$dom.customBox.hide(),
                t.$dom.custom.html('<i class="icon icon-customize"></i>'),
                t.saveUserCategory(),
                t.$el.removeClass("customize"),
                t.isCustom = !1
            }),
            $(window).on("scroll",
            function() {
                o = $(document).scrollTop(),
                o > 70 ? t.$dom.toolbarInner.css({
                    position: "fixed"
                }) : 70 >= o && t.$dom.toolbarInner.css({
                    position: "static"
                })
            })
        },
        createSearch: function(e) {
            var t = [];
            if (this.hasHotwords = !!e.length, this.hasHotwords) {
                for (var o = 0; o < e.length; o++) t.push(r.replace("#{keyword}", e[o]));
                this.curHotword = e[0],
                this.$dom.searchMenu.html(t.join("")),
                this.$dom.searchInput.val(this.curHotword)
            }
        },
        showLayer: function(e) {
            var t = this,
            o = $(e.currentTarget),
            s = o.data("node"),
            r = s + "hidetimer",
            i = s + "showtimer";
            this[r] && clearTimeout(this[r]),
            this[i] = setTimeout(function() {
                t.$dom[s].addClass("show-layer")
            },
            300)
        },
        hideLayer: function(e) {
            var t = this,
            o = $(e.currentTarget),
            s = o.data("node"),
            r = s + "hidetimer",
            i = s + "showtimer";
            this[i] && clearTimeout(this[i]),
            this[r] = setTimeout(function() {
                t.$dom[s].removeClass("show-layer")
            },
            100)
        },
        getHotwords: function() {
        },
        render: function() {
            for (var e = "",
            t = "",
            o = "",
            s = 0; s < a.length; s++) {
                var r = "";
                this.curCategory === a[s] && (r = "selected"),
                o = '<li data-node="category" data-category="' + a[s] + '"><a ga_event="feed_category" ga_label="' + n[s] + '" href="javascript:;" class="item ' + r + '">' + n[s] + '<span class="font-icon-add">+</span><i class="icon icon-customize-close"></i></a></li>',
                this.userCategory.indexOf(a[s]) >= 0 ? e += o: t += o
            }
            this.$dom.curCategory.append(e),
            this.$dom.otherCategory.append(t)
        },
        saveUserCategory: function() {
            var e = this.userCategory.split(/[,]+/);
            s.set("menuDefaults_new", e.join(","))
        },
        onSearchFormSubmit: function(e) {
            this.$dom.searchInput.val() || e.preventDefault()
        },
        onSearchBoxFocus: function(e) {
            var t = this,
            o = !1,
            s = t.$dom.searchInput.val(),
            r = function() {
                var i = t.$dom.searchInput.val();
                o || (o = s !== i),
                i && o ? t.hideLayer(e) : t.showLayer(e),
                t.searchtimer = setTimeout(r, 500)
            };
            r()
        },
        onSearchBoxBlur: function(e) {
            this.searchtimer && clearTimeout(this.searchtimer),
            this.hideLayer(e)
        },
        onSearchItemClick: function(e) {
            var t = $(e.currentTarget),
            o = t.html();
            this.$dom.searchInput.val(o),
            this.$dom.searchForm.submit()
        },
        onCustomClick: function(e) {
            e.stopPropagation();
            var t = $(e.currentTarget);
            this.isCustom ? (this.$dom.customBox.hide(), t.html('<i class="icon icon-customize"></i>'), this.saveUserCategory(), this.$el.removeClass("customize")) : (this.$dom.msg.html(h).removeClass("error"), this.$dom.customBox.show(), t.html('<i class="icon icon-customize-up"></i>'), this.$el.addClass("customize")),
            this.isCustom = !this.isCustom
        },
        onCategoryClick: function(e) {
//        	debugger;
            var t = $(e.currentTarget),
            o = t.data("category");
//            if (this.isCustom) {
//                var s = this.userCategory.replace(/^,+|,+$/g, "").split(/[,]+/).length;
//                if ("" === o) return;
//                if (this.userCategory.indexOf(o) >= 0) this.userCategory = this.userCategory.replace(o, ""),
//                t.appendTo(this.$dom.otherCategory);
//                else {
//                    if (! (6 > s)) return void this.$dom.msg.html(l).addClass("error");
//                    this.userCategory += "," + o,
//                    t.appendTo(this.$dom.curCategory)
//                }
//                this.$dom.msg.html(h).removeClass("error")
//            } else {
                var r = window.location.pathname+"?category=" + o ;
                "" === o ,
                window.location.href = r
//            }
        },
        onRefreshClick: function() {
            listener.trigger("com.toutiao.feedlist", "refresh", this.curCategory)
        },
        onToolbarInnerClick: function(e) {
            e.stopPropagation()
        },
        onSearchInputClick: function() {
            var e = this.$dom.searchInput.val();
            e === this.curHotword && this.$dom.searchInput.val("")
        }
    })
});;
define("pagelet/appintro/appintro.js",
function(e, p, t) {
    t.exports = Pagelet.extend({
        el: "#pagelet-appintro"
    })
});;
define("pagelet/rightbanner/rightbanner.js",
function(t, e, i) {
    var n = {
      
    };
    i.exports = Pagelet.extend({
        el: "#pagelet-rightbanner",
        init: function() {
            var t = this,
            e = 2015,
            i = 9;
            for (var a in n) {
                var r = n[a],
                c = a.split("&"),
                o = new Date(e, i - 1, c[0]),
                l = new Date(e, i - 1, c[1] - 0 + 1),
                s = new Date;
                s >= o && l > s && (r.link || (t.$dom.link.bind("click",
                function(t) {
                    t.preventDefault()
                }), t.$dom.link.css({
                    cursor: "default"
                })), t.$dom.link.attr("href", r.link), t.$dom.img.attr("src", r.img), t.$el.show())
            }
        }
    })
});