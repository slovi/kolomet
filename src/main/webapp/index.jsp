<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
	<jsp:directive.page contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" session="false"/>
	<jsp:output doctype-root-element="html"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		omit-xml-declaration="true" />
		
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><!-- dynamický titulek--></title>
	</head>
	<link type="text/css" rel="stylesheet" media="all" href="css/style.css"> <!--základní stylesheet-->
	<script src="./js/side_menu.js" type="text/javascript"></script> <!-- javascript pro postranní menu -->
	
	<body>
		<div id="container"> <!-- hlavní kontejner -->
			<div id="header_background">  
		    <div id="header"> <!-- hlavička stránky - logo, přihlasovací tlačítko -->
		   		<img src="img/logotyp.png" id="logo"/>
		        <a class="action_button" href="javascript">Přihlásit se</a>
		    </div><!-- hlavička stránky konec -->
		    </div>
		    <div id="menu_background"> 
		    <div id="menu_container"> <!-- kontejner hlavního menu -->
		    	<nav>	
		            <ul id="main_menu"><!-- hlavní menu -->
		    			<li><a href="index.php">Úvod</a></li>
		    			<li><a href="dynamická adresa hlavního menu">Dynamická položka</a></li><!-- položka hlavního menu s dynamickým označením a odkazem -->
		    			<li id="admin"><a href="index.php">Náš Kolomet</a>
		                	<ul id="admin_menu"><!-- menu administrace začátek -->
		                    	<li><a href="dynamický odkaz administrace">Položka administrace 1</a></li>
		                        <li><a href="dynamický odkaz administrace">Položka administrace 2</a></li>
		                        <hr color="#f9f9f9" width="85%" align="center" size="1" />  
		                        <li><a href="dynamický odkaz administrace">Položka administrace 3</a></li>
		                        <li><a href="dynamický odkaz administrace">Položka administrace 4</a></li>  
		                    </ul>
		                </li>
		    		</ul><!-- hlavní menu konec -->
				</nav>
			</div><!--  kontejner hlavního menu konec -->
		    </div>
		    <div id="center_container"> <!-- kontejner vystředění - boční menu, kontejner obsahu, patka -->
		    	<div id="side_menu"> <!-- boční menu -->
		        	<div> <!-- box bočního menu -->
		            	<h1 onclick="javascript:ToggleTypes()">
		                	Typy kol 
		                	<img src="img/arrow_down.png" id="TypeArrowDown"/>
		                    <img class="hidden" src="img/arrow_right.png" onmouseover="javascript:this.src=('img/arrow_right_orange.png');" onmouseout="javascript:this.src=('img/arrow_right.png');" id="TypeArrowRight"/>
		                </h1>
		                
		            	<ul id="Types">
		            		<li><a href="">položka bočního menu</a></li>
		                    <li><a href="">položka bočního menu</a></li>
		            	</ul>
		            </div>
		            <div> <!-- box bočního menu -->
		            	<h1 onclick="javascript:ToggleBrands()">
		                	Značky kol 
			                <img class="hidden" src="img/arrow_down.png" id="BrandArrowDown"/>
			                <img src="img/arrow_right.png" onmouseover="javascript:this.src=('img/arrow_right_orange.png');" onmouseout="javascript:this.src=('img/arrow_right.png');" id="BrandArrowRight"/>
		                </h1>
		                
		            	<ul class="hidden" id="Brands">
		            		<li><a href="">položka bočního menu</a></li>
		                    <li><a href="">položka bočního menu</a></li>
		            	</ul>
		            </div>
		            <div> <!-- box bočního menu -->
		                    <ul>
		            		<li><a href="">Tabulka velikostí kol</a></li>
		            	</ul>
		            </div>
		        </div> <!-- boční menu konec -->
		        <div id="content_container"> <!-- kontejner obsahu -->
		        <!-- obsah pro homepage -->
		        	<div class="homepage_unit"> 
		            	<a href=""><img src="img/bike_sample.png"/></a><!-- odkaz na detail inzerátu -->
		            	<div class="home_description"> 
		            		<a href="" class="label">Název</a><!-- odkaz na detail inzerátu -->
		                	<p class="price">Cena</p>
		                	<p>Nové horské kolo, vhodné pro běžné výletníky. Kolemjdoucí se za vámi...</p>
		            	</div>
		            	<div class="home_seller"> 
		            		<p><a href=""><img src="img/arrow_right.png" onmouseover="javascript:this.src=('img/arrow_right_orange.png');" onmouseout="javascript:this.src=('img/arrow_right.png');"/></a><a href="">Jméno prodejce</a>, Město<br/>
		                	Adresa prodejce <a href="">mapa</a><br/>
		                    telefon</p>
		                    
		            	</div>
		            </div>
		        <!-- obsah pro homepage konec -->
		        </div> <!-- kontejner obsahu konec -->
		        <div id="footer"> <!-- patka -->
		        	<p>2014 Kolomet &#169; &#160; &#160; |
		            <a href="">O nás</a> |
		            <a href="">Obchodní podmínky</a> |
		            <a href="">Kontakt</a></p>
		            <a href="" class="action_button_dark">Chci zde inzerovat</a>
		            
		        </div> <!-- patka konec -->
		    </div> <!-- kontejner vystředění konec -->
		</div><!-- hlavní kontejner konec -->
	</body>
</html>

</jsp:root>