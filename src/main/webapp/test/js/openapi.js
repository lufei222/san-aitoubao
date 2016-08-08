/**
 * Created by luosan on 2016/7/18.
 */
debugger
$("#submit").click(function(){
    $.ajax( {
        url:'/claim/spring8.do',// 跳转到 action
        data:{ },
        type:'post',
        cache:false,
        //dataType:'json',
        success:function(data) {
            console.log(data)
            if(data.msg =="true" ){
                // view("修改成功！");
                alert("修改成功！");
                window.location.reload();
            }else{
                view(data.msg);
            }
        },
        error : function(msg) {
            console.log("error",msg);
        }
    });
})
