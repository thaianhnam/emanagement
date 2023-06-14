<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <title>${page.title }</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <base href="/EManagement/">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <main class="container">
    <header class="row pt-5 pb-2">
			<div class="col-9">
				<h1>Online Entertainment</h1>
			</div>
			<div class="col-3 text-right">
				<img src="images/logo.png" alt="" class="mr-4" width="100">
			</div>
		</header>
        <nav class="row">
            <nav class="navbar navbar-expand-sm navbar-light bg-light col">
                <a class="navbar-brand" href="#">Administration</a>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active"><a class="nav-link" href="HomepageAdmin"><i
								class="fa fa-home
                                "
								aria-hidden="true"></i>Home <span class="sr-only">(current)</span></a></li>
                        <li class="nav-item">
                            <a class="nav-link" href="Admin/UsersManagement">
                                <i class="fa fa-info" aria-hidden="true"></i> UsersManagement
                            </a>
                        </li>
                        <div class="nav-item">
                            <a href="Admin/VideosManagement" class="nav-link">
                                <i class="fa fa-id-card" aria-hidden="true"></i> VideosManagement
                            </a>
                        </div>
                        <div class="nav-item">
                            <a href="ReportsManagement" class="nav-link">
                                <i class="fa fa-comments" aria-hidden="true"></i> ReportsManagement
                            </a>
                        </div>
                        <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownId"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
								class="fa fa-user" aria-hidden="true"></i> My Account</a>
							<div class="dropdown-menu" aria-labelledby="dropdownId">
								<c:if test="${isLogin }">
									<a class="dropdown-item" href="Logoff">Logoff</a>
								</c:if>
							</div></li>

                    </ul>

                </div>
            </nav>
        </nav>
        <section class="row">
            <jsp:include page="${page.contentUrl }"></jsp:include>
        </section>
        <footer class="row"></footer>
    </main>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <c:if test="${not empty page.scriptUrl }">
    	<jsp:include page="${page.scriptUrl }"></jsp:include>
    </c:if>
    <script>
        $('#myTab button').on('click', function (event) {
            event.preventDefault()
            $(this).tab('show')
        })
    </script>
</body>

</html>