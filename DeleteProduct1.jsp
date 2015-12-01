<%@ page import = "java.io.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.servlet.*"%>



<%
		
			
			
			String orderNum = request.getParameter("orderNum");
			
			MongoClient mongo = new MongoClient("localhost", 27017);
			
			DB db = mongo.getDB("spate141_A1");
			
			DBCollection CustmrDetails = db.getCollection("checkout");
			
			BasicDBObject doc = new BasicDBObject();
			doc.put("orderNum", orderNum);
			CustmrDetails.remove(doc);
		
			response.sendRedirect("product_deleted.jsp");

%>
