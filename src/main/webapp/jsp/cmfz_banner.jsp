<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'cmfz_banner.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/easyui.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/icon.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/icons/icon-all.css">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<%-- 展示所有轮播图信息--%>
<table id="showAllcmfz_banner">


</table>

<%--添加轮播图--%>
<div id="addBanner" class="easyui-dialog" data-options="closed:true">
    <form id="addBannerInformation" enctype="multipart/form-data" method="post">
        轮播图名：<input name="bannerName"><br>
        图片路径：<input type="file" onchange="previewImage(this)"  name="image"><br>
        <div id="preview">
            <img id="imghead" border="0" src="${pageContext.request.contextPath}/img/photo_icon.png" width="90" height="90" >
        </div><br>
        图片状态：<input value="请选择状态" id="banner_status1" name="bannerState" class="easyui-combobox" data-options="
    			valueField: 'label',
				textField: 'value',
				width:150,height:20,
				data: [{
					label: 'y',
					value: '显示'
				},{
					label: 'n',
					value: '不显示'
				}]
    		"><br>
        <center>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="pro1()">确认</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
        </center>

    </form>
</div>
<%--修改轮播图--%>
<div id="updateBanner" class="easyui-dialog" data-options="closed:true">
    <form id="updateBannerInformation" enctype="multipart/form-data" method="post">
        <input id="bannerId" name="bannerId" type="hidden"/>
        <input id="banner_Image" name="bannerImage" type="hidden"/>

        轮播图名：<input name="bannerName" id="bannerName"><br>
       <%--图片：<input type="file"  name="image" /><br/><br/>
        <div id="bannerImg2"></div>--%>
        图片路径：<input type="file" onchange="previewImage2(this)"  name="image"><br>
        <div id="preview2">
            <%--<img id="imghead2" border="0" src="img/photo_icon.png" width="90" height="90" >--%>
        </div><br>

        状态：<input class="easyui-combobox" id="banner_status2" name="bannerState" data-options="
    			valueField: 'label',
				textField: 'value',
				width:150,height:20,
				data: [{
					label: 'y',
					value: '显示'
				},{
					label: 'n',
					value: '不显示'
				}]
    		"></input><br/>
        <center>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="pro2()">确认</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
        </center>
    </form>

</div>
<script type="text/javascript">

    $("#showAllcmfz_banner")
        .datagrid(
            {
                url: '${pageContext.request.contextPath}/getAllBanner.do',
                fitColumns: true,

                columns: [[{
                    field: '',
                    checkbox: true
                }, {
                    "field": 'bannerId',
                    "title": 'ID',
                    "width": 200,
                    "align": 'center',

                }, {
                    field: 'bannerImage',
                    align: 'center',
                    title: '图片',
                    width: 200,
                    formatter: function (value, row, index) {
                        // value  当前列值
                        // row 当前行对象
                        // index  行数据下标
                        // easyui 1.4  datagrid存在的问题   默认加载两次请求，第一次不携带返回数据。
                        // js  判断   value值 为undefined  默认的Boolean 为false  如果value不为undefined  则为true
                        if (value) {
                            return "<img width=50px height=50px src='${pageContext.request.contextPath}/picture" + value + "'>";
                        }

                    }
                }, {
                    "field": 'bannerName',
                    "title": '名称',
                    "width": 200,
                    "align": 'center'
                }, {
                    "field": 'bannerNum',
                    "title": '数量',
                    "width": 200,
                    "align": 'center'

                }, {
                    "field": 'bannerState',
                    "title": '状态',
                    "width": 200,
                    "align": 'center',
                    formatter: function (value, row, index) {
                        /* alert(value) */
                        if (value == 'y') {
                            return "已展示";
                        } else {
                            return "未展示";
                        }
                    }


                }
                ]],
                striped: true,
                pagination: true,
                pageSize:10,
               /* pageList: [10,20,30,40],*/
                toolbar: [
                    {
                        iconCls: 'icon-add',
                        handler: function () {
                            $("#addBanner").dialog({
                                title: '添加轮播图',
                                width: 400,
                                modal: true,
                                closed: false
                            })

                        }
                    },
                    '-',
                    {
                        iconCls: 'icon-edit',
                        handler: function () {
                            var cates = $("#showAllcmfz_banner")
                                .datagrid('getChecked');
                            if (cates.length > 1
                                || cates.length < 1) {
                                $.messager.alert("消息",
                                    "请选择一条数据修改", 'warning');
                            } else {
                                $("#updateBanner").dialog(
                                    {
                                        title: '修改轮播图',
                                        width: 400,
                                        modal: true,
                                        closed: false,

                                    })
                                var bannerId;
                                var bannerImage;
                                var bannerName;
                                var bannerNum;
                                var bannerState;
                                var state2;
                                var banner = $("#showAllcmfz_banner").datagrid('getChecked');
                                $.each(banner, function (index,
                                                         cate) {
                                    console.log(cate)


                                    bannerId = cate.bannerId;
                                    bannerImage = cate.bannerImage;
                                    bannerName = cate.bannerName;
                                    bannerNum = cate.bannerNum;
                                    bannerState = cate.bannerState;
                                    state2=cate.bannerState;

                                })

                                $("#bannerId")
                                    .val(bannerId);
                                $("#bannerName")
                                    .val(bannerName);
                                $("#banner_Image")
                                    .val(bannerImage);
                                var state=bannerState;
                                if(state=='y'){
                                    state='已展示'
                                }
                                else{state='未展示'}
                                console.log(state)
                                $("#banner_status2").combobox("select",state);
                                $("#banner_status2").combobox('setValue', state2);
                                $("#preview2").html('<img id="imghead2" border="0" width="50px" height="50px" src="${pageContext.request.contextPath}/picture'+bannerImage+'"/>');
                            }
                        }
                    },
                    '-',
                    {
                        iconCls: 'icon-remove',
                        handler: function () {
                            var cates = $("#showAllcmfz_banner").datagrid('getChecked');
                            if (cates.length < 1) {
                                $.messager.alert("消息", "请选择一条数据修改", 'warning');
                            } else {
                                $.messager.confirm("消息", "您确定要删除吗？", function (x) {
                                    if (x) {
                                        var ids = [];
                                        var cateIds = $("#showAllcmfz_banner").datagrid('getChecked');
                                        $.each(cateIds, function (index, ii) {
                                            ids.push(ii.bannerId);
                                        })
                                        $.ajax({
                                            type: 'post',
                                            url: '${pageContext.request.contextPath}/deleteBanner.do',
                                            data: 'ids=' + ids,
                                            success: function (dada) {
                                                if (dada != 0) {
                                                    $.messager.alert("消息", "删除成功", 'info');
                                                    $("#showAllcmfz_banner").datagrid('reload');
                                                } else {
                                                    $.messager.alert("消息", "删除失败", 'error');
                                                    $("#showAllcmfz_banner").datagrid('reload');
                                                }
                                            }
                                        })
                                    } else {
                                        $("#showAllcmfz_banner").datagrid('reload');
                                    }
                                })

                            }
                        }
                    }]

            })

    $("#addBannerInformation").submit(function () {
        var formData = new FormData($("#addBannerInformation")[0]);
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/addBanner.do',
            data: formData,
            contentType: false,
            processData: false,
            success: function (dada) {
                if (dada == 1) {
                    $.messager.alert("消息", "添加成功", 'info');
                    $("#addBanner").dialog('close');
                    $("#showAllcmfz_banner").datagrid('reload');

                } else if (dada == 0) {
                    $.messager.alert("消息", "添加失败", 'error');
                    $("#addBanner").dialog('close');
                    $("#showAllcmfz_banner").datagrid('reload');

                }
            }
        })
        return false;
    })
    $("#updateBannerInformation").submit(function () {
        var formData = new FormData($("#updateBannerInformation")[0]);
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/updateBanner.do',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (dada) {
                if (dada == 1) {
                    $.messager.alert("消息", "修改成功", 'info');
                    $("#updateBanner").dialog('close');
                    $("#showAllcmfz_banner").datagrid('reload');
                } else {
                    $.messager.alert("消息", "修改失败", 'error');
                    $("#updateBanner").dialog('close');
                    $("#showAllcmfz_banner").datagrid('reload');
                }
            }
        })
        return false;
    })

    function exit() {
        $("#updateBanner").dialog('close');
        $("#showAllcmfz_banner").datagrid('reload');
    }

    function pro2() {
        $("#updateBannerInformation").submit();
    }

    function pro1() {
        $("#addBannerInformation").submit();
    }

    // 图片回显
    //添加图片回显
    function previewImage(file)
    {
        var MAXWIDTH  = 90;
        var MAXHEIGHT = 90;
        var div = document.getElementById('preview');
        if (file.files && file.files[0])
        {
            div.innerHTML ='<img id=imghead onclick=$("#previewImg").click()>';
            var img = document.getElementById('imghead');
            img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
                img.style.marginTop = rect.top+'px';
            }
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        }

    }
    //修改图片回显
    function previewImage2(file)
    {
        var MAXWIDTH  = 90;
        var MAXHEIGHT = 90;
        var div = document.getElementById('preview2');
        if (file.files && file.files[0])
        {
            div.innerHTML ='<img id=imghead2 onclick=$("#previewImg2").click()>';
            var img = document.getElementById('imghead2');
            img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
                img.style.marginTop = rect.top+'px';
            }
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        }

    }
    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        if( width>maxWidth || height>maxHeight ){
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if( rateWidth > rateHeight ){
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
            }else{
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }


    /*图片回显结束*/
</script>
</body>
</html>
