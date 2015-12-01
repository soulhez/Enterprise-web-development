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
<%@ page import = "javax.servlet.*"%>

<% 
      	/* private CatalogItem[] items;
		private String[] itemIDs;
		
		MongoClient mongo;
		
		itemIDs = itemIDs;
		items = new CatalogItem[itemIDs.length];
		for(int i=0; i<items.length; i++) {
		  items[i] = Catalog.getItem(itemIDs[i]);
		}
		
		mongo = new MongoClient("localhost", 27017);
		CatalogItem item; 		 */
		
		String itemID = "" + request.getParameter("productName");			
			
		String itemCost = "" + request.getParameter("itemCost");

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
			      <article class='expanded'>
			        <p>&nbsp;</p>
			        <div id='login'><strong>Submit Product Review</strong> </div>
			        <div id='login_form'>
			          <form action='SubmitReview.jsp' method='post'>
			            <table id='mytable'>
			              <tr>
			                <td class='left'><label for='model'>Product Model: </label></td>
			                <td class='right'>
							 <textarea rows='2' cols='22' style='resize:none' name='productName' id='productName' value=''><%=itemID%></textarea>
			              </td>
			              </tr>
			              <tr>
			                <td class='left'><label for='p_cat'>Product Category: </label></td>
			                <td class='right'><select name='productCategory'>
			                    <option value='Game Console'>Game Console</option>
			                    <option value='Games'>Games</option>
			                    <option value='Accessories'>Accessories</option>
			                  </select></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='price'>Product Price: </label></td>
			                <td class='right'><input name='productPrice' id='price' value=<%= itemCost%> type='text' readonly></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='r_name'>Retailer Name: </label></td>
			                <td class='right'><select name='retailerName'>
			                    <option value='GameSpeed'>GameSpeed</option>
			                    <option value='Walmart'>Walmart</option>
			                    <option value='BestBuy'>BestBuy</option>
			                  </select></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='zip'>Retailer Zip: </label></td>
			                <td class='right'><input name='retailerZipcode' id='zip' value='' type='text'></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='city'>Retailer City: </label></td>
			                <td class='right'><input name='retailerCity' id='city' value='' type='text'></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='state'>Retailer State: </label></td>
			                <td class='right'><input name='retailerState' id='state' value='' type='text'></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='sale'>Product On sale: </label></td>
			                <td class='right'><select name='productOnSale'>
			                    <option value='Yes'>Yes</option>
			                    <option value='No'>No</option>
			                  </select></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='mfg'>Manufacturer Name: </label></td>
			                <td class='right'><select name='consoleManufacturer'>
			                    <option value='Microsoft'>Microsoft</option>
			                    <option value='Sony'>Sony</option>
			                    <option value='Nintendo'>Nintendo</option>
			                    <option value='Activision'>Activision</option>
			                    <option value='Ea'>Electronic Arts</option>
			                    <option value='T2'>Take Two</option>
			                  </select></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='mfg_rebate'>Manufacturer Rebate: </label></td>
			                <td class='right'><select name='manufacturerRebate'>
			                    <option value='Yes'>Yes</option>
			                    <option value='No'>No</option>
			                  </select></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='userid'>User ID: </label></td>
			                <td class='right'><input name='userID' id='userID' value='' type='text'></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='userage'>User Age: </label></td>
			                <td class='right'><input name='userAge' id='userage' value='' type='text'></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='usergen'>User Gender: </label></td>
			                <td class='right'><select name='userGender'>
			                    <option value='male'>Male</option>
			                    <option value='female'>Female</option>
			                  </select></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='userocc'>User Occupation: </label></td>
			                <td class='right'><input name='userOccupation' id='userocc' value='' type='text'></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='rating'>Review Rating: </label></td>
			                <td class='right'><select name="reviewRating">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
			                 </td>
			              </tr>
			              <tr>
			                <td class='left'><label for='date'>Review Date: </label></td>
			                <td class='right'><input name='reviewDate' id='date' value='' type='date'></td>
			              </tr>
			              <tr>
			                <td class='left'><label for='reviewText'>Review Text: </label></td>
			                <td class='right'><textarea rows='4' cols='24' name='reviewText' id='review_text' value=''></textarea>
			                
			            </td>
			              </tr>
			              <tr>
			                <td colspan='2'><p></p></td>
			              </tr>
			              <tr>
			                <td class='left'><a href='customer_login.jsp'>
			                  <div class='h3_a'><b></b></div>
			                  </a></td>
			
			                <td class='right'><input type="submit" value="Submit Review"></td>
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