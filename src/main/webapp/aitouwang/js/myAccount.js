/**
 * Created by 三 on 2016/5/1.
 */
$(function () {
    asyncQueryCurUserInfo();
    asyncQueryCurUsetAccount()
    asyncQueryCurUsetProjects()
    asyncQueryCurUserJournals()

//刷新项目列表
    function asyncQueryCurUserInfo() {

        $.ajax({
            url: basePath + "customer/findCurUserById.do",
            dataType: "json",
            success: function (data) {
                if (data) {
                    $(".name").html(data.name)
                    $("#idNo").html(data.idNo)
                    $("#bankNo").html(data.bankNo)
                    $("#wechat").html(data.wechat)
                    $("#qq").html(data.qq)
                    $("#phone").html(data.phone)
                    $("#email").html(data.email)
                }
            }
        });
    }

    function asyncQueryCurUsetAccount() {
        $.ajax({
            url: basePath + "account/findCurUserAccountById.do",
            dataType: "json",
            success: function (data) {
                if (data) {
                    $("#totalAmount").html(data.totalAmount)
                    $("#frozenAmount").html(data.frozenAmount)
                    $("#availableAmount").html(data.availableAmount)
                    $("#receivingAmount").html(data.receivingAmount)
                    $("#historialAmount").html(data.historialAmount)
                }
            }
        });
    }

    function asyncQueryCurUsetProjects() {
        $.ajax({
            url: basePath + "project/selectEntitiesByCurUserId.do",
            dataType: "json",
            success: function (data) {
                var html = "";
                if (data && data.rows.length > 0) {
                    html = html
                        + '<table class="accountContent">'
                        + '<thead>'
                        + '<tr>'
                        + '<th>项目编号</th>'
                        + '<th>项目名称</th>'
                        + '<th>投资金额</th>'
                        + '<th>预期收益</th>'
                        + '<th>项目状态</th>'
                        + '<th>项目到期时间</th>'
                        + '</tr>'
                        + '</thead>'
                    for (var i = 0; i < data.rows.length; i++) {
                        var item = data.rows[i];
                        html = html
                            + '<tbody>'
                            + '<tr>'
                            + '<td>' + item.projectCode + '</td>'
                            + '<td>' + item.projectName + '</td>'
                            + '<td>' + item.investAmount + '</td>'
                            + '<td>' + item.investInterest + '</td>'
                            + '<td>' + item.projectCode + '</td>'
                            + '<td>' + item.pendDate + '</td>'
                            + '</tr>'
                            + '</tbody>'
                    }
                }
                $("#myProjectInfo").html(html);
            }
        });
    }

    function asyncQueryCurUserJournals() {
        $.ajax({
            url: basePath + "account/journalListOfCurUser.do",
            dataType: "json",
            success: function (data) {
                var html = "";
                if (data && data.rows.length > 0) {
                    html = html
                        + '<table class="accountContent">'
                        + '<thead>'
                        + '<tr>'
                        + '<th>流水号</th>'
                        + '<th>流水金额</th>'
                        + '<th>进账账户</th>'
                        + '<th>出账账户</th>'
                        + '<th>来源</th>'
                        + '<th>流水类型</th>'
                        + '</tr>'
                        + '</thead>'
                    for (var i = 0; i < data.rows.length; i++) {
                        var item = data.rows[i];
                        html = html
                            + '<tbody>'
                            + '<tr>'
                            + '<td>' + item.journalNo + '</td>'
                            + '<td>' + item.journal + '</td>'
                            + '<td>' + item.destinationBankNo + '</td>'
                            + '<td>' + item.origin + '</td>'
                            + '<td>' + item.changeType + '</td>'
                            + '<td>' + item.updatedAt + '</td>'
                            + '</tr>'
                            + '</tbody>'
                    }
                }
                $("#myJournalInfo").html(html);
            }
        });
    }

    changeMyContent = function (e) {
        var selectId = e.attributes["value"].value
        if (selectId == 1) {
            $("#myAccountInfo")[0].style.display = "block"
            $("#myProjectInfo")[0].style.display = "none"
            $("#myJournalInfo")[0].style.display = "none"
        }else if (selectId == 2) {
            $("#myProjectInfo")[0].style.display = "block"
            $("#myAccountInfo")[0].style.display = "none"
            $("#myJournalInfo")[0].style.display = "none"
        }else if (selectId == 3) {
            $("#myJournalInfo")[0].style.display = "block"
            $("#myAccountInfo")[0].style.display = "none"
            $("#myProjectInfo")[0].style.display = "none"
        }
    }

})


