<%@page import="Model.ReplicaCRUD"%>
<%@page import="DAO.ReplicaDAO"%>
<%@page import="Model.ComentariosCRUD"%>
<%@page import="DAO.ComentariosDAO"%>
<%@page import="Model.Follow"%>
<%@page import="DAO.FollowDAO"%>
<%@page import="DAO.TemasDAO"%>
<%@page import="java.util.List"%>
<%@page import="Model.TemasCRUD"%>
<jsp:include page="layouts/header2.jsp"/>
<div class="container search">
    <div class="row">
        <div class="col-md-2">
            <% String id = (String) session.getAttribute("id"); %>
            <%
                String mensaje = (String) request.getAttribute("mensaje");
                if (mensaje != null) {
                    out.println("<div class='alert alert-warning'>" + mensaje + "</div>");
                }
            %>
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



            <div class="mb-3 card">

                <div class="card-body">
                    <form action="ServletCreateTema" method="post">
                        <h3>Cree un nuevo tema..</h3>
                        <div class="form-gruop">
                            <label>Nombre del tema</label>
                            <input type="hidden" name="id_usuario" value=<%out.print(id);%>>
                            <input type="text" name="tname" class="form-control" placeholder="Java">
                        </div>
                        <div class="form-gruop">
                            <label>Describa el tema</label>
                            <textarea  name="tcontenido" class="form-control"></textarea>
                        </div>
                        <button type="submit" name="btn" class="mt-3 btn btn-outline-primary btn-block">Subir</button>
                    </form>
                </div>
            </div>


            <%
                TemasCRUD tcu = new TemasCRUD();
                List<TemasDAO> temas = tcu.Read();
                for (TemasDAO tema : temas) {%>
            <div class="card mb-3">
                <div class="card-body">
                    <h3>Temas: </h3>
                    <div class="accordion" id="accordionExample">
                        <div class="card">
                            <div class="card-header" id="headingOne">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Titulo <%out.print(tema.getTitle());%><br> 
                                        Usuario: <%out.print(tema.getId_usuarios());%> 
                                    </button>

                                </h2>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    <%out.print(tema.getDescription());%> 
                                </div>
                            </div>
                            <div class="card-footer">
                                <form action="ServletFollow" method="post">
                                    <input type="hidden" name="id_tema" value=<%out.print(tema.getId());%>>
                                    <input type="hidden" name="id_usuario" value=<%out.print(id);%>>
                                    <input id="btn" name="follow" type="submit" class="btn btn-ouline-success" value="follow">

                                </form>
                               

                                <form action="ServletUnFollow" method="post">
                                    <input type="hidden" name="id_tema" value=<%out.print(tema.getId());%>>
                                    <input type="hidden" name="id_usuario" value=<%out.print(id);%>>
                                    <input id="btn" name="unfollow" type="submit" class="btn btn-ouline-danger" value="unfollow">

                                </form>


                            </div>
                            <div class="container">
                                <form action="ServletComentarios" method="post">
                                    <input type="hidden" name="id_tema" value=<%out.print(tema.getId());%>>
                                    <input type="hidden" name="id_usuario" value=<%out.print(id);%>>
                                    <div class="form-gruop">
                                        <label>Comentar</label>
                                        <textarea name="contenido" rows="3" class="form-control"></textarea>
                                    </div>
                                    <button class="btn btn-outline-success btn-block" type="submit">Responder</button>
                                </form>
                            </div>
                        </div>

                    </div>

                    <div class="mt-3 mb-3">
                        <hr class="mt-3">
                        <h3>Respuestas: </h3>
                        <div class="accordion" id="accordionExample">
                            <%
                                ComentariosDAO co = new ComentariosDAO();
                                co.setId_tema(tema.getId());

                                ComentariosCRUD ccrud = new ComentariosCRUD();
                                List<ComentariosDAO> comentario = ccrud.Read(co);
                                for (ComentariosDAO com : comentario) {%>
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Usuario: <%out.print(com.getId_usuarios());%>
                                        </button>
                                    </h2>
                                </div>

                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <%out.print(com.getContenido());%>
                                    </div>
                                </div>
                            </div>

                            <table class="table">
                                <h5>Replicas</h5>
                                <thead>
                                    <tr>

                                        <th scope="col">Usuario</th>
                                        <th scope="col">Contenido</th>

                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        ReplicaDAO re = new ReplicaDAO();
                                        re.setId_comentario(com.getId());

                                        ReplicaCRUD rcrud = new ReplicaCRUD();
                                        List<ReplicaDAO> replicas = rcrud.Read(re);
                                        for (ReplicaDAO replica : replicas) {%>

                                    <tr>
                                        <td><%out.print(replica.getId_usuario());%></td>
                                        <td><%out.print(replica.getConetindo());%></td>
                                    </tr>

                                    <%}%>
                                </tbody>
                            </table>

                            <div class="container mb-3">
                                <form action="ServletReplica" method="post">
                                    <input type="hidden" name="id_comentario" value=<%out.print(com.getId());%>>
                                    <input type="hidden" name="id_usuario" value=<%out.print(com.getId_usuarios());%>>
                                    <input type="hidden" name="id_usuario_replica" value=<%out.print(id);%>>
                                    <div class="form-gruop">
                                        <label>Responder</label>
                                        <textarea name="contenido" rows="3" class="form-control"></textarea>
                                    </div>
                                    <button class="btn btn-outline-success btn-block" type="submit">Responder</button>
                                </form>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>


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

<script type="text/javascript">
    $(document).ready(function () {
        $('#btn').clcik(function () {
            let tname, description;
            tname = document.getElementById("tname")
            description = document.getElementById("description")


            if (tname.value === null || tname.value === '' || tname.lenght < 2 || tname.lenght > 15) {
                tname.className += " is-invalid"
            }

            if (description.value === null || description.value === '' || description.lenght < 2 || description.lenght > 15) {
                description.className += " is-invalid"
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