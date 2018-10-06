define("pagelet/searchbar/searchbar.js",
function(e, a, c) {
    c.exports = Pagelet.extend({
        el: "#pagelet-searchbar",
        events: {
            "click $search": "onSearchClick"
        },
        onSearchClick: function() {
//        	var sse= encodeURIComponent(this.$dom.keyword.val());
//        	alert(sse)
//        	var nnow=decodeURIComponent(sse);
//        	alert(nnow);
            window.location.href = "/sousuo.html?keyword=" + encodeURIComponent(this.$dom.keyword.val())
        }
    })
});