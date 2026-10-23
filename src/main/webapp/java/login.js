/**
 * 
 */

function handleLogin() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    if(email == "" || password == "") {
        window.alert("Please fill all fields");
        return false;
    }
    return true;
}