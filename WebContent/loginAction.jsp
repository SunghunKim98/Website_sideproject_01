<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="user.User" scope="page" /> <!-- id="빈 이름" class="자바빈 클래스명" scope="사용 범위 -->
<jsp:setProperty name="user" property="*" /> <!-- name="빈 이름" property="속성명" value="설정할 속성 값" -->
<!--login.jsp 의 form태그안에 input에서 넘어오는 parameter의 name이 property_속성명과 같다면, property 속성에 *로 표시해도 -->

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

		if((String)session.getAttribute("LOGIN")!=null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp '");
			script.println("</script>");
		}
		
	
		UserDAO userDAO = new UserDAO(); //인스턴스생성

		int result = userDAO.login(user.getUserID(), user.getUserPassword());	

		//로그인 성공
		if(result == 1){
			session.setAttribute("LOGIN",user.getUserID()); //세션 부여; 이때 문법은 setAttribut("id","value")--> 이때 id는 내가 원하는대로 이름을 설정
		
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		//로그인 실패
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//아이디 없음
		else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
		//DB오류
		else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		}		
	%>

</body>


</html>
