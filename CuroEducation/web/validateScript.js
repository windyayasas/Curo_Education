function noti()
{
    alert("Successfuly Added");
}
function notu()
{
    alert("Successfuly Updated");
}


function xmlhttpVPost(field,value,file)
{ 
var xmlHttpReq = false; 
var self = this; 

// Mozilla/Safari 
if (window.XMLHttpRequest) { 
self.xmlHttpReq = new XMLHttpRequest(); 
} 
// IE 
else if (window.ActiveXObject) { 
self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP"); 
} 
self.xmlHttpReq.open('POST',file, false); 
self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
self.xmlHttpReq.onreadystatechange = function()
{
    if (self.xmlHttpReq.readyState != 4 && self.xmlHttpReq.status == 200)
 {
     document.getElementById(field).innerHTML = "Validating..";
 }
  else if (self.xmlHttpReq.readyState == 4)
  { 
     updatepageV(field,self.xmlHttpReq.responseText); 
  } 
}
var word = getquerystring(value);

word ='value='+ escape(word);
var field1='field='+ escape(field);
var the_data =field1 +'&'+ word;
self.xmlHttpReq.send(the_data); 




}
function xmlhttpDPost(field,value,file)
{ 
var xmlHttpReq = false; 
var self = this; 

// Mozilla/Safari 
if (window.XMLHttpRequest) { 
self.xmlHttpReq = new XMLHttpRequest(); 
} 
// IE 
else if (window.ActiveXObject) { 
self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP"); 
} 
self.xmlHttpReq.open('POST',file, false); 
self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
self.xmlHttpReq.onreadystatechange = function()
{
    if (self.xmlHttpReq.readyState != 4 && self.xmlHttpReq.status == 200)
 {
     document.getElementById(field).innerHTML = "Validating..";
 }
  else if (self.xmlHttpReq.readyState == 4)
  { 
     updatepageV(field,self.xmlHttpReq.responseText); 
  } 
}
var word = value;

word ='value='+ escape(word);
var field1='field='+ escape(field);
var the_data =field1 +'&'+ word;
self.xmlHttpReq.send(the_data); 




}

function getquerystring(value)
{ 

var word = document.getElementById(value).value;

 

return word;


} 


function updatepageV(field,str){ 
document.getElementById(field).innerHTML = str; 

} 

function xmlhttpFPost(field,value,file)
{ 
var xmlHttpReq = false; 
var self = this; 

// Mozilla/Safari 
if (window.XMLHttpRequest)
{ 
self.xmlHttpReq = new XMLHttpRequest(); 
} 
// IE 
else if (window.ActiveXObject) { 
self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP"); 
} 
self.xmlHttpReq.open('POST',file, false); 
self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
self.xmlHttpReq.onreadystatechange = function()
{
    if (self.xmlHttpReq.readyState != 4 && self.xmlHttpReq.status == 200)
 {
     document.getElementById(field).innerHTML = "Validating..";
 }
  else if (self.xmlHttpReq.readyState == 4)
  { 
     updatepageF(field,self.xmlHttpReq.responseText); 
  } 
}
var word = value;

word ='value='+ escape(word);
var field1='field='+ escape(field);
var the_data =field1 +'&'+ word;
self.xmlHttpReq.send(the_data); 




}

function getquerystring(value)
{ 

var word = document.getElementById(value).value;

 

return word;


} 


function updatepageF(field,str)
{ 
        alert('Successfully Done');
        window.open('sellSpOrPDF.jsp', '_blank');
        window.location="index.jsp";
   
} 

