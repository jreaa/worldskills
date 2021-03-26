<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Jekyll v4.1.1">
        <title>CODEHOME</title>
        <!--Jqury-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="css/style.css">

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="signin.css" rel="stylesheet">
    </head>
    <body>
        <!--header-->
        <header class="header">
            <nav class="navbar navbar-dark bg-dark">
                <a href="index.html"class="navbar-brand">WelcomeToCodeHome</a>
                <div class="form-inline">
                    <a class=" mr-sm-2 btn btn-outline-success" >Iniciar Sesion</a>
                    <a href="index.jsp#registro" class="btn btn-outline-success my-2 my-sm-0">Registrate</a>
                </div>
            </nav>
        </header>

        <div class="container search">
            <%
                String mensaje = (String) request.getAttribute("msg");
                if (mensaje != null) {
                    out.println("<div class='alert alert-warning'>" + mensaje + "</div>");
                }
            %>
            <div class="text-center">
                <form class="form-signin" method="POST" action="ServletLogin">
                    <h1 class="h3 mb-3 font-weight-normal">Bienvenido de nuevo</h1>
                    <div class="form-group">
                        <label for="inputRut" class="sr-only">Rut</label>
                        <input type="text" id="rut" name="rut" class="form-control" placeholder="Rut" required autofocus>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="sr-only">Password</label>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                    </div>
                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" value="remember-me"> Recuerdeme
                        </label>
                    </div>
                    <button id="btn" name="btn" class="btn btn-lg btn-outline-success btn-block" type="sumit">Iniciar Sesion</button>
                </form>
            </div>
        </div>

        <!---Validaciones --->

        <script type="text/javascript">
            $(document).ready(function () {
                $('#btn').click(function () {
                    let exp = /[0-9]{7,8}-[0-9kk]{1}/;
                    let rut, password;
                    password = document.getElementById("password")
                    rut = document.getElementById("rut")


                    if (password.value === null || password.value === '' || password.lenght < 2 || password.lenght > 15) {
                        name.className += " is-invalid"
                    }

                    if (rut.value === null || rut.value === '' || rut.lenght < 2 || rut.lenght > 15 || !rut.value.match(exp)) {
                        rut.className += " is-invalid"
                    }
                })
            })
        </script>



        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        -->
    </body>
</html>