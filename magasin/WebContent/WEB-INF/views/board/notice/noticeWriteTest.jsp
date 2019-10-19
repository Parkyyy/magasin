<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ckEditor links -->
<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
<link rel="stylesheet" href="/css/board_css/notice.css">
<!-- BootStrab links -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>	
</head>
<body>
	<section>
			<div class="noticeContainer">
			
				<ul id="notice">
					<li>Notice</li>
				</ul>
				<form action="/noticeInsert" method="get">
				
				<div class="table-wrapper">
					<table class="table write-table">
						<thead>
							<tr>
								<th>subject</th>
								<td><input type="text" name="noticeTitle" class="inputText"></td>
							</tr>
							<tr>
								<th>Writer</th>
								<td><img src="/common_img/footerlogo2.png" height="27">
								<input type="hidden" name="noticeWriter" class="inputText"
								value="admin">
								</td>
							</tr>
							
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
									<textarea id="editor" name="noticeContent" cols="100" rows="10"></textarea>
								</td>
							</tr>
					</table>
				</div>
				<div class="notice-btn">
					<br>
					<a href="/views/test_board/noticeListTest.jsp" class="btn btn-md" >List</a>
					<a href="#" class="btn btn-md" >등록</a>
					
					
				</div>
				</form>
			</div>
	</section>
</body>
</html>