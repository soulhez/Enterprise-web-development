

<%@ page import = "java.io.*" %>
<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.servlet.*"%>

<% 
      	MongoClient mongo;
		mongo = new MongoClient("localhost", 27017);
		try{
			
				
			
			String searchParameter = "" + request.getParameter("userid");
			String checkoutURL = response.encodeURL("DeleteProduct1.jsp");
			
			
			DB db = mongo.getDB("spate141_A1");
			
			DBCollection myReviews = db.getCollection("checkout");
			
			
			BasicDBObject searchQuery = new BasicDBObject();
			
			

			DBCursor cursor = myReviews.find();
			
			response.setContentType("text/html");		
			

%>


		<html>
		<head>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
		<title>GameSpeed - spate141</title>
		<link rel='stylesheet' href='styles.css' type='text/css' />
		</head>
		
		<body>
		<div id='container'>
		  <header>
		    <h1><a href='/'>Game<span>Speed</span></a></h1>
		    <h5><strong>ASSIGNMENT&nbsp;&nbsp;1&nbsp;&nbsp;:&nbsp;</strong>Spate141</h5>
		  </header>
		  <nav>
		    <ul>
		      <li class='start selected'><a href='index.jsp'>Home</a></li>
		      <li class=''><a href='games.jsp'>Games</a></li>
		      <li class=''><a href='console.jsp'>Console</a></li>
		      <li class=''><a href='ass.jsp'>Accessories</a></li>
		      <li class='end'><a href='about.jsp'>About us</a></li>
		      <li id='cart'><a href='Logout.jsp'>Logout</a></li>
			  <li id='cart'><a href='OrderPage.jsp'><img src='images/cart.png' alt='Mountain View' style='width:25px;height:20px;'></a></li>
		    </ul>
		    <ul>
		      <li></li>
		    </ul>
		  </nav>
		  <div id='image_slider'> <img src='images/logo_homepage.jpg' alt='Mountain View' style='width:100%;height:280px;'> </div>
		  <div id='body'>
		    <section id='content'>
		      <p>&nbsp;</p>
		
		
		      
		      <div id='login_form'>
		            <h3 align='center'>Welcome to the Salseman Portal!</h3>
		            <h5 align='center'><u>Add New User or Update customers orders!</u></h5>
		      <p>&nbsp;</p>
		        <form action='AddNewCust.jsp' method='post'>
		          <table id='mytable'>
		          <caption><strong>Create Customers account</strong><br>
		          <br>
		          </caption>
		            <tr>
		              <td class='left'><label for='userid'>User ID:</label></td>
		              <td class='right'><input name='userID' id='userID' value='' type='text'></td>
		            </tr>
		            <tr>
		              <td class='left'><label for='email'>Email:</label></td>
		              <td class='right'><input name='email' id='email' value='' type='email'></td>
		            </tr>
		            <tr>
		              <td class='left'><label for='password'>Password:</label></td>
		              <td class='right'><input name='password' id='password' value='' type='password'></td>
		            </tr>
		            
		            <tr>
		              <td colspan='2'><p></p></td>
		            </tr>
		            <tr>
		              
		              <td colspan='2' class='right_btn'><input name='submit' class='formbutton' value='Register' type='submit'></td>
		            </tr>
		          </table>
		        </form>
		      </div>
		      
		      <div id='login_form'>
				
		        <table id='mytable'>
		          <tr>
		            <td><center>
		                <h3>ALL ORDERS DETAILS</h3>
		              </center></td>
		          </tr>
		        </table>
				
	<%
	if(cursor.count() == 0){
	}else{
			
			String ctotal = "";
			String cname = "";
			String ccity = "";
			String ctype = "";				
			String orderNum = "";	
			String deliveryDate = "";				
			
			
			
			while (cursor.hasNext()) {
				//out.println(cursor.next());
				BasicDBObject obj = (BasicDBObject) cursor.next();
				
				ctotal = obj.getString("ctotal");
				cname = obj.getString("cname");
				ccity = obj.getString("ccity");
				ctype = obj.getString("ctype");
				orderNum = obj.getString("orderNum");				
				deliveryDate = obj.getString("deliveryDate");
				
	%>
				        <table cellspacing='4' style='font-size:14px'>
				          <tbody>
				
				            <tr>
				              <th width='15%'>User </th>
				              <th width='65%'><%=cname%></td>
				              <th width='20%'>  <form class = '' method = 'get' action = '<%=checkoutURL%>'><input type='hidden' name='orderNum' value=<%=orderNum%>><small><input type='submit' class='formbutton' value='Cancle Order'></small></form>  </td>
				            </tr>
				            <tr>
				              <td>Order No:: </th>
				              <td><%=orderNum%></td>
				            </tr>
				            <tr>
				              <td>Total Cost: </th>
				              <td>$<%=ctotal%></td>
				            </tr>
				            <tr>
				              <td>City: </th>
				              <td><%=ccity%></td>
				            </tr>				
				            <tr>
				              <td>Delivery Date: </th>
				              <td><%=deliveryDate%></td>
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
		
		<%}
		} catch (MongoException e) {
				e.printStackTrace();
		}%>