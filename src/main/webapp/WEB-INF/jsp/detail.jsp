<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><!-- dynamický titulek--></title>
<link type="text/css" rel="stylesheet" media="all" href="css/style.css"> <!--základní stylesheet-->
<script src="side_menu.js" type="text/javascript"></script> <!-- javascript pro postranní menu -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript" src="jquery.leanModal.min.js"></script>
		<script type="text/javascript">
			$(function() {
    			$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });		
			});
		</script>
</head>
<body>
<div id="container"> <!-- hlavní kontejner -->
	<div id="header_background">  
    <div id="header"> <!-- hlavička stránky - logo, přihlasovací tlačítko -->
   		<img src="img/logotyp.png" id="logo"/>
        <a class="action_button" id="go" rel="leanModal" name="login" href="#login">Přihlásit se</a>
        
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
        	<div id="dd" class="wrapper-dropdown-2 active" tabindex="1">
            <h1>Typy kol</h1>
				<ul class="dropdown">
					<li><a href="#">Horská kola</a></li>
					<li><a href="#">Silniční kola</a></li>
					<li><a href="#">Dětská kola</a></li>
				</ul>
			</div>
            <script type="text/javascript">

			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

			});

			</script>
            <div id="cc" class="wrapper-dropdown-2" tabindex="1">
            <h1>Značky kol</h1>
				<ul class="dropdown">
					<li><a href="#">Author</a></li>
					<li><a href="#">Rock Machine</a></li>
					<li><a href="#">Yamaha</a></li>
                    <li><a href="#">Zephir</a></li>
				</ul>
			</div>
            <script type="text/javascript">

			function DropDown(cl) {
				this.cc = cl;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.cc.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var cc = new DropDown( $('#cc') );

			});

			</script>
        </div> <!-- boční menu konec -->
        <div id="content_container"> <!-- kontejner obsahu -->
        <!-- obsah pro detail -->
        	<div class="detail_header"> 
                <img src="img/bike_detail.png"/>
            	<div class="detail_description"> 
               		<a href="" class="label">Název</a><!-- odkaz na detail inzerátu -->
                	<p>Nové horské kolo, vhodné pro běžné výletníky. Kolemjdoucí se za vámi...</p>
                    <div>
                    <a class="action_button_dark" href="">Objednat</a>
                    </div>
            	</div>
                <div class="detail_tag"> 
                	<p class="detail_price">Cena</p>
            		<p class="detail_seller"><a href="">Jméno prodejce</a>, Město<br/>
                	Adresa prodejce <a href="">mapa</a><br/>
                    telefon</p>
            	</div>
            </div>
            
            <div class="detail_info"> 
            	<div class="detail_pictures"> 
                <img src="img/detail_sample.png" />
                <img src="img/detail_sample.png" />
                <img src="img/detail_sample.png" />
                <img src="img/detail_sample.png" />
            	</div>
                <div class="detail_specifications"> 
                	<p class="left_column">
                    Typ kola: lowrider <br />							
					Značka kola:	custom	<br />					
					Velikost rámu: 105	<br />						
					Záruka: 2 roky<br />
					Velikost kola:	 26"	<br />							
					Barva kola: tyrkysová<br />
					Váha kola: 8 kg<br />
					Doporučené využití:	 kočkolap
                    </p>
            		<p class="right_column">
                    Region: Texas<br />
                    Město prodejce: El Paso<br />
                    Možnost zaslat po celé ČR: Ano
                    </p>
            	</div>
            </div>
            
        <!-- obsah pro detail konec -->
        </div> <!-- kontejner obsahu konec -->
        <div id="footer"> <!-- patka -->
        	<p>2014 Kolomet &#169; &nbsp; &nbsp; |
            <a href="">O nás</a> |
            <a href="">Obchodní podmínky</a> |
            <a href="">Kontakt</a></p>
            <a href="" class="action_button_dark">Chci zde inzerovat</a>
            
        </div> <!-- patka konec -->
    </div> <!-- kontejner vystředění konec -->
</div><!-- hlavní kontejner konec -->
<div id="login">
                <form action="">
				    	<div>
                        <label for="" class="login_label">Přihlášení:</label><br /><br />
                        <label for="">Přihlasovací jméno</label><br />
				    	<input id=""  name="" type="text" /><br />
				    	<label for="">Heslo</label><br />
				    	<input id="" name="" type="password" /><br />
                        <a href=#>Zapomenuté heslo</a>
                        </div>
                        </span>
				  		<div class="login_button_field">
                        <a class=action_button href=#>Registrovat</a> 
                        <button type="submit">Přihlásit se</button>
                        </div>
				 </form>
			</div>
		</div>
</body>
</html>