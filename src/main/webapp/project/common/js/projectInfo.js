$(document).ready(function() {
    $('#cc').combobox({
        url: '/project/userdata.do',
        valueField: 'id',
        textField: 'text',
        editable: false,
        loadFilter: function(data) {
            if (data.d) {
                return data;
            } else {
                data = JSON.parse(data);
                return data;
            }
        }
    });
    $('#interestDate').combobox({
        textField: 'value',
        valueField: 'id',
        data: [{
            id: '1',
            value: '15天贷'
            },
            {
                id: '2',
                value: '30天贷'
            },
            {
                id: '3',
                value: '45天贷'
            }]
    });

    $('#linkmanName').combotree({
        url: "/project/userdatatree.do",
        loadFilter: function(data) {
            if (data.d) {
                return data;
            } else {
                data = JSON.parse(data);
                return convert(data);
            }
        }
    })
}),
    function submitForm() {
        $('#ff').form('submit');
    },
    function clearForm() {
        $('#ff').form('clear'); //赋值
    }
    function convert(rows) {
    function exists(rows, parentId) {
        for (var i = 0; i < rows.length; i++) {
            if (rows[i].id == parentId) return true;
        }
        return false;
    }

    var nodes = [];
    // get the top level nodes
    for (var i = 0; i < rows.length; i++) {
        var row = rows[i];
        if (!exists(rows, row.parentId)) {
            nodes.push({
                id: row.id,
                text: row.name
            });
        }
    }

    var toDo = [];
    for (var i = 0; i < nodes.length; i++) {
        toDo.push(nodes[i]);
    }
    while (toDo.length) {
        var node = toDo.shift(); // the parent node
        // get the children nodes
        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            if (row.parentId == node.id) {
                var child = {
                    id: row.id,
                    text: row.name
                };
                if (node.children) {
                    node.children.push(child);
                } else {
                    node.children = [child];
                }
                toDo.push(child);
            }
        }
    }
    return nodes;
}