/**
 * Created by 三 on 2016/4/4.
 */
$(function () {
    asyncQueryProjectList();
})
//刷新项目列表
function asyncQueryProjectList() {

    $.ajax({
        url:"/project.do",
        dataType:"json",
        success:function(result){
            console.log(result);
            data=result.rows;
            var html = ''
            if (data && data.length > 0) {
                //   dealEmptyValues(data.products);
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    html = html
                        + '<div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">'
                        + '<div class="feature-wrap">'
                        + '<div class="pull-left"><i class="fa fa-bullhorn"></i></div>'
                        + '<div class="media-body">'
                        + '<h2>'+ item.projectName + '</h2>'
                        + '<h3><font color="#000000">利率：</font><B>'+ (item.interestRatio*100).toFixed(1) + '</B>%/<font color="#c52d2f">期限：</font>'+ item.interestDate +'天</h3>'
                        + '<h3><font color="#000000">剩余：</font><B>'+ item.curInvestMoney + '</B>%</h3>'
                        + '<h3><font color="#000000">总金额：</font>'+ item.investMoney +'</h3>'
                        + '</div>'
                        + '</div>'
                        +'<div class="timer"><strong><a class="wine-red" href="/aitouwang/projectDetail/'+item.projectId+'.do">投资</a></strong></div>'
                        + '</div>'
                    if(i==5)break;
                }
                //深红#c52d2f
                //
            }
            $("#projectList").html(html);

        }
    });

}
