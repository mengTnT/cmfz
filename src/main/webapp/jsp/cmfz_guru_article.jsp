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
<table id="showAllcmfz_guru_article">
    <div id="lala">

        <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-remove'" id="resetIndexDB" onClick="resetIndexDB();">重置索引库</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-remove',disabled:true" id="addIndexDB" onClick="addIndexDB();">添加索引库</a>
        <input  id="keysword" data-options="prompt:'Please Input Value',searcher:''" style="width:130px;vertical-align:middle;"></input>
        <a href="javascript:void(0)" onClick="lucene();" class="easyui-linkbutton" plain="true">高级检索</a>
    </div>
</table>
<%-- 展示所有文章信息--%>
<table id="showAllcmfz_article">


</table>

<%--添加文章--%>
<div id="addArticle" class="easyui-dialog" data-options="closed:true">
    <form id="addArticleInformation" enctype="multipart/form-data" method="post">
        文章标题：<input name="articleName"><br>
        图片路径：<input type="file" onchange="previewImage(this)" name="image"><br>
        <div id="preview">
            <img id="imghead" border="0" src="${pageContext.request.contextPath}/img/photo_icon.png" width="90"
                 height="90">
        </div>
        <br>
        正文：<input  name="articleContent"><br>
        所属上师：<input id="prosele1" name="guru.siId" value="请选择所属上师"></input><br/><br/>

        <center>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="pro1()">确认</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
        </center>

    </form>
</div>
<%--修改文章--%>
<div id="updateArticle" class="easyui-dialog" data-options="closed:true">
    <form id="updateArticleInformation" enctype="multipart/form-data" method="post">
        <input id="article_Id" name="articleId" type="hidden"/>
        <input id="article_Image" name="articleImage" type="hidden"/>

        文章标题：<input name="articleName" id="article_Name"><br>
        <%--图片：<input type="file"  name="image" /><br/><br/>
         <div id="bannerImg2"></div>--%>
        图片路径：<input type="file" onchange="previewImage2(this)" name="image"><br>
        <div id="preview2">
            <%--<img id="imghead2" border="0" src="img/photo_icon.png" width="90" height="90" >--%>
        </div>
        <br>

        正文：<input id="article_Content" name="articleContent"><br>
        所属上师：<input id="prosele2" name="guru.siId"></input><br/><br/>

        <center>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="pro2()">确认</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
        </center>
    </form>

</div>
<script type="text/javascript">

    function lucene() {
        var kw=$("#keysword").val();
        alert(kw)
        $("#showAllcmfz_article")
            .datagrid(
                {
                    url: '${pageContext.request.contextPath}/showLuceneArticle.do?keysword='+kw,
                    fitColumns: true,

                    columns: [[{
                        field: '',
                        checkbox: true
                    }, {
                        "field": 'articleId',
                        "title": 'ID',
                        "width": 200,
                        "align": 'center',

                    }, {
                        field: 'articleImage',
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
                        "field": 'articleName',
                        "title": '标题',
                        "width": 200,
                        "align": 'center'
                    }, {
                        "field": 'articleCount',
                        "title": '点击量',
                        "width": 200,
                        "align": 'center'

                    }, {
                        "field": 'articleContent',
                        "title": '正文',
                        "width": 200,
                        "align": 'center'
                    }, {
                        "field": 'articleDate',
                        "title": '添加时间',
                        "width": 200,
                        "align": 'center'
                    }, {
                        "field": 'guru',
                        "title": '所属上师',
                        "width": 200,
                        "align": 'center',
                        formatter: function (value, row, index) {
                            // value  当前列值
                            // row 当前行对象
                            // index  行数据下标
                            // easyui 1.4  datagrid存在的问题   默认加载两次请求，第一次不携带返回数据。
                            // js  判断   value值 为undefined  默认的Boolean 为false  如果value不为undefined  则为true
                            /*  return value.siName*/
                            if (value) {
                                return row.guru.siName

                            }

                        }
                    }

                    ]],
                    striped: true,
                    pagination: true,
                    pageSize: 10,
                    /* pageList: [10,20,30,40],*/
                    toolbar: [
                        {
                            iconCls: 'icon-add',
                            handler: function () {
                                $("#addArticle").dialog({
                                    title: '添加',
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
                                var cates = $("#showAllcmfz_article")
                                    .datagrid('getChecked');
                                if (cates.length > 1
                                    || cates.length < 1) {
                                    $.messager.alert("消息",
                                        "请选择一条数据修改", 'warning');
                                } else {
                                    $("#updateArticle").dialog(
                                        {
                                            title: '修改',
                                            width: 400,
                                            modal: true,
                                            closed: false,

                                        })
                                    var articleId;
                                    var articleName;
                                    var articleImage;
                                    var articleContent;
                                    var siName;
                                    var siId;

                                    var article = $("#showAllcmfz_article").datagrid('getChecked');
                                    $.each(article, function (index,
                                                              cate) {
                                        console.log(cate)


                                        articleId = cate.articleId;
                                        articleName = cate.articleName;
                                        articleImage = cate.articleImage;
                                        articleContent = cate.articleContent;
                                        siName = cate.guru.siName;
                                        siId = cate.guru.siId;

                                    })

                                    $("#article_Id")
                                        .val(articleId);
                                    $("#article_Name")
                                        .val(articleName);
                                    $("#article_Image")
                                        .val(articleImage);
                                    $("#article_Content")
                                        .val(articleContent);

                                    $("#prosele2").combobox("select", siName);
                                    $("#prosele2").combobox('setValue', siId);
                                    $("#preview2").html('<img id="imghead2" border="0" width="50px" height="50px" src="${pageContext.request.contextPath}/picture' + articleImage + '"/>');
                                }
                            }
                        },
                        '-',
                        {
                            iconCls: 'icon-remove',
                            handler: function () {
                                var cates = $("#showAllcmfz_article").datagrid('getChecked');
                                if (cates.length < 1) {
                                    $.messager.alert("消息", "请选择一条数据修改", 'warning');
                                } else {
                                    $.messager.confirm("消息", "您确定要删除吗？", function (x) {
                                        if (x) {
                                            var ids = [];
                                            var cateIds = $("#showAllcmfz_article").datagrid('getChecked');
                                            $.each(cateIds, function (index, ii) {
                                                ids.push(ii.articleId);
                                            })
                                            $.ajax({
                                                type: 'post',
                                                url: '${pageContext.request.contextPath}/deleteArticle.do',
                                                data: 'ids=' + ids,
                                                success: function (dada) {
                                                    if (dada != 0) {
                                                        $.messager.alert("消息", "删除成功", 'info');
                                                        $("#showAllcmfz_article").datagrid('reload');
                                                    } else {
                                                        $.messager.alert("消息", "删除失败", 'error');
                                                        $("#showAllcmfz_article").datagrid('reload');
                                                    }
                                                }
                                            })
                                        } else {
                                            $("#showAllcmfz_article").datagrid('reload');
                                        }
                                    })

                                }
                            }
                        }]

                })

    }

    function resetIndexDB() {
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/reset.do',
            contentType: false,
            processData: false,
            success: function (data) {

                alert("重置成功")
                $('#addIndexDB').linkbutton({
                    disabled:false
                });
                $('#resetIndexDB').linkbutton({
                    disabled:true
                });
            }

        })
    }
    function addIndexDB() {
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/add.do',
            contentType: false,
            processData: false,
            success: function (data) {

                alert("添加成功")
                $('#addIndexDB').linkbutton({
                    disabled:true
                });
                $('#resetIndexDB').linkbutton({
                    disabled:false
                });
            }

        })
    }




    /*添加时下拉框*/
    $('#prosele1').combobox({
        url: '${pageContext.request.contextPath}/getGuru.do',
        valueField: 'siId',
        textField: 'siName'
    });
    /* 修改时下拉框 */
    $('#prosele2').combobox({
        url: '${pageContext.request.contextPath}/getGuru.do',
        valueField: 'siId',
        textField: 'siName'
    });

    $("#showAllcmfz_article")
        .datagrid(
            {
                url: '${pageContext.request.contextPath}/showAllArticle.do',
                fitColumns: true,

                columns: [[{
                    field: '',
                    checkbox: true
                }, {
                    "field": 'articleId',
                    "title": 'ID',
                    "width": 200,
                    "align": 'center',

                }, {
                    field: 'articleImage',
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
                    "field": 'articleName',
                    "title": '标题',
                    "width": 200,
                    "align": 'center'
                }, {
                    "field": 'articleCount',
                    "title": '点击量',
                    "width": 200,
                    "align": 'center'

                }, {
                    "field": 'articleContent',
                    "title": '正文',
                    "width": 200,
                    "align": 'center'
                }, {
                    "field": 'articleDate',
                    "title": '添加时间',
                    "width": 200,
                    "align": 'center'
                }, {
                    "field": 'guru',
                    "title": '所属上师',
                    "width": 200,
                    "align": 'center',
                    formatter: function (value, row, index) {
                        // value  当前列值
                        // row 当前行对象
                        // index  行数据下标
                        // easyui 1.4  datagrid存在的问题   默认加载两次请求，第一次不携带返回数据。
                        // js  判断   value值 为undefined  默认的Boolean 为false  如果value不为undefined  则为true
                        /*  return value.siName*/
                        if (value) {
                            return row.guru.siName

                        }

                    }
                }

                ]],
                striped: true,
                pagination: true,
                pageSize: 10,
                /* pageList: [10,20,30,40],*/
                toolbar: [
                    {
                        iconCls: 'icon-add',
                        handler: function () {
                            $("#addArticle").dialog({
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
                            var cates = $("#showAllcmfz_article")
                                .datagrid('getChecked');
                            if (cates.length > 1
                                || cates.length < 1) {
                                $.messager.alert("消息",
                                    "请选择一条数据修改", 'warning');
                            } else {
                                $("#updateArticle").dialog(
                                    {
                                        title: '修改轮播图',
                                        width: 400,
                                        modal: true,
                                        closed: false,

                                    })
                                var articleId;
                                var articleName;
                                var articleImage;
                                var articleContent;
                                var siName;
                                var siId;

                                var article = $("#showAllcmfz_article").datagrid('getChecked');
                                $.each(article, function (index,
                                                          cate) {
                                    console.log(cate)


                                    articleId = cate.articleId;
                                    articleName = cate.articleName;
                                    articleImage = cate.articleImage;
                                    articleContent = cate.articleContent;
                                    siName = cate.guru.siName;
                                    siId = cate.guru.siId;

                                })

                                $("#article_Id")
                                    .val(articleId);
                                $("#article_Name")
                                    .val(articleName);
                                $("#article_Image")
                                    .val(articleImage);
                                $("#article_Content")
                                    .val(articleContent);

                                $("#prosele2").combobox("select", siName);
                                $("#prosele2").combobox('setValue', siId);
                                $("#preview2").html('<img id="imghead2" border="0" width="50px" height="50px" src="${pageContext.request.contextPath}/picture' + articleImage + '"/>');
                            }
                        }
                    },
                    '-',
                    {
                        iconCls: 'icon-remove',
                        handler: function () {
                            var cates = $("#showAllcmfz_article").datagrid('getChecked');
                            if (cates.length < 1) {
                                $.messager.alert("消息", "请选择一条数据修改", 'warning');
                            } else {
                                $.messager.confirm("消息", "您确定要删除吗？", function (x) {
                                    if (x) {
                                        var ids = [];
                                        var cateIds = $("#showAllcmfz_article").datagrid('getChecked');
                                        $.each(cateIds, function (index, ii) {
                                            ids.push(ii.articleId);
                                        })
                                        $.ajax({
                                            type: 'post',
                                            url: '${pageContext.request.contextPath}/deleteArticle.do',
                                            data: 'ids=' + ids,
                                            success: function (dada) {
                                                if (dada != 0) {
                                                    $.messager.alert("消息", "删除成功", 'info');
                                                    $("#showAllcmfz_article").datagrid('reload');
                                                } else {
                                                    $.messager.alert("消息", "删除失败", 'error');
                                                    $("#showAllcmfz_article").datagrid('reload');
                                                }
                                            }
                                        })
                                    } else {
                                        $("#showAllcmfz_article").datagrid('reload');
                                    }
                                })

                            }
                        }
                    }]

            })

    $("#addArticleInformation").submit(function () {
        var formData = new FormData($("#addArticleInformation")[0]);
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/addArticle.do',
            data: formData,
            contentType: false,
            processData: false,
            success: function (dada) {
                if (dada == 1) {
                    $.messager.alert("消息", "添加成功", 'info');
                    $("#addArticle").dialog('close');
                    $("#showAllcmfz_article").datagrid('reload');

                } else if (dada == 0) {
                    $.messager.alert("消息", "添加失败", 'error');
                    $("#addArticle").dialog('close');
                    $("#showAllcmfz_article").datagrid('reload');

                }
            }
        })
        return false;
    })
    $("#updateArticleInformation").submit(function () {
        var formData = new FormData($("#updateArticleInformation")[0]);
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/updateArticle.do',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (dada) {
                if (dada == 1) {
                    $.messager.alert("消息", "修改成功", 'info');
                    $("#updateArticle").dialog('close');
                    $("#showAllcmfz_article").datagrid('reload');
                } else {
                    $.messager.alert("消息", "修改失败", 'error');
                    $("#updateArticle").dialog('close');
                    $("#showAllcmfz_article").datagrid('reload');
                }
            }
        })
        return false;
    })

    function exit() {
        $("#updateArticle").dialog('close');
        $("#showAllcmfz_article").datagrid('reload');
    }

    function pro2() {
        $("#updateArticleInformation").submit();
    }

    function pro1() {
        $("#addArticleInformation").submit();
    }

    // 图片回显
    //添加图片回显
    function previewImage(file) {
        var MAXWIDTH = 90;
        var MAXHEIGHT = 90;
        var div = document.getElementById('preview');
        if (file.files && file.files[0]) {
            div.innerHTML = '<img id=imghead onclick=$("#previewImg").click()>';
            var img = document.getElementById('imghead');
            img.onload = function () {
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width = rect.width;
                img.height = rect.height;
                img.style.marginTop = rect.top + 'px';
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                img.src = evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);
        }

    }

    //修改图片回显
    function previewImage2(file) {
        var MAXWIDTH = 90;
        var MAXHEIGHT = 90;
        var div = document.getElementById('preview2');
        if (file.files && file.files[0]) {
            div.innerHTML = '<img id=imghead2 onclick=$("#previewImg2").click()>';
            var img = document.getElementById('imghead2');
            img.onload = function () {
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width = rect.width;
                img.height = rect.height;
                img.style.marginTop = rect.top + 'px';
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                img.src = evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);
        }

    }

    function clacImgZoomParam(maxWidth, maxHeight, width, height) {
        var param = {top: 0, left: 0, width: width, height: height};
        if (width > maxWidth || height > maxHeight) {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if (rateWidth > rateHeight) {
                param.width = maxWidth;
                param.height = Math.round(height / rateWidth);
            } else {
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
