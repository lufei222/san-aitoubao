var oLoading;		//大锅饭的
var loadingHandle;	//更多
var isLoaded = true; 		//方式
var list;
var dialog;

$(document).ready(function () {
    $("#projectList").val("fdhvgdfhjvbdfj vdfhjbd");
    var mydata={
        "name": "Jack",
        "id":"007",
        "address":"jjjj"
    };
/*    var mydata={"jsonMap":{
        "name": "Jack",
        "id":"007",
        "address":"jjjj"
    }};*/
   // mydata= JSON.stringify(mydata);
    var values = {};
    values[1] = "jack";
    values[2] = "3454luo";
    $.ajax({
        type: "POST",
        cache: false,
        data:  JSON.stringify(values),
        async: false,
        url: '/project2/doTestMap3.do',
        dataType: 'json',
        success: function (rtn) {
            $("#111").html(rtn);
            alert(document.getElementById("222").innerHTML);  //输出信息Hello Jack!
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('请求失败' + errorThrown);
        }

    });
});// end of $(document).ready();
