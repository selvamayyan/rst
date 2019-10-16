<%@ Page Language="C#" AutoEventWireup="true" CodeFile="css.aspx.cs" Inherits="ado_css" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
   
    <style type="text/css">
        
  #navMenu
     {
      margin:0;
      padding:0;
     }
     
    
     
  #navMenu ul
     {
       margin:0;
      padding:0;
      line-height:30px;
     }
     
  #navMenu li
     {
      margin:01;
      padding:0;
      list-style:none;
      float:left;
      position:relative;
     background-color:#999;
     }
     
 #navMenu ul li a
 {
	text-align:center;
	font-family:"Comic Sans MS",Cursive;
	text-decoration:none;
	height:30px;
	width:150px;
	display:block;
	color:#FFF;
	border:1px solid #FFF;
	
 }

 #navMenu ul ul
 {
	position:absolute;
	visibility:hidden;
	top:30px;
 }
 
#navMenu ul li:hover ul
{
	visibility:visible;
}
    
    
#navMenu li:hover
{
	background:#09f;
}
  
  #navMenu ul li:hover ul li a:hover
{
	background:#CCC;
	color:#000;
}  
     
 #navMenu a:hover
{
	color:#000;
}
    
    .ClearFloat
    {
		clear:both;
		margin:0;
		padding:0;
		
    }
    
   

    </style>   
    
</head>
<body >
    <form id="form1"  runat="server">
    
    
 <table style="border:0" cellpadding="0" cellspacing="0">
  <tr> 
  <td>
  <div id ="wrapper" >
    <div id ="navMenu">
    <ul >
     <li><a href="#">HOME</a>
       <ul>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
       </ul> 
    </li>
   </ul>
   
   <ul>
     <li><a href="#">MEN</a>
       <ul>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
       </ul> 
    </li>
   </ul>
   
   <ul>
     <li><a href="#">WOMEN</a>
       <ul>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
       </ul> 
    </li>
   </ul>
   
   <ul>
     <li><a href="#">KIDS</a>
       <ul>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
       </ul> 
    </li>
   </ul>
   
   <ul>
     <li><a href="#">PREMIUM</a>
       <ul>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
       </ul> 
    </li>
   </ul>
   
    <ul>
     <li><a href="#">DEALS</a>
       <ul>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
         <li><a href="#">List Item</a></li>
       </ul> 
    </li>
   </ul>
      
    <br class= "ClearFloat"/>
    </div><!--End of Novmenu-->
    </div><!--End of wrapper-->
  
  </td>
  
 
  <td>
  
      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
      <asp:Button ID="Button1" runat="server" Text="Search" />
  </td>
  
  </tr>
  
  
    
    
    
    </table>
  
  
    </form>
</body>
</html>
