<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> 
<jsp:setProperty name="bbs" property="*" /> 


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
	
		String Login_check = null;
		
		if((String)session.getAttribute("LOGIN")!=null){
			Login_check = (String)session.getAttribute("LOGIN");			
		}

		if(Login_check==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 이용해주세요.')");
			script.println("location.href = 'login.jsp '");
			script.println("</script>");
		}
		else{ //Login이 되어있다면;
			
			if(bbs.getBbsTitle()==null || bbs.getBbsContent() == null){ //--> 여기서의 Object 'bbs'는 DataBase가 아닌 object of javabean 
																	//So, get____는 write.jsp에서 formtag로 tranfer 된 정보들이다. 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력하지 않은 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				
				BbsDAO bbsDAO = new BbsDAO();

				int result = bbsDAO.write(bbs.getBbsTitle(), Login_check, bbs.getBbsContent());
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패하였습니다')");
					script.println("history.back()");
					script.println("</script>");
					}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				}
				
			}
		}
	%>

</body>


</html>
