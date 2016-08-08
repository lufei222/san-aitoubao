var oLoading;		//大锅饭的
var loadingHandle;	//更多
var isLoaded = true; 		//方式
var list;
var dialog;

$(document).ready(function () {
    $("#projectList").val("fdhvgdfhjvbdfj vdfhjbd");
    var tags = {};
   /* tags["foo"] = "bar";
    tags["whee"] = "whizzz";
    tags["sing"] = "luo";
    tags["name"] = "san";*/
    tags.foo="bar";
    tags.whee="whizzz";
    tags.sing="luo"

    $.post("/project/select.do",   {"tags" : tags }, function(data, textStatus, jqXHR) {
        if (textStatus == 'success') {
            //handle success
            console.log("doTest returned " + data);
        } else {
            console.err("doTest returned " + data);
        }
    });
});// end of $(document).ready();
