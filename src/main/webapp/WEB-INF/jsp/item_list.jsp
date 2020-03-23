<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>

		<meta charset="UTF-8">
		<title>游戏管理后台</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		 <!-- bootstrap framework -->
		<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<!-- main stylesheet -->
		<link href="${pageContext.request.contextPath }/css/main.min.css" rel="stylesheet" media="screen" id="mainCss">
		<!-- elegant icons -->
        <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" media="screen">
        <!-- datepicker -->
        <link href="${pageContext.request.contextPath }/css/datepicker3.css" rel="stylesheet" media="screen">
        <!-- jBox -->
        <link href="${pageContext.request.contextPath }/css/jbox.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath }/css/noticeborder.css" rel="stylesheet" media="screen">

    </head>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <body class="side_menu_active side_menu_expanded">
        <div id="page_wrapper">

            <!-- header -->
            <header id="main_header">
                <div class="container-fluid">
                	<!--logo-->
                    <div class="brand_section">
                        <a href="#"><img src="${pageContext.request.contextPath }/picture/logo01.png" alt="site_logo" width="108" height="40" style="margin-top: 5px"></a>
                    </div>
                    <div class="header_user_actions dropdown">
                        <div data-toggle="dropdown" class="dropdown-toggle user_dropdown">
                            <div class="user_avatar">
                                <img src="${pageContext.request.contextPath }/picture/head01.png" width="38" height="38">
                            </div>
                            <span class="caret"></span>
                        </div>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#">个人中心</a></li>
                            <li><a href="#">注销</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <!-- main content -->
            <div id="main_wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <form action="${pageContext.request.contextPath }/item/selectByVo.do" method="post">
                                <input type="text" placeholder="id" name="itemInfo.item_id">
                                <input type="text" placeholder="名称" name="itemInfo.item_name">
                                <input type="text" placeholder="类型" name="itemInfo.item_type">
                                <input type="text" placeholder="原价"  name="itemInfo.item_price">
                                <input type="submit"  value="查询">
                            </form>

                            <div class="row">
                                <div class="col-md-10">
<%--                                    <form action="${pageContext.request.contextPath }/item/selectArrays.do" method="post">--%>
<%--                                    <form action="${pageContext.request.contextPath }/item/selectVoArrays.do" method="post">--%>
                                    <form action="${pageContext.request.contextPath }/item/selectVoList.do" method="post">
                                    <table class="table table-yuk2 toggle-arrow-tiny" id="footable_demo" data-filter="#textFilter" data-page-size="5">
                                        <thead>
                                            <tr>
                                            	<!--描述：商品数据标签-->
                                                <th>选择</th>
                                                <th>ID</th>
                                                <th>游戏名称</th>
                                                <th>类型</th>
                                                <th>原价</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                       		<c:forEach items="${itemList }" var="item" varStatus="i">
	                                        	<tr>
	                                                <td><input type="checkbox" name="ids" value="${item.item_id}"></td>
	                                                <td>${item.item_id }</td>
<%--	                                                <td>${item.item_name }</td>--%>
	                                                <td><input type="text" class="input_item_name" value="${item.item_name}"></td>
	                                                <td>${item.item_type }</td>
	                                                <td><input type="text" name="priceList[${i.index}]" value="${item.item_price}"></td>
<%--	                                                <td>${item.item_price }</td>--%>

	                                                <td data-value="1">
	                                                	<a herf="#" id="edit_btn" class="btn btn-xs btn-info" data-toggle="modal" data-target="#editLayer" onclick="editGoods('${item.item_id}')">修改</a>
	                                                	<a herf="#"  id="del_btn" class="btn btn-xs btn-danger" onclick="deleteItem('${item.item_id}')">删除</a>
	                                                	<a herf="#"  id="del_btn2" class="btn btn-xs btn-danger" onclick="window.location='${pageContext.request.contextPath }/item/${item.item_id}'">查询</a>
	                                                	<a herf="#"  id="del_btn3" class="btn btn-xs btn-warning" onclick="restFul(${item.item_id})">ajax</a>
	                                                </td>
	                                           	</tr>
                                        	</c:forEach>
                                        </tbody>
                                        <tfoot class="hide-if-no-paging">
                                            <tr>
                                                <td colspan="5">
                                                    <ul class="pagination pagination-sm"></ul>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                        <input type="submit" value="获取数组">
                                        <input type="submit" value="获取总价">
                                        <input type="button" value="ajax提交json数据" onclick="jsonData()">
                                        <input type="button" value="获取所有name" onclick="getNameList()">
                                  </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- edit layer -->
            <div class="modal fade" id="editLayer">
                <div class="modal-dialog modal-content">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">修改游戏信息</h4>
                        </div>
                   	<div class="modal-body">
                        <!--游戏修改详情弹出层表单-->
	                    <form class="form-horizontal" id="edit_item_form">
	                    	<!-- 游戏id隐藏域 -->
							<input type="hidden" id="edit_item_id" name="item_id"/>
							<!-- 游戏名称 -->
							<div class="form-group">
								<label for="edit_item_name" class="col-sm-2 control-label">游戏名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_item_name" placeholder="游戏名称" name="item_name">
								</div>
							</div>
							<!-- 游戏类型 -->
							<div class="form-group">
								<label for="edit_item_price" class="col-sm-2 control-label">类型</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_item_type" placeholder="类型" name="item_price">
								</div>
							</div>
							<!-- 游戏原价 -->
							<div class="form-group">
								<label for="edit_item_price" class="col-sm-2 control-label">原价</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_item_price" placeholder="原价" name="item_price">
								</div>
							</div>
						</form>  
                    </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="updateItem()">确认修改</button>
                        </div>
                    </div>
                </div>
            </div>
            
             <!-- add layer -->
            <div class="modal fade" id="addLayer">
                <div class="modal-dialog modal-content">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">新增游戏</h4>
                        </div>
                   	<div class="modal-body">
                        <!--添加游戏弹出层表单-->
	                    <form class="form-horizontal" id="add_item_form">
	                    	<!-- 游戏id隐藏域 -->
                            <div class="form-group">
                                <label for="add_item_id" class="col-sm-2 control-label">游戏id</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_item_id" placeholder="游戏id" name="item_id"/>
                                </div>
                            </div>
<%--							<input type="hidden" id="add_item_id" name="item_id"/>--%>
							<!-- 游戏名称 -->
							<div class="form-group">
								<label for="add_item_name" class="col-sm-2 control-label">游戏名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_item_name" placeholder="游戏名称" name="item_name">
								</div>
							</div>
							<!-- 游戏类型 -->
							<div class="form-group">
								<label for="add_item_price" class="col-sm-2 control-label">类型</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_item_type" placeholder="类型" name="item_price">
								</div>
							</div>
							<!-- 游戏原价 -->
							<div class="form-group">
								<label for="add_item_price" class="col-sm-2 control-label">原价</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_item_price" placeholder="原价" name="item_price">
								</div>
							</div>
<%--                            <div>--%>
<%--                                <button type="submit" class="btn btn-primary btn-sm" onclick="addItem()" >确认修改</button>--%>
<%--                            </div>--%>
						</form>  
                    </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="addItem()" >确认修改</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- main menu -->
            <nav id="main_menu">
                <div class="menu_wrapper">
                    <ul>
                        <li class="first_level">
                            <a href="javascript:void(0)">
                                <span class="icon_document_alt first_level_icon"></span>
                                <span class="menu-title">游戏管理</span>
                            </a>
                            <ul>
                                <li class="submenu-title">游戏管理</li>
                                <li><a href="#" data-toggle="modal" data-target="#addLayer">商品添加</a></li>
                                <li><a href="${pageContext.request.contextPath }/item/myitemlist.do">游戏列表</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="menu_toggle">
                    <span class="icon_menu_toggle">
                        <i class="arrow_carrot-2left toggle_left"></i>
                        <i class="arrow_carrot-2right toggle_right" style="display:none"></i>
                    </span>
                </div>
            </nav>
        </div>

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
        <!-- jQuery Cookie -->
        <script src="${pageContext.request.contextPath }/js/jquerycookie.min.js"></script>
        <!-- Bootstrap Framework -->
        <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
        <!-- retina images -->
        <script src="${pageContext.request.contextPath }/js/retina.min.js"></script>
        <!-- switchery -->
        <script src="${pageContext.request.contextPath }/js/switchery.min.js"></script>
        <!-- typeahead -->
        <script src="${pageContext.request.contextPath }/js/typeahead.bundle.min.js"></script>
        <!-- fastclick -->
        <script src="${pageContext.request.contextPath }/js/fastclick.min.js"></script>
        <!-- match height -->
        <script src="${pageContext.request.contextPath }/js/jquery.matchheight-min.js"></script>
        <!-- scrollbar -->
        <script src="${pageContext.request.contextPath }/js/jquery.mcustomscrollbar.concat.min.js"></script>
		<!-- moment.js (date library) -->
        <script src="${pageContext.request.contextPath }/js/moment-with-langs.min.js"></script>
        <!-- Yukon Admin functions -->
        <script src="${pageContext.request.contextPath }/js/yukon_all.min.js"></script>
	    <!-- page specific plugins -->
        <!-- footable -->
        <script src="${pageContext.request.contextPath }/js/footable.min.js"></script>
        <script src="${pageContext.request.contextPath }/js/footable.paginate.min.js"></script>
        <script src="${pageContext.request.contextPath }/js/footable.filter.min.js"></script>
       	<!-- datepicker -->
        <script src="${pageContext.request.contextPath }/js/bootstrap-datepicker.js"></script>
   		<!-- jBox -->
        <script src="${pageContext.request.contextPath }/js/jbox.min.js"></script>
        
        <script type="text/javascript">
	        $(function() {
	            //footable
	            yukon_footable.goodslist();
	            //datepicker
	            yukon_datepicker.p_forms_extended();
	        })
	        
	        //修改弹框回显
            function editGoods(id) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath }/item/editGoods.do",
                    data:{"id":id},
                    dataType:"json",
                    success:function (data) {
                        // alert(data.item_name);
                        $("#edit_item_name").val(data.item_name);
                        $("#edit_item_type").val(data.item_type);
                        $("#edit_item_price").val(data.item_price);
                    }
                });
            }
	       	function toEdit(id) {
	   			$.ajax({
	   				type:"post",
	   				url:"${pageContext.request.contextPath }/item/toEdit.do",
	   				data:{"id":id},
	   				success:function(data) {
	   					$("#edit_item_name").val(data.item_name);
	   					$("#edit_item_type").val(data.item_type);
	   					$("#edit_item_price").val(data.item_price);
	   				},
	   				dataType:"json"
	   			});
	   		}
	   		function getNameList(){
                //获取所有name的值
                //保存所有的值
                var nameList = new Array();
                $(".input_item_name").each(function () {
                    nameList.push($(this).val())
                });
                //alert(nameList[3])
                //发送到后台
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath }/item/getNameList.do",
                    contentType:"application/json;charset=utf-8",
                    data:JSON.stringify(nameList)
                });
                alert("获取成功，请到后台查看")
            }



	        //确认修改
			function updateItem() {
				$.post(
					"${pageContext.request.contextPath }/item/update.do",
					$("#edit_item_form").serialize(),
					function(data){
						alert("游戏信息更新成功!");
						window.location.reload();
				});
			}
			
	        //确认删除
			function deleteItem(id) {
				if(confirm('确实要删除该游戏吗?')) {
					$.post(
						"${pageContext.request.contextPath }/item/delete.do",
						{"id":id},
						function(data){
							window.location.reload();
					});
				}
			}
			
	        //添加游戏
			function addItem() {
				$.post(
					"${pageContext.request.contextPath }/item/save.do",
                    // $("#add_item_form").serialize(),
                    // $("#add_item_id").text(""),
                     {"item_id":$("#add_item_id").val(),"item_name":$("#add_item_name").val(),"item_type":$("#add_item_type").val(),"item_price":$("#add_item_price").val()},
                    // $("#add_item_form").submit(
                    //     function(){
                    //         $('#add_item_form').serialize();
                    //     }
                    // )
					function(data){
						alert("游戏添加成功!");
						window.location.reload();
				});
			}

			//使用ajax发送和接受json格式的字符串
            function jsonData(){
	            //json格式的字符串 要传输的数据 测试
                var jsondata = '{"item_id":"99","item_name":"超级玛丽","item_type":"横板过关","item_price":"10"}';
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath }/item/jsonData.do",
                    //发送的数据格式
                    contentType:"application/json;charset=utf-8",
                    //回调的格式
                    dataType:"json",
                    data:jsondata,
                    success:function(data) {
                        alert(data);
                        alert(data.item_name)
                    }
                })
            }
            //restFul
            function restFul(id) {
                $.ajax({
                   type:"get",
                   url:"${pageContext.request.contextPath}/item/"+id,
                   success:function (data) {
                       <%--window.location="${pageContext.request.contextPath}/item/"+id;--%>
                       alert(data.item_name)
                   }
                });
            }

		</script>
    </body>
</html>