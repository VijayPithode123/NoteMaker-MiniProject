<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.SessionFactory" %>
 <%@ page import="org.hibernate.Session" %>
  <%@ page import="org.hibernate.Transaction" %>
 <%@ page import="java.util.*"%>
 <%@ page import="com.entities.*" %>
 <%@ page import="com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit page here</title>
</head>
<body>

	<div class="container">
    <%@ include file="navbar.jsp" %>
    <%@ include file="all_js_css.jsp" %>
    
    <%
	String note_Id=request.getParameter("note_id");
	int id=Integer.parseInt(note_Id);
	SessionFactory factory=FactoryProvider.getSessionFactory();
	Session s1=factory.openSession();
	
//	Permanantly change database Transaction
	
	//Transaction tx=s1.beginTransaction();
	
	Note note=(Note)s1.get(Note.class, id);

	%>
     
    <h2>This is edit Page</h2>
   <br> 
    
     <form action="UpdateServlet" method="post">
     <input  value="<%=note.getId()%>" name="note_id" type="hidden">
  <div class="mb-3">
    <label for="title" class="form-label">Note Title</label>
    <input required  type="text" name="title" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Note Title" value="<%=note.getTitle()%>">
    </div>
  <div class="mb-3">
    <label for="content"  class="content">Enter Your Content</label>
    <textarea required class="form-control row='5'" name="content" id="content1" placeholder="Please Write Your Content" style="height:200px" ><%= note.getContent()%></textarea>
  </div>
  <p ><b class="text-primary" value="date"><%=note.getAddDate()%></b><p>
  <div class="container text-center">
  	<button type="submit" class="btn btn-success">Save & Update</button>
  </div>
  
</form>
	
    </div>
 
 
 
 
   
</body>
</html>