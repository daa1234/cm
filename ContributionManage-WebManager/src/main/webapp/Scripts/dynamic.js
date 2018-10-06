define("pagelet/dynamiclist/dynamiclist.js",function(require,exports,module){var template=function(obj){{var __t,__p="";Array.prototype.join}with(obj||{}){__p+="";for(var i=0;i<data.length;i++)__p+="\n",1===data[i].cell_type&&(__p+='\n<li>\n    <div class="head">\n        <a ga_event="dynamic_icon" target="_blank" href="/user/'+(null==(__t=data[i].user&&data[i].user.user_id)?"":__t)+'/subscribe/">\n            <img src="'+(null==(__t=data[i].user&&data[i].user.avatar_url)?"":__t)+'">\n        </a>\n    </div>\n    <p class="dynamic-title">\n        <a ga_event="dynamic_name" target="_blank" class="name" href="/user/'+(null==(__t=data[i].user&&data[i].user.user_id)?"":__t)+'/subscribe/">\n            '+(null==(__t=data[i].user&&data[i].user.screen_name)?"":_.escape(__t))+"\n        </a>\n        ",data[i].action_desc&&(__p+='\n            <span class="action">'+(null==(__t=data[i].action_desc)?"":__t)+"</span>\n        "),__p+='\n    </p>\n    <p class="content">\n        '+(null==(__t=data[i].content)?"":_.escape(__t))+'\n    </p>\n    <div class="dynamic clearfix">\n        <i class="arrow"></i>\n        ',__p+=data[i].group&&data[i].group.thumb_url?'\n            <div class="img-box">\n                <a ga_event="dynamic_img" target="_blank" href="/group/article/'+(null==(__t=data[i].group&&data[i].group.group_id)?"":__t)+'/">\n                    <img src="'+(null==(__t=data[i].group.thumb_url)?"":__t)+'">\n                </a>\n            </div>\n            <div class="msg">\n        ':'\n            <div class="msg" style="width:100%;">\n        ',__p+='\n            <a ga_event="dynamic_title" target="_blank" href="/group/article/'+(null==(__t=data[i].group&&data[i].group.group_id)?"":__t)+'/">\n                '+(null==(__t=data[i].group&&data[i].group.title)?"":__t)+'\n            </a>\n        </div>\n    </div>\n    <span class="label">\n        ',"热门评论"===data[i].reason&&(__p+='\n        <i class="tag-icon hot"></i>\n        '),__p+="\n        ","今日神评"===data[i].reason&&(__p+='\n        <i class="tag-icon shen"></i>\n        '),__p+="\n        <span>"+(null==(__t=dateFormat(new Date(1e3*data[i].create_time),"M月d日 hh:mm"))?"":__t)+'</span>\n        <a ga_event="dynamic_dig" class="btn" href="javascript:;" data-node="digg" data-id="'+(null==(__t=data[i].id)?"":__t)+'">\n            <i class="icon icon-like-blue icon-small"></i>\n            <span class="liked-num" data-node="likedNum">'+(null==(__t=data[i].digg_count)?"":__t)+"</span>\n        </a>\n    </span>\n</li>\n"),__p+="\n";__p+=""}return __p},LIST_AJAX="/dongtai/list/v4/?cell_type=1",DIGG_AJAX="/dongtai/digg/action/",dateFormat=require("common/util/dateFormat.js"),LOAD_HEIGHT=750;module.exports=Pagelet.extend({el:"#pagelet-dynamiclist",events:{"click $digg":"onDiggClick","click $loadMore":"onLoadMoreClick"},init:function(a){this.spec=a||{},this.$win=$(window),this.$doc=$(document),this.maxCursor=0,this.$win.on("scroll",$.proxy(this.onWinScroll,this)),this.getList()},render:function(a){a.dateFormat=dateFormat,this.$dom.list.append(template(a)),a.has_more?(this.$dom.unread.hide(),this.$dom.loadMore.show()):(this.$dom.unread.show(),this.$dom.loadMore.hide(),this.$win.off("scroll"))},getList:function(){this.locked||(this.locked=!0,$.ajax({url:LIST_AJAX,type:"GET",context:this,data:{max_cursor:this.maxCursor},success:function(a){this.locked=!1,a=a||{};var t=a.data||{};return"success"!==a.message?void this.$dom.loadMore.hide():(this.maxCursor=t.max_cursor,void this.render(t))},error:function(){this.locked=!1}}))},onLoadMoreClick:function(){this.getList()},onWinScroll:function(){this.scrollTimer&&clearTimeout(this.scrollTimer);var a=this;this.scrollTimer=setTimeout(function(){var t=a.$win.scrollTop(),i=a.$doc.height(),n=a.$win.height();LOAD_HEIGHT>i-t-n&&a.getList()},50)},onDiggClick:function(a){var t=$(a.currentTarget);if(!t.hasClass("liked")){var i=t.data("id");$.post(DIGG_AJAX,{id:i,cancel:1},function(a){a=a||{},"success"!==a.message});var n=$(t.find('[data-node="likedNum"]'));n.html(parseInt(n.html(),10)+1),t.addClass("liked")}}})});
;define("pagelet/recommend/recommend.js",function(require,exports,module){var loginDialog=require("common/loginDialog/loginDialog.js"),user=require("common/util/user.js"),TEMPLATE=function(obj){{var __t,__p="";Array.prototype.join}with(obj||{}){__p+="";for(var i=0;i<suggest_users.length;i++)__p+='\n<li class="item clearfix">\n    <div class="user-img">\n        <a href="/user/'+(null==(__t=suggest_users[i].id)?"":__t)+'/subscribe/">\n            <img src="'+(null==(__t=suggest_users[i].avatar_url)?"":__t)+'" title="'+(null==(__t=suggest_users[i].screen_name)?"":__t)+'">\n        </a>\n    </div>\n    <div class="user-info">\n        <p class="user-name">\n            <a class="',suggest_users[i].is_verified&&(__p+="vip"),__p+='" href="/user/'+(null==(__t=suggest_users[i].id)?"":__t)+'/subscribe/">'+(null==(__t=suggest_users[i].screen_name)?"":__t)+'</a>\n        </p>\n        <p class="user-desc">粉丝：'+(null==(__t=suggest_users[i].followers_count)?"":__t)+'</p>\n    </div>\n    <a href="javascript:;" ga_event="recommend_follow" class="follow-btn" data-uid="'+(null==(__t=suggest_users[i].id)?"":__t)+'" title="加关注" data-node="follow">\n            <i class="add"></i><span>关注</span>\n    </a>\n</li>\n';__p+=""}return __p},USER_LIST_AJAX="/get_suggest_users/?display=json",FOLLOW_AJAX="/api/user/follow/",UNFOLLOW_AJAX="/api/user/unfollow/",OFFSET=25;module.exports=Pagelet.extend({el:"#pagelet-recommend",events:{"click $change":"onChangeClick","click $follow":"onFollowClick","click $unfollow":"onUnFollowClick"},init:function(s){this.offset=0,this.locked=!1,this.spec=s||{},this.getUserList();var e=this,t=this.spec.fixedTop||0,n=this.$el.offset(),i=$(document).scrollTop(),o=n.top-(OFFSET+t);$(window).on("scroll",function(){o=e.$el.offset().top-(OFFSET+t),i=$(document).scrollTop(),i>o?(e.$dom.inner.css({position:"fixed",top:OFFSET+t}),e.fixed=!0):o>=i&&(e.$dom.inner.css({position:"static"}),e.fixed=!1)});var l=_.debounce(function(){e.$dom.inner.css({left:e.$el.offset().left}),e.$dom.inner.show()},300);$(window).on("resize",function(){e.fixed&&e.$dom.inner.hide(),l()})},render:function(s){var e=this;this.$dom.list.fadeOut("fast",function(){e.$dom.list.fadeIn("fast"),e.$dom.list.html(TEMPLATE(s))})},getUserList:function(){this.locked||(this.locked=!0,$.ajax({url:USER_LIST_AJAX,type:"GET",dataType:"json",context:this,data:{offset:this.offset},success:function(s){if(this.locked=!1,s=s||{},"success"===s.message){if(!s.suggest_users||!s.suggest_users.length)return this.offset=0,window.alert("没有更多了！");this.offset+=5,this.render(s)}},error:function(){this.locked=!1}}))},onChangeClick:function(){this.getUserList()},onFollowClick:function(s){var e=$(s.currentTarget),t=e.data("action"),n=e.data("uid"),i="unfollow"===t?UNFOLLOW_AJAX:FOLLOW_AJAX,o=function(){$.ajax({url:i,type:"POST",dataType:"json",data:{user_id:n,app_name:"news_article"},success:function(s){s=s||{},"success"===s.message&&("unfollow"===t?(e.data("action","follow"),e.attr("class","follow-btn"),e.html('<i class="add"></i><span>加关注</span>')):(e.data("action","unfollow"),e.attr("class","unfollow-btn"),e.html('<i class="add"></i><span>取消关注</span>')))}})};user.checkLogin({successCb:function(){o()},errorCb:function(){loginDialog().show({successCb:function(){o()}})}})}})});