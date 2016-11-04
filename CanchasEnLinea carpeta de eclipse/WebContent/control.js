function validaInt(numero, id){
	 var numero_ = numero;
	 var id_ = id;
       if (isNaN(numero_)){
    	    var x = document.getElementById(id_);
    	    x.value = "";
    	    alert("Ingrese sólo el valor numérico");
    	   return false;
       }else{
    	   nuevaCadena = numero_.replace(".", "");
    	   nuevaCadena = nuevaCadena.replace(" ", "");
    	   var x = document.getElementById(id_);
   	       x.value = nuevaCadena;
    	   return true;
    	   }
   }

function validaPass(cadena, id){
	var cadena_ = cadena;
	var id_ = id;
	if(cadena_ == document.getElementById("password").value){
		return true;
	}else{
		var x = document.getElementById(id_);
	    x.value = "";
	    var y = document.getElementById("password");
	    y.value = "";
	    alert("Tus contraseñas no coinciden");
	    document.getElementById("password").focus();
		return false;
	}
}