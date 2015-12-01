<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>GameSpeed - spate141</title>
<link rel="stylesheet" href="styles.css" type="text/css">
<style type="text/css"></style></head>

<body>

<%@ page import = "java.io.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>

<% 
      	MongoClient mongo;
		mongo = new MongoClient("localhost", 27017);
		//Get the values from the form
		
		String searchField = "productName";
		String searchParameter = "" + request.getParameter("productName");
		
		
		// if database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("spate141_A1");
		
		DBCollection myReviews = db.getCollection("productreview");
		
		// Find and display 
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put(searchField, searchParameter);

		DBCursor cursor = myReviews.find(searchQuery);

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
			<h3>Product Reviews</h3>
			</center></td>
		</tr>
		</table>
      <%if(cursor.count() == 0){%>
	  <center><h2>"There are no reviews for this product."</h2><center>
	  <%}else
	  {
			String productName = "";
			String productCat = "";
			String productPrice = "";
			String productRetailer = "";
			int retailerZip = 0;
			String retailerState = "";		
			String retailerCity = "";				
			String productOnSale = "";
			String mfgName = "";
			String mfgRebate = "";
			String useride = "";
			int userAge = 0;
			String gender = "";
			String userOcc = "";				
			int reviewRating = 0;
			String reviewDate = "";
			String reviewText = "";
				
	  %>	
			  
	  
		<table cellspacing='4' style='font-size:14px;'>
		<tbody>
	  
		
	  <%
		while (cursor.hasNext()) {
			//out.println(cursor.next());
			BasicDBObject obj = (BasicDBObject) cursor.next();
					
					productName = obj.getString("productName");
					productCat = obj.getString("productCategory");
					productPrice = obj.getString("productPrice");
					productRetailer = obj.getString("retailerName");
					retailerZip = obj.getInt("retailerZipcode");					
					retailerCity = obj.getString("retailerCity");
					retailerState = obj.getString("retailerState");
					productOnSale = obj.getString("productOnSale");
					mfgName = obj.getString("consoleManufacturer");
					mfgRebate = obj.getString("manufacturerRebate");
					useride = obj.getString("userID");
					userAge = obj.getInt("userAge");
					gender = obj.getString("userGender");
					userOcc = obj.getString("userOccupation");
					reviewRating = obj.getInt("reviewRating");
					reviewDate = obj.getString("reviewDate");
					reviewText = obj.getString("reviewText");
	  %>			
			<tr>
			<th width='15%'>Model </th>
			<th ><%=productName%></td>
			<td rowspan=17>
			<center>
			<img src='images/<%=productName%>.jpg' alt='Product Image' style='width:200px;height:200px;border-style:outset;'>
			</center>
			</td>
			</tr>
			<tr>
			<td>Category: </th>
			<td><%=productCat%></td>
			</tr>
			<tr>
			<td>Price: </th>
			<td>$<%=productPrice%></td>
			</tr>
			<tr>
			<td>Retailer: </th>
			<td><%=productRetailer%></td>
			</tr>
			<tr>
			<td>ZIP: </th>
			<td><%=retailerZip%></td>
			</tr>
			<tr>
			<td>City: </th>
			<td><%=retailerCity%></td>
			</tr>
			<tr>
			<td>State: </th>
			<td><%=retailerState%></td>
			</tr>
			<tr>
			<td>Sale ?: </th>
			<td><%=productOnSale%></td>
			</tr>
			<tr>
			<td>Manufacturer: </th>
			<td><%=mfgName%></td>
			</tr>
			<tr>
			<td>Rebate ?: </th>
			<td><%=mfgRebate%></td>
			</tr>
			<tr>
			<td>UserID: </th>
			<td><%=useride%></td>
			</tr>
			<tr>
			<td>Age: </th>
			<td><%=userAge%></td>
			</tr>
			<tr>
			<td>Gender: </th>
			<td><%=gender%></td>
			</tr>
			<tr>
			<td>Occupation: </th>
			<td><%=userOcc%></td>
			</tr>
			<tr>
			<td>Rating: </th>
			<td><%=reviewRating%></td>
			</tr>
			<tr>
			<td>Date: </th>
			<td><%=reviewDate%></td>
			</tr>
			<tr>
			<td>Comment: </th>
			<td><%=reviewText%></td>					
			</tr>
		<%}}%>
		</tbody>
		</table>
		  
		 
       </article>
    </section>
    <aside class="sidebar">
      <ul>
        <li>
          <h4>Portal</h4>
          <ul>
            <li><a href="customer_portal.jsp">Customer Portal</a></li>
            <li><a href="storemanager_portal.jsp">Storemanager Portal</a></li>
            <li><a href="salseman_portal.jsp">Salseman Portal</a></li>
          </ul>
        </li>
        <li>
          <h4>Game Consoles</h4>
          <ul>
            <li><a href="ms.jsp">Microsoft</a></li>
            <li><a href="sony.jsp">Sony</a></li>
            <li><a href="nin.jsp">Nintendo</a></li>
          </ul>
        </li>
        <li>
          <h4>Games Vendor</h4>
          <ul>
            <li><a href="ActivisionPage.jsp">Activision</a></li>
            <li><a href="EaPage.jsp">Electronic Arts</a></li>
            <li><a href="TaketwoPage.jsp">Take Two</a></li>
          </ul>
        </li>
        <li>
          <h4>About us</h4>
          <ul>
            <li class="text">
              <p style="margin: 0;">This is a sample website created to demonstrate a standard enterprise web page for the CSP595 class.</p>
            </li>
          </ul>
        </li>
      </ul>
    </aside>
    <div class="clear">
      <p>&nbsp;</p>
    </div>
  </div>
  <footer>
    <div class="footer-bottom">
      <p>CSP 595 - Snehal Patel - Email: spate141@hawk.iit.edu</p>
    </div>
  </footer>
</div>


</body></html>