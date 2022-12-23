<%@include file="source/includes/head.jsp" %>
    <%@include file="source/includes/header.jsp" %>
        <%@include file="source/includes/menu.jsp" %>
            <!-- BEGIN: Content-->
            <div class="app-content content ">
                <div class="content-overlay"></div>
                <div class="header-navbar-shadow"></div>
                <div class="content-wrapper container-xxl p-0">
                    <div class="content-header row">
                        <div class="content-header-left col-md-9 col-12 mb-2">
                            <div class="row breadcrumbs-top">
                                <div class="col-12">
                                    <h2 class="content-header-title float-start mb-0">Photos</h2>
                                    <div class="breadcrumb-wrapper">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp">Home</a>
                                            </li>
                                            <li class="breadcrumb-item active">Photos
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="content-header-right text-md-end col-md-3 col-12 d-md-block d-none">
                            <div class="mb-1 breadcrumb-right">
                                <div class="dropdown">
                                    <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle"
                                        type="button" data-bs-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false"><i data-feather="grid"></i></button>
                                    <div class="dropdown-menu dropdown-menu-end"><a class="dropdown-item" href="#"><i
                                                class="me-1" data-feather="check-square"></i><span
                                                class="align-middle">Todo</span></a><a class="dropdown-item" href="#"><i
                                                class="me-1" data-feather="message-square"></i><span
                                                class="align-middle">Chat</span></a><a class="dropdown-item" href="#"><i
                                                class="me-1" data-feather="mail"></i><span
                                                class="align-middle">Email</span></a><a class="dropdown-item"
                                            href="#"><i class="me-1" data-feather="calendar"></i><span
                                                class="align-middle">Calendar</span></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content-body row pdl-2">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Photos</h4>
                            </div>
                            <div class="card-body">
                                <form class="input-group" id="photoForm" method="post" action="PhotoController"
                                    enctype="multipart/form-data">
                                    <select id="mon" name="mon" class="form-control">
                                    </select>
                                    <input type="file" class="form-control" name="file" id="photo"
                                        aria-describedby="addP" aria-label="Charger">
                                    <button class="btn btn-success" type="submit" id="addP"><i
                                            class="fa-solid fa-plus"></i></button>
                                </form>
                                <div class="input-group mt-2">
                                    <span class="input-group-text"><i class="fas fa-search"></i></span>
                                    <input type="text" class="form-control"id="psearch"  placeholder="Search">
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Monument</th>
                                            <th>Url</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody id="cphoto">

                                    </tbody>
                                </table>
                            </div>
                        </div>



                    </div>
                </div>
            </div>

            <script>
                let photoObjects=null
                $(document).ready(function () {

                    loadMonuments()
                    loadPhotos()

                    $("#photoForm").submit(function (e) {
                      //  e.preventDefault()
                       // loadPhotos()
                    });

                });

                document.getElementById("psearch").addEventListener("keyup",(e)=>{
                  let val = e.target.value.toLowerCase()
                    let photos = photoObjects.filter(elem => {
                        return elem.monument.zone.ville.nom.toLowerCase().includes(val) || elem.monument.zone.nom.toLowerCase().includes(val) || elem.monument.nom.toLowerCase().includes(val)
                    })

                   injPhotos(photos)
                })
               
                function loadMonuments() {
                    $.ajax({
                        url: "MonumentController",
                        data: { op: "load" },
                        method: "POST",
                        success: function (data) {
                            selectM(data)


                        }
                    });
                }



                function loadPhotos() {
                    $.ajax({
                        url: "PhotoController",
                        data: { op: "load" },
                        method: "POST",
                        success: function (data) {
                           if (data) {
                             photoObjects = JSON.parse(JSON.stringify(data))
                             injPhotos(data)
                           }


                        }
                    });
                }

                function selectM(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<option value="' + e.id + '">' + e.zone.ville.nom + '-' + e.zone.nom + ' : ' + e.nom + '</option>'
                    });

                    $("#mon").html(ligne);

                }

                function injPhotos(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<tr><td>' + e.monument.zone.ville.nom + '-' + e.monument.zone.nom + ' : ' + e.monument.nom + '</td><td>' + e.url + '</td><td><span style="display: none;">' + e.id + '</span><a class="btn btn-danger" onclick="delPhoto(this)" ><i class="fa-solid fa-trash"></i></a></td></tr>'
                    });

                    $("#cphoto").html(ligne);

                }

                function delPhoto(arg) {
                    let vid = parseInt(arg.parentNode.querySelectorAll("span")[0].innerText)
                    $.ajax({
                        url: "PhotoController",
                        data: { op: "del", id: vid },
                        method: "POST",
                        success: function (data) {
                            loadPhotos()
                        },
                        statusCode: {
                            500: function () {
                                alert("Erreur dans le serveur");
                            }
                        },

                    });

                }



            </script>
            <!-- END: Content-->
            <%@include file="source/includes/footer.jsp" %>