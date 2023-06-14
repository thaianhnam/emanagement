<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col mt-4">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="videoEditing-tab"
				data-toggle="tab" data-target="#videoEditing" type="button"
				role="tab" aria-controls="videoEditing" aria-selected="true">Favorites</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="videoList-tab" data-toggle="tab"
				data-target="#videoList" type="button" role="tab"
				aria-controls="videoList" aria-selected="false">Favorite
				User</button>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEditing"
			role="tabpanel" aria-labelledby="videoEditing-tab">
			<table class="table table-bordered mt-3">
				<tr>
					<td>Video Title</td>
					<td>Favorites Count</td>
					<td>Lasted Date</td>
					<td>Oldest Date</td>
				</tr>
				<c:forEach var="item" items="${favList }">
				<tr>
					<td>${item.videoTitle }</td>
					<td>${item.favoriteCount }</td>
					<td>${item.newestDate }</td>
					<td>${item.oldestDate }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="tab-pane fade" id="videoList" role="tabpanel"
			aria-labelledby="videoList-tab">
			<form action="/EManagement/ReportsManagement" method="get">
				<div class="mt-3">
					<div class="col">
						<div class="form-inline">
							<div class="form-group">
								<label> Video Title 
								<select name="videoUserId" id="videoUserId"
									class="form-control ml-3">
									<c:forEach var="item" items="${vidList }">
										<option  value="${item.videoId }" ${item.videoId == videoUserId?'selected':'' }>${item.title }</option>
									</c:forEach>
								</select>
								</label>
								<button class="btn btn-info ml-2">Report</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col mt-3">
							<table class="table table-bordered">
								<tr>
									<td>Username</td>
									<td>Fullname</td>
									<td>Email</td>
									<td>Favorite Date</td>
								</tr>
								<c:forEach var="item" items="${favUsers }">
								<tr>
									<td>${item.username }</td>
									<td>${item.fullname }</td>
									<td>${item.email }</td>
									<td>${item.likeDate }</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
		
	</div>
</div>