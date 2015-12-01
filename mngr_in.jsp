<!doctype html>

<!-- INDEX -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>GameSpeed - spate141</title>
<link rel="stylesheet" href="styles.css" type="text/css" />

</head>

<body>
<div id="container">
  <header>
    <h1><a href="/">Game<span>Speed</span></a></h1>
    <h5><strong>ASSIGNMENT&nbsp;&nbsp;1&nbsp;&nbsp;:&nbsp;</strong>Spate141</h5>
  </header>
  <nav>
    <ul>
      <li class="start selected"><a href="index.jsp">Home</a></li>
      <li class=""><a href="games.jsp">Games</a></li>
      <li class=""><a href="console.jsp">Console</a></li>
      <li class=""><a href="ass.jsp">Accessories</a></li>
      <li class="end"><a href="about.jsp">About us</a></li>
	  <li id="cart"><a href="Logout.jsp">Logout</a></li>
	  <li id="cart"><a href="OrderPage.jsp"><img src="images/cart.png" alt="Mountain View" style="width:25px;height:20px;"></a></li>
    </ul>
    <ul>
      <li></li>
    </ul>
  </nav>
  <div id="body">
    <section id="content">
      <p>&nbsp;</p>
      <div id="login"></div>
      <div id="login_form">
      <article>
        <form method="get" action="AddProductManager">
         <table id="mytable">
            <tr >
            <td >
            <h3 align="center">Welcome to the Manager Portal!</h3>
            </td>    
                      
            </tr>
            <tr >
              <td ><p><center>ADD PRODUCTS
             </center></p></td>
            </tr>
          </table>
        
        
        
          <table id="mytable">
            
            <tr>
              <td class="left"><label for="pid">Product ID:</label></td>
              <td class="right"><input name="pid" id="pid" value="" type="text"></td>
            </tr>
            <tr>
              <td class="left"><label for="pname">Product Name:</label></td>
              <td class="right"><input name="pname" id="pname" value="" type="text"></td>
            </tr>
            <tr>
              <td class="left"><label for="pprice">Product Price:</label></td>
              <td class="right">$<input name="pprice" id="pprice" value="" type="text" size="19"></td>
            </tr>
            <tr>
              <td class="left"><label for="pdsc">Product Description:</label></td>
              <td class="right"><textarea name="pdsc" rows="5" cols="22"></textarea></td>
            </tr>
            <tr>
              <td colspan="2"><p></p></td>
            </tr>
            <tr>
              <td colspan="2" class="right_btn"><input name="reg" class="formbutton" value="Add Product" type="submit"></td>
            </tr>
          </table>
        </form>
        </article>
        <article>
        <form method="get" action="AddProductManager">
         <table id="mytable">
         <tr>
              <td colspan="2" class="right_btn"><input name="reg" class="formbutton" value="Update or Delete Product" type="submit"></td>
            </tr>
         </table>
         </form>
         </article>
      </div>
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
</body>
</html>