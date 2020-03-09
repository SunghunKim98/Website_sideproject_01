<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" /> 
<jsp:setProperty name="user" property="userPassword" /> 
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" /> 
<jsp:setProperty name="user" property="userEmail" />
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Signin Template · Bootstrap</title>
  </head>
  <body>
	<%
	if((String)session.getAttribute("userID")!=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp '");
		script.println("</script>");
	
		
		if(user.getUserID()== null || user.getUserPassword()==null||user.getUserName()==null||user.getUserEmail()==null||user.getUserGender()==null)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
  
	    else{
	    	
	    	UserDAO userDAO = new UserDAO();
		    int result = userDAO.join(user); //result라는 것은 5번의 입력중 입력 완료된 횟수
		    
		    // result가 -1이라는 것은 데이터베이스 상의 오류를 의미한다
		    // result가 -1이면 try catch문을 통해 걸러진다.
		    
	    	if(result == -1){
	    		PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디가 있습니다')");
				script.println("history.back()");
				script.println("</script>");
	        }
	    	else{
				session.setAttribute("userID",user.getUserID());

		    	PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
		    }    	
	    }
	
	%>

</body>


</html>
