<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@ include file="all_js_css.jsp" %>
</head>
<body>


    <div class="container  ">
    <%@ include file="navbar.jsp" %>
    <%@ include file="all_js_css.jsp" %>
    <br>
    <h2>Please Fill Your Details</h2>
    
    
    <!--This is adding form  -->
    <form action="SaveNoteServlet" method="post">
  <div class="mb-3">
    <label for="title" class="form-label">Note Title</label>
    <input required  type="text" name="title" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Note Title">
    </div>
  <div class="mb-3">
    <label for="content"  class="content">Enter Your Content</label>
    <textarea required class="form-control row='5'" name="content" id="content1" placeholder="Please Write Your Content" style="height:200px"></textarea>
  </div>
  <div class="container text-center">
  	<button type="submit" class="btn btn-primary">Add Note</button>
  </div>
  
</form>
    
    </div>

</body>
</html>