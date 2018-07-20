<%@ include file="/WEB-INF/views/includes/includes.jsp"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Gestion du Stock</title>

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
<!-- DataTables CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

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
							<fmt:message code="common.users" />
						</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>

				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li><a href="<c:url value="/users/ajoutUser" />"><i
									class="fa fa-plus">&nbsp;<fmt:message code="common.ajouter" /></i></a></li>

						</ol>
					</div>
				</div>
				<!-- /.row -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th><fmt:message code="common.nom" /></th>
								<th>Prénom</th>
								<th><fmt:message code="common.mailUsers" /></th>
								<th><fmt:message code="common.pwd" /></th>
								<th><fmt:message code="common.nameRole" /></th>
								<th><fmt:message code="common.activated" /></th>
								<th><fmt:message code="common.actions" /></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${utilisateurs }" var="utilisateur">
								<tr class="odd gradeX">

									<td>${utilisateur.getNom() }</td>
									<td>${utilisateur.getPrenom() }</td>
									<td>${utilisateur.getMail() }</td>
									<td>${utilisateur.getMotDePasse() }</td>
									<td>${utilisateur.getNameRole() }</td>
									<td>${utilisateur.isActived() }</td>
									<td>
										<li><c:url
												value="/users/modifier/${utilisateur.getIdUtilisateur() }"
												var="urlModif" /> <a href="${urlModif }"> <i
												class="fa fa-edit">&nbsp;<fmt:message
														code="common.modifier" /></i></a></li>
										<li><c:url
												value="/users/supprimer/${utilisateur.getIdUtilisateur() }"
												var="urlRemove" /> <a href="${urlRemove }"> <i
												class="fa fa-trash-o">&nbsp;<fmt:message
														code="common.supprimer" /></i></a></li>

									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<!-- /.table-responsive -->


				</div>
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

	<script
		src="<%=request.getContextPath()%>/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

</body>

</html>
