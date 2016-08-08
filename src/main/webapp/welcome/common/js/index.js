/**
 * Created by 三 on 2016/4/10.
 */
window.basePath = "${basePath}";
var uc = {"biz": {}};
uc.biz.rolesData = [];
uc.biz.menusData = null;
uc.biz.allRolesOfCurrUser = [];
uc.biz.allRolesOfCurrUserMap = {};

var _menus = {
    "menus": [{
        "menuid": "1",
        "icon": "icon-sys",
        "menuname": "系统管理",
        "menus": [{
            "menuname": "项目管理",
            "icon": "icon-nav",
            "url": "/project/index.do"
        },
     /*       {
                "menuname": "合同管理",
                "icon": "icon-add",
                "url": "/contract/index.do"
            },*/
            {
                "menuname": "费用单",
                "icon": "icon-users",
                "url": "/expense/index.do"
            },
            {
                "menuname": "报销单",
                "icon": "icon-role",
                "url": "/claim/index.do"
            },
            //{
            //    "menuname": "权限设置",
            //    "icon": "icon-set",
            //    "url": "demo.html"
            //},
    /*        {
                "menuname": "系统日志",
                "icon": "icon-log",
                "url": "demo.html"
            }*/
        ]
    },
        {
            "menuid": "56",
            "icon": "icon-sys",
            "menuname": "人事管理",
            "menus": [
                {
                "menuname": "角色权限",
                "icon": "icon-nav",
                "url": "/role/indexRole.do"
            },
                {
                    "menuname": "部门列表",
                    "icon": "icon-nav",
                    "url": "/dept/index.do"
                },
                {
                    "menuname": "员工列表",
                    "icon": "icon-nav",
                    "url": "/employee/index.do"
                },
                {
                    "menuname": "客户列表",
                    "icon": "icon-nav",
                    "url": "/customer/index.do"
                },
            ]
        },
        {
            "menuid": "28",
            "icon": "icon-sys",
            "menuname": "财务管理",
            "menus": [{
                "menuname": "报销单",
                "icon": "icon-nav",
                "url": "/claim/index.do"
            },
                {
                    "menuname": "费用单",
                    "icon": "icon-nav",
                    "url": "/expense/index.do"
                },
                {
                    "menuname": "账户资金流水",
                    "icon": "icon-nav",
                    "url": "/account/index.do"
                }]
        },
        {
            "menuid": "39",
            "icon": "icon-sys",
            "menuname": "CRM管理",
            "menus": [{
                "menuname": "客户列表",
                "icon": "icon-nav",
                "url": "/customer/index.do"
            },
                {
                    "menuname": "客户交易额量图",
                    "icon": "icon-nav",
                    "url": "/shop/productcatagory.aspx"
                },
            ]
        }]
};
//设置登录窗口
function openPwd() {
    $('#w').window({
        title: '修改密码',
        width: 300,
        modal: true,
        shadow: true,
        closed: true,
        height: 160,
        resizable: false
    });
}
//关闭登录窗口
function close() {
    $('#w').window('close');
}
//修改密码
function serverLogin() {
    var $newpass = $('#txtNewPass');
    var $rePass = $('#txtRePass');
    if ($newpass.val() == '') {
        msgShow('系统提示', '请输入密码！', 'warning');
        return false;
    }
    if ($rePass.val() == '') {
        msgShow('系统提示', '请在一次输入密码！', 'warning');
        return false;
    }
    if ($newpass.val() != $rePass.val()) {
        msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
        return false;
    }
    $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(),
        function(msg) {
            msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
            $newpass.val('');
            $rePass.val('');
            close();
        })
}

$(function() {
    openPwd();
    $('#editpass').click(function() {
        $('#w').window('open');
    });
    $('#btnEp').click(function() {
        serverLogin();
    })
    $('#loginOut').click(function() {
        $.messager.confirm('系统提示', '您确定要退出本次登录吗?',
            function(r) {
                if (r) {
                    $.ajax({
                        url :" /login/logout.do",
                        data:{userType:2},
                        cache : false,
                        async : false,
                        global:false,
                        type : "GET",
                        dataType : 'json',
                        success : function (result){
                            var data=result;
                            if(data){
                                location.href = '/admin/index.do';
                            }
                        }
                    });
                }
            });
    })
});

/**
 * 查询用户所有权限
 */
uc.biz.loadAllRolesOfCurrUser = function(){
    var param={
        userType:2
    }
    $.ajax({
        url: "/role/allPermissionsOfCurrUser.do",
        data:param,
        success:function(result){
            var roles=result.rows
            uc.biz.allRolesOfCurrUser = roles;
            for (var i = 0; i < roles.length; i++) {
                var role = roles[i];
                uc.biz.allRolesOfCurrUserMap[role.code] = role;
            }
        }
    });
}
/**
 * 判断用户是否有指定权限
 * @param roleCode
 * @returns {boolean}
 */
uc.hasRole = function(roleCode){
    if(top.uc.biz.allRolesOfCurrUserMap[roleCode]){
        return true;
    }
    return false;
}
uc.biz.loadAllRolesOfCurrUser();
window.uc=uc;
var atb="woshigeshou";
window.atb=atb;

