<%@ include file="/WEB-INF/views/includes/includes.jsp"%>
<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
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
							<fmt:message code="common.dashbord" />
						</h1>
					</div>
					<!-- /.col-lg-12 -->
					
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
						  <li><a href="<c:url value="/client/nouveau" />" ><i class="fa fa-plus">&nbsp;<fmt:message code="common.ajouter" /></i></a></li>
						  <li><a href="#"><i class="fa fa-download">&nbsp;<fmt:message code="common.exporter" /></i></a></li>
						  <li><a href="#"><i class="fa fa-upload">&nbsp;<fmt:message code="common.importer" /></i></a></li>
						</ol>					
					</div>                
                </div>

					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<fmt:message code="client.liste" />
								</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<table width="100%"
										class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th><fmt:message code="common.photo" /></th>
												<th><fmt:message code="common.nom" /></th>
												<th><fmt:message code="common.prenom" /></th>
												<th><fmt:message code="common.adresse" /></th>
												<th><fmt:message code="common.mail" /></th>
												<th><fmt:message code="common.actions" /></th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${clients }" var = "client">
	                                    <tr class="odd gradeX">
	                                        <td class="center"><img src="${client.getPhoto() }" width="50px" height="50px"/></td>
	                                        <td>${client.getNom() }</td>
	                                        <td>${client.getPrenom() }</td>
	                                        <td>${client.getAdresse() }</td>
	                                        <td>${client.getMail() }</td>
	                                        <td>${client.getMail() }</td>
											</tr>
											</c:forEach>
										
										</tbody>
									</table>
									<!-- /.table-responsive -->
									<div class="well">
										<h4>DataTables Usage Information</h4>
										<p>
											DataTables is a very flexible, advanced tables plugin for
											jQuery. In SB Admin, we are using a specialized version of
											DataTables built for Bootstrap 3. We have also customized the
											table headings to use Font Awesome icons in place of images.
											For complete documentation on DataTables, visit their website
											at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.
										</p>
										<a class="btn btn-default btn-lg btn-block" target="_blank"
											href="https://datatables.net/">View DataTables
											Documentation</a>
									</div>
								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
						</div>
						<!-- /.col-lg-12 -->
					</div>

					<!-- /.row -->
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

		<!-- DataTables JavaScript -->
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
