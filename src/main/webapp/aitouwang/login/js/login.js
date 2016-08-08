/**
 * Created by 三 on 2016/4/6.
 */
 $('#submitLogin').click(function(){
     //submitLogin();
 });

$("#signUp").click(function(){
    window.location.href = "/login/signup.do";
})
function submitLogin(){
    var url="/login/submit.do"
    var param={
        username:$("#username").val(),
        password:$("#password").val(),
        userType:2//运营系统登录
        }

    $.ajax({
        url: url,
        type: "POST",
        data: param,
        dataType: "json",
        success: function (data) {
            success(data);
            //self.set('isChange', true);
            //self.hideLoading();
        },

})}