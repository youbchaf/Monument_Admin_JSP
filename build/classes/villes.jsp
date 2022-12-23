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
                                    <h2 class="content-header-title float-start mb-0">Villes</h2>
                                    <div class="breadcrumb-wrapper">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp">Home</a>
                                            </li>
                                            <li class="breadcrumb-item active">Villes
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
                        <div class="col-3">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Types</h4>
                                </div>
                                <div class="card-body">
                                    <form class="input-group">
                                        <input type="text" id="type" class="form-control" placeholder="Ajouter Type" />
                                        <button class="btn btn-success" onclick="addType()"
                                            type="reset"><i class="fa-solid fa-plus"></i></button>
                                    </form>
                                    <div class="input-group mt-2">
                                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                                        <input type="text" class="form-control"id="tsearch"  placeholder="Search">
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="ctype">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Villes</h4>
                                </div>
                                <div class="card-body">
                                    <form class="input-group">
                                        <input type="text" id="ville" class="form-control"
                                            placeholder="Ajouter ville" />
                                        <button class="btn btn-success" onclick="addVille()"
                                            type="reset"><i class="fa-solid fa-plus"></i></button>
                                    </form>
                                    <div class="input-group mt-2">
                                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                                        <input type="text" class="form-control"id="vsearch"  placeholder="Search">
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Ville</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="cville">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Zones</h4>
                                </div>
                                <div class="card-body">
                                    <form class="input-group">
                                        <select id="sv" class="form-control">
                                        </select>
                                        <input type="text" id="zone" class="form-control" placeholder="Ajouter Zone" />
                                        <button class="btn btn-success" onclick="addZone()"
                                            type="reset"><i class="fa-solid fa-plus"></i></button>
                                    </form>
                                    <div class="input-group mt-2">
                                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                                        <input type="text" class="form-control"id="zsearch"  placeholder="Search">
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Ville</th>
                                                <th>Zone</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="czone">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>
            </div>

            <script>

                let villeObjects = null
                let typeObjects = null
                let zoneObjects = null
                $(document).ready(function () {

                    loadVilles()
                    loadTypes()
                    loadZones()

                });

                document.getElementById("vsearch").addEventListener("keyup",(e)=>{
                  let val = e.target.value.toLowerCase()
                    let villes = villeObjects.filter(elem => {
                        return elem.nom.toLowerCase().includes(val)
                    })

                   injVilles(villes)
                })

                document.getElementById("tsearch").addEventListener("keyup",(e)=>{
                  let val = e.target.value.toLowerCase()
                    let types = typeObjects.filter(elem => {
                        return elem.libelle.toLowerCase().includes(val)
                    })

                   injTypes(types)
                })

                document.getElementById("zsearch").addEventListener("keyup",(e)=>{
                  let val = e.target.value.toLowerCase()
                    let zones = zoneObjects.filter(elem => {
                        return elem.nom.toLowerCase().includes(val) || elem.ville.nom.toLowerCase().includes(val) 
                    })

                   injZones(zones)
                })
                function delVille(arg) {
                    let vid = parseInt(arg.parentNode.querySelectorAll("span")[0].innerText)
                    $.ajax({
                        url: "VilleController",
                        data: { op: "del", id: vid },
                        method: "POST",
                        success: function (data) {
                            loadVilles()
                        },
                        statusCode: {
                            500: function () {
                                alert("Ville est affecter a une zone");
                            }
                        },

                    });

                }
                function delType(arg) {
                    let tid = parseInt(arg.parentNode.querySelectorAll("span")[0].innerText)
                    $.ajax({
                        url: "TypeController",
                        data: { op: "del", id: tid },
                        method: "POST",
                        success: function (data) {
                            loadTypes()
                        },
                        statusCode: {
                            500: function () {
                                alert("Type est affecter a un Monument");
                            }
                        },
                    });
                }
                function delZone(arg) {
                    let zid = parseInt(arg.parentNode.querySelectorAll("span")[0].innerText)
                    $.ajax({
                        url: "ZoneController",
                        data: { op: "del", id: zid },
                        method: "POST",
                        success: function (data) {
                            loadZones()
                        },
                        statusCode: {
                            500: function () {
                                alert("Zone est affecter a un Monument");
                            }
                        },
                    });
                }

                function addVille() {
                    let ville = document.getElementById('ville').value
                  if (ville) {
                      $.ajax({
                          url: "VilleController",
                          data: { op: "add", nom: ville },
                          method: "POST",
                          success: function (data) {
                              loadVilles()
                          }
                      });
                  }
                }
                function addType() {
                    let type = document.getElementById('type').value
                   if (type) {
                     $.ajax({
                         url: "TypeController",
                         data: { op: "add", libelle: type },
                         method: "POST",
                         success: function (data) {
                             loadTypes()
                         }
                     });
                   }
                }
                function addZone() {
                    let zone = document.getElementById('zone').value
                    let v = document.getElementById('sv').value
                   if (zone && v) {
                     $.ajax({
                         url: "ZoneController",
                         data: { op: "add", nom: zone, villeId: v },
                         method: "POST",
                         success: function (data) {
                             loadZones()
                         }
                     });
                   }
                }

                function loadVilles() {
                    $.ajax({
                        url: "VilleController",
                        data: { op: "load" },
                        method: "POST",
                        success: function (data) {
                           if (data) {
                             villeObjects = JSON.parse(JSON.stringify(data))
                             injVilles(data)
                             selectV(data)
                           }
                        }
                    });
                }
                function loadTypes() {
                    $.ajax({
                        url: "TypeController",
                        data: { op: "load" },
                        method: "POST",
                        success: function (data) {
                           if (data) {
                             typeObjects = JSON.parse(JSON.stringify(data))
                             injTypes(data)
                           }

                        }
                    });
                }

                function loadZones() {
                    $.ajax({
                        url: "ZoneController",
                        data: { op: "load" },
                        method: "POST",
                        success: function (data) {
                         if (data) {
                               zoneObjects = JSON.parse(JSON.stringify(data))
                               injZones(data)
                         }

                        }
                    });
                }
                function injVilles(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<tr><td>' + e.nom + '</td><td><span style="display: none;">' + e.id + '</span><a class="btn btn-danger" onclick="delVille(this)" ><i class="fa-solid fa-trash"></i></a></td></tr>'
                    });

                    $("#cville").html(ligne);

                }
                function injTypes(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<tr><td>' + e.libelle + '</td><td><span style="display: none;">' + e.id + '</span><a class="btn btn-danger" onclick="delType(this)"><i class="fa-solid fa-trash"></i></a></td></tr>'
                    });

                    $("#ctype").html(ligne);

                }
                function injZones(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<tr><td>' + e.ville.nom + '</td><td>' + e.nom + '</td><td><span style="display: none;">' + e.id + '</span><a class="btn btn-danger" onclick="delZone(this)"><i class="fa-solid fa-trash"></i></a></td></tr>'
                    });

                    $("#czone").html(ligne);

                }
                function selectV(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<option value="' + e.id + '">' + e.nom + '</option>'
                    });

                    $("#sv").html(ligne);

                }

            </script>
            <!-- END: Content-->
            <%@include file="source/includes/footer.jsp" %>