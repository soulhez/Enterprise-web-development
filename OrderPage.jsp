<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cart</title>
<link rel="stylesheet" href="styles.css" type="text/css">
<style type="text/css"></style></head>

<body>
<%@ page session = "true"%>

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*"%>
<%@ page import = "java.text.*"%>
<%@ page import = "MyBean.*"%>

<%

		String username = (String)session.getAttribute("userId");
		session.setAttribute("userId", username);
      	HttpSession session1 = request.getSession();
		ShoppingCart cart;
		CatalogItem a;
		
		synchronized(session1) {
		  cart = (ShoppingCart)session1.getAttribute("shoppingCart");
		  // New visitors get a fresh shopping cart.
		  // Previous visitors keep using their existing cart.
		  if (cart == null) {
			cart = new ShoppingCart();
			session.setAttribute("shoppingCart", cart);
		  }
		  String itemID = request.getParameter("itemID");
		  if (itemID != null) {
			String numItemsString =
			  request.getParameter("numItems");
			if (numItemsString == null) {
			  // If request specified an ID but no number,
			  // then customers came here via an "Add Item to Cart"
			  // button on a catalog page.
			  cart.addItem(itemID);
			} else {
			  // If request specified an ID and number, then
			  // customers came here via an "Update Order" button
			  // after changing the number of items in order.
			  // Note that specifying a number of 0 results
			  // in item being deleted from cart.
			  int numItems;
			  try {
				numItems = Integer.parseInt(numItemsString);
			  } catch(NumberFormatException nfe) {
				numItems = 1;
			  }
			  cart.setNumOrdered(itemID, numItems);
			}
		  }
		}
		
	

%>
	<div id='container'>
	  <header>
	    <h1><a href='/'>Game<span>Speed</span></a></h1>
	    <h5><strong>ASSIGNMENT&nbsp;&nbsp;1&nbsp;&nbsp;:&nbsp;</strong>Spate141</h5>
	  </header>
	  <nav>
	    <ul>
	      <li class=''><a href='index.jsp'>Home</a></li>
	      <li class=''><a href='games.jsp'>Games</a></li>
	      <li class=''><a href='console.jsp'>Console</a></li>
	      <li class=''><a href='ass.jsp'>Accessories</a></li>
	      <li class='end'><a href='about.jsp'>About us</a></li>
	      
	      <li id='cart'><a href='Logout.jsp'>Logout</a></li>
	      <li class='start selected' id='cart'><a href='OrderPage.jsp'><img src='images/cart.png' alt='Mountain View' style='width:25px;height:20px;'></a></li>
	    </ul>
	    <ul>
	      <li></li>
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
	            <td><center>
	                <h3>Order Status</h3><i><h5>UserID: <%=username%></h5></i>
	              </center></td>
	          </tr>
	        </table>	
	<%    synchronized(session1) {
		  List itemsOrdered = cart.getItemsOrdered();
		  if (itemsOrdered.size() == 0) {
	%>
	<H2><I>No items in your cart...</I></H2>
	<%			
		  } else {
	%>
	
		        <table cellspacing='4' style='font-size:14px'>
		          <tbody>
		            <tr>
		              <th >Item ID </th>
		              
		              <th >Unit Cost </th>
		              <th >Number</td>
		              <th >Total Cost</td>
		            </tr>
	<%			
		  ItemOrder order;
		  NumberFormat formatter = NumberFormat.getCurrencyInstance();
		  double sum = 0;
		  for(int i=0; i<itemsOrdered.size(); i++) {
			order = (ItemOrder)itemsOrdered.get(i);	
			
			
			
	%>
	
				<tr>
				  <td><%= order.getItemID() %></td>
				  
				  <td><%= formatter.format(order.getUnitCost()) %></td>
	
	
				  <td><form method = 'get' action = 'OrderPage.jsp'><input type='hidden' name='itemID' value="<%= order.getItemID() %>"/><input type='text' name='numItems' size='3' value="<%=  order.getNumItems() %>"/>&nbsp;&nbsp;&nbsp;<small><input type='submit' class = 'submit-button' value='Update Order'/></small></form></td>
	
	
				  <td><%= formatter.format(order.getTotalCost()) %></th>
				  
				</tr>           
	<%
	}
       
	%>
	
		          </tbody>
		        </table>
		          </div>
		
		          <form class = '' method = 'get' action = 'Checkout.jsp'>
		            <div align='center'>
		              <input class = 'submit-button' type = 'submit' value = 'Checkout'>
		            </div>
		          </form>
	<%
	}
	%>
		  
		 
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
	}
	%>