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
<p align="center" class="style1">Training Details</p>
<div style="margin-left:30%; margin-right:30%; background-color:#999999; border-radius:20px;">
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <table width="auto" border="0" align="center">
  <tr>
      <td ><span class="style2">TRAINING_TYPE </span></td>
      <td > <input name="of1" type="text" id="of2" required/>     </td>
    </tr>
   <tr>
      <td ><span class="style2">S_NUMBER</span></td>
      <td ><select name="of2">
	  <% 
	  rst=stmt.executeQuery("select * from personnel");
	  while(rst.next()){
	   %>
        <option><%= rst.getString(1) %></option>
		<% } %>
      </select>      </td>
    </tr>
	 <tr>
      <td ><span class="style2">REGI_NAME</span></td>
      <td ><input name="of3" type="text" id="of2" required/>      </td>
    </tr>
    <tr>
      <td><span class="style2">PERIOD</span></td>
      <td><input name="of4" type="number" id="of22" required="required"/>days</td>
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

int x=stmt.executeUpdate("insert into training(TRAINING_TYPE,S_NUMBER,REGI_NAME,PERIOD) values('"+request.getParameter("of1")+"','"+request.getParameter("of2")+"','"+request.getParameter("of3")+"','"+request.getParameter("of4")+"')");


if(x!=0){
%>
<script> alert("training added to database successfully");
window.open("training.jsp","_self");
</script>
<%
}else{
%>
<script> alert("fail to add family");</script>
<%
}
}




 %>
 
 
 
 
 
 <p align="center" class="style1">Training Details  </p>
 <table width="auto" border="1" align="center">
  <tr bgcolor="#000033">
    <td ><span class="style3">TRAINING_TYPE</span></td>
   
    <td ><span class="style3">S_NUMBER</span></td>
    <td ><span class="style3">REGI_NAME</span></td>
   
    <td ><span class="style3">PERIOD</span></td>
    <td ><span class="style3">ID</span></td>
  </tr>
  <% 
  rst=stmt.executeQuery("select * from training");
  while(rst.next()){
  
   %>
   <form action="" method="post">
  <tr>
    <td><input name="of1" type="text" value="<%= rst.getString(1)%>" required /></td>
    <td><input name="of2" type="text" value="<%= rst.getString(2) %>" size="5" required/></td>
    
	<td><input name="of3" type="text" value="<%= rst.getString(3) %>" size="8"    required /></td>
	
	
    <td><input name="of4" type="text" value="<%= rst.getString(4) %>" size="8"   required="required" /></td>
    <td><input name="of5" type="text" value="<%= rst.getString(5) %>" size="8" readonly="true"   required="required" /></td>
    <td width="186"><input name="update" type="submit" id="update" value="Update" />
      <input name="delete" type="submit" id="delete" value="delete" /></td>
  </tr>
  </form>
  <% } %>
</table>
<p>&nbsp;</p>
<% 
if(request.getParameter("update")!=null){

int x=stmt.executeUpdate("update training set TRAINING_TYPE='"+request.getParameter("of1")+"',S_NUMBER='"+request.getParameter("of2")+"',REGI_NAME='"+request.getParameter("of3")+"',PERIOD='"+request.getParameter("of4")+"' where id='"+request.getParameter("of5")+"'");

if(x!=0){
%>
<script> alert("training Updated successfully");
window.open("training.jsp","_self");</script>
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

int x=stmt.executeUpdate("delete from training where id='"+request.getParameter("of5")+"'");

if(x!=0){
%>
<script> alert("training deleted successfully");
		window.open("training.jsp","_self");
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
