<%@page import="kr.magasin.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       //SerchIdervlet에서 키값 member를 받아옴
       Member m = (Member)request.getAttribute("member"); //이름,이메일 또는 이름,전화번호로 찾을 때
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/common_css/layout.css">
<link rel="stylesheet" href="/css/common_css/header.css">
<style type="text/css">
        body {
            padding: 60px;
            background-color: rgb(246,246,246);
        }
        .main{
            width: 80%;
            text-align: center;
        }
        .main_h3{
            padding: 0 0 10px;
            text-align: center;
        }
        .container{
            text-align: center;
        }
        .table_join_success{
            border: 1px solid #444;
            border-radius: 4px;
            padding: 30px 35px;
            width: 340px;
            height: 200px;
            margin: auto;
             background-color: #2321;
        }
        .table_join_success tr th,
        .table_join_success tr td{
            text-align: left;
            font-size: 14px;
        }
        button {
            font-size: 13px;
            height: 45px;
            width: 150px;
            border: 0;
            background-color: #444;
            color: white;
            border-radius: 3px;
        }
        .btn_login{
            display: inline;
        }
        .btn_main{
            display: inline;
        }
</style>
</head>
<body id="body1">
   <div class="wrapper">
      <header>
         <div class="header">
            <div class="header-left">
               <a href="/index.jsp"><img src="/img/common_img/mainlogo.png" width="170"></a>
            </div>
            <div class="header-center">
            </div>
            <div class="header-right">
               <div class="header-menu">
                  <ul class="header-menu-bar">
                     <li><a href="/views/member/join.jsp">join</a></li>
                     <li><a href="/views/member/login.jsp">log-in</a></li>
                     <li><a href="/views/myPage/myPage.jsp">mypage</a></li>
                     <li><a href="#" id="cart-img">cart<img src="/img/common_img/jang.png" width="20"></a></li>
                  </ul>
               </div>
               
               <div class="header-search">
                  <input type="text" name="headerSearch" class="searchBar">
                  <a href="#"><img src="/img/common_img/searchIcon.png" width="30" height="28" id="searchIcon"></a>
               </div>
            </div> 
         </div>
      </header>
      <section>
         <div class="mainContainer">
            <div class="side-nav">
               <%@include file="/WEB-INF/views/common/nav.html"%>
            </div>
            <div class="mainContent" style="width: 943px;">
               <div class="main">
                   <div class="main_h3"><h3>아이디 찾기 완료</h3></div>
                      <div class="container">
                        <h4><%=m.getName() %>님의 아이디 확인 결과입니다.</h4>
                        <table class="table_join_success">
                           <tr>
                              <th>아이디 : </th>
                              <td><%=m.getId() %></td>
                           </tr>
                           <tr>
                              <th>가입일 : </th>
                              <td><%=m.getEnrollDate()%></td>
                           </tr>
                        </table>
                     </div>
                     <br>
                     <div>
                        <div id="btn_join_success">
                           <div class="btn_login"><a href="/views/member/login.jsp"><button>로그인</button></a></div>
                           <div class="btn_main"><a href="/views/member/searchPw.jsp"><button>비밀번호 찾기</button></a></div>
                        </div>   
                     </div>
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