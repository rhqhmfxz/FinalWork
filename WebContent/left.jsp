<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<!-- 设计完毕,勿动!!! -->
	<head>
		<style type="text/css">
			/* ------- wrapper ------- */
		#wrapper {
			width: 740px;
			margin: 30px auto;
		}

			/* ------- nav ------- */
		#nav {
			float:left;
			width:250px;
		}

		#nav li {
			list-style: none;
		}

		div.main {
			height: 60px;
			line-height: 60px;
			text-indent:25px;
			background-color:#3FC6F3;
			border-right:10px solid #0D9BE5;
			cursor:pointer;
		}

		ul.subs li a {
			display:block;
			height: 40px;
			line-height: 40px;
			text-indent:25px;
			text-decoration:none;
			background-color:#F5F5F5;
			border-right:10px solid #0D9BE5;
			font-size:15px;
			color: #164158;
		}

		/* ------- color selection ------- */
		/* main menu*/
		li.color-blue div.main {
			background-color:#3FC6F3;
			border-right:10px solid #0D9BE5;
		}

		li.color-red div.main {
			background-color:#FF625F;
			border-right:10px solid #FD2621;
		}

		li.color-yellow div.main {
			background-color:#FEBD01;
			border-right:10px solid #FF8D00;
		}

		li.color-green div.main {
			background-color:#46D7C6;
			border-right:10px solid #15B59B;
		}

		/* sub menu*/
		li.color-blue ul.subs li a {
			border-right:10px solid #0D9BE5;
			color: #0D9BE5;
		}

		li.color-red ul.subs li a {
			border-right:10px solid #FD2621;
			color: #FD2621;
		}

		li.color-yellow ul.subs li a {
			border-right:10px solid #FF8D00;
			color: #FF8D00;
		}

		li.color-green ul.subs li a {
			border-right:10px solid #15B59B;
			color: #15B59B;
		}


		li.color-blue ul.subs li a:hover {
			background-color: #3FC6F3;
			color: #FFF;
		}

		li.color-red ul.subs li a:hover {
			background-color: #FF625F;
			color: #FFF;
		}

		li.color-yellow ul.subs li a:hover {
			background-color: #FEBD01;
			color: #FFF;
		}

		li.color-green ul.subs li a:hover {
			background-color: #46D7C6;
			color: #FFF;
		}

		/* ------- sub menu open ------- */
		li.color-blue div.open {
			background:url("images/arrow.png") no-repeat #0D9BE5 28px bottom;
		}

		li.color-red div.open {
			background:url("images/arrow.png") no-repeat #FD2621 28px bottom;
		}

		li.color-yellow div.open {
			background:url("images/arrow.png") no-repeat #FF8D00 28px bottom;
		}

		li.color-green div.open {
			background:url("images/arrow.png") no-repeat #15B59B 28px bottom;
		}

		/* ------- mouseover ------- */
		li.color-blue div.rollover {
			background-color: #0D9BE5;
		}

		li.color-red div.rollover {
			background-color: #FD2621;
		}

		li.color-yellow div.rollover {
			background-color: #FF8D00;
		}

		li.color-green div.rollover {
			background-color: #15B59B;
		}
		</style>
		<script type="text/javascript" src="./JS/jquery-1.10.2.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("ul.subs").hide();
				$("div.main").click(function(){
					$("ul.subs").slideUp();
					$("div.main").removeClass("open");
					if($("+ul",this).css("display")=="none"){
						$("+ul",this).slideDown();
						$(this).addClass("open");
					}
				}).mouseover(function () {
					$(this).addClass("rollover");
				}).mouseout(function(){
					$(this).removeClass("rollover");
				});
			});
		</script>
	</head>
	<body>
		<div id="wrapper" class="clearfix">
			<div id="nav">
				<ul> 
					<li class="color-blue">
						<div class="main">课程信息查看</div>
						<ul class="subs"> 
							<li><a href="QueryById.jsp">按课程编号查看</a></li> 
							<li><a href="QueryByName.jsp">按课程名称查看</a></li> 
							<li><a href="sortByTime.jsp">按开课学期排序</a></li> 
							<li><a href="sortByScore.jsp">按课程学分排序</a></li>
							<li><a href="sortByExam.jsp">按考核方式排序</a></li>
						</ul> 
					</li> 
					<li class="color-red">
						<div class="main">课程信息管理</div>
						<ul class="subs"> 
							<li><a href="Add.jsp">课程信息增加</a></li> 
							<li><a href="Update.jsp">课程信息更新</a></li> 
							<li><a href="Delete.jsp">课程信息删除</a></li> 
						</ul> 
					</li>
					<li class="color-yellow">
						<div class="main">信息汇总</div>
						<ul class="subs"> 
							<li><a href="#">学时统计表</a></li> 
							<li><a href="#">学分统计表</a></li>  
						</ul> 
					</li>
					<li class="color-green">
						<div class="main">帐户设置</div>
						<ul class="subs"> 
							<li><a href="#">更换用户</a></li> 
							<li><a href="#">修改密码</a></li> 
						</ul> 
					</li> 
				</ul>
			</div>
		</div>
	</body>
</html>