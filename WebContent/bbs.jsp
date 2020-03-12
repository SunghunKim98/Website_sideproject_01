<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Checkout example · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/checkout/">

    <!-- Bootstrap core CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      label{
        margin-bottom: 0.1rem;
      }
      .container{
        padding : 0px;
      }
      .container-selfmade{
      	margin : 60px;
      	margin-top :60px;
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  
  
  
  <body class="bg-light">
   <%
   		String Login_check = null;
    	if(session.getAttribute("LOGIN")!=null){
    		Login_check = (String) session.getAttribute("LOGIN");  		
    	}
   %>
    <div class="container">
 <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a href="main.jsp"><img src="logo.png" alt=""></a>
      </div>
      <div class="col-4 text-center">
        <h1 class="" href="#" style="font-size: 2rem;">컴퓨터공학과</h1>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="text-muted" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
        
        
        <%
        	if(Login_check == null){
        %>
        
        <div class="btn-group" role="group">
          <button id="btnGroupDrop1" type="button" class="btn   dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            접속하기
          </button>
          <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
            <a class="dropdown-item" href="login.jsp">로그인</a>
            <a class="dropdown-item" href="join.jsp">회원가입</a>
          </div>
        </div>
        
        <%
        	} else{
        %>
        
        <div class="btn-group" role="group">
          <button id="btnGroupDrop1" type="button" class="btn   dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            회원정보
          </button>
          <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
            <a class="dropdown-item" href="#">회원정보 수정</a>
            <a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
          </div>
        </div>
               
        <div class="mt-3">
        	
        	<h1 style="font-size:0.80rem;"><%= Login_check %>님 <br>반갑습니다.</h1>
        	 
        </div>
        <%
        	}
        %>
        
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <div class="px-4 mx-5">
      <nav class="nav d-flex justify-content-between">
        <a class="p-2 text-muted" href="#">나도몰라</a>
        <a class="p-2 text-muted" href="#">U.S</a>
        <a class="p-2 text-muted" href="#">게시판</a>
        <a class="p-2 text-muted" href="#">Design</a>
        <a class="p-2 text-muted" href="#">Culture</a>
      </nav>
    </div>
  </div>
  
  <div class="container-selfmade">
  	<div class="row">
  		<table class="table" style="text-align: center; border: 1px solid #dddddd">
  			<thead>
  				<tr>
  					<th style=" text-align:center;">번호</th>
  					<th style="  text-align:center;">제목</th>
  					<th style="  text-align:center;">작성자</th>
  					<th style="  text-align:center;">작성일</th>
  				</tr>
  			</thead>
  			<tbody>
  				<tr>
  					<td>1</td>
  					<td>new</td>
  					<td>june</td>
  					<td>2020-03-11</td>
  				</tr>
  				<tr>
  					<td>2</td>
  					<td>sec</td>
  					<td>june</td>
  					<td>2020-03-11</td>
  				</tr>
  			</tbody>
  		</table>
  		 <div class="align-self-end ml-auto">
   			 <a href="write.jsp" class="btn btn-primary">글쓰기</a>
   		</div>
  	</div>
  </div>
  

</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
<script src="form-validation.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>
