/**
 * 这个js的主要目的是测试
 * Created by luosan on 2016/7/18.
 */

//    var promise = new Promise(function(resolve, reject) {
//    console.log("promise1 start ");
//    $.ajax({
//        url: '/claim/promise1.do',// 跳转到 action
//        data: {},
//        type: 'get',
//        cache: false,
//        //dataType:'json',
//        success: function (data) {
//            console.log("promise1 ajax success return ");
//            console.log(data)
//        },
//        error: function (msg) {
//            console.log("promise1 ajax error return ")
//            console.log("error", msg);
//        }
//    });
//})
//    promise.then(function(value) {
//        console.log("promise2 start ");
//        $.ajax( {
//            url:'/claim/promise2.do',// 跳转到 action
//            data:{ },
//            type:'get',
//            cache:false,
//            //dataType:'json',
//            success:function(data) {
//                console.log("promise2 ajax success return ")
//                console.log(data)
//            },
//            error : function(msg) {
//                console.log("promise2 ajax error return ")
//                console.log("error", msg);
//            }
//        })
//    })

//$.ajax( {
//    url:'/claim/spring8.do',// 跳转到 action
//    data:{ },
//    type:'get',
//    cache:false,
//    //dataType:'json',
//    success:function(data) {
//        console.log(data)
//        if(data.msg =="true" ){
//            // view("修改成功！");
//            alert("修改成功！");
//            window.location.reload();
//        }else{
//            view(data.msg);
//        }
//    },
//    error : function(msg) {
//        console.log("error",msg);
//    }
//});

function step1(resolve,reject){
var param=1;
    $.ajax({
        url: '/claim/promise1.do',
        data: {},
        type: 'get',
        cache: false,
        //dataType:'json',
        success: function (data) {
            console.log("promise1 ajax success return ");
            console.log("println result _"+data)
            resolve(param,data);
          //  reject(val);

        },
        error: function (msg) {
            console.log("promise1 ajax error return ")
            console.log("error", msg);
        }
    });
}
function step2(reject,reject){
    $.ajax( {
        url:'/claim/promise2.do',// 跳转到 action
        data:{ },
        type:'get',
        cache:false,
        //dataType:'json',
        success:function(data) {
            console.log("promise2 ajax success return ")
            console.log("println result _ "+data)
        },
        error : function(msg) {
            console.log("promise2 ajax error return ")
            console.log("error", msg);
        }
    })
}
new Promise(step1).then(function(val,val2){
    console.log("打印参数1"+val);
    console.log("打印参数2"+val2);

    console.info("ready to step2");
    console.info(val);
    return new Promise(step2);
}).then(function(val){
    console.info(val);
    return new Promise(step3);
}).then(function(val){
    console.info(val);
    return val;
}).then(function(val){
    console.info(val);
    return val;
}).catch(function(err){
        console.log(err)
    });
