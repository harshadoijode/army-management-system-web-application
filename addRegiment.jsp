<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="Style_button_text.css" type="text/css" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {
	color: #FFFF00;
	font-weight: bold;
}
body,td,th {
	color: #FFFF00;
	font-family: Georgia, Times New Roman, Times, serif;
	font-weight: bold;
}
body {
	background-color: #0033FF;
	background-image:url(images/bg.jpg)
}
.style2 {color: #000000}
.style3 {color: #CCCCCC}
-->
</style>




</head>

<body>
 <%@ include file="adminmenu.html" %>
<p>
 
  <%@ include file="db.jsp" %>
  <a href="AdminLogin.html" target="_parent">
<input type="button" value="Back" /></a>
</p>
<p align="center" class="style1">Add new Regiments</p>
<div style="margin-left:30%; margin-right:30%; background-color:#999999; border-radius:20px;">
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <table width="auto" border="0" align="center">
   <tr>
      <td ><span class="style2">REGIMENT_NAME </span></td>
      <td ><input name="of1" type="text" id="of1" required="required"/></td>
    </tr>
	 <tr>
      <td ><span class="style2">CENTER </span></td>
      <td ><input name="of2" type="text" id="of2" required/>      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="Submit" onclick="return validate()" />
        <input type="reset" name="Submit2" value="Reset" /></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</div>
<% 
if(request.getParameter("Submit")!=null){

int x=stmt.executeUpdate("insert into regiment(REGIMENT_NAME,CENTER) values('"+request.getParameter("of1")+"','"+request.getParameter("of2")+"')");


if(x!=0){
%>
<script> alert("Regiment added to database successfully");
window.open("addRegiment.jsp","_self");
</script>
<%
}else{
%>
<script> alert("fail to add family");</script>
<%
}
}




 %>
 
 
 
 
 
 <p align="center" class="style1">Regiments Details  </p>
 <table width="auto" border="1" align="center">
  <tr bgcolor="#000033">
    <td ><span class="style3">REGIMENT_NAME  </td>
   
    <td ><span class="style3">Center</span></td>
    <td ><span class="style3">Regiment ID</span></td>
   
  </tr>
  <% 
  rst=stmt.executeQuery("select * from regiment");
  while(rst.next()){
  
   %>
   <form action="" method="post">
  <tr>
    <td><input name="of1" type="text" value="<%= rst.getString(1)%>" required /></td>
    <td><input name="of2" type="text" value="<%= rst.getString(2) %>" size="5" required/></td>
    
	<td><input name="of3" type="text" value="<%= rst.getString(3) %>" size="8" readonly="true"   required /></td>
	
	
    <td width="186"><input name="update" type="submit" id="update" value="Update" />
      <input name="delete" type="submit" id="delete" value="delete" /></td>
  </tr>
  </form>
  <% } %>
</table>
<p>&nbsp;</p>
<% 
if(request.getParameter("update")!=null){

int x=stmt.executeUpdate("update regiment set REGIMENT_NAME='"+request.getParameter("of1")+"',CENTER='"+request.getParameter("of2")+"' where id='"+request.getParameter("of3")+"'");

if(x!=0){
%>
<script> alert("Regiment Updated successfully");
window.open("addRegiment.jsp","_self");</script>
<%

}else{
%>
<script> alert("fail to add officer");</script>
<%
}
}
%>
<% 
if(request.getParameter("delete")!=null){

int x=stmt.executeUpdate("delete from regiment where id='"+request.getParameter("of3")+"'");

if(x!=0){
%>
<script> alert("regiment deleted successfully");
		window.open("addRegiment.jsp","_self");
</script>
<%

}else{
%>
<script> alert("fail to delete family");</script>
<%
}
}




 %>

 
</body>
</html>
