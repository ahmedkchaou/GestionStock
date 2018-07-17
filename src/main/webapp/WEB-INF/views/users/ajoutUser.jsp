<%@ include file="/WEB-INF/views/includes/includes.jsp"%>
<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Gestion des employées</title>

<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/resources/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">

			<%@ include file="/WEB-INF/views/menu_top/topMenu.jsp"%>

			<!-- /.navbar-top-links -->

			<%@ include file="/WEB-INF/views/menu_left/leftMenu.jsp"%>
			<!-- /.navbar-static-side -->
		</nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							<fmt:message code="user.nouveau" />
						</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<!-- Formulaire User -->
				<c:url value="/users/enregistrer" var="urlEnregistrer" />
				<f:form modelAttribute="utilisateurs" action="${urlEnregistrer }"
					role="form">

					<f:hidden path="idUtilisateur" />
					<f:hidden path="photo" />

					<div class="form-group">
						<label>Nom</label>
						<f:input path="nom" class="form-control" placeholder="Enter nom" />
					</div>
					<div class="form-group">
						<label>Prenom</label>
						<f:input path="prenom" class="form-control"
							placeholder="Enter prenom" />
					</div>
					<div class="form-group">
						<label>E-mail</label>
						<f:input path="mail" class="form-control"
							placeholder="Enter e-mail" />
					</div>

					<div class="form-group">
						<label>Mot de passe</label>
						<f:input path="motDePasse" type="password" class="form-control"
							placeholder="Enter mot de passe" />
					</div>
					<div class="form-group">
						<label>Roles</label> 
						<f:select path="nameRole" class="form-control">
							<f:option value="ROLE_ADMIN">ROLE_ADMIN</f:option>
							<f:option value="ROLE_USER">ROLE_USER</f:option>

						</f:select>
					</div>
					
					<div class="form-group">
						<label>Activated</label> 
						<f:select path="actived" class="form-control">
							<f:option value="1">True</f:option>
							<f:option value="0">False</f:option>

						</f:select>
					</div>


					<f:button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#exampleModalCenter">Valider</f:button>
					<f:button type="reset" class="btn btn-default">Annuler</f:button>


					<!-- Modal -->
					<div class="modal fade" id="exampleModalCenter" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">Confirmation</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<fmt:message code="user.confirm.add.msg" />
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Annuler</button>
									<button type="submit" class="btn btn-primary">Confirmer</button>
								</div>
							</div>
						</div>
					</div>

				</f:form>

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/sb-admin-2.js"></script>

</body>

</html>
