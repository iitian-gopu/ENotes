<%@page import="com.User.UserNotes" %>
	<%@page import="java.util.List" %>
		<%@page import="com.DAO.NoteDAO" %>
			<% UserDetails userDetails1=(UserDetails) session.getAttribute("userDetails"); if (userDetails1==null) {
				session.setAttribute("Login-error", "Please login first to see all notes..." );
				response.sendRedirect("login.jsp"); } %>
				<!doctype html>
				<%@page import="com.Db.DBConnection" %>
					<%@page import="java.sql.Connection" %>
						<html lang="en">

						<head>
							<meta charset="utf-8">
							<meta name="viewport" content="width=device-width, initial-scale=1">
							<link href="stylesheets/index.css" type="text/css" rel="stylesheet" />
							<link href="stylesheets/showNotes.css" type="text/css" rel="stylesheet" />

							<!-- add icon link -->
							<link rel="icon" href="pictures/title_logo2.png" type="image/x-icon">
							<title>Add new note | ENotes</title>
						</head>

						<body>
							<%@include file="common_content/navbar.jsp" %>

								<% String noteEvent=(String) session.getAttribute("EventOnNote"); if (noteEvent !=null)
									{ %>

									<div class="alert alert-info" role="alert">
										<%=noteEvent%>
									</div>
									<% session.removeAttribute("EventOnNote"); } %>

										<!-- Main body -->
										<% if (userDetails1 !=null) { %>

											<div class="container-fluid p-0 mt-3">
												<h1>
													All notes by: <span class="text-info">
														<%=userDetails1.getName().toUpperCase()%>
													</span>
												</h1>
												<p>Feel free to edit and delete any of them, they are all your</p>
												<div class="masonry">
													<% NoteDAO theirNotes=new NoteDAO(DBConnection.getCon());
														List<UserNotes> notes =
														theirNotes.getNotes(userDetails1.getId());
														for (UserNotes i : notes) {
														%>
														<div class="item">
															<div>
																<img alt="Everything is secure, just save and feel free"
																	src="pictures/note_img.png">
																<p class="fw-bold pt-2">
																	<%=i.getTitle()%>
																</p>
																<hr>
																<p>
																	<%=i.getContent()%>
																</p>
															</div>
															<hr>
															<p>
																<!-- Url rewritting concept used -->
																<a href="editNote.jsp?note_id=<%=i.getId()%>"
																	class="btn btn-primary btn-lg px-3 py-1 fs-6"
																	role="button" aria-pressed="true">Edit</a>
																<a href="DeleteNoteServlet?note_id=<%=i.getId()%>&uid=<%=userDetails1.getId()%>"
																	class="btn btn-secondary btn-lg px-3 py-1 fs-6"
																	role="button" aria-pressed="true">Delete</a>
															</p>
															<div style="float: right;">
																<span class="text-muted">last modified date: </span>
																<%=i.getDt()%>
															</div>
														</div>
														<% } %>
												</div>
												<div class="text-center">
													<a href="addNotes.jsp"
														class="btn btn-outline-success text-center mb-3 mx-auto px-4 fs-4">Add
														Note</a>
												</div>
											</div>

											<% } %>

												<%@include file="common_content/footer.jsp" %>
													<script
														src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
													<script
														src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
						</body>

						</html>