function checkAccountNo(val)
{
    var regex=/^[A-Za-z][0-9A-Za-z_]{5,15}$/;
    return regex.exec(val);
}

function checkTel(tel){
	 var reg = /^0?1[3|4|5|6|7|8][0-9]\d{8}$/;
	 return reg.test(tel);
}

function checkEmail(val) {  
    var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;  
    if (!pattern.test(val)) {  
        return false;  
    }  
    return true;  
}  

function checkPassword(val)
{
    var regex=/^[0-9A-Za-z_]{6,16}$/;
    return regex.exec(val);
}


function validEnName(str){
	 var regex=/^[A-Za-z ]{2,200}$/;
	 return regex.test(str);
}

function validUrl(url){
	var regex=/^(http:\/\/){1}(www.)?(\w+\.)+\w{2,4}(\/)?$/;
	return regex.test(url);
}
function validNumber(num){
	var regex=/^[0-9]{1,6}$/;
	return regex.test(num);
}
function validNum(num){
	var regex=/^[0-9]{1,16}$/;
	return regex.test(num);
}
