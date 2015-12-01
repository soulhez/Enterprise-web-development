<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>GameSpeed - spate141</title>
<link rel="stylesheet" href="styles.css" type="text/css">
<style type="text/css"></style></head>

<body>


<%@ page import = "com.mongodb.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*"%>

<% 
      	
		MongoClient mongo;
		
		mongo = new MongoClient("localhost", 27017);
		
		String username = (String)session.getAttribute("userId");
		
		if(request.getParameter("cname").isEmpty() || 
		("" + request.getParameter("cphone")).isEmpty() ||
		request.getParameter("ccity").isEmpty() ||
		request.getParameter("cstate").isEmpty() ||  
		("" + request.getParameter("czip")).isEmpty() ||
		("" + request.getParameter("ccnum")).isEmpty() || 
		("" + request.getParameter("year")).isEmpty() ||	
		("" + request.getParameter("ccsc")).isEmpty())
		{
			response.sendRedirect("Checkout_error");
		}
		else{
		
		
		
		try{
			String ctotal = "" + request.getParameter("ctotal");
			String itemID = "" + request.getParameter("itemID");
			String numItems = "" + request.getParameter("numItems");
			String cItemName = "" + request.getParameter("cItemName");			
			
			String cid = username;
			String cname = "" + request.getParameter("cname");
			String cphone = "" + request.getParameter("cphone");
			String ccity = "" + request.getParameter("ccity");
			String cstate = "" + request.getParameter("cstate");
			String czip = "" + request.getParameter("czip");
			int ccnum = Integer.parseInt(request.getParameter("ccnum"));
			String ctype = "" + request.getParameter("ctype");
			String month = "" + request.getParameter("month");
			int year = Integer.parseInt(request.getParameter("year"));
			int ccsc = Integer.parseInt(request.getParameter("ccsc"));		
			
			
			String orderNum = UUID.randomUUID().toString().replaceAll("-", "");
			
			Calendar now = Calendar.getInstance();
			String today = ((now.get(Calendar.MONTH) + 1)
                        + "/"
                        + now.get(Calendar.DATE)
                        + "/"
                        + now.get(Calendar.YEAR));
						
			now.add(Calendar.WEEK_OF_YEAR,2);
   
			String today2 = ((now.get(Calendar.MONTH) + 1)
                        + "/"
                        + now.get(Calendar.DATE)
                        + "/"
                        + now.get(Calendar.YEAR));
						
			int x = 9;
			Calendar cal = Calendar.getInstance();
			cal.add( Calendar.DAY_OF_YEAR, x);
			SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
			String formatted_fiveDaysAgo = format1.format(cal.getTime());
			
			Date fiveDaysAgo = cal.getTime();
			
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("spate141_A1");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection myReviews = db.getCollection("checkout");
			//System.out.println("Collection myReviews selected successfully");
				
			BasicDBObject doc = new BasicDBObject("title", "myReviews").
				append("cid", cid).
				append("username", username).
				append("ctotal", ctotal).
				append("itemID", itemID).
				append("numItems", numItems).
				append("cItemName", cItemName).				
				append("cname", cname).
				append("cphone", cphone).
				append("ccity", ccity).
				append("cstate", cstate).
				append("czip", czip).
				append("ccnum", ccnum).	
				append("ctype", ctype).				
				append("month", month).
				append("year", year).				
				append("ccsc", ccsc).
				append("orderNum", orderNum).
				append("fiveDaysAgo", formatted_fiveDaysAgo).
				append("orderDate", today).
				append("deliveryDate", today2);
				
				
				
			
			myReviews.insert(doc);
			session.removeAttribute("shoppingCart");

%>


			<div id='container'>
			  <header>
			    <h1><a href='/'>Game<span>Speed</span></a></h1>
			    <h5><strong>ASSIGNMENT   1</strong></h5>
			  </header>
			  <nav>
			    <ul>
			      <li class='start selected'><a href='index.jsp'>Home</a></li>	
			      <li class=''><a href='games.jsp'>Games</a></li>
			      <li class=''><a href='console.jsp'>Consoles</a></li>
			      <li class=''><a href='ass.jsp'>Accessories</a></li>	
			      <li class='end'><a href='about.jsp'>About us</a></li>
			      
			      <li id='cart'><a href='Logout.jsp'>Logout</a></li>
			      <li id='cart'><a href='OrderPage.jsp'><img src='images/cart.png' alt='Mountain View' style='width:25px;height:20px;'></a></li>
			    </ul>
			  </nav>
			  <div id='image_slider'> <img src='images/logo_homepage.jpg' alt='Mountain View' style='width:100%;height:280px;'> </div>
			  <div id='body'>
			    <section id='content'>
			      
				  
				        <article>
			        <div id='login'></div>
			        <div id='login_form'>
			          
			            <table id='mytable'>
			            <tr>
			            
			              <td><p align='center'><img src='images/placed.png' alt='Mountain View' style='width:663px%;height:180px;'></center></p></td>
			            </tr>
			            <tr>
			              <td><p><center>
			                <h4>Confirmation Number: <b><%=orderNum%></b></h4>
			             </center></p></td>
			            </tr>
			            <tr>
			              <td><center>
			                <h5>You're order will be delivered by: <b><%=today2%></b></h5>
			             </center></td>
			            </tr>
			            <tr>
			              <td><center>
			                <h5>* * * <u>You can cancle the order before <b><%=fiveDaysAgo%></b></u> * * *</h5>
			             </center></td>
			            </tr>
			            
			          </table>
			          
			        </div>
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

<%
} catch (MongoException e) {
			e.printStackTrace();
			
		}
	}

%>