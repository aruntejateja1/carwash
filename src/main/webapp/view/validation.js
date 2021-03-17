

function myfunction(){
		var name= document.getElementById("fname");
		var error=document.getElementById("vname");
		
		name.style.color="red";
		//alert("Hii");
		if(name.value.length==0){
			alert("name cannot be null");
				error.innerHTML="must be 4 to 50 characters";
					name.style.background="red";
			
		}
		else if(name.value.length<4||name.value.length>50){
			//alert(name.value.length);
			error.innerHTML="must be 4 to 50 characters";
			name.style.background.color="white";
			name.style.color="black";
		}
		else{
			error.innerHTML="";
			name.style.color="black";
		}
		
		
}


function myfunction10(){
	var name= document.getElementById("fname");
	name.style.background="white";
	name.style.color="black";
	
	
}



function myfunction2(){
		var name= document.getElementById("lname");
		var error=document.getElementById("vname2");
		
		if(name.value.length==0){
			alert("name cannot be null");
				error.innerHTML="must be 4 to 50 characters";
					name.style.background="red";
			
		}
		else if(name.value.length<4||name.value.length>50){
			//alert(name.value.length);
			error.innerHTML="must be 4 to 50 characters";
			name.style.background.color="white";
			name.style.color="black";
		}
		else{
			error.innerHTML="";
			name.style.color="black";
		}
	
}


function myfunction12(){
	var name= document.getElementById("lname");
	name.style.background="white";
	name.style.color="black";
	
	
}



function myfunction3(){
		var name= document.getElementById("contact");
		var error=document.getElementById("vcontact");
		
			
		if(name.value.length==0){
			alert("contact cannot be null");
				error.innerHTML="must be 4 to 50 characters";
					name.style.background="red";
			
		}
		else if(name.value.length!=10){
			
			error.innerHTML="must be 10 digits";
					name.style.color="black";
		}
		else{
			error.innerHTML="";
					name.style.color="black";
		}
	
}




function myfunction13(){
	var name= document.getElementById("contact");
	name.style.background="white";
	name.style.color="black";
	
	
}




/*function myfunction4(){
		var name= document.getElementById("email");
		var error=document.getElementById("vemail");
		
		
		var mailformat =/^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$/;
	
		
		if(name.value.length==0){
			alert(" cannot be null");
				error.innerHTML="invalid mail format";
					name.style.background="red";
			
		}
	
	
	else if(name.match(mailformat)){
		error.innerHTML="";
		name.style.color="black";
	}
	else { 
		
		error.innerHTML =" invalid mail format";
		name.style.color="black";
	}
	
	
}

*/


function vemail(){ 
    var name= document.getElementById("email");
var error=document.getElementById("vemail");
    var mailformat =/^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$/;
    


if(name.value.length==0){
			alert("email cannot be null");
				error.innerHTML="Invalid Email format";
					name.style.background="red";
			
		}
	


  if(mailformat.test(name.value)){
        document.getElementById("vemail").innerHTML="";
    }
    else { 
	
	document.getElementById("vemail").innerHTML =" Invalid Email Format";
}
}



function myfunction14(){
	var name= document.getElementById("email");
	name.style.background="white";
	name.style.color="black";
	
	
}




function vpass(){
    var name=document.getElementById("password");
var error=document.getElementById("vpassword");


    var format=/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%*^]).{6,}/;
if(name.value.length==0){
			alert("password cannot be null");
				error.innerHTML=" Password should be greater than 6 and must include a special character";;
					name.style.background="red";
			
		}


  else if(format.test(name.value)){
        document.getElementById("vpassword").innerHTML="";
name.style.color="black";
        }
    else{
    document.getElementById("vpassword").innerHTML=" Password should be greater than 6 and must include a special character";
name.style.color="black";
    }
   
}





function myfunction15(){
	var name= document.getElementById("password");
	name.style.background="white";
	name.style.color="black";
	
	
}

