<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>

		<meta charset="utf-8">
		<title>项目详情</title>
		<%--爱心关注--%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style29.css"/>
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
		<!--  设置网页的小图标logo  favicon.ico-->
		<link href="${pageContext.request.contextPath}/picture/heard.png" rel="shortcut icon" />
	</head>
	<body>
	<%@ include file="connect/heard.jsp"%>

		<!-- 大标题 -->	
		<div class="container" style="margin-top: 40px;padding: 0px;">
			<div class="row">
				<!-- 文字 -->
				<div class="col-md-2" style="font-size: 40px;">项目详情</div>
				<!-- 图片 -->
				<img src="${pageContext.request.contextPath}/picture/title2.jpg" style="margin-top: 30px;padding: 0px;"/>
			</div>
			<div style="border: #000000 solid 1px;"></div>
		</div>	
		
		<!-- 简单介绍 -->
		<div class="container"  style="margin-top: 40px;padding: 0px;">
			<div class="row" style="border: lightgray 1px solid;height: 100px;background-color: whitesmoke;" >
				<form class="navbar-form">
					<p style="font-size: 24px;"> ${item.name} </p>
					<p>可爱的造型，摄像安防远程互联的全能设计，让你随时随地守护您的家人，陪伴你的生活。</p>
				</form>

				<%--<div class="heart" id="like1" rel="${flag}" name="heart" value="heart" style="margin-top: -60px;margin-left: 1200px;">
					<div class="likeCount" id="likeCount1" >${item.follower} </div>
				</div>--%>

				<div id="likes">
					<%@ include file="heart.jsp"%>
				</div>

			</div>	
		</div>
		
		<!-- 图片加介绍 -->
		<div class="container" style="margin-top: 40px;padding: 0px;">
			<div class="row" style="margin-top: -30px;padding: 0px;margin-left: -50px;">
				<!-- 图片 -->
				<div class="col-md-8 col-sm-12 col-xs-12" align="center" >
					<img src="${pageContext.request.contextPath}/${item.pimgs}" >
				</div>
				<!-- 介绍 -->
				<div class="col-md-4 col-sm-12 col-xs-12"  style="border: lightgray 1px solid;height: 435px;">
					<div style="font-style: italic;background-color: green;width: 55px;border-radius: 4px;margin-top: 10px;">
						<c:if test="${item.status==0}">
							<span style="color: white;">众筹中</span>
						</c:if>
						<c:if test="${item.status==1}">
							<span style="color: white;">众筹成功</span>
						</c:if>
						<c:if test="${item.status==2}">
							<span style="color: white;">众筹失败</span>
						</c:if>
					</div>
					
					<table border="10px"  bordercolor="white" style="margin-top: 35px;">
						
						<tr>
							<td colspan="2" ><span style="font-size: 24px;">已筹资金：￥<span> ${item.supportmoney} </span></span></td>
						</tr>
						<tr>
							<td width="280px">目标金额：<span> ${item.money} </span></td><td>达成：<span> ${item.completion} %</span></td>
						</tr>
						<tr>
							<td colspan="2">进度条</td>
						</tr>
						<tr>
							<td>剩余<span> ${item.day} </span>天</td>
						</tr>
						<tr>
							<td>已有<span> ${item.supporter} </span>人支持该项目</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button type="button" style="width: 330px;height: 50px;border: white; border-radius: 4px;background-color: rgb(240,173,78);font-size: 24px;">
									<span style="color: white;"><a href="${path}/jsp/support.jsp">立即支持</a>></span>
								</button>
							</td>
						</tr>
					</table>
					
					<div style="border: lightgray solid 1px;margin-top: 20px;width: 400px;margin-left: -10px;"></div>
					
					<table style="margin-top: 20px;" border="10px"  bordercolor="white">
						<tr>
							<td rowspan="3"><img src="../picture/object1.1.png" ></td>
							<td><span style="font-size: 24px;font-weight: 800;">福建省南安厨卫</span></td>
							<td>
								<div style="font-style: italic;background-color: green;width: 50px;border-radius: 4px;"><span style="color: white;">已认证</span></div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span style="width: 20px;">
									酷驰是一家年轻的厨卫科技公司，我们有一支朝气蓬勃，有激情、有想法、敢实践的团队。
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">客服电话：0595-86218855</td>
						</tr>
						
					</table>
				
				
				</div>
				
				
				
			</div>
		</div>	
			
				
	<%@ include file="connect/foot.jsp"%>
	</body>

	<!-- 先引入jQuery核心js文件 -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
	<!-- 引入BootStrap核心js文件 -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<%--	爱心关注--%>
<%--	<script src="${pageContext.request.contextPath}/js/heart.js"></script>--%>

    <script>
        $(document).ready(function()
        {

            $('body').on("click",'.heart',function()
            {

                var A=$(this).attr("id");
                var B=A.split("like");
                var messageID=B[1];
                var C=parseInt($("#likeCount"+messageID).html());
                $(this).css("background-position","")
                var D=$(this).attr("rel");

                if(D === 'like')
                {
                    $("#likeCount"+messageID).html(C+1);
                    $(this).addClass("heartAnimation").attr("rel","unlike");

                }
                else
                {
                    $("#likeCount"+messageID).html(C-1);
                    $(this).removeClass("heartAnimation").attr("rel","like");
                    $(this).css("background-position","left");
                }


            });


        });
    </script>

    <%--<script>

		/*window.onload=show;

		function show() {
			$.ajax({
				url:"${path}/great?method=findGreatByAidAndUid",
				data:{"aid":${item.id}},
				success:function () {
					if (${flag}){
						$("#likeCount"+messageID).html(${item.follower}+1);
						$(this).addClass("heartAnimation").attr("rel","unlike");
					}
				}
			})
		};*/


		/*function show2() {
			$.ajax({
				url:"${path}/great?method=findGreatByAidAndUid",
				data:{"aid":${item.id}},
				success:function (data) {
					$("#like").html(data);
					console.log(${flag});
				}
			})
		};*/


		/*$(document).ready(function() {
			$('body').on("click",'.heart',function()
			{
				var A=$(this).attr("id");
				var B=A.split("like");
				var messageID=B[1];
				var C=parseInt($("#likeCount"+messageID).html());//关注者数量

				$(this).css("background-position","");

				var D=$(this).attr("rel");

				//if(D === 'like')
				if (D ==  )
				{
					$("#likeCount"+messageID).html(C+1);
					$(this).addClass("heartAnimation").attr("rel","unlike");
				}
				else
				{
					$("#likeCount"+messageID).html(C-1);
					$(this).removeClass("heartAnimation").attr("rel","like");
					$(this).css("background-position","left");
				}
			});
		});*/


	</script>--%>

</html>