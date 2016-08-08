

/****************方法一测试***************/
var curUrl=document.location.href||""
if(curUrl.indexOf("claim")>-1) {
    var stateObject = {};
    var title = "修改当前的url";
    // var newUrl=curUrl.substr(0,curUrl.indexOf("&")>-1?curUrl.indexOf("&"): curUrl.length)
    //var newUrl = "/market.html";
    var newUrl = "www.jd.com"
   // history.pushState(stateObject, title, newUrl)//只能修改root下面的路径
    //history.replaceState(stateObject, title, newUrl)//只能修改root下面的路径 result：失败
}
/****************方法二测试***************/

function getAbsoluteUrl(url){
    var img = new Image();
    img.src = url; // 设置相对路径给Image, 此时会发送出请求
    url = img.src; // 此时相对路径已经变成绝对路径
    img.src = null; // 取消请求
    console.log("getAbsoluteUrl2= "+url)
    return url;

}
var getAbsoluteUrl2 = (function() {
    var a = document.createElement('a');

    return function(url) {
        a.href = url;
        console.log("getAbsoluteUrl2= "+a.href)
        return a.href;
    };
})();

getAbsoluteUrl2("showroom/list");