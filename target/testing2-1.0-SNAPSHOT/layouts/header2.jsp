


<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <!--Jqury-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!---css-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <title>Hello, world!</title>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            if (name == null) {
                request.setAttribute("mensaje", "Por favor iniciar sesion");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        %>
        <!--header-->
        <header class="header">
            <nav class="navbar navbar-dark bg-dark">
                <a class="navbar-brand">WelcomeToCodeHome</a>
                <div class="form-inline">
                    <%
                        String lastname = (String) session.getAttribute("lastname");
                        out.println("<span style='color: #fff;margin-right: 12px;font-size: 25px;'><i>" + name + " " + lastname + "</i></span>");%>
                    <form action="ServletCerrarSesion">
                        <button class="btn btn-outline-danger my-2 my-sm-0">Cerrar Sesion</button>
                    </form>

                </div>
            </nav>
        </header>
        <!--end header-->
