<%@ page import = "java.io.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.servlet.*"%>



<%
		
			
			
			String orderNum = request.getParameter("pid");
			
			MongoClient mongo = new MongoClient("localhost", 27017);
			
			DB db = mongo.getDB("spate141_A1");
			
			DBCollection CustmrDetails = db.getCollection("NewProducts");
			
			BasicDBObject doc = new BasicDBObject();
			doc.put("pid", orderNum);
			CustmrDetails.remove(doc);
		
			response.sendRedirect("product_deleted.jsp");

%>
