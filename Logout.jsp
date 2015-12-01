<%@ page import = "java.io.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.servlet.*"%>



<%
		
			
			
			String username = (String)session.getAttribute("userId");
			if(username != null ) {                
                
			
			/* session.removeAttribute("shoppingCart");
			session.removeAttribute("username");
			session.removeAttribute("userId");
			session.removeAttribute("userID"); */
			session.invalidate();
			response.sendRedirect("index.jsp");			
				
				
			}  else {
				//showPage(response, "Login Failure!  You must supply a username and password");
				response.sendRedirect("index.jsp");
			}

%>
