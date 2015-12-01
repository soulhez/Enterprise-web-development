<%@ page import = "java.io.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.servlet.*"%>



<%
		Map users = new HashMap();
		users.put("john", "12345");
		users.put("gamespeed", "12345");
		
		String userid = request.getParameter("sname");
        String password = request.getParameter("spassword");
		
        if(userid != null && userid.length() != 0) {
            userid = userid.trim();
        }
        if(password != null && password.length() != 0) {
            password = password.trim();
        }
        if(userid != null &&
            password != null) {
                String realpassword = (String)users.get(userid);
                if(realpassword != null && realpassword.equals(password)) {
					response.sendRedirect("SalsemanLogin.jsp");
                    //showPage(response, "Login Success!");
                } 
				
				else {
                    //showPage(response, "Login Failure! Username or password is incorrect");
					response.sendRedirect("salseman_notin.jsp");
                }
        }  else {
            //showPage(response, "Login Failure!  You must supply a username and password");
			response.sendRedirect("salseman_notin.jsp");
        }
	    


%>
