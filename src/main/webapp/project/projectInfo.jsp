<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.4/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.4/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.4/themes/color.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="project/common/css/projectInfo.css">
    <script type="text/javascript" src="jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="project/common/js/projectInfo.js"></script>
    <div id="projectList"></div>
</head>
<body>
<div style="margin:20px 0;"></div>
<div class="easyui-panel" title="New Topic" style="width:100%;height:95%">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>项目编号:</td>
                    <td><input class="easyui-textbox" type="text" name="code" data-options="required:true"></input></td>
                    <td>项目类型:</td>
                    <td><input class="easyui-textbox" type="text" name="projectType" data-options="required:true"></input></td>
                    <td>项目期限:</td>
                    <td><input id="interestDate" name="interestDate" value="aa"></td>
                    <input class="easyui-combobox" data-options="
		valueField: 'label',
		textField: 'value',
		data: [{
			label: 'java',
			value: 'Java'
		},{
			label: 'perl',
			value: 'Perl'
		},{
			label: 'ruby',
			value: 'Ruby'
		}]" />


                </tr>
                <tr>
                    <td>项目名称:</td>
                    <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>项目总额:</td>
                    <td><input class="easyui-textbox" type="text" name="totalMoney" data-options="required:true"></input></td>
                    <td>项目来源:</td>
                    <td><input class="easyui-textbox" type="text" name="souece" data-options="required:true"></input></td>
                    <td>联系人:</td>
                    <td>
                        <input id="linkmanName" name="linkmanName" />
                    </td>

                </tr>
                <tr>
                    <td>对内利率:</td>
                    <td><input class="easyui-textbox" type="text" name="inRate" data-options="required:true"></input></td>
                    <td>对外贷率:</td>
                    <td><input class="easyui-textbox" type="text" name="outRate" data-options="required:true,validType:'email'"></input></td>
                </tr>
                <tr>
                    <td>预计利息:</td>
                    <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
                    <td>实际利息:</td>
                    <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>预计支出:</td>
                    <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
                    <td>实际支出:</td>
                    <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>税费:</td>
                    <td><input class="easyui-textbox" type="text" name="tax" data-options="required:true"></input></td>
                    <td>可抵扣税费:</td>
                    <td><input class="easyui-textbox" type="text" name="deTax" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>竞标日期:</td>
                    <td><input class="easyui-textbox" type="text" name="startDate" data-options="required:true"></input></td>
                    <td>满标日期:</td>
                    <td><input class="easyui-textbox" type="text" name="fullDate" data-options="required:true"></input></td>
                    <td>起息日期:</td>
                    <td><input class="easyui-textbox" type="text" name="valueDate"
                               data-options="required:true,validType:'email'"></input></td>
                </tr>
                <tr>
                    <td>回款日期:</td>
                    <td><input class="easyui-textbox" type="text" name="endDate" data-options="required:true"></input></td>
                    <td>实际回款日期:</td>
                    <td><input class="easyui-textbox" type="text" name="realendDate" data-options="required:true"></input></td>
                    <td>项目结束日期:</td>
                    <td><input class="easyui-textbox" type="text" name="overDate"
                               data-options="required:true,validType:'email'"></input></td>
                </tr>
                <tr>
                    <td>创建日期:</td>
                    <td><input class="easyui-textbox" type="text" name="createDate" data-options="required:true"></input></td>
                    <td>最近编辑日期:</td>
                    <td><input class="easyui-textbox" type="text" name="editDate"
                               data-options="required:true,validType:'email'"></input></td>
                </tr>
                <tr>
                    <td>创建人:</td>
                    <td><input class="easyui-textbox" type="text" name="createrName" data-options="required:true"></input></td>
                    <td>跟单人:</td>
                    <td><input class="easyui-textbox" type="text" name="followerName" data-options="required:true"></input></td>
                    <td>负责人:</td>
                    <td><input class="easyui-textbox" type="text" name="directorName" data-options="required:true,validType:'email'"></input></td>
                </tr>
                <tr>
                    <td>项目备注:</td>
                    <td><input class="easyui-textbox" type="text" name="remark" data-options="required:true"></input></td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清空</a>
        </div>
    </div>
</div>

</body>
