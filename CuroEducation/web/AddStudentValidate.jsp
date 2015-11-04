
<%@page import="java.sql.*"%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javafx.scene.input.DataFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@page import="data.DbConnManager" %>


<%
    DbConnManager db = new DbConnManager();
    Connection conn = db.connect();
    Statement stat = conn.createStatement();
   
%>

<html> 
<head> 

</head> 
<body> 
<% 
String v = request.getParameter("value");
String f = request.getParameter("field");

 




if(f.equals("subcat"))
{
   
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from subcategory where CatID='"+v+"'");%>
    <%="<label>Sub-Category</label><br> " %>
    
    <select name="SubCat" id="SubCat" style="width:250px" onchange='JavaScript:xmlhttpVPost("SubCat1","SubCat","AddSparePartsValidate.jsp")'>%>>
        <% while(rs.next()) {%>

        <option value="<%=rs.getString("SubCatID")%>"><%=rs.getString("SubCatName")%></option>
        
        <%}%>
    <%="</select>"%>
    <div class="val" id="SubCat1"></div>
    

  
<%}
if(f.equals("SubCat1"))
{
    if(v.isEmpty())
    {
        %><%="Select a sub category"%><%
    }
    else
    {
        session.setAttribute("SubCatID",v);
    }
}
if(f.equals("course1"))
{
    
   
    ResultSet rs = stat.executeQuery("select * from batch where CourseID='"+v+"'");%>
    <label>Batch</label><br>
    <select name="batch" id="batch" style="width:250px" >
        <% while(rs.next()) {%>
        
        <option value="<%=rs.getString("BatchID")%>"><%=rs.getString("Name")%></option>
        
        <%}%>
    </select>
   
    

  
<%}
if(f.equals("spModel"))
{
    String SubCatID=session.getAttribute("SubCatID").toString();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from spareParts where BModelID='"+v+"' and SubCategory='"+SubCatID+"' ");%>
    <%="<p><label>Spare Part Model</label><br> " %>
    <select name="spmodel" id="spmodel" style="width:250px" onchange='JavaScript:xmlhttpVPost("SelectedItem","spmodel","AddSparePartsValidate.jsp")'>%>
        <% while(rs.next()) {%>
        
        <option value="<%=rs.getString("SparePartID")%>"><%=rs.getString("Name")+" - "%><%=rs.getString("ModelID")%></option>
        
        <%}%>
    <%="</select><p>"%>
   
    

  
<%}

if(f.equals("SelectedItem"))
{
    session.setAttribute("SelectedItem", v);
     
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from spareparts where SparePartID='"+v+"'");%>
     <% while(rs.next()) {%>
    
      <h3 >Selected Item </h3>
      <hr>
      
   <p><b>Model No -</b> <%=rs.getString("ModelID")%> </p>
   <p><b>Name -</b> <%=rs.getString("Name")%> </p>
   <p><b>Shell Number -</b> <%=rs.getString("ShellNo")%> </p>
   <p><b>Sale Price -</b> Rs <%=rs.getString("SalePrice")%> </p>
   <p><b>Purchase Price -</b> Rs <%=rs.getString("PurchasePrice")%> </p>
   <p><b>No Of Items in Stock -</b> <%=rs.getString("Quantity")%> </p>
   
   <% 
      session.setAttribute("price",rs.getString("SalePrice"));
     }%>
   <p ><label>Discount -</label> 
<input  type="number" name="discount" onchange='JavaScript:xmlhttpVPost("discount1","discount","AddSparePartsValidate.jsp")'   size="80" aria-required="true" id="discount" required placeholder="Enter the Discount"></p>

        <div id="discount1"></div>
    
    
<%}
if(f.equals("discount1"))
{
    session.setAttribute("discount",0);
     double price =Double.parseDouble(session.getAttribute("price").toString());
     
    if(v.isEmpty())
    {
        
        session.setAttribute("disprice",price);
        session.setAttribute("totprice", price);
        session.setAttribute("discount",0);
    }
    else
    {
        double dis=0;
        dis=Double.parseDouble(v);
        price=price-(price * dis/100);
        session.setAttribute("disprice",price);
        session.setAttribute("totprice", price);
        session.setAttribute("discount",dis);
    }
      %><%="<b>New price = Rs "+price+"</b>"%>
      
      
       <p ><label>Quantity -</label> 
<input  type="number" name="Quantity" onchange='JavaScript:xmlhttpVPost("TotPrice","Quantity","AddSparePartsValidate.jsp")'   size="80" aria-required="true" id="Quantity" required placeholder="Enter the Quantity"></p>

        <div id="TotPrice"></div>
      
      
<%}
if(f.equals("TotPrice"))
{
    double qty=0;
    qty=Double.parseDouble(v);
    session.setAttribute("qty", qty);
    Double price=Double.parseDouble(session.getAttribute("disprice").toString());
    price=price*qty;
    session.setAttribute("totprice", price);
     %><%="<b>New price = Rs "+price+"</b>"%>

        <br>  
     
      <input type="Button" id="Add" value="Add to list" onclick='xmlhttpVPost("AddtoList","Add","AddSparePartsValidate.jsp"); xmlhttpVPost("viewList","Add","AddSparePartsValidate.jsp");' > 
        <%
     
    
}

if(f.equals("MkOrder"))
{
      Statement stmt1 = conn.createStatement();
      int id=0;
      String OrderID="OR";
      try{
      stmt1 = conn.createStatement();
      String sql = "SELECT * FROM orders ORDER BY OrderID DESC LIMIT 1";
      ResultSet rs = stmt1.executeQuery(sql);
      
  
         while(rs.next())
            {    
                OrderID = rs.getString("OrderID");
            }
         rs.close();
     }      
      catch(SQLException se){      
            se.printStackTrace();
      } 
     id=Integer.parseInt(OrderID.substring(2));
     id=id+1;
     OrderID="OR"+id;
     session.setAttribute("OrderID", OrderID);
     DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
     Date date = new Date();
     String Date =dateFormat.format(date);
     try
          { 
            
             
         
             String sql="INSERT INTO `gajanayake`.`orders` (`OrderID`, `Status`, `Date`, `userID`) VALUES ('"+OrderID+"', 'pending', '"+Date+"', '"+v+"')";
             stat.executeUpdate(sql);             
          }
          catch(Exception e)
          {
             e.printStackTrace();
          }
}

if(f.equals("AddtoList"))
{
    
    
    String OrderID=session.getAttribute("OrderID").toString();
    String SpID=session.getAttribute("SelectedItem").toString();
    Double qty1=Double.parseDouble(session.getAttribute("qty").toString());
    Double dis=Double.parseDouble(session.getAttribute("discount").toString());
    Double disPrice=Double.parseDouble(session.getAttribute("disprice").toString());
    Double totPrice=Double.parseDouble(session.getAttribute("totprice").toString());
    
    System.out.println(OrderID);
    System.out.println(SpID);
    System.out.println(qty1);
    System.out.println(dis);
    System.out.println(disPrice);
    System.out.println(totPrice);
    
    Statement stmt1 = conn.createStatement();
      int id=0;
      String SpOrderID="SO";
      try{
      stmt1 = conn.createStatement();
      String sql = "SELECT * FROM orderspareparts ORDER BY OrderID DESC LIMIT 1";
      ResultSet rs = stmt1.executeQuery(sql);
      
  
         while(rs.next())
            {    
                SpOrderID = rs.getString("OrderID");
            }
         rs.close();
     }      
      catch(SQLException se){      
            se.printStackTrace();
      } 
     id=Integer.parseInt(SpOrderID.substring(2));
     id=id+1;
     SpOrderID="SO"+id;
     
      try
          { 
          
             
         
             String sql="INSERT INTO `gajanayake`.`orderspareparts` (`OrderID`, `Quantity`, `SparePartID`, `Discount` ,`TotPrice` ,`disPrice`) VALUES ('"+SpOrderID+"','"+qty1+"', '"+SpID+"', '"+dis+"', '"+totPrice+"','"+disPrice+"')";
             stat.executeUpdate(sql);
             String sql1="INSERT INTO `gajanayake`.`ordersp` (`OrderID`, `SpOrderID`) VALUES ('"+OrderID+"', '"+SpOrderID+"')";
             stat.executeUpdate(sql1);
          }
          catch(Exception e)
          {
             e.printStackTrace();
          }
    
       
    
}
if(f.equals("viewList"))
{
      int count=0;
      double totCost=0;
      double avgDiscount=0;
      double totDiscount=0;
      String OrderID=session.getAttribute("OrderID").toString();
      Statement stmt = conn.createStatement();
      ResultSet rs1 = stmt.executeQuery("select s.SparePartID , s.Name,o.Discount, o.OrderID, o.TotPrice from orderspareparts o , spareparts s where s.SparePartID = o.SparePartID AND o.OrderID in (select SpOrderID from ordersp where OrderID='"+OrderID+"')");
          while(rs1.next())
          {count++;%>
         
          <p> <%=count+") "+rs1.getString("SparePartID")+" "+rs1.getString("Name")+" "%><a style="float: right;" id="delOrID" name="delOrID" value="<%=rs1.getString("OrderID")%>" onclick='xmlhttpDPost("delOrID1","<%=rs1.getString("OrderID")%>","AddSparePartsValidate.jsp"); xmlhttpVPost("viewList","Add","AddSparePartsValidate.jsp");' title="Delete"><img   src="Images/DeleteSmall.png"></a></p>
            <%
              totCost=totCost+Double.parseDouble(rs1.getString("TotPrice"));
              totDiscount=Double.parseDouble(rs1.getString("Discount"));
          }
          avgDiscount=totDiscount/count;
          session.setAttribute("TotPrice", totCost);
          session.setAttribute("avgDiscount",avgDiscount);
          %><p><u><b>Total Cost - <%=totCost+"</b></u>"%><input onclick='JavaScript:xmlhttpFPost("finish","Add","AddSparePartsValidate.jsp");'  title="Finish Transaction" style="float: right" type='button' value='Finish'> </p><%
    
}
if(f.equals("delOrID1"))
{
    String ID=v;
 
 Statement stmt =conn.createStatement();
 
 String query="DELETE FROM orderspareparts WHERE OrderID='"+ID+"'";
 
 stmt.executeUpdate(query);
 
 
}
if(f.equals("finish"))
{
   
    Statement stmt1=conn.createStatement();
    int id=0;
      String payID="PM";
      try{
      stmt1 = conn.createStatement();
      String sql = "SELECT * FROM payments ORDER BY PaymentID DESC LIMIT 1";
      ResultSet rs = stmt1.executeQuery(sql);
      
  
         while(rs.next())
            {    
                payID = rs.getString("PaymentID");
            }
         rs.close();
     }      
      catch(SQLException se){      
            se.printStackTrace();
      } 
     id=Integer.parseInt(payID.substring(2));
     id=id+1;
     payID="PM"+id;
     DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
     Date date = new Date();
     String Date =dateFormat.format(date);
     double amount=Double.parseDouble(session.getAttribute("TotPrice").toString());
     String OrderID=session.getAttribute("OrderID").toString();
     double discount=Double.parseDouble(session.getAttribute("avgDiscount").toString());
    try
          { 
             
             
    String sql2 ="INSERT INTO `gajanayake`.`payments` (`PaymentID`, `Date`, `Amount`, `OrderID`, `Discount`) VALUES ('"+payID+"', '"+Date+"', '"+amount+"', '"+OrderID+"', '"+discount+"')";
             
             
             stmt1.executeUpdate(sql2);
             int status=1;
             %><%=status%><%
              
             
          }
          catch(Exception e)
          {
             e.printStackTrace();
          }
  
        
  
 
}

     %>
    
      
      
 
   
   
  
        




        
     


 


</body> 
</html> 