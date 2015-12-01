<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>GameSpeed - spate141</title>
<link rel="stylesheet" href="styles.css" type="text/css">
<style type="text/css"></style></head>

<body>

<%@ page import = "java.io.*" %>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>

<% 	
		Map users = new HashMap();
		
		users.put("john", "12345");
		
      	MongoClient mongo;
		mongo = new MongoClient("localhost", 27017);
		
		
			String searchParameter = "" + request.getParameter("userid");
			
			String checkoutURL = response.encodeURL("DeleteProduct.jsp");
			
			DB db = mongo.getDB("spate141_A1");
			
			DBCollection myReviews = db.getCollection("NewProducts");
			
			BasicDBObject searchQuery = new BasicDBObject();

			DBCursor cursor = myReviews.find();
			
			response.setContentType("text/html");		
      

%>


<div id="container">
  <header>
    <h1><a href="/">Game<span>Speed</span></a></h1>
    <h5><strong>ASSIGNMENT&nbsp;&nbsp;1&nbsp;&nbsp;:&nbsp;</strong>Spate141</h5>
  </header>
  <nav>
    <ul>
      <li class="start selected"><a href="index.jsp">Home</a></li>
      <li class=""><a href="games.jsp">Games</a></li>
      <li class=""><a href="console.jsp">Consoles</a></li>
      <li class=""><a href="ass.jsp">Accessories</a></li>
      <li class="end"><a href="about.jsp">About us</a></li>
      <li id="cart"><a href="Logout.jsp">Logout</a></li>
      <li id="cart"><a href="OrderPage.jsp"><img src="images/cart.png" alt="Mountain View" style="width:25px;height:20px;"></a></li>
    </ul>
    <ul>
      <li></li>
    </ul>
  </nav>
  <div id="image_slider"> <img src="images/logo_homepage.jpg" alt="Mountain View" style="width:100%;height:280px;"> </div>
  <div id="body">
    <section id="content">
    <article>
	
	<table id='mytable'>
		<tr>
			<td><center>
			<h3>Product Details</h3>
			</center></td>
		</tr>
		</table>
      <%if(cursor.count() == 0){%>
	  <center><h2>"There are no reviews for this product."</h2><center>
	  <%}else
	  {
			String pid = "";
			String pname = "";
			String pprice = "";
			String pdsc = "";	
			while (cursor.hasNext()) {
				//out.println(cursor.next());
				BasicDBObject obj = (BasicDBObject) cursor.next();
				
				pid = obj.getString("pid");
				pname = obj.getString("pname");
				pprice = obj.getString("pprice");
				pdsc = obj.getString("pdsc");
		%>		
				
				        <table cellspacing='4' style='font-size:14px'>
				          <tbody>
				
				            <tr>
				              <th width='15%'>ID </th>
				              <th width='65%'><%=pid%></td>
				              <th width='20%'>
							  
							  <form class = '' method = 'get' action = '<%=checkoutURL%>'>
							  <input type='hidden' name='pid' value=<%=pid%>>
							  <small>
							  <input type='submit' class='formbutton' value='Delete Product'>
							  </small>
							  </form>  
							  
							  </td>
				            </tr>
				            <tr>
				              <td>Name: </th>
				              <td><%=pname%></td>
				            </tr>
				            <tr>
				              <td>Price: </th>
				              <td>$<%=pprice%></td>
				            </tr>
				            <tr>
				              <td>Description: </th>
				              <td><%=pdsc%></td>
				            </tr>		
				
				          </tbody>
				        </table>
				
	  	
			<%}%>	  

		      </div>
		      
		      
		      
		      
		    </section>
		    <aside class='sidebar'>
		      <ul>
		        <li>
		          <h4>Portal</h4>
		          <ul>
		            <li><a href='customer_portal.jsp'>Customer Portal</a></li>
		            <li><a href='storemanager_portal.jsp'>Storemanager Portal</a></li>
		            <li><a href='salseman_portal.jsp'>Salseman Portal</a></li>
		          </ul>
		        </li>
		        <li>
		          <h4>Game Consoles</h4>
		          <ul>
		            <li><a href='ms.jsp'>Microsoft</a></li>
		            <li><a href='sony.jsp'>Sony</a></li>
		            <li><a href='nin.jsp'>Nintendo</a></li>
		          </ul>
		        </li>
		        <li>
		          <h4>Games Vendor</h4>
		          <ul>
		            <li><a href='ActivisionPage.jsp'>Activision</a></li>
		            <li><a href='EaPage.jsp'>Electronic Arts</a></li>
		            <li><a href='TaketwoPage.jsp'>Take Two</a></li>
		          </ul>
		        </li>
		        <li>
		          <h4>About us</h4>
		          <ul>
		            <li class='text'>
		              <p style='margin: 0;'>This is a sample website created to demonstrate a standard enterprise web page for the CSP595 class.</p>
		            </li>
		          </ul>
		        </li>
		      </ul>
		    </aside>
		     
		    <div class='clear'>
		      <p>&nbsp;</p>
		    </div>
		  </div>
		  <footer>
		    
		    <div class='footer-bottom'>
		      <p>CSP 595 - Snehal Patel - Email: spate141@hawk.iit.edu</p>
		    </div>
		  </footer>
		</div>
		</body>
		</html>
<%}%>	