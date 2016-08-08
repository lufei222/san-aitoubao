var url;
function newUser() {
    $('#dlg').dialog('open').dialog('center').dialog('setTitle', 'New User');
    $('#fm').form('clear');
    url = '';
}
function newProject() {
    /*    $('#dlg').dialog('open').dialog('center').dialog('setTitle','New User');
     $('#fm').form('clear');
     url = '';*/
    var tabTitle = "新增项目";
    var url = "/project/info.do";
    window.parent.addTab(tabTitle, url);
}
function editUser() {
    var row = $('#dg').datagrid('getSelected');
    if (row) {
        $('#dlg').dialog('open').dialog('center').dialog('setTitle', 'Edit User');
        $('#fm').form('load', row);
        //   url = '/update_user.php?id='+row.id;
    }
}
function saveUser() {
    $('#fm').form('submit', {
        url: url,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (result) {
            var result = eval('(' + result + ')');
            if (result.errorMsg) {
                $.messager.show({
                    title: 'Error',
                    msg: result.errorMsg
                });
            } else {
                $('#dlg').dialog('close');        // close the dialog
                $('#dg').datagrid('reload');    // reload the user data
            }
        }
    });
}
function destroyUser() {
    var row = $('#dg').datagrid('getSelected');
    if (row) {
        $.messager.confirm('Confirm', 'Are you sure you want to destroy this user?', function (r) {
            if (r) {
                $.post('destroy_user.php', {id: row.id}, function (result) {
                    if (result.success) {
                        $('#dg').datagrid('reload');    // reload the user data
                    } else {
                        $.messager.show({    // show error message
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    }
                }, 'json');
            }
        });
    }
}
