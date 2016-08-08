/**
 * Created by 三 on 2016/4/4.
 */
$(function () {
    var curData;
    asyncQueryProjectList();
    $("#invest").click(function () {
        var params = {
            payPassword: $("#pay_password").val(),
            cuInvestMoney: $("#invest_money").val(),
            projectId: $("#projectId").val()
        }
        checkParams(params)
        $.ajax({
            url: $("#basePath").val() + "project/investProject.do",
            dataType: "json",
            type:"post",
            data:params,
            success: function (data) {
                if(data.indexOf("密码不正确")>-1){
                    layer.msg('密码不正确', {icon: 16});
                    return
                }
                layer.msg('投资成功', {icon: 16});
                asyncQueryProjectList();
            },
            error: function (XMLHttpRequest) {
                layer.msg('投资失败', {icon: 16});
            }
        })

    })
})
function checkParams(param) {
    if (!param.cuInvestMoney) {
        $("#err_invest_money").html("投資金額不能不為空")
    }else{
        $("#err_invest_money").html("")
    }
    if (param.investMoney && param.investMoney > ((parseFloat(curData.investMoney) - parseFloat(curData.curInvestMoney)) )) {
        $("#err_invest_money").html("投資金額不能超過當可投金額")
    }else{
        $("#err_invest_money").html("")
    }
    if (!param.payPassword) {
        $("#err_pay_password").html("密碼不能為空")
    }else{
        $("#err_pay_password").html("")
    }
}
//刷新项目列表
function asyncQueryProjectList() {

    $.ajax({
        url: $("#basePath").val() + "aitouwang/findProjectDetailById/" + $("#projectId").val() + ".do",
        dataType: "json",
        success: function (data) {
            var html = ''
            if (data) {
                curData = data
                var item = data
                html = html
                    + '<h2>' + item.projectName + '</h2>'
                    + '<h3><font color="#000000">利率：</font><B>' + (item.interestRatio * 100).toFixed(1) + '</B>%/<font color="#c52d2f">期限：</font>' + item.interestDate + '天</h3>'
                    + '<h3><font color="#000000">剩余金额：</font><B>' + (parseFloat(item.investMoney) - parseFloat(item.curInvestMoney)) + '</B></h3>'
                    + '<h3><font color="#000000">项目总额：</font>' + item.investMoney + '</h3>'
            }
            $("#projectInfo").html(html);

        }
    });

}
