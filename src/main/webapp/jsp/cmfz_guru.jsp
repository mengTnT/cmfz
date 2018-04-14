<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cmfz_guru.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/icon.css">
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/easyui-lang-zh_CN.js"></script>
	

  </head>
  
  <body>
    <table id="showAllcmfz_guru"></table>

    <div id="addguru" class="easyui-dialog" data-options="closed:true">
    	<form id="addguruInformation" enctype="multipart/form-data" method="post">
    		上师名字：<input name="si_name"><br>
    		上师法号：<input name="si_nickname"><br>
    		上师照片：<input name="uploadFile" class="easyui-filebox" data-options="
    			buttonText:'选择文件',
    			width:150,
    			height:20
    		">
    	</form>
    </div>
    <div id="updateguru" class="easyui-dialog" data-options="closed:true">
    	<form id="updateguruInformation" enctype="multipart/form-data" method="post">
    				<input id="guru_id" name="si_id" type="hidden">
    		上师名字：<input id="guru_name" name="si_name"><br>
    		上师法号：<input name="si_nickname"><br>
    		上师照片：<input name="uploadFile" class="easyui-filebox" data-options="
    			buttonText:'选择文件',
    			width:150,
    			height:20
    		">
    	</form>
    		<p id="guru_picture"></p>
    </div>
	<script type="text/javascript">
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

        $("#showAllcmfz_guru")
            .datagrid(
                {
                    url: '${pageContext.request.contextPath}/getGuru.do',
                    fitColumns: true,

                    columns: [[{
                        field: '',
                        checkbox: true
                    }, {
                        "field": 'siId',
                        "title": 'ID',
                        "width": 200,
                        "align": 'center',

                    }, {
                        field: 'siImage',
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
                        "field": 'siName',
                        "title": '上师名',
                        "width": 200,
                        "align": 'center'
                    }, {
                        "field": 'siNickname',
                        "title": '法号',
                        "width": 200,
                        "align": 'center'

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
                                $("#addguru").dialog({
                                    title: '添加上师',
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
                                var cates = $("#showAllcmfz_guru")
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

                                    var article = $("#showAllcmfz_guru").datagrid('getChecked');
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
                                var cates = $("#showAllcmfz_guru").datagrid('getChecked');
                                if (cates.length < 1) {
                                    $.messager.alert("消息", "请选择一条数据修改", 'warning');
                                } else {
                                    $.messager.confirm("消息", "您确定要删除吗？", function (x) {
                                        if (x) {
                                            var ids = [];
                                            var cateIds = $("#showAllcmfz_guru").datagrid('getChecked');
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
                                                        $("#showAllcmfz_guru").datagrid('reload');
                                                    } else {
                                                        $.messager.alert("消息", "删除失败", 'error');
                                                        $("#showAllcmfz_guru").datagrid('reload');
                                                    }
                                                }
                                            })
                                        } else {
                                            $("#showAllcmfz_guru").datagrid('reload');
                                        }
                                    })

                                }
                            }
                        }]

                })

        $("#addguruInformation").submit(function () {
            var formData = new FormData($("#addguruInformation")[0]);
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/addguru.do',
                data: formData,
                contentType: false,
                processData: false,
                success: function (dada) {
                    if (dada == 1) {
                        $.messager.alert("消息", "添加成功", 'info');
                        $("#addguru").dialog('close');
                        $("#showAllcmfz_guru").datagrid('reload');

                    } else if (dada == 0) {
                        $.messager.alert("消息", "添加失败", 'error');
                        $("#addguru").dialog('close');
                        $("#showAllcmfz_guru").datagrid('reload');

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
                        $("#showAllcmfz_guru").datagrid('reload');
                    } else {
                        $.messager.alert("消息", "修改失败", 'error');
                        $("#updateArticle").dialog('close');
                        $("#showAllcmfz_guru").datagrid('reload');
                    }
                }
            })
            return false;
        })

        function exit() {
            $("#updateArticle").dialog('close');
            $("#showAllcmfz_guru").datagrid('reload');
        }

        function pro2() {
            $("#updateArticleInformation").submit();
        }

        function pro1() {
            $("#addguruInformation").submit();
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
