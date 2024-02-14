<?php 
session_start();
if(isset($_SESSION['user_id'])){//ha a user be van lépve
    header("location:index.php");
}
?>
<?php include_once "head.php"; ?>
<body>
    <div class="wrapper">
        <section class="form login">
            <header>
                Belépés
            </header>
            <form action="#">
                <div class="error-txt">Hiba üzenet!</div>
                
                    <div class="field input">
                        <label>E-mail:</label>
                        <input type="email" placeholder="E-amil cím" name="email" id="">
                    </div>
                    <div class="field input">
                        <label>Jelszó:</label>
                        <input type="password" placeholder="Jelszó" name="password" id="">
                        <i class="fas fa-eye"></i>
                    </div>
                    
                    <div class="field button">
                        <input type="submit" value="Tovább a főoldalra">
                    </div>
                
            </form>
            <div class="link">Ha még nincs regisztrációja: <a href="regisztracio.php">Regisztráció</a></div>
        </section>

    </div>
    <script src="js/pass-show-hide.js"></script>
    <script src="js/login.js"></script>
</body>

</html>