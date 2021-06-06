<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.helper.*" %>
<%@ page import="com.entities.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes</title>

<%@ include file="all_css_js.jsp" %>

</head>
<body>
<div class="container">

<%@ include file="navbar.jsp" %>
<br>
<h1 class="text-Upper">ALL NOTES</h1>

<div class="row">
<div  class="column">
	<%
		Session s=FactoryProvider.getFactory().openSession();
		Query q= s.createQuery("from Note");
		List<Note> list= q.list();
		for(Note n :list){
	%>
	<div class="card mt-3">
  <img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="images/post-it.png" alt="Card image cap">
  <div class="card-body px-5">
    <h5 class="card-title"><%= n.getTitle() %></h5>
    <p class="card-text"><%= n.getContent() %></p>
    
    <p class="text-primary"><b>Last Edited: <%= n.getAddedDate()%></b></p>
    
    <div class="conatiner text-center mt-2">
    <a href="DeleteServlet?note_id=<%=n.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%=n.getId()%>" class="btn btn-primary">Update</a>
    </div>
    
    
  </div>
</div>
	<%
		}
		s.close();

	%>

</div>


</div>

</div>

</body>
</html>