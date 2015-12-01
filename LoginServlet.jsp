<%@ page import = "java.io.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.servlet.*"%>



<%
		try {
			String userid =  request.getParameter("userid");
			
			String password =  request.getParameter("password");		
			
			PrintWriter output = response.getWriter();
			
			MongoClient mongo = new MongoClient("localhost", 27017);
	
			DB db = mongo.getDB("spate141_A1");
			
			DBCollection CustmrDetails = db.getCollection("CustmrDetails");
			

			BasicDBObject searchQuery = new BasicDBObject("userID", userid);
			
			DBCursor cursor = CustmrDetails.find(searchQuery);
			
			if (cursor.hasNext()) {
				String uname = (String) cursor.one().get("userID");
				String password1 = (String) cursor.one().get("password");
				


				if (userid.equals(uname) && password.equals(password1)) {
				
					
					session.setAttribute("userId", uname);
					response.sendRedirect("customer_in.jsp");
				}

				else

				{
					response.sendRedirect("customer_notin.jsp");

				}
			}else {
				
				response.sendRedirect("customer_notin.jsp");
			}
		}catch (MongoException e) {
			e.printStackTrace();

		}	
	    


%>
