var edad;

function call(){
	var kcyear = document.getElementsByName("year")[0],
	kcmonth = document.getElementsByName("month")[0],
	kcday = document.getElementsByName("day")[0];
       
	var d = new Date();
	var n = d.getFullYear();
	var mActual = d.getMonth();
	var dActual = d.getUTCDate();

	for (var i = n; i >= 1950; i--) {
		 var opt = new Option();
		 opt.value = opt.text = i;
		 kcyear.add(opt);
    }
 	kcyear.addEventListener("change", validate_date);
 	kcmonth.addEventListener("change", validate_date);

 	if(document.getElementById("year").selectedIndex > 0 && document.getElementsByName("day")[0].length > 1 && document.getElementsByName("month")[0].selectedIndex > 0){
 		edad = document.getElementById("year").selectedIndex - 1;
 		if(kcmonth.value > (mActual+1) || (kcmonth.value == (mActual+1) && kcday.value > dActual)){
 			edad = edad-1;
 		} 
 		document.getElementById("edad").value = edad; 
 	}

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