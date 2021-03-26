<%@page import="java.util.List"%>
<%@page import="DAO.TemasDAO"%>
<%@page import="Model.TemasCRUD"%>
<jsp:include page="layouts/header2.jsp"/>


<div class="container search">
    <div class="row">
        <div class="col-md-2">
            <%
                String mensaje = (String) request.getAttribute("msg");
                if (mensaje != null) {
                    out.println("<div class='alert alert-warning'>" + mensaje + "</div>");
                }
            %>
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><a href="home.jsp">Home</a></li>
                <li class="list-group-item"><a href="temas.jsp">Temas</a></li>
                <li class="list-group-item"><a href="miperfil.jsp">Mi Perfil</a></li>
                <li class="list-group-item"><a href="mistemas.jsp">Mis Temas</a></li>
                <li class="list-group-item"><a href="misentradas.jsp">Entradas</a></li>
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
            <% String id = (String) session.getAttribute("id"); %>

        <div class="col-md-10">
            <div class="mb-3 card">
                <div class="card-body">
                    <form action="ServletPost" method="post">
                        <div class="form-group">
                            <label>Titulo:</label>
                            <input id="title" type="text" name="title" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Escribe algo...</label>
                            <textarea id="contenido" name="" class="form-control"rows="7" placeholder="Que estas pensando ? ">
                            </textarea> 
                        </div>
                        <input type="hidden" name="id_usuario" value=<%out.print(id);%>>
                        <div class="form-gruop">
                            <label>Seleccione un tema</label> 
                            <select class="form-control" id="tema" name="tema">
                                <option>...</option>
                                <%
                                    TemasCRUD tcu = new TemasCRUD();
                                    List<TemasDAO> temas = tcu.Read();
                                    for (TemasDAO tema : temas) {%>
                                    
                                    <option value=<%out.print(tema.getId());%>><%out.print(tema.getTitle());%></option>
                                    
                                <%}%>
                            </select>
                        </div>
                        <button id="btn" type="submit" class="mt-3 btn btn-outline-primary btn-block">Subir</button>
                    </form>
                </div>
            </div>
            <div class="card mb-5">
                <div class="card-body">
                    <h3>Problemas con xampp (solucion)</h3>
                    <p>Fecha de publicacion: <strong>03-11-2020</strong> </p>
                    <hr>
                    <div class="contenido">
                        <p>
                            I am having problems doing a build using :

                            mvn clean -U install -Dmaven.test.skip=true

                            The artefact is not in nexus, but was created in my local repository.

                            [ERROR] Failed to execute goal on project mis-core: Could not resolve dependencies for project x.y.z:mis-core:ejb:0.0.1-SNAPSHOT: Failure to find x.y.z:mis-core-api:jar:tests:0.0.1-SNAPSHOT in https://company.net:8080/nexus/content/repositories/snapshots was cached in the local repository, resolution will not be reattempted until the update interval of nexus-snapshots has elapsed or updates are forced.

                            Any help will be appreciated.</p>
                    </div>
                </div>
                <div class="card-footer">
                    <div>
                        <p>Likes: <strong>25</strong> </p>
                        <p>Comentarios <strong>105</strong> </p>
                        <p>Tema: <strong>JAVA</strong> </p>
                        <a href="problemaXAMP.html" class="btn btn-outline-success btn-block">Responder</a>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h3>Problemas con xampp (solucion)</h3>
                    <p>Fecha de publicacion: <strong>03-11-2020</strong> </p>
                    <hr>
                    <div class="contenido">
                        <p>
                            I am having problems doing a build using :

                            mvn clean -U install -Dmaven.test.skip=true

                            The artefact is not in nexus, but was created in my local repository.

                            [ERROR] Failed to execute goal on project mis-core: Could not resolve dependencies for project x.y.z:mis-core:ejb:0.0.1-SNAPSHOT: Failure to find x.y.z:mis-core-api:jar:tests:0.0.1-SNAPSHOT in https://company.net:8080/nexus/content/repositories/snapshots was cached in the local repository, resolution will not be reattempted until the update interval of nexus-snapshots has elapsed or updates are forced.

                            Any help will be appreciated.</p>
                    </div>
                </div>
                <div class="card-footer">
                    <div>
                        <p>Likes: <strong>25</strong> </p>
                        <p>Comentarios <strong>105</strong> </p>
                        <p>Tema: <strong>JAVA</strong> </p>
                        <a href="problemaXAMP.html" class="btn btn-outline-success btn-block">Responder</a>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h3>Problemas con xampp (solucion)</h3>
                    <p>Fecha de publicacion: <strong>03-11-2020</strong> </p>
                    <hr>
                    <div class="contenido">
                        <p>
                            I am having problems doing a build using :

                            mvn clean -U install -Dmaven.test.skip=true

                            The artefact is not in nexus, but was created in my local repository.

                            [ERROR] Failed to execute goal on project mis-core: Could not resolve dependencies for project x.y.z:mis-core:ejb:0.0.1-SNAPSHOT: Failure to find x.y.z:mis-core-api:jar:tests:0.0.1-SNAPSHOT in https://company.net:8080/nexus/content/repositories/snapshots was cached in the local repository, resolution will not be reattempted until the update interval of nexus-snapshots has elapsed or updates are forced.

                            Any help will be appreciated.</p>
                    </div>
                </div>
                <div class="card-footer">
                    <div>
                        <p>Likes: <strong>25</strong> </p>
                        <p>Comentarios <strong>105</strong> </p>
                        <p>Tema: <strong>JAVA</strong> </p>
                        <a href="problemaXAMP.html" class="btn btn-outline-success btn-block">Responder</a>
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


<!---Validaciones --->

<script type="text/javascript">
    $(document).ready(function () {
        $('#btn').click(function () {
            let contenido, title, tema;
            title = document.getElementById("title")
            contenido = document.getElementById("contenido")
            tema = document.getElementById("tema")

            if (contenido.value === null || contenido.value === '' || contenido.lenght < 2 || contenido.lenght > 15) {
                contenido.className += " is-invalid"
            }

            if (title.value === null || title.value === '' || title.lenght < 2 || title.lenght > 15) {
                title.className += " is-invalid"
            }

            if (tema.value === null || tema.value === '' || tema.lenght < 2 || tema.lenght > 15) {
                tema.className += " is-invalid"
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
