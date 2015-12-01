

<%@ page import = "java.io.*" %>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>

<% 
			MongoClient mongo;
			mongo = new MongoClient("localhost", 27017);
		//Get the values from the form
		
			String userID = request.getParameter("userID");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
		
		// if database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("spate141_A1");
		
			DBCollection CustmrDetails = db.getCollection("CustmrDetails");
			
			
			BasicDBObject doc = new BasicDBObject("title", "MongoDB").
				append("userID", userID).
				append("password", password).
				append("email", email);
				
				
			CustmrDetails.insert(doc);
			response.sendRedirect("customer_added.jsp");

%>
