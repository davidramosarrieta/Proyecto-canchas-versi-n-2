function call(){
	var kcyear = document.getElementsByName("year")[0],
	kcmonth = document.getElementsByName("month")[0],
	kcday = document.getElementsByName("day")[0];
       
	var d = new Date();
	var n = d.getFullYear();
	var mActual = d.getMonth();
	var dActual = d.getUTCDate();

	if(document.getElementsByName("year")[0][1]== null){
		for (var i = n; i <= 2020; i++) {
			 var opt = new Option();
			 opt.value = opt.text = i;
			 kcyear.add(opt);
	    }
 		kcyear.addEventListener("change", validate_date);
 	}
 	kcmonth.addEventListener("change", validate_date);

 	function validate_date() {
 		var y = +kcyear.value, m = kcmonth.value, d = kcday.value;
 		if (m === "2"){
 			var mlength = 28 + (!(y & 3) && ((y % 100) !== 0 || !(y & 15)));
 		}else{ var mlength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][m - 1];
 		
 		}
 			kcday.length = 0;
 			for (var i = 1; i <= mlength; i++) {
 				var opt = new Option();
 				opt.value = opt.text = i;
 				if (i == d){ opt.selected = true;}
 				kcday.add(opt);
 			}
 	}
	validate_date();
}


function validar(){
	var d = new Date();
	var n = d.getFullYear();
	var mActual = d.getMonth();
	var dActual = d.getUTCDate();

	if(document.getElementsByName("tipo")[0].value == 0){
		alert("Seleccione un tipo de cancha");
	}else{

		if(document.getElementsByName("year")[0].value == n ){
			if(document.getElementsByName("month")[0].value == mActual){
				if(document.getElementsByName("day")[0].value <= dActual){
					alert("La fecha ha caducado");
				}else{
					document.getElementById("reservaForm").submit();
				}
			}else if(document.getElementsByName("month")[0].value < mActual){
				alert("La fecha ha caducado");	
			}else{
				document.getElementById("reservaForm").submit();
			}
		}else{
			document.getElementById("reservaForm").submit();
		}
	}
}