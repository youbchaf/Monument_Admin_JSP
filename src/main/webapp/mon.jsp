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
                                    <h2 class="content-header-title float-start mb-0">Monuments</h2>
                                    <div class="breadcrumb-wrapper">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp">Home</a>
                                            </li>
                                            <li class="breadcrumb-item active">Monuments
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
                        <div class="col-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Createurs</h4>
                                </div>
                                <div class="card-body">
                                    <form class="form" id="cform">
                                        <div class="row">
                                            <div class="col-md-6 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="nomC">Nom</label>
                                                    <input type="text" id="nomC" class="form-control"
                                                        placeholder="Nom de Createur" />
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="db">Date Debut</label>
                                                    <input type="date" id="db" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="descC">Description</label>
                                                    <textarea rows="1" id="descC" class="form-control"
                                                        placeholder="Description de Createur"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="df">Date Fin</label>
                                                    <input type="date" id="df" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <button type="button" class="btn btn-primary me-1"
                                                    onclick="addCreator()" id="cbtn"><i class="fa-solid fa-plus"></i></button>
                                                <button type="reset" class="btn btn-outline-secondary"
                                                    onclick="reseC()"><i class="fa-solid fa-arrows-rotate"></i></button>
                                            </div>
                                            <div class="col-md-9 col-12">
                                                <div class="mb-1">
                                                    <div class="input-group">
                                                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                                                        <input type="text" class="form-control"id="csearch"  placeholder="Search">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Date Debut</th>
                                                <th>Date Fin</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="ccr">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Monuments</h4>
                                </div>
                                <div class="card-body">
                                    <form class="form" id="mform">
                                        <div class="row">
                                            <div class="col-md-3 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="nom">Nom</label>
                                                    <input type="text" id="nom" class="form-control"
                                                        placeholder="Nom de Createur" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="lat">Lattitude</label>
                                                    <input type="number" id="lat" class="form-control" step="any" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="lng">Longitude</label>
                                                    <input type="number" id="lng" class="form-control" step="any" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="rank">Rank</label>
                                                    <input type="number" id="rank" class="form-control" step=".1"
                                                        value="0" readonly />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="ov">Ouvert</label>
                                                    <input type="time" id="ov" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="fer">Fermer</label>
                                                    <input type="time" id="fer" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="desc">Description</label>
                                                    <textarea rows="1" id="desc" class="form-control"
                                                        placeholder="Description de Createur"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="zone">Zone</label>
                                                    <select id="zone" class="form-control">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="type">Type</label>
                                                    <select id="type" class="form-control">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="cre">Createur</label>
                                                    <select id="cre" class="form-control">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="db">Date Creation</label>
                                                    <input type="date" id="dtc" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="mb-1">
                                                    <label class="form-label" for="week">Weekend</label>
                                                    <input class="form-check-input d-block" type="checkbox"
                                                        id="week" value="checked" checked />
                                                </div>
                                            </div>

                                            <div class="col-md-3 col-12">
                                               
                                                    <button type="button" class="btn btn-primary me-1"
                                                        onclick="addMonument()" id="mbtn"><i class="fa-solid fa-plus"></i></button>
                                                    <button type="reset" class="btn btn-outline-secondary"
                                                        onclick="reseM()"><i class="fa-solid fa-arrows-rotate"></i></button>
                                                
                                            </div>
                                            <div class="col-md-9 col-12">
                                                <div class="mb-1">
                                                    <div class="input-group">
                                                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                                                        <input type="text" class="form-control"id="msearch"  placeholder="Search">
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Ville</th>
                                                <th>Zone</th>
                                                <th>Rank</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="cmon">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <script>
                let monumentObjects = null
                let creatorObjects = null
                let currentCreator = null
                let currentMonument = null
                $(document).ready(function () {

                    loadCreators()
                    loadTypes()
                    loadZones()
                    loadMonuments()

                });

                document.getElementById("msearch").addEventListener("keyup",(e)=>{
                  let val = e.target.value.toLowerCase()
                    let monuments = monumentObjects.filter(elem => {
                        return elem.nom.toLowerCase().includes(val) || elem.zone.nom.toLowerCase().includes(val) || elem.zone.ville.nom.toLowerCase().includes(val)
                    })

                    injMonuments(monuments)
                })
                
                document.getElementById("csearch").addEventListener("keyup",(e)=>{
                  let val = e.target.value.toLowerCase()
                    let creators = creatorObjects.filter(elem => {
                        return elem.nom.toLowerCase().includes(val)
                    })

                   injCreators(creators)
                })

                function delCreator(arg) {
                    let vid = parseInt(arg.parentNode.querySelectorAll("span")[0].innerText)
                    $.ajax({
                        url: "CreatorController",
                        data: { op: "del", id: vid },
                        method: "POST",
                        success: function (data) {
                            loadCreators()
                        },
                        statusCode: {
                            500: function () {
                                alert("Createur est affecter a un Monument");
                            }
                        },

                    });


                    $("#cform")[0].reset()
                    reseC()

                }
                function reseM() {
                    currentMonument = null
                    document.getElementById('mbtn').innerHTML = '<i class="fa-solid fa-plus"></i>'
                    $('#rank').prop('readonly', true);
                }
                function reseC() {
                    currentMonument = null
                    document.getElementById('cbtn').innerHTML =  '<i class="fa-solid fa-plus"></i>'
                }
                function getCInfos(arg) {
                    let id = parseInt(arg.parentNode.querySelectorAll("span")[0].innerText)
                    let creators = creatorObjects.filter(e => {
                        return e.id === id
                    })
                    currentCreator = creators[0];
                    document.getElementById('cbtn').innerHTML = '<i class="fas fa-save"></i>'

                    document.getElementById('nomC').value = currentCreator.nom
                    document.getElementById('descC').value = currentCreator.description
                    document.getElementById('db').value = formatDate(currentCreator.dateDebut)
                    document.getElementById('df').value = formatDate(currentCreator.dateFin)



                }
                function getMInfos(arg) {
                    let id = parseInt(arg.parentNode.querySelectorAll("span")[0].innerText)
                    let monuments = monumentObjects.filter(e => {
                        return e.id === id
                    })
                    currentMonument = monuments[0]
                    document.getElementById('mbtn').innerHTML = '<i class="fas fa-save"></i>'
                    $('#rank').prop('readonly', false);
                    document.getElementById('nom').value = currentMonument.nom
                    document.getElementById('desc').value = currentMonument.description
                    document.getElementById('lat').value = currentMonument.latitude
                    document.getElementById('lng').value = currentMonument.longitude
                    document.getElementById('type').value = currentMonument.type.id
                    document.getElementById('zone').value = currentMonument.zone.id
                    document.getElementById('cre').value = currentMonument.creator.id
                    document.getElementById('rank').value = currentMonument.rank
                    document.getElementById('ov').value = currentMonument.heure_open
                    document.getElementById('fer').value = currentMonument.heure_close
                    document.getElementById('dtc').value = formatDate(currentMonument.dateCreation)
                    document.getElementById('week').checked = currentMonument.week

                }
                function formatDate(date) {
                    var d = new Date(date),
                        month = '' + (d.getMonth() + 1),
                        day = '' + d.getDate(),
                        year = d.getFullYear();

                    if (month.length < 2)
                        month = '0' + month;
                    if (day.length < 2)
                        day = '0' + day;

                    return [year, month, day].join('-');
                }
                function delMonument(arg) {
                    let vid = parseInt(arg.parentNode.querySelectorAll("span")[0].innerText)
                    $.ajax({
                        url: "MonumentController",
                        data: { op: "del", id: vid },
                        method: "POST",
                        success: function (data) {
                            loadMonuments()
                        },
                        statusCode: {
                            500: function () {
                                alert("Monument est affecter a des photos");
                            }
                        },

                    });

                    $("#mform")[0].reset()
                    reseM()

                }

                function addMonument() {
                    if (currentMonument) {
                        let nom = document.getElementById('nom').value
                        let desc = document.getElementById('desc').value
                        let lat = document.getElementById('lat').value
                        let lng = document.getElementById('lng').value
                        let type = document.getElementById('type').value
                        let zone = document.getElementById('zone').value
                        let cre = document.getElementById('cre').value
                        let rank = document.getElementById('rank').value
                        let ov = document.getElementById('ov').value
                        let fer = document.getElementById('fer').value
                        let dtc = document.getElementById('dtc').value
                        let week = document.getElementById('week').checked
                        if (nom && lat && lng && dtc) {
                            $.ajax({
                                url: "MonumentController",
                                data: {
                                    op: "edit", id: currentMonument.id, nom: nom, desc: desc, lat: lat, lng: lng,
                                    type: type, zone: zone, cre: cre, rank: rank,
                                    ov: ov, fer: fer, week: week, dtc: dtc
                                },
                                method: "POST",
                                success: function (data) {
                                    loadMonuments()
                                },
                            });
                        }
                    }
                    else {
                        let nom = document.getElementById('nom').value
                        let desc = document.getElementById('desc').value
                        let lat = document.getElementById('lat').value
                        let lng = document.getElementById('lng').value
                        let type = document.getElementById('type').value
                        let zone = document.getElementById('zone').value
                        let cre = document.getElementById('cre').value
                        let rank = document.getElementById('rank').value
                        let ov = document.getElementById('ov').value
                        let fer = document.getElementById('fer').value
                        let dtc = document.getElementById('dtc').value
                        let week = document.getElementById('week').checked
                        if (nom && lat && lng && dtc) {
                            $.ajax({
                                url: "MonumentController",
                                data: {
                                    op: "add", nom: nom, desc: desc, lat: lat, lng: lng,
                                    type: type, zone: zone, cre: cre, rank: rank,
                                    ov: ov, fer: fer, week: week, dtc: dtc
                                },
                                method: "POST",
                                success: function (data) {
                                    loadMonuments()
                                },
                            });
                        }
                    }

                    $("#mform")[0].reset()
                    reseM()
                }

                function loadMonuments() {
                    $.ajax({
                        url: "MonumentController",
                        data: { op: "load" },
                        method: "POST",
                        success: function (data) {
                            if (data) {
                                monumentObjects = JSON.parse(JSON.stringify(data))
                                injMonuments(data)
                            }


                        }
                    });
                }

                function addCreator() {
                    if (currentCreator) {
                        let nom = document.getElementById('nomC').value
                        let desc = document.getElementById('descC').value
                        let db = document.getElementById('db').value
                        let df = document.getElementById('df').value
                        if (nom && db && df) {
                            $.ajax({
                                url: "CreatorController",
                                data: { op: "edit",id:currentCreator.id, nom: nom, desc: desc, db: db, df: df },
                                method: "POST",
                                success: function (data) {
                                    loadCreators()
                                }
                            });
                        }
                    }
                    else {
                        let nom = document.getElementById('nomC').value
                        let desc = document.getElementById('descC').value
                        let db = document.getElementById('db').value
                        let df = document.getElementById('df').value
                        if (nom && db && df) {
                            $.ajax({
                                url: "CreatorController",
                                data: { op: "add", nom: nom, desc: desc, db: db, df: df },
                                method: "POST",
                                success: function (data) {
                                    loadCreators()
                                }
                            });
                        }
                    }

                    $("#cform")[0].reset()
                    reseC()
                }

                function loadCreators() {
                    $.ajax({
                        url: "CreatorController",
                        data: { op: "load" },
                        method: "POST",
                        success: function (data) {
                            if (data) {
                                creatorObjects = JSON.parse(JSON.stringify(data))
                                injCreators(data)
                                selectC(data)
                            }

                        }
                    });
                }

                function injMonuments(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<tr><td>' + e.nom + '</td><td>' + e.zone.ville.nom + '</td><td>' + e.zone.nom + '</td><td>' + e.rank + '</td><td><span style="display: none;">' + e.id + '</span><a class="btn btn-primary" onclick="getMInfos(this)" ><i class="fas fa-edit"></i></a>&nbsp;<a class="btn btn-danger" onclick="delMonument(this)" ><i class="fa-solid fa-trash"></i></a></td></tr>'
                    });

                    $("#cmon").html(ligne);

                }

                function injCreators(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<tr><td>' + e.nom + '</td><td>' + e.dateDebut.split(',')[0] + ', ' + e.dateDebut.split(',')[1] + '</td><td>' + e.dateFin.split(',')[0] + ', ' + e.dateFin.split(',')[1] + '</td><td><span style="display: none;">' + e.id + '</span><a class="btn btn-primary mb-1" onclick="getCInfos(this)" ><i class="fas fa-edit"></i></a>&nbsp;<a class="btn btn-danger" onclick="delCreator(this)" ><i class="fa-solid fa-trash"></i></a></td></tr>'
                    });

                    $("#ccr").html(ligne);

                }


                function selectT(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<option value="' + e.id + '">' + e.libelle + '</option>'
                    });

                    $("#type").html(ligne);

                }
                function selectC(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<option value="' + e.id + '">' + e.nom + '</option>'
                    });

                    $("#cre").html(ligne);

                }
                function selectZ(data) {
                    var ligne = "";
                    data.forEach(e => {
                        console.log(e)
                        ligne += '<option value="' + e.id + '">' + e.ville.nom + '-' + e.nom + '</option>'
                    });

                    $("#zone").html(ligne);

                }





                function loadTypes() {
                    $.ajax({
                        url: "TypeController",
                        data: { op: "load" },
                        method: "POST",
                        success: function (data) {
                            console.log(data)
                            selectT(data)

                        }
                    });
                }

                function loadZones() {
                    $.ajax({
                        url: "ZoneController",
                        data: { op: "load" },
                        method: "POST",
                        success: function (data) {
                            console.log(data)
                            selectZ(data)

                        }
                    });
                }

            </script>
            <!-- END: Content-->
            <%@include file="source/includes/footer.jsp" %>