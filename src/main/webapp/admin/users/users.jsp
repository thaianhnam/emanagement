<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col mt-4">
	<jsp:include page="/common/inform.jsp"></jsp:include>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="videoEditing-tab"
				data-toggle="tab" data-target="#videoEditing" type="button"
				role="tab" aria-controls="videoEditing" aria-selected="true">User
				Editing</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="videoList-tab" data-toggle="tab"
				data-target="#videoList" type="button" role="tab"
				aria-controls="videoList" aria-selected="false">User List</button>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEditing"
			role="tabpanel" aria-labelledby="videoEditing-tab">
			<form action="" method="post">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<div class="form-group">
									<label for="username">Username</label> <input
										value="${user.username }" type="text" class="form-control"
										name="username" id="username" aria-describedby="usernameHid"
										placeholder="Username"> <small id="usernameHid"
										class="form-text text-muted">Username is required</small>
								</div>
								<div class="form-group">
									<label for="fullname">Fullname</label> <input ${user.fullname }
										type="text" class="form-control" name="fullname" id="fullname"
										aria-describedby="fullnameHid" placeholder="Fullname">
									<small id="fullnameHid" class="form-text text-muted">Fullname
										is required</small>
								</div>
								<div class="form-group">
									<label for="role">Role:</label> <select class="form-control"
										id="role" name="admin">
										<option value="true">Admin</option>
										<option value="false">User</option>
									</select>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="password">Password</label> <input type="password"
										class="form-control" name="password" id="password"
										aria-describedby="passwordHid" placeholder="Password">
									<small id="passwordHid" class="form-text text-muted">Password
										is required</small>
								</div>
								<div class="form-group">
									<label for="email">Email</label> <input ${user.email }
										type="text" class="form-control" name="email" id="email"
										aria-describedby="emailHid" placeholder="Email"> <small
										id="emailHid" class="form-text text-muted">Email is
										required</small>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted">
						<button class="btn btn-primary"
							formaction="Admin/UsersManagement/create">Create</button>
						<button class="btn btn-warning"
							formaction="Admin/UsersManagement/update">Update</button>
						<button class="btn btn-danger"
							formaction="Admin/UsersManagement/delete">Delete</button>
						<button class="btn btn-info"
							formaction="Admin/UsersManagement/reset">Reset</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videoList" role="tabpanel"
			aria-labelledby="videoList-tab">
			<table class="table table-bordered mt-3">
				<tr>
					<td>Username</td>
					<td>Fullname</td>
					<td>Email</td>
					<td>Role</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach var="item" items="${users }">
					<tr>
						<td>${item.username }</td>
						<td>${item.fullname }</td>
						<td>${item.email }</td>
						<td>${item.admin? 'Admin':'User' }</td>
						<td><a
							href="Admin/UsersManagement/edit?username=${item.username }"><i
								class="fa fa-edit" aria-hidden="true"></i>Edit</a> <a
							href="Admin/UsersManagement/delete?username=${item.username }"><i
								class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>