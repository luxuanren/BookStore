function changeTwoDecimal(x){
	var f_x = parseFloat(x);
	
	if (isNaN(f_x)){
		alert('function:changeTwoDecimal->parameter error');
		return false;
	}
	f_x = Math.round(f_x *100)/100;
	return f_x;
}