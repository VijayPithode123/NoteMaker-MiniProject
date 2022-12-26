<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ page import="org.hibernate.SessionFactory" %>
 <%@ page import="org.hibernate.Session" %>
 <%@ page import="org.hibernate.Query" %>
 <%@ page import="java.util.*"%>
 <%@ page import="com.entities.Note" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show all notes</title>


 <%@ include file="all_js_css.jsp" %>
</head>
<body>
		<div class="container">
		<%@ include file="navbar.jsp" %>
		<br>
		<h1 class="text-uppercase">All notes:</h1>
		
		<div class="row">
		<div class="col-12">
		
		<%
				SessionFactory factory=FactoryProvider.getSessionFactory();
				Session s=factory.openSession();
			Query q=	s.createQuery("from Note");
			List<Note> list=q.list();
			for(Note l:list)
			{
		%>
				<!--out.println(l.getTitle()+"   "+l.getContent()+"<br>");  -->
				<div class="card mt-4" ">
				<img src="Image/pencil.png " class="card-img-top  m-4 mx-auto"  style="max-width: 100px" class="card-img-top" alt="...">   
				  <div class="card-body px-5 mt-3">
				    <h5 class="card-title"><%= l.getTitle() %></h5>
				    <p class="card-text"><%= l.getContent() %></p>
				    <div class="container text-center ">
				    <a href="DeleteServlet?note_id=<%= l.getId() %>" class="btn btn-danger">Delete</a>
				    
				    <a href="edit.jsp?note_id=<%=l.getId() %>" class="btn btn-primary">Update</a>
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