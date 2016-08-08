/**
 * Created by 三 on 2016/4/6.
 */
$(function(){


$('#submitSignUp').click(function(){
     submitSignUp();
 });


function submitSignUp(){
    var url = "/customer/update.do"
    var param={
        loginName:$("#loginName").val(),
        password:$("#password").val(),
        payPassword:$("#payPassword").val(),
        confirmPassword:$("#confirmPassword").val(),
        phone:$("#phone").val(),
        idNo:$("#idNo").val(),
        bankNo:$("#bankNo").val(),
        name:$("#name").val(),
        gender:$("#gender").val(),
        qq:$("#qq").val(),
        wechat:$("#wechat").val()
    }
    checkParams(param);
    $.ajax({
        url: url,
        type: "POST",
        data: param,
        success: function (data) {
            layer.msg('注册成功，5秒后跳入登录页面', {icon: 16});//非交易日不可交易
            setTimeout(goToAitouwang, 5000)//如果有高亮，一秒后取消高亮
        },
        error: function (XMLHttpRequest) {
            layer.msg('用户已存在', {icon: 16});//非交易日不可交易
        }

})}
    function goToAitouwang() {
        window.location.href = "/aitouwang/index.do"
    }
        function checkParams(param) {
    $("#err_invest_money").html("")
    if (!param.loginName) {
        $("#loginName").html("用户名不能为空")
        return false
    }
    if (!param.password) {
        $("#password").html("密码不能为空")
        return false
    }
    if (param.payPassword!=param.password) {
        $("#confirmPassword").html("两次输入的密码不匹配")
        return false
    }
    if (!param.phone) {
        $("#phone").html("电话不能为空")
        return false
    }
    if (!param.idNo) {
        $("#idNo").html("身份证不能为空")
        return false
    }
    if (!param.bankNo) {
        $("#bankNo").html("银行卡不能为空")
        return false
    }
    if (!param.name) {
        $("#name").html("姓名不能为空")
        return false
    }
    if (!param.gender) {
        $("#gender").html("性别不能为空")
        return false
    }

}
})