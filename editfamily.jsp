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
	color: #CCCCCC;
}
body {
	background-color: #0033CC;
	background-image:url(images/bg.jpg)
}
.style3 {color: #CCCCCC}
-->
</style>
</head>

<body>
 <%@ include file="adminmenu.html" %>
<p>
  
  <%@ include file="db.jsp" %>
<a href="AdminLogin.html" target="_parent">
<input name="button" type="button" value="Back" />
</a></p>
<p align="center" class="style1">Family Details  </p>
<table width="auto" border="1" align="center">
  <tr bgcolor="#000033">
    <td ><span class="style3">Service No </td>
   
    <td ><span class="style3">Department</span></td>
    <td ><span class="style3">DOB</span></td>
    <td ><span class="style3">Gender</span></td>
	 <td ><span class="style3">RelationShip</span></td>
	  <td ><span class="style3">Address</span></td>
	   <td ><span class="style3">ID</span></td>
	    <td ><span class="style3"></span></td>
  </tr>
  <% 
  rst=stmt.executeQuery("select * from family");
  while(rst.next()){
  
   %>
   <form action="" method="post">
  <tr>
    <td><input name="of1" type="text" value="<%= rst.getString(1)%>" required /></td>
    <td><input name="of2" type="text" value="<%= rst.getString(2) %>" size="5" required/></td>
    <td><input name="of3" type="text" value="<%= rst.getString(3) %>" required/></td>
    <td><input name="of4" type="text" value="<%= rst.getString(4) %>" size="10" required/></td>
    <td><input name="of5" type="text" value="<%= rst.getString(5) %>"    required /></td>
	<td><input name="of6" type="text" value="<%= rst.getString(6) %>" size="10"    required /></td>
	<td><input name="of7" type="text" value="<%= rst.getString(7) %>" size="8" readonly="true"   required /></td>
	
	
    <td width="186"><input name="update" type="submit" id="update" value="Update" />
      <input name="delete" type="submit" id="delete" value="delete" /></td>
  </tr>
  </form>
  <% } %>
</table>
<p>&nbsp;</p>
<% 
if(request.getParameter("update")!=null){

int x=stmt.executeUpdate("update family set SERV_NUMBER='"+request.getParameter("of1")+"',DEP_NAME='"+request.getParameter("of2")+"',DOB='"+request.getParameter("of3")+"',Gender='"+request.getParameter("of4")+"',Relationship='"+request.getParameter("of5")+"',Address='"+request.getParameter("of6")+"' where id='"+request.getParameter("of7")+"'");

if(x!=0){
%>
<script> alert("officer Updated successfully");
window.open("editfamily.jsp","_self");</script>
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

int x=stmt.executeUpdate("delete from family where id='"+request.getParameter("of7")+"'");

if(x!=0){
%>
<script> alert("officer deleted successfully");
		window.open("editfamily.jsp","_self");
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
