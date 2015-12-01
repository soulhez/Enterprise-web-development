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
		if (username==null){
		response.sendRedirect("customer_notin1.jsp");
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
		  <form action='CheckoutDone.jsp' method='get'>
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
		              <th >Description</td>
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
			sum = sum + order.getTotalCost();
			
			
	%>
	
				<tr>
				  <td><%= order.getItemID() %></td>
				  <td><%= order.getShortDescription() %></td>
				  <td><%= formatter.format(order.getUnitCost()) %></td>
	
				
				
				  <td><input type='hidden' name='itemID' value=<%= order.getItemID() %>><input type='hidden' name='numItems' size='3' readonly value=<%=  order.getNumItems() %>><%=  order.getNumItems() %></td>
	
	
				  <td><%= formatter.format(order.getTotalCost()) %></th>
				  
				</tr>     
		             
	<%
	}
       
	%>
	<tr>
		              <th >Total </th>
		              <th ></td>
		              <th ></th>
		              <th ></td>
		              <th ><input name='ctotal' type='hidden' value=<%=sum %>>$ <%=sum %></td>
		            </tr> 
		          </tbody>
		        </table>
		          </div>
		
		          
	<%
	}
	%>
		          <div id='login'></div>
		        <div id='login_form'>
		
		            <table id='mytable' cellspacing='15'>
		            <caption>
		            Personal Information
		            </caption>
		            
		            <tr>
		              <td class='left'><label for='model'>Name: </label></td>
		              <td class='right'><input name='cname' type='text'></td>
		            </tr>
		            
		            <tr>
		              <td class='left'><label for='model'>Phone: </label></td>
		              <td class='right'><input name='cphone' type='text'></td>
		            </tr>
		            
		            <tr>
		              <td class='left'><label for='model'>City: </label></td>
		              <td class='right'><input name='ccity' type='text'></td>
		            </tr>
		            
		            <tr>
		              <td class='left'><label for='model'>State: </label></td>
		              <td class='right'><input name='cstate' type='text'></td>
		            </tr>
		            
		            <tr>
		              <td class='left'><label for='model'>ZIP: </label></td>
		              <td class='right'><input name='czip' type='text'></td>
		            </tr>
		            
		            </table>
		            <article></article>
		            <table id='mytable' cellspacing='15'>
		            <caption>
		            Billing Information
		            </caption>
		            
		            <tr>
		              <td class='left'><label for='model'>Card Number: </label></td>
		              <td class='right'><input name='ccnum' type='text'></td>
		            </tr>
		            
		            <tr>
		              <td class='left'><label for='model'>Card Type: </label></td>
		              <td class='right'><select name='ctype'>
		                    <option value='Creditcard'>Credit Card</option>
		                    
		                  </select></td>
		            </tr>
		            <tr>
		              <td class='left'><label for='model'>EXP DATE: </label></td>
		              <td class='right'><select name='month'>
		                    <option value='JAN'>01-JAN</option>
		                    <option value='FEB'>02-FEB</option>
		                    <option value='MAR'>03-MAR</option>
		                    <option value='APR'>04-APR</option>
		                    <option value='MAY'>05-MAY</option>
		                    <option value='JUN'>06-JUN</option>
		                    <option value='JUL'>07-JUL</option>
		                    <option value='AUG'>08-AUG</option>
		                    <option value='SEP'>09-SEP</option>
		                    <option value='OCT'>10-OCT</option>
		                    <option value='NOV'>11-NOV</option>
		                    <option value='DEC'>12-DEC</option>
		                  </select>
		                  <input name='year' type='number' min='2015' max='2020'>
		                  </td>
		            </tr>
		            <tr>
		              <td class='left'><label for='model'>CSC: </label></td>
		              <td class='right'><input name='ccsc' type='number' min='100' max='999'></td>
		            </tr>
		            <tr>
		                <td class='left'><a href='#.jsp'>
		                  <div class='h3_a'><b></b></div>
		                  </a></td>
		                <td class='right'><input name='submit_review' class='formbutton' value='Checkout' type='submit'></td>
		              </tr>
		            </table>
		          </form>
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
	}
	%>