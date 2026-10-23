/**
 * 
 */
function validateForm() {
		var password = document.getElementById("password").value;
	    var confirmPassword = document.getElementById("confirmPassword").value;
		    
	    if (password !== confirmPassword) {
	        window.alert("Password and Confirm Password do not match !!");
	        return false;
	    }
	    
		var upper = false;
		var lower = false;
		var number = false;
		var special = false;
		
		if(password.length < 8) {
			window.alert("Password must be at least 8 characters");
			return false;
		}
		
		for (var i = 0; i < password.length;i++) {
			var ch = password[i];
			if(ch >= 'A' && ch <= 'Z') {
				upper = true;
			}
			if(ch >= 'a' && ch <= 'z') {
				lower = true;
			}
			if(ch >= '0' && ch <= '9') {
				number = true;
			}
			else {
				special = true;
			}
		}
		
		if(!upper || !lower || !number || !special) {
			window.alert("Password must contain uppercase, lowercase, number and special character.");
			return false;

		}
		return true;
}