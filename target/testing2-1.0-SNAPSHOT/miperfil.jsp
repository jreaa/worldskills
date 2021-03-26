<jsp:include page="layouts/header2.jsp"/>

<div class="container search">
    <div class="row">
        <div class="col-md-2">

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
    <div class="col-md-10">
        <div class="card">
            <div class="card-header">
                Ultima Entrada
            </div>

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
                </div>
            </div>
        </div>

        <div class="mt-3 mb-3">
            <h3>Respuestas: </h3>
            <div class="accordion" id="accordionExample">
              <div class="card">
                <div class="card-header" id="headingOne">
                  <h2 class="mb-0">
                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      Usuario: Jose Era
                  </button>
              </h2>
          </div>

          <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
              <div class="card-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-header" id="headingTwo">
          <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
              Usuario: Manuel Loyo
          </button>
      </h2>
  </div>
  <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
    </div>
</div>
</div>
<div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Usuario: Samuel Jackson
      </button>
  </h2>
</div>
<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
  <div class="card-body">
    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
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