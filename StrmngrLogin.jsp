<%@ page import = "java.io.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.servlet.*"%>



<%
		Map users = new HashMap();
		users.put("admin", "admin");
		
		String userid = request.getParameter("userid");
        String password = request.getParameter("password");
		
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
					response.sendRedirect("MngrIn.jsp");
                    
                } 
				
				else {
                    
					response.sendRedirect("mngr_notin.jsp");
                }
        }  else {
            
			response.sendRedirect("mngr_notin.jsp");
        }	
	    


%>
