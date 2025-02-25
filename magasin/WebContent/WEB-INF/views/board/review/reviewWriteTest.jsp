<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% String prdName = (String)request.getAttribute("prdName");
		String prdSnImg = (String)request.getAttribute("prdSnImg");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>***reviewView***</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script> 
<link rel="stylesheet" href="/css/board_css/review.css">
<link rel="stylesheet" href="/css/common_css/layout.css">
</head>
<body id="body1">
	<div class="wrapper">
		<header>
			<div class="header">
				<%@include file="/WEB-INF/views/common/header.jsp"%>
			</div>
		</header>
		<section>
			<div class="mainContainer">
				<div class="side-nav">
					<%@include file="/WEB-INF/views/common/nav.html"%>
				</div>
				<div class="mainContent" style="width: 943px;">
				<!-- 만드신 콘텐츠 넣으세요!!!!!!!!!!!!!!!!width 반드시 943!!!!!!!!!!!!!!!!!!!!!!!!!! -->
				<div class="reviewContainer">

		<ul id="review">
			<li>review</li>
		</ul>
		<form action="/reviewInsert" method="post" enctype="multipart/form-data" id="frm">

			<div class="table-wrapper">
				<table class="table review-write-table">
					<thead>
						<tr>
							<th>subject</th>
							<td><input type="text" name="reviewTitle" class="inputText" id="title"></td>
						</tr>
						<tr>
							<th>Writer</th>
							<td><%=m.getName() %><input type="hidden" value="<%=m.getName()%>" name="reviewWriter"></td>
						</tr>
						<tr>
							<th>별점</th>
							<td>
							<%for(int i=0; i<5;i++){%>
								<img src="/img/board_img/star1.png" width="20" onclick="changeStar(this);" class="stars">
							<%} %>
							<input type="hidden" name="reviewPoint" id="pointCount">
							</td>
							<script>
								var count = 0;
								function changeStar(obj){
									var index= $(".stars").index(obj);
									if($(".stars").eq(index).attr("src")=="/img/board_img/star1.png"){
										$(".stars").eq(index).attr("src","/img/board_img/yellowstar1.png");	
										count++;
										console.log(count);
									}else if($(".stars").eq(index).attr("src")=="/img/board_img/yellowstar1.png"){
										$(".stars").eq(index).attr("src","/img/board_img/star1.png");
										count--;
										console.log(count);
									}
								$("#pointCount").attr("value",count);
								}
							</script>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							<th>
									<div class="pdt-div">

										<img src="/upload/photo/<%=prdSnImg %>" width="150"><br>
										<p id="prdName" style="width:100%;text-align:center;"><%=prdName %></p>
										<input type="hidden" name="prdSnImg" value="<%=prdSnImg %>">
										<input type="hidden" name="prdName" value="<%=prdName %>">
								</div>
								
							</th>
							<td>

								<div class="review-content-div" style="width:100%;">
									
									<textarea id="ir1" name="reviewContent" cols="90" rows="10"></textarea>
										<script type="text/javascript">
											$(document).ready(function(){
											var oEditors = [];
											nhn.husky.EZCreator.createInIFrame({
											 oAppRef: oEditors,
											 elPlaceHolder: "ir1",
											 sSkinURI: "/se2/SmartEditor2Skin.html",
											 fCreator: "createSEditor2"
											});

											$("#insertBtn").click(function(){
												 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
												  if($("#title").val()==""){
														alert("제목을 입력하세요");
														return false;
													}else if($("#ir1").val()=="<p><br></p>"){
														alert("내용을 입력하세요");
														return false;
													}else if(count ==0){
														alert("별점을 입력하세요");
														return false;
													} 
												 // 에디터의 내용에 대한 값 검증은 이곳에서
												 // document.getElementById("ir1").value를 이용해서 처리한다.
												 try {
												     $("#frm").submit();
												     
												 } catch(e) {}
											});											
											

										});
											 </script>
								
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p style="text-align:left;">Photo Upload <span style="font-size:7px;color:navy;">*두장까지 가능해요*</span></p>
								<input type="file" name="filename1">
								<input type="file" name="filename2">
							</td>
						</tr>
						</tbody>
				</table>
			</div>
			<div class="review-btn">
				<br>

					<a href="/reviewList"
						class="btn btn-default btn-md">List</a> 
						<button type="button"
						class="btn btn-default btn-md insertBtn" id="insertBtn">등록</button>
				
				</div>

			</form>
		</div>	
				</div>
			</div>
		</section>
		<footer>
			<div class="footer">
				<%@include file="/WEB-INF/views/common/footer.jsp"%>
			</div>
		</footer>
	</div>
</body>
</html>