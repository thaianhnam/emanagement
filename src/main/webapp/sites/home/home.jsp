<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col">
	<div class="row p-2">
		<c:forEach var="item" items="${videos }">
			<div class="col-3 mt-2">
				<div class="card text-center">
					<div class="card-body">
						<img
							src="${ empty item.poster ? 'images/desktop.png': item.poster }"
							width="90%" height="90%" alt="" class="img-fluid">
						<div class="row border-top mt-2">
							<b>${item.title }</b>
						</div>
					</div>
					<div class="card-footer">
						<a href="LikeVideo?videoId=${item.videoId }"
							class="btn btn-success">Like</a> <a
							href="ShareVideo?videoId=${item.videoId }" class="btn btn-info">Share</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="row">
		<div class="col">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a class="page-link" href="Homepage?page=${previousPage}" aria-label="Previous"> 
							<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a></li>
					<li class="page-item">
						<a class="page-link" href="Homepage?page=${nextPage}" aria-label="Next"> 
							<span aria-hidden="true">&raquo;</span> 
							<span class="sr-only">Next</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
