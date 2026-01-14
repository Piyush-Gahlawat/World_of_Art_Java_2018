/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function redirect(link) {
    window.location = link;
}
function validateclogin() {
    var uid=document.clog.uid.value;
    var pass=document.clog.pass.value;
    
    if ( uid== "" &&  pass== "") {
        alert("Enter UID and Password");
        return false;
    } else
    if (uid == "" && pass != "") {
        alert("Enter UID");
        return false;
    } else
    if (uid != "" && pass == "") {
        alert("Enter Password ");

        return false;
    } else
    if (uid != "" && pass != "") {

        return true;
    }
    }
function validatealogin() {
    var uid=document.alog.uid.value;
    var pass=document.alog.pass.value;
    
    if ( uid== "" &&  pass== "") {
        alert("Enter UID and Password");
        return false;
    } else
    if (uid == "" && pass != "") {
        alert("Enter UID");
        return false;
    } else
    if (uid != "" && pass == "") {
        alert("Enter Password ");

        return false;
    } else
    if (uid != "" && pass != "") {

        return true;
    }
}
function validateadlogin() {
    var uid=document.adlog.uid.value;
    var pass=document.adlog.pass.value;
    
    if ( uid== "" &&  pass== "") {
        alert("Enter UID and Password");
        return false;
    } else
    if (uid == "" && pass != "") {
        alert("Enter UID");
        return false;
    } else
    if (uid != "" && pass == "") {
        alert("Enter Password ");

        return false;
    } else
    if (uid != "" && pass != "") {

        return true;
    }
}
function validatecreg(){
    var fname=document.creg.fname.value;
    var lname=document.creg.lname.value;
    var address=document.creg.address.value;
    var email=document.creg.email.value;
    var contact=document.creg.contact.value;
    var gender=document.creg.gender.value;
    var sq=document.creg.sq.value;
    var sa=document.creg.sa.value;
    var pass=document.creg.pass.value;
    if(fname==""){
        return false;
    }else
       if(lname==""){
           alert("Enter All Fields");
           return false;
       }else
   if(address==""){
           alert("Enter All Fields");
            return false;
   }else if(email==""){
           alert("Enter All Fields");
   return false;
   }else if(contact==""){
           alert("Enter All Fields");
       return false;
   }else if(gender==""){
           alert("Enter All Fields");
       return false;
   }else if(sq==""){
           alert("Enter All Fields");
       return false;
   }else if(sa==""){
           alert("Enter All Fields");
       return false;
   }else if(pass==""){
           alert("Enter All Fields");
       false;
   }else{
        return true;
   }
}
function validateareg(){
    var fname=document.areg.fname.value;
    var lname=document.areg.lname.value;
    var address=document.areg.address.value;
    var email=document.areg.email.value;
    var contact=document.areg.contact.value;
    var gender=document.areg.gender.value;
    var sq=document.areg.sq.value;
    var sa=document.areg.sa.value;
    var pass=document.areg.pass.value;
    if(fname==""){
        return false;
    }else
       if(lname==""){
           alert("Enter All Fields");
           return false;
       }else
   if(address==""){
           alert("Enter All Fields");
            return false;
   }else if(email==""){
           alert("Enter All Fields");
   return false;
   }else if(contact==""){
           alert("Enter All Fields");
       return false;
   }else if(gender==""){
           alert("Enter All Fields");
       return false;
   }else if(sq==""){
           alert("Enter All Fields");
       return false;
   }else if(sa==""){
           alert("Enter All Fields");
       return false;
   }else if(pass==""){
           alert("Enter All Fields");
       false;
   }else{
        return true;
   }
}
function validatefgpass(){
    var uid=document.fgpass.uid.value;
    if(uid==""){
    alert("Enter UserID");
        return false;
    }
    else
    {
        return true;
    }
}
function validateub(){
    var uid=document.ub.uid.value;
    var email=document.ub.email.value;
    if(uid==""){
    alert("Enter UserID");
        return false;
    }
    else if(email==""){
        alert("Enter Email ID");
        return false;
    }else
    {
        return true;
    }
}
function validaterev(){
    var rev=document.revbox.review.value;
if(rev==""){
      alert("No Review Put");
        return false;
}    
 else
 {
     return true;
 }
}
function validatestar(){
    var st=document.strrate.rating.value;
if(st==""){
      alert("No Stars Selected");
        return false;
}    
 else
 {
     return true;
 }
}
function validatesq(){
    var sa=document.secq.ansg.value;
if(sa==""){
      alert("Answer The Question");
        return false;
}    
 else
 {
     return true;
 }
}
function validateadd(){
    var add=document.eaddress.address.value;
if(add==""){
      alert("Enter new Address");
        return false;
}    
 else
 {
     return true;
 }
}
function validateename(){
    var fn=document.edname.fname.value;
    var ln=document.edname.lname.value;
if(fn==""){
      alert("Enter the First Name");
        return false;
}    
 else
if(ln==""){
      alert("Enter the Last Name");
        return false;
}    
 else
 {
     return true;
 }
}
function validatemail(){
    var em=document.eemail.email.value;
if(em==""){
      alert("Enter new Email");
        return false;
}    
 else
 {
     return true;
 }
}
function validatephone(){
    var ph=document.eph.phone.value;
if(ph==""){
      alert("Enter new Phone no.");
        return false;
}    
 else
 {
     return true;
 }
}
function validateupload(){
    var arttype=document.upform.arttype.value;
    var price=document.upform.price.value;
    var pic=document.upform.picture.value;
    var desc=document.upform.description.value;
if(arttype==""){
      alert("Select Art Type");
        return false;
}    else
if(price==""){
      alert("Enter Price");
        return false;
}    else
if(pic==""){
      alert("Select Picture");
        return false;
}    else
if(desc==""){
      alert("Enter Description");
        return false;
}    
 else
 {
     return true;
 }
}
function validateartdesc(){
    var desc=document.edartdesc.new_desc.value;
if(desc==""){
      alert("Enter New Description");
        return false;
}    
 else
 {
     return true;
 }
}

function validateartprice(){
    var p=document.edartp.new_price.value;
if(p==""){
      alert("Enter New Price");
        return false;
}    
 else
 {
     return true;
 }
}
var slideIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > x.length) {slideIndex = 1}
    x[slideIndex-1].style.display = "block";
    setTimeout(carousel, 2000); // Change image every 2 seconds
}