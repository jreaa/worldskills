<%@page import="DAO.UsuariosDAO"%>
<%@page import="Model.UsuariosCRUD"%>
<%
    if (request.getSession(false) == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<jsp:include page="layouts/header2.jsp"/>
<div class="container search">
    <div class="row">
        <div class="col-md-2">
            <ul class="list-group list-group-flush">
                <!-- <li class="list-group-item"><a href="home.jsp">Home</a></li>-->
                <li class="list-group-item"><a href="temas.jsp">Temas</a></li>
                <!--<li class="list-group-item"><a href="miperfil.jsp">Mi Perfil</a></li>
                <li class="list-group-item"><a href="mistemas.jsp">Mis Temas</a></li>
                <li class="list-group-item"><a href="misentradas.jsp">Entradas</a></li>-->
                <li class="list-group-item"><a href="actualizar.jsp">Actualizar Datos</a></li>


                <hr>
                <form action="#" method="post">
                    <div class="form-gruop">
                        <label >Buscar por temas</label>
                        <input type="text" name="search" class="form-control">
                    </div>
                    <button class="mt-3 btn btn-outline-success btn-block">Buscar</button>
                </form>

            </ul>

        </div>
        <div class="col-md-10">

            <%
                String id = (String) session.getAttribute("id");
                UsuariosCRUD cu = new UsuariosCRUD();
                UsuariosDAO user = cu.Read(Integer.parseInt(id));

                String name = (String) user.getName();
                String lastname = (String) user.getLastname();
                String rut = (String) user.getRut();
                String fono = (String) user.getFono();
                String email = (String) user.getEmail();
                String pais = (String) user.getPais();
                String password = (String) user.getPassword();


            %>
            <div class="card">
                <%                            String mensaje = (String) request.getAttribute("update");
                    if (mensaje != null) {
                        out.println("<div class='alert alert-warning'>" + mensaje + "</div>");
                    }
                %>
                <div class="card-body">
                    <div class="container" method="submit">
                        <form action="ServletDBaja" method="POST">
                            <input type="hidden" name="id" value=<%out.print(id);%> />
                            <input type="hidden" name="status" value="0" />
                            <button type="submit" class="btn btn-outline-danger">Cerrar mi cuenta</button> 
                        </form>
                    </div>
                    <div id="content">
                        <div class="container">
                            <div>
                                <form class="form-group mt-3" method="POST" action="ServletUpdate">
                                    <div class="row">

                                        <div class="col">
                                            <h3>Mis Datos</h3>

                                            <div class="form-group">
                                                <label for="id">Id</label>
                                                <input name="id" type="text" class="form-control" id="name" value=<%out.print(id);%> required readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="name">Nombre</label>
                                                <input name="name" type="text" class="form-control" id="name" value=<%out.print(name);%> required>
                                            </div>
                                            <div class="form-group">
                                                <label for="lastname">Apellido</label>
                                                <input name="lastname" type="text" class="form-control"  id="lastname" value=<%out.print(lastname);%> required>
                                            </div>

                                            <div class="form-group">
                                                <label for="rut">Rut</label>
                                                <input name="rut" type="text" class="form-control" id="rut" value=<%out.print(rut);%> required>
                                            </div>
                                            <div class="form-group">
                                                <label for="password">Password</label>
                                                <input name="password" type="text" class="form-control" id="password" value=<%out.print(password);%> required>
                                            </div>

                                        </div>


                                        <div class="col">

                                            <div class="form-group">
                                                <label for="fono">Fono</label>
                                                <input name="fono" id="fono" type="tel" class="form-control"  value=<%out.print(fono);%> required>
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <input type="email" name="mail" class="form-control" id="email" value=<%out.print(email);%>>
                                            </div>
                                            <div class="form-group">
                                                <label for="pais">Pais</label>
                                                <input type="text" name="pais" id="city" class="form-control" value=<%out.print(pais);%> required>
                                            </div>

                                        </div>

                                    </div>

                            </div>

                            <!-- Button trigger modal -->
                            <button type="submit" name="btn" class="btn btn-primary btn-block mt-5" data-toggle="modal" data-target="#staticBackdrop">
                                Enviar
                            </button>

                            </form>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</div>




<footer class="mt-5" style="padding: 2.5rem 0;
        color: #999;
        text-align: center;
        background-color: #f9f9f9;
        border-top: .05rem solid #e5e5e5;">
    <div class="container">
        <p><a href="/">CODEHOMES</a> by <a href="#">EraJose</a>.</p>
        <p>
            <a href="#top">Subir</a>
        </p>
    </div>
</footer>



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