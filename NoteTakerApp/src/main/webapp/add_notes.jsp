<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>

<%@ include file="all_css_js.jsp" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>


<div class="container">
   <%@ include file="navbar.jsp" %>
   <br> 
   <h1>Fill your Note Details</h1>
   <br>
   
   <!--this is add notes form  -->
   
   <form action= "SaveNoteServlet" method ="post">
  <div class="form-group">
    <label for="title">Note Title</label>
    <input name="title" required type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Here"/>
    
  </div>
  
  
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea name="content" required 
    id="content"
     placeholder="Enter Your Content Here!!"
     class="form-control"
     style="height:300px" 
     ></textarea>
  </div>
  
  <div class="container text-center">
  
  <button type="submit" class="btn btn-primary">Add</button>
  </div>
  
  
</form>

<script>
            $(document).ready(function (e) {
                $('#addNote').submit(function (event) {
                    event.preventDefault(); // Prevent the form from submitting via the browser
                 //   console.log("clicked on submit");
                    let form = $(this);
                 //   console.log(form);
                 //   var form = new FormData(this);
                    $.ajax({
                        url: "SaveNoteServlet",
                        type: 'POST',
                        data: form.serialize(),
                        dataType: "text",
                                success: function (data, textStatus, jqXHR) {
                                 //   console.log(data);
                                    if (data.trim() == 'success')
                                    {
                                        swal("Noted it!", "Add another..?", "success");
                                    } else
                                    {
                                        swal("Error!!", "Something went wrong try again...", "error");
                                    }
                                },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        }
                    });
                });
   </script>
   
   
   </div>
</body>
</html>